# 🏭 Manufacturing Analytics Dashboard

### End-to-End Data Analytics Project

**Tools Used:** Microsoft Excel | MySQL Workbench | Power BI | Tableau | Git & GitHub



# 📌 Project Overview

The **Manufacturing Analytics Dashboard** is an end-to-end Data Analytics project developed to analyze manufacturing and production data and generate meaningful business insights using Microsoft Excel, MySQL, Power BI, and Tableau.

The project focuses on production performance, manufacturing quantities, machine utilization, operational efficiency, product quality, rejection analysis, manufacturing costs, delivery performance, and department-wise production analysis.

The project demonstrates the complete analytics lifecycle, including data cleaning and validation, KPI development, SQL-based business analysis, dashboard development, and business intelligence reporting. The dashboards provide insights into production efficiency, rejected quantities, machine performance, employee contributions, departmental quality, and overall manufacturing performance.



# 🎯 Project Objectives

- Analyze manufacturing and production data to identify business trends.
- Monitor ordered, processed, manufactured, and rejected quantities.
- Evaluate production efficiency and machine utilization.
- Analyze manufacturing rejection and wastage rates.
- Identify employee-wise, machine-wise, and operation-wise rejection patterns.
- Compare manufactured and rejected quantities across departments.
- Monitor on-time delivery and repeat-order performance.
- Analyze manufacturing costs and cost per unit.
- Generate meaningful business KPIs for decision-making.
- Perform SQL-based manufacturing business analysis using MySQL.
- Build interactive dashboards using Excel, Power BI, and Tableau.
- Present manufacturing insights through effective data visualization.



# 🛠️ Tech Stack

| Technology | Purpose |
|------------|---------|
| Microsoft Excel | Data Cleaning, Validation, KPI Cards & Analysis |
| MySQL Workbench | SQL Queries & Business Analysis |
| Power BI | Interactive Manufacturing Dashboard |
| Tableau | Data Visualization & Storytelling |
| Git & GitHub | Version Control & Project Management |



# 📂 Dataset Description

The project uses **nine related datasets** organized using a star-schema structure, consisting of one fact table and eight dimension tables.

### 🏭 Fact Production

Contains production-level transactional information used to analyze manufacturing performance.

Important columns include:

- Doc_Num
- Date_FK
- Buyer_ID
- Customer_Code
- Employee_Code
- Machine_Code
- Operation_Code
- Dept_ID
- Item_Code
- Delivery_Status
- Is_Repeat_Order
- WO_Qty
- Press_Qty
- Processed_Qty
- Produced_Qty
- Rejected_Qty
- Today_Manufactured_Qty
- Total_Qty
- Total_Value
- Per_Day_Machine_Cost
- Rejection_Rate_Pct
- Efficiency_Rate_Pct
- Machine_Utilization_Pct
- Cost_per_Unit

### 👤 Buyer Dimension

Contains buyer-related information used to analyze production and business transactions.

### 👥 Customer Dimension

Contains customer-related information associated with manufacturing work orders.

### 👨‍💼 Employee Dimension

Contains employee information used for employee-wise production and rejection analysis.

### ⚙️ Operation Dimension

Contains manufacturing operation information used to analyze rejection quantities and production performance across different operations.

### 🏭 Machine Dimension

Contains machine-related information used to analyze machine performance, utilization, and rejected quantities.

### 🏢 Department Dimension

Contains department-related information used for department-wise manufacturing and quality analysis.

### 📦 Item Dimension

Contains item and product-related information used for product category and manufacturing analysis.

### 📅 Date Dimension

Contains date-related information used for time-based production analysis and trend reporting.

The original `fact_Production` dataset contained **10,679 rows**, including **679 blank placeholder records** without valid work order document numbers. These placeholder records were identified and separated from the valid production records, leaving **10,000 valid production work orders** for the main analysis.

The dataset covers manufacturing activity from **January 1, 2015, to December 31, 2015**.



# 🔄 Project Workflow

```text
Raw Manufacturing Dataset
          │
          ▼
Data Cleaning & Validation (Excel)
          │
          ▼
Identification of Placeholder Records
          │
          ▼
Clean Manufacturing Dataset
          │
          ▼
KPI Development
          │
          ▼
SQL Business Analysis (MySQL)
          │
          ▼
Power BI Dashboard Development
          │
          ▼
Tableau Dashboard Development
          │
          ▼
Business Insights & Recommendations
```

---

# 📊 Key Performance Indicators (KPIs)

The project includes production, quality, cost, delivery, and operational performance KPIs to evaluate manufacturing efficiency and support data-driven decision-making.

### 🏭 Production Performance

- Total Work Orders
- Total WO Qty (Ordered)
- Total Manufactured (Produced) Qty
- Total Processed Qty
- Efficiency Rate %
- Machine Utilization %
- Total Manufacturing Cost
- Cost per Unit
- Average Per-Day Machine Cost

### 🚚 Delivery & Order Performance

- On-Time Delivery %
- Repeat Order %

### 🛡️ Quality & Rejection Analysis

- Total Rejected Qty
- Rejection Rate %
- Wastage %
- Total Wastage %

### 🔍 Operational Rejection Analysis

- Employee-wise Rejected Qty
- Machine-wise Rejected Qty
- Operation-wise Rejected Qty
- Department-wise Manufactured vs Rejected

These KPIs help evaluate production volume, processing performance, manufacturing costs, delivery efficiency, and quality performance across employees, machines, operations, and departments.

---

# 🗄️ SQL Project

The SQL module focuses on business-oriented manufacturing analysis using MySQL Workbench.

The queries are designed to analyze production quantities, work orders, rejection performance, machine utilization, manufacturing costs, delivery status, repeat orders, and departmental performance.

The SQL analysis covers:

- COUNT()
- COUNT(DISTINCT)
- SUM()
- AVG()
- GROUP BY
- ORDER BY
- WHERE Conditions
- CASE Statements
- Aggregate Functions
- Production Performance Analysis
- Quality and Rejection Analysis
- Employee-wise Rejection Analysis
- Machine-wise Rejection Analysis
- Operation-wise Rejection Analysis
- Department-wise Production Analysis
- Manufacturing Cost Analysis
- Delivery Performance Analysis
- Repeat Order Analysis
- Business Reporting

These queries support KPI validation and help transform manufacturing data into meaningful business insights.

---

# 📈 Dashboards

## 📊 Excel Dashboard

The Excel analysis focuses on data cleaning, validation, KPI development, and manufacturing performance analysis.

Key components include:

- KPI Cards
- Production Performance
- Ordered vs Produced Quantity
- Processing Analysis
- Quality and Rejection Analysis
- Machine Performance
- Employee-wise Rejection Analysis
- Department-wise Manufacturing Analysis
- Manufacturing Cost Analysis
- Delivery Performance
- Trend Analysis

<img width="840" height="570" alt="Screenshot 2026-10-14 143101" src="https://github.com/user-attachments/assets/964cd8b3-02cb-481c-906c-b754fede6cae" />

<img width="837" height="575" alt="Screenshot 2026-10-14 143433" src="https://github.com/user-attachments/assets/d2aa65e4-5051-44e3-adc2-6cbe69367b61" />

## 📊 Power BI Dashboard

The Power BI dashboard provides an interactive manufacturing analytics experience through KPI cards, visualizations, filters, and slicers.

Key components include:

- Interactive KPI Cards
- Total Work Orders
- Total Manufactured Quantity
- Total Processed Quantity
- Efficiency Rate %
- Machine Utilization %
- Total Manufacturing Cost
- Cost per Unit
- On-Time Delivery %
- Repeat Order %
- Total Rejected Quantity
- Rejection Rate %
- Wastage Analysis
- Employee-wise Rejected Qty
- Machine-wise Rejected Qty
- Operation-wise Rejected Qty
- Department-wise Manufactured vs Rejected
- Interactive Filters & Slicers
- Manufacturing Performance Reporting

The dashboard helps users understand manufacturing performance and compare production and rejection quantities across different operational dimensions.

<img width="1263" height="720" alt="image" src="https://github.com/user-attachments/assets/189db8a1-9e23-41fa-84ef-400079d00e40" />

---

## 📊 Tableau Dashboard

The Tableau dashboard focuses on interactive manufacturing visualizations and business storytelling.

Key components include:

- Production Performance Analysis
- Manufacturing Quantity Analysis
- Quality and Rejection Analysis
- Machine Performance
- Employee Performance
- Operation-wise Analysis
- Department-wise Manufacturing Analysis
- Manufacturing Cost Analysis
- Delivery Performance
- Business Insights & Storytelling

<img width="1588" height="704" alt="image" src="https://github.com/user-attachments/assets/e00b4b11-a560-4b68-a4da-9e3ad7db8952" />


---

# 📁 Repository Structure

```text
Manufacturing-Analytics/
│
├── Dataset/
├── Excel/
├── SQL/
├── Power BI/
├── Tableau/
├── Presentation/
└── README.md
```

---

# 📌 Key Business Insights

- Analyzed **10,000 valid manufacturing work orders** after identifying 679 blank placeholder records in the original production dataset.
- Evaluated ordered, processed, and manufactured quantities to understand production performance.
- Analyzed manufacturing efficiency and machine utilization.
- Evaluated total rejected quantities and rejection rates to understand product quality.
- Compared rejection quantities across employees, machines, and manufacturing operations.
- Analyzed department-wise manufactured and rejected quantities to compare quality performance across departments.
- Evaluated manufacturing costs and cost per unit.
- Analyzed on-time delivery performance and repeat-order percentages.
- Developed KPI-based dashboards to support manufacturing performance monitoring and business decision-making.

---

# 🚀 Future Scope

- Predictive Production Analytics
- Machine Failure Prediction
- Predictive Quality Analysis
- Production Demand Forecasting
- Automated Data Pipeline Integration
- Real-Time Manufacturing Monitoring
- Machine Anomaly Detection
- Production Optimization
- Cloud-Based Manufacturing Analytics
- Advanced Manufacturing Performance Reporting

---

# 📚 Learning Outcomes

This project strengthened practical knowledge in:

- Data Cleaning and Validation
- Data Analysis
- KPI Development
- Manufacturing Analytics
- SQL Query Writing
- Microsoft Excel
- Power BI Dashboard Development
- Tableau Dashboard Development
- Business Intelligence
- Data Visualization
- Data Storytelling
- Business Performance Analysis
- Git & GitHub

---

# 👨‍💻 Author

**M H PRASHANTH**  
Data Analyst Aspirant

---

## ⭐ If you found this project helpful, consider giving this repository a Star!
