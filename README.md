<h1 align="center">
Anti-Money Laundering (AML) Detection System
<h1 align="center">

<img width="600" alt="image" src="https://github.com/nahlarmash/AML-Project/blob/main/Document/AML.jpg">
</h1> 

## Overview 
This project aims to detect potential money laundering activities by analyzing transaction patterns and customer behavior. By identifying unusual or suspicious transactions, the system helps financial institutions mitigate the risk of financial crimes and ensure compliance with anti-money laundering regulations.

## Features
- **Data Generation:** Simulated financial transactions with customer details using Python.
- **Data Warehousing:** Centralized storage of transaction data for efficient analysis.
- **ETL Process:** Data is extracted, transformed, and loaded for analysis.
- **Data Analysis:** SQL queries used to detect unusual or suspicious transactions.
- **Visualization:** Interactive dashboards highlighting suspicious accounts and activities.

## Project Workflow

### Data Generation:
Synthetic data is generated to simulate real-world financial transactions. This includes customer profiles, transaction amounts, dates, and locations.
- **Tools Used:** Python (with Pandas and Faker libraries).
- **Steps:**
   - Generate customer data (names, addresses, etc.).
   - Generate transactions data (amounts, account IDs, transaction types, etc.).
   - Store generated data in CSV, Excel, and XML formats for further processing.

### Data Warehousing
A SQL-based data warehouse is designed to store the generated transaction data after transformation. This warehouse allows for efficient querying and analysis.

- **Design:**
Implemented using a Star Schema, with a central fact table (FactTransactions) and dimension tables (customer, account, date, bank, transaction).
- **Purpose:** Facilitate fast querying and historical analysis of transactions.

### ETL Process (Extract, Transform, Load)
The ETL process prepares data for analysis by cleaning, transforming, and loading it into the data warehouse.

- **Steps:**
   - **Extract:** Collect data from generated CSV files or databases.
   - **Transform:** Clean and standardize data (remove null values, format dates, ...etc).
   - **Slowly Changing Dimensions (SCD):** Implemented SCD in SSIS to track changes over time in dimension data. This approach captures and manages historical changes to customer or account details while maintaining accurate transaction history.
   - **Load:** Insert the cleaned and transformed data into the SQL Server data warehouse.

- **Tools Used:** SQL Server Integration Services (SSIS).

### Data Analysis (SQL Queries)
SQL queries are used to identify suspicious transaction patterns, The system detects activities like:
- Large transactions above a threshold.
- Frequent transactions in a short time period.
- Transactions originating from high-risk countries.

- **Sample Queries:**
    - Query transactions above $40,000.
    - Identify accounts with multiple transactions within 24 hours.
    - Track transactions from sanctioned locations.
 
### Visualization (Power BI Dashboard)
The analyzed data is visualized using interactive Power BI dashboards, These visualizations provide insights into:
- Total transaction amounts.
- Number of suspicious transactions.
- Geographic breakdown of high-risk transactions.
- **Outcome:** We can easily identify suspicious accounts and transaction patterns, allowing for deeper investigation.

## Conclusion
The Anti-Money Laundering (AML) Detection System is a comprehensive project designed to help financial institutions proactively identify and prevent potential money laundering activities. By simulating real-world data and implementing a centralized data warehouse, the system effectively processes large volumes of transaction information. The use of SQL queries and advanced data analysis allows for the identification of unusual transaction patterns, frequent transfers, and activities from high-risk locations.

## Contributors:
- Ahmed Osama
- Nahla Mohamed
- Mona Osama
- Rowan Amr 
- Adham Medhat
- Mahmoud Magdy
