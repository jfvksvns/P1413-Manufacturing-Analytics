-- ----------------------------------Production KPIS---------------------------------------------------------------------------------------------------------------------------------
use manufacturing;

SELECT
    SUM(WO_Qty) AS Ordered_Qty,
    SUM(Produced_Qty) AS Produced_Qty,

    ROUND(
        SUM(Produced_Qty) * 100.0 /
        NULLIF(SUM(Processed_Qty), 0), 2
    ) AS Efficiency_Pct,

    ROUND(
        SUM(Processed_Qty) * 100.0 /
        NULLIF(SUM(WO_Qty), 0), 2
    ) AS Utilization_Pct,

    ROUND(
        SUM(Total_Value) /
        NULLIF(SUM(Produced_Qty), 0), 2
    ) AS Cost_Per_Unit

FROM fact_production
WHERE Doc_Num IS NOT NULL;

-- ----------------------------------- Wastage, rejection and manufacturing cost----------------------------------------------------------------------------------------------

SELECT
    SUM(Produced_Qty) AS Total_Produced,
    SUM(Rejected_Qty) AS Total_Rejected,

    ROUND(
        SUM(Rejected_Qty) * 100.0 /
        NULLIF(SUM(Processed_Qty), 0), 2
    ) AS Wastage_Pct,

    ROUND(
        SUM(Rejected_Qty) * 100.0 /
        NULLIF(SUM(Produced_Qty), 0), 2
    ) AS Rejection_Rate_Pct,

    SUM(Total_Value) AS Total_Manufacturing_Value

FROM fact_production
WHERE Doc_Num IS NOT NULL;

-- -----------------------------------Date-wise rejected quantity--------------------------------------------------------------------------------------------------

SELECT
    d.Date,
    SUM(f.Rejected_Qty) AS Total_Rejected_Qty
FROM fact_production f
JOIN dim_date d
    ON f.Date_FK = d.Date
WHERE f.Doc_Num IS NOT NULL
GROUP BY d.Date
ORDER BY d.Date;


-- ------------------------------- Manufactured quantity by month--------------------------------------------------------
SELECT
    d.Year,
    d.Month_Num,
    d.Month_Name,
    SUM(f.Produced_Qty) AS Total_Manufactured_Qty
FROM fact_production f
JOIN dim_date d
    ON f.Date_FK = d.Date
WHERE f.Doc_Num IS NOT NULL
GROUP BY d.Year, d.Month_Num, d.Month_Name
ORDER BY d.Year, d.Month_Num;

-- -----------------------MTD and YTD manufactured quantity-----------------------------------------------------------------------------------------------------------------------

WITH Daily_Production AS (
    SELECT
        d.Date AS Reporting_Date,
        d.Year,
        d.Month_Num,
        SUM(f.Produced_Qty) AS Daily_Produced_Qty
    FROM fact_production f
    JOIN dim_date d
        ON f.Date_FK = d.Date
    WHERE f.Doc_Num IS NOT NULL
    GROUP BY d.Date, d.Year, d.Month_Num
)

SELECT
    Reporting_Date,
    Daily_Produced_Qty,

    SUM(Daily_Produced_Qty) OVER (
        PARTITION BY Year, Month_Num
        ORDER BY Reporting_Date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS MTD_Produced_Qty,

    SUM(Daily_Produced_Qty) OVER (
        PARTITION BY Year
        ORDER BY Reporting_Date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS YTD_Produced_Qty

FROM Daily_Production
ORDER BY Reporting_Date;


-- ------------------------Processed quantity--------------------------------------------------------------------------------------------------------------------------------------

SELECT
    d.Date,
    SUM(f.Produced_Qty) AS Manufactured_Qty,
    SUM(f.Rejected_Qty) AS Rejected_Qty,
    SUM(f.Produced_Qty) - SUM(f.Rejected_Qty)
        AS Processed_Qty
FROM fact_production f
JOIN dim_date d
    ON f.Date_FK = d.Date
WHERE f.Doc_Num IS NOT NULL
GROUP BY d.Date
ORDER BY d.Date;

-- --------------------------Total Manufacturing cost -----------------------------------------------------------------------------------------------------------------------------
SELECT
    SUM(Total_Value) AS Total_Manufacturing_Cost,

    ROUND(AVG(Total_Value), 2)
        AS Average_Value_Per_Record,

    ROUND(
        SUM(Total_Value) /
        NULLIF(SUM(Produced_Qty), 0),
        2
    ) AS Cost_Per_Unit,

    SUM(Produced_Qty) AS Total_Produced_Qty

FROM fact_production
WHERE Doc_Num IS NOT NULL;

-- -----------------------------Estimated Production Cost -----------------------------------------------------------------------------------------------------------------------

SELECT
    COUNT(DISTINCT d.Date) AS Total_Production_Days,

    SUM(f.Produced_Qty) AS Total_Produced_Qty,

    ROUND(
        SUM(f.Produced_Qty) /
        NULLIF(COUNT(DISTINCT d.Date), 0),
        2
    ) AS Avg_Produced_Per_Day

FROM fact_production f
JOIN dim_date d
    ON f.Date_FK = d.Date
WHERE f.Doc_Num IS NOT NULL;

-- --------------------------On-time delivery and repeat orders--------------------------------------------------------------------------------------------------------------------

SELECT
    COUNT(*) AS Total_Records,

    SUM(Delivery_Status = 'On Time')
        AS On_Time_Orders,

    ROUND(
        AVG(Delivery_Status = 'On Time') * 100,
        2
    ) AS On_Time_Delivery_Pct,

    SUM(Is_Repeat_Order = 'Yes')
        AS Repeat_Orders,

    ROUND(
        AVG(Is_Repeat_Order = 'Yes') * 100,
        2
    ) AS Repeat_Order_Pct

FROM fact_production
WHERE Doc_Num IS NOT NULL;

--  --------------------------Delivery status breakdown---------------------------------------------------------------------------------------------------------------------------

SELECT
    Delivery_Status,
    COUNT(*) AS Total_Orders,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*)
         FROM fact_production
         WHERE Doc_Num IS NOT NULL),
        2
    ) AS Delivery_Pct
FROM fact_production
WHERE Doc_Num IS NOT NULL
GROUP BY Delivery_Status
ORDER BY Total_Orders DESC;

-- ------------------------Processed quantity by operation ---------------------------------------------------------------------------------------------------------------------
SELECT
    o.Operation_Code,
    o.Operation_Name,
    SUM(f.Processed_Qty) AS Total_Processed_Qty,
    SUM(f.Produced_Qty) AS Total_Produced_Qty,
    SUM(f.Rejected_Qty) AS Total_Rejected_Qty
FROM fact_production f
JOIN dim_operation o
    ON f.Operation_Code = o.Operation_Code
WHERE f.Doc_Num IS NOT NULL
GROUP BY
    o.Operation_Code,
    o.Operation_Name
ORDER BY Total_Processed_Qty DESC;

-- ----------------------------Rejected quantity by operation-----------------------------------------------------------------------------------------------------------------------
SELECT
    o.Operation_Code,
    o.Operation_Name,
    SUM(f.Produced_Qty) AS Produced_Qty,
    SUM(f.Rejected_Qty) AS Rejected_Qty,

    ROUND(
        SUM(f.Rejected_Qty) * 100.0 /
        NULLIF(SUM(f.Produced_Qty), 0),
        2
    ) AS Rejection_Rate_Pct

FROM fact_production f
JOIN dim_operation o
    ON f.Operation_Code = o.Operation_Code
WHERE f.Doc_Num IS NOT NULL
GROUP BY
    o.Operation_Code,
    o.Operation_Name
ORDER BY Rejection_Rate_Pct DESC;

--  ------------------Rejection analysis by department---------------------------------------------------------------------------------------------------------------------------

SELECT
    d.Dept_ID,
    SUM(f.Produced_Qty) AS Produced_Qty,
    SUM(f.Rejected_Qty) AS Rejected_Qty,
    ROUND(
        SUM(f.Rejected_Qty) * 100.0 /
        NULLIF(SUM(f.Produced_Qty), 0), 2
    ) AS Rejection_Rate_Pct
FROM fact_production f
JOIN dim_department d
    ON f.Dept_ID = d.Dept_ID
WHERE f.Doc_Num IS NOT NULL
GROUP BY d.Dept_ID
ORDER BY Rejection_Rate_Pct DESC;


--  ------------------------------Machine utilization by machine-------------------------------------------------------------------

SELECT
    Machine_Code,
    ROUND(AVG(Machine_Utilization_Pct), 2)
        AS Avg_Machine_Utilization_Pct
FROM fact_production
WHERE Doc_Num IS NOT NULL
GROUP BY Machine_Code
ORDER BY Avg_Machine_Utilization_Pct DESC;

-- ------------------------------Production efficiency by employee-----------------------------------------------------------------------------------------------------------------

SELECT
    Employee_Code,
    SUM(Produced_Qty) AS Produced_Qty,
    SUM(Processed_Qty) AS Processed_Qty,
    ROUND(
        SUM(Produced_Qty) * 100.0 /
        NULLIF(SUM(Processed_Qty), 0), 2
    ) AS Efficiency_Pct
FROM fact_production
WHERE Doc_Num IS NOT NULL
GROUP BY Employee_Code
ORDER BY Efficiency_Pct DESC;




-- ------------------------------END--------------------------------------------------------------------------------------------------------------------------------------------



