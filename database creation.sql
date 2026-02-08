create database RetailStoreDB;
go

use RetailStoreDB;
go

create table dimcustomers (
    customer_id int primary key,
    cust_name nvarchar(100),
    cust_email nvarchar(100),
    phone nvarchar(50),
    cust_address nvarchar(200),
    region nvarchar(50),
    segment nvarchar(50)
);

create table dimproducts (
    product_id int primary key,
    product_name nvarchar(100),
    product_category nvarchar(50),
    price decimal(10,2),
    supplier_id nvarchar(50)
);

create table dimorders (
    order_id int primary key,
    order_date datetime,
    order_status nvarchar(50),
    channel nvarchar(50)
);

create table dimpayments (
    payment_id int primary key,
    payment_method nvarchar(50),
    payment_date datetime
);

create table dimreturns (
    return_id int primary key,
    return_reason nvarchar(100),
    return_date datetime
);

create table dimdiscounts (
    discount_id int primary key,
    discount_percent decimal(5,2),
    discount_start_date datetime,
    end_date datetime
);

create table dimdate (
    datekey int primary key,
    fulldate date,
    year int,
    month int,
    quarter int,
    weekday nvarchar(20)
);

create table factsales (
    fact_id int primary key,
    order_id int foreign key references dimorders(order_id),
    customer_id int foreign key references dimcustomers(customer_id),
    product_id int foreign key references dimproducts(product_id),
    payment_id int foreign key references dimpayments(payment_id),
    discount_id int foreign key references dimdiscounts(discount_id),
    return_id int foreign key references dimreturns(return_id),
    date_key int foreign key references dimdate(datekey),
    quantity int,
    unitprice decimal(10,2),
    sales_amount decimal(12,2),
    discount_amount decimal(12,2),
    refund_amount decimal(12,2)
);

