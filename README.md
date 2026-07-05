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
The project uses a relational database designed in **MySQL** to manage sales and warranty data. The schema consists of five interconnected tables that support efficient data storage, retrieval, and business reporting.

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
































