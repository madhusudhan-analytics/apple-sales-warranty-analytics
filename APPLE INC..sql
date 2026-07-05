
create database Apple_Inc;

use Apple_Inc;


create table category (

 category_id varchar(50) primary key,
 category_name varchar(100)
 
);

create table products (

Product_ID varchar(50) primary key,
Product_Name varchar(300),
Category_ID varchar(50),
Launch_Date date,
Price int,
foreign key (Category_ID) references category(category_id)

);

create table stores (

Store_ID varchar(50) primary key,
Store_Name varchar(300),
City varchar(300),
Country varchar(300)

);

create table sales (

sale_id varchar(50) primary key,
sale_date date,
store_id varchar(50),
product_id varchar(50),
quantity int,
foreign key (store_id) references stores(Store_ID),
foreign key (product_id) references products(Product_ID)

);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sales.csv'
INTO TABLE sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

create table warranty (

claim_id varchar(100),
claim_date date,
sale_id varchar(50),
repair_status varchar(200),
foreign key (sale_id) references sales(sale_id)

);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/warranty.csv'
INTO TABLE warranty
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from category;
select * from products;
select * from stores;
select * from sales;
select * from warranty;

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
