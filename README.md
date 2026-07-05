# Apple Sales & Warranty Analytics Dashboard
This project is a complete end-to-end Business Intelligence solution developed using MySQL and Power BI to transform raw sales and warranty data into meaningful business insights. It covers the entire analytics workflow, including relational database design, SQL-based data modeling, reporting views, data transformation using Power Query, DAX measure development, and interactive dashboard creation. The project demonstrates advanced data modeling, KPI development, conditional formatting, dynamic filtering, and interactive reporting to support data-driven decision-making. Built following industry-standard Business Intelligence practices, it showcases practical expertise in SQL, MySQL, Power BI, DAX, Power Query, data visualization, dashboard design, and business analytics.

# Objectives
- Design and implement a relational database to efficiently store and manage sales, product, store, and warranty data.
- Perform data modeling and transformation to prepare data for business reporting and analysis.
- Develop SQL queries and reporting views to extract meaningful business insights.
- Build an interactive Power BI dashboard to monitor key business metrics and performance.
- Create DAX measures to calculate KPIs and support dynamic business analysis.
- Apply conditional formatting and interactive filtering to enhance data visualization and improve user experience.
- Analyze sales, product, regional, store, and warranty performance to identify trends and support data-driven decision-making.
- Demonstrate an end-to-end Business Intelligence workflow using MySQL, SQL, Power BI, DAX, and Power Query.

# Tech Stack

### Database
- MySQL

### Data Analysis & Visualization
- Power BI
- Power Query
- DAX (Data Analysis Expressions)

### Query Language
- SQL

### Data Preparation
- Microsoft Excel

### Development Tools
- MySQL Workbench
- Power BI Desktop
- Git & GitHub

### Skills Demonstrated
- Relational Database Design
- Data Modeling
- SQL Query Writing
- SQL Views
- DAX Measures
- Data Transformation
- KPI Development
- Interactive Dashboard Design
- Conditional Formatting
- Data Visualization
- Business Analytics

# Database Schema
![Database Schema](Database%20Schema.png)

# SQL Scripts
The project includes a collection of SQL scripts covering the complete data pipeline from database creation to business reporting.

## SQL Files
### Database creation
```sql
create database Apple_Inc;
```
### Table creation
#### Category
```sql
create table category (

 category_id varchar(50) primary key,
 category_name varchar(100)
 
);
```
#### Products
```sql
create table products (

Product_ID varchar(50) primary key,
Product_Name varchar(300),
Category_ID varchar(50),
Launch_Date date,
Price int,
foreign key (Category_ID) references category(category_id)

);
```

#### Stores
```sql
create table stores (

Store_ID varchar(50) primary key,
Store_Name varchar(300),
City varchar(300),
Country varchar(300)

);
```

#### Sales 
```sql
create table sales (

sale_id varchar(50) primary key,
sale_date date,
store_id varchar(50),
product_id varchar(50),
quantity int,
foreign key (store_id) references stores(Store_ID),
foreign key (product_id) references products(Product_ID)

);
```

#### Warranty 
```sql
create table warranty (

claim_id varchar(100),
claim_date date,
sale_id varchar(50),
repair_status varchar(200),
foreign key (sale_id) references sales(sale_id)

);
```

### Views

#### VW_SALES_DETAILED 
```sql
create view VW_SALES_DETAILED as
SELECT
    s.sale_id as SALE_ID,
    s.sale_date as SALE_DATE,
    s.store_id as STORE_ID,
    s1.Store_Name AS STORE_NAME,
    s1.City AS CITY,
    s1.Country AS COUNTRY,
    c.category_id as CATEGORY_ID,
    c.category_name AS CATEGORY,
    p.Product_ID as PRODUCT_ID,
    p.Product_Name AS PRODUCT_NAME,
    s.quantity AS QUANTITY,
    (s.quantity * p.Price) AS REVENUE
FROM sales s
LEFT JOIN stores s1
    ON s.store_id = s1.Store_ID
LEFT JOIN products p
    ON s.product_id = p.Product_ID
LEFT JOIN category c
    ON p.Category_ID = c.category_id
ORDER BY s.sale_date;
```

#### VW_WARRANTY_DETAILED 
```sql
create view VW_WARRANTY_DETAILED AS
select
      s.store_id as "STORE ID",
      s1.Store_Name as "STORE NAME",
      s1.City as "CITY",
      s1.Country as "COUNTRY",
      s.sale_id as "SALE ID",
      w.claim_id as "CLAIM ID",
      w.claim_date as "CLAIM DATE", 
	  c.category_id as "CATEGORY ID",
	  c.category_name as "CATEGORY NAME",
      s.product_id as "PRODUCT ID",
      p.Product_Name as "PRODUCT NAME",
      w.repair_status as "REPAIR STATUS"
from warranty w
left join sales s 
		  on s.sale_id = w.sale_id
left join stores s1 
		  on s.store_id = s1.Store_ID
left join products p 
          on s.product_id = p.Product_ID
left join category c  
          on p.Category_ID = c.category_id;
```
# Dashboard Preview

## Landing Page
![Landing Page](Screenshot/Screenshot%201.png)

The landing page serves as the entry point to the dashboard, providing a clean and intuitive navigation experience. It introduces the project with Apple Inc. branding and allows users to seamlessly navigate to each analytical report through interactive navigation buttons.

### Features

- Professional dashboard introduction with Apple Inc. branding.
- Interactive navigation buttons for quick access to all report pages.
- Consistent dark-themed user interface for a modern and professional appearance.
- Centralized navigation to improve the overall user experience.
- Clean and minimal design focused on accessibility and ease of use.

## Executive Summary
![Executive Summary](Screenshot/Screenshot%202.png)

The **Executive Summary** page provides a high-level overview of business performance by consolidating key performance indicators (KPIs) and strategic insights into a single interactive dashboard. It enables stakeholders to quickly assess overall sales performance, monitor business trends, and identify top-performing regions and product categories.

### Key Highlights

- Displays core business KPIs for quick performance evaluation.
- Provides an overview of revenue distribution across product categories.
- Tracks monthly revenue trends to monitor business performance over time.
- Identifies the top-performing cities based on revenue generation.
- Highlights the highest revenue-contributing countries.
- Supports interactive filtering through year slicers for dynamic analysis.
- Uses conditional formatting to emphasize top-performing business metrics.


## Category & Product Performance Analysis
![Category & Product Performance Analysis](Screenshot/Screenshot%203.png)

The **Category & Product Performance Analysis** page provides detailed insights into product and category performance by evaluating key sales metrics and overall business contribution. It enables users to compare product categories, identify high-performing products, analyze sales trends, and understand the relationship between revenue and quantity sold for informed decision-making.

### Key Highlights

- Analyzes category and product performance using key business metrics.
- Monitors monthly revenue trends with interactive year and category filters.
- Identifies top-performing product categories based on revenue.
- Compares revenue and quantity sold to evaluate product performance.
- Ranks products based on revenue contribution.
- Provides interactive filtering for detailed category-level analysis.
- Utilizes conditional formatting to highlight top-performing categories and products.






















