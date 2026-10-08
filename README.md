# 🏭 Manufacturing Analytics Dashboard

### End-to-End Data Analytics Project

**Tools Used:** Microsoft Excel | MySQL Workbench | Power BI | Tableau | Git & GitHub

---

# 📌 Project Overview

The **Manufacturing Analytics Dashboard** is an end-to-end Data Analytics project developed to analyze manufacturing and production data and generate meaningful business insights using Microsoft Excel, MySQL, Power BI, and Tableau.

The project focuses on analyzing production performance, manufacturing quantities, quality and rejection levels, machine utilization, operational efficiency, manufacturing costs, delivery performance, repeat orders, and department-wise production performance.

The project demonstrates the complete analytics lifecycle, starting from raw manufacturing data cleaning and validation through KPI development, SQL-based business analysis, interactive dashboard development, and business intelligence reporting.

---

# 🎯 Project Objectives

- Analyze manufacturing and production performance.
- Monitor ordered, processed, produced, and rejected quantities.
- Evaluate production efficiency and machine utilization.
- Analyze manufacturing rejection and wastage.
- Identify employee, machine, operation, and department-wise rejection patterns.
- Monitor delivery and repeat-order performance.
- Analyze manufacturing costs and cost per unit.
- Generate meaningful business KPIs for decision-making.
- Perform SQL-based manufacturing business analysis.
- Build interactive dashboards using Excel, Power BI, and Tableau.
- Present manufacturing insights through effective data visualization and business reporting.

---

# 🛠️ Tech Stack

| Technology | Purpose |
|------------|---------|
| Microsoft Excel | Data Cleaning, Validation, KPI Cards & Analysis |
| MySQL Workbench | SQL Queries & Business Analysis |
| Power BI | Interactive Manufacturing Dashboard |
| Tableau | Data Visualization & Business Storytelling |
| Git & GitHub | Version Control & Project Management |

---

# 📂 Dataset Description

The project uses a manufacturing dataset designed using a **star schema**, consisting of one production fact table and multiple related dimension tables.

The main **fact_Production** table contains production-level transactional information such as Work Order, Date, Buyer, Customer, Employee, Machine, Operation, Department, Item, Delivery Status, Repeat Order Status, Work Order Quantity, Press Quantity, Processed Quantity, Produced Quantity, Rejected Quantity, Total Value, Machine Cost, Rejection Rate, Efficiency Rate, Machine Utilization, and Cost per Unit.

The supporting dimension tables include **dim_Buyer, dim_Customer, dim_Employee, dim_Operation, dim_Machine, dim_Department, dim_Item, and dim_Date**, which provide descriptive information for analyzing production data across different business dimensions.

The dataset contains **10,000 valid production work orders**. During data validation, **679 blank placeholder records** were identified in the original production table and were excluded from the valid production analysis.

The data covers manufacturing activity across the year **2015**, enabling production, quality, cost, delivery, and operational analysis across different dates, machines, employees, operations, and departments.

---

# 🔄 Project Workflow

```text
Raw Manufacturing Dataset
          │
          ▼
Data Cleaning & Validation using Excel
          │
          ▼
Clean Manufacturing Dataset
          │
          ▼
KPI Development & Validation
          │
          ▼
SQL Business Analysis using MySQL
          │
          ▼
Power BI Dashboard Development
          │
          ▼
Tableau Dashboard Development
          │
          ▼
Business Insights & Reporting
