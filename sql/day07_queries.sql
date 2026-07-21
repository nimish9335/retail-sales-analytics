CREATE DATABASE retail_sales_db;
SHOW DATABASES;
USE retail_sales_db;

CREATE TABLE retail_sales (

    ship_mode VARCHAR(50),
    segment VARCHAR(50),
    country VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code INT,
    region VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(100),

    sales DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(5,2),
    profit DECIMAL(10,2),

    profit_margin DECIMAL(10,2),
    average_selling_price DECIMAL(10,2),
    discount_percentage DECIMAL(10,2)

);

SHOW TABLES;
DESCRIBE retail_sales;

SHOW VARIABLES LIKE 'local_infile';
SELECT VERSION();

-- =====================================================
-- IMPORTANT NOTE
--
-- This project uses a cleaned Retail Sales dataset.
-- Therefore, columns such as Customer_ID, Customer_Name,
-- Product_ID, and Product_Name are not available.
--
-- Some KPI queries related to customer and product analysis
-- are included for learning purposes and are intended to run
-- on the original Superstore dataset containing these fields.
--
-- =====================================================

SELECT *
FROM retail_sales
LIMIT 10;

SELECT COUNT(*) AS total_records
FROM retail_sales;

SELECT
SUM(ship_mode IS NULL) AS ship_mode_nulls,
SUM(segment IS NULL) AS segment_nulls,
SUM(country IS NULL) AS country_nulls,
SUM(city IS NULL) AS city_nulls,
SUM(state IS NULL) AS state_nulls,
SUM(postal_code IS NULL) AS postal_code_nulls,
SUM(region IS NULL) AS region_nulls,
SUM(category IS NULL) AS category_nulls,
SUM(sub_category IS NULL) AS sub_category_nulls,
SUM(sales IS NULL) AS sales_nulls,
SUM(quantity IS NULL) AS quantity_nulls,
SUM(discount IS NULL) AS discount_nulls,
SUM(profit IS NULL) AS profit_nulls
FROM retail_sales;

SELECT ROUND(SUM(sales),2) AS total_sales
FROM retail_sales;

SELECT ROUND(SUM(profit),2) AS total_profit
FROM retail_sales;

SELECT ROUND(AVG(sales),2) AS average_sales
FROM retail_sales;

SELECT SUM(quantity) AS total_quantity
FROM retail_sales;

-- ==========================================
-- Aggregate Functions & Business KPIs
-- ==========================================

SELECT MAX(sales) AS highest_sale
FROM retail_sales;

SELECT MIN(sales) AS lowest_sale
FROM retail_sales;

SELECT MAX(profit) AS highest_profit
FROM retail_sales;

SELECT MIN(profit) AS biggest_loss
FROM retail_sales;

SELECT ROUND(AVG(profit),2) AS average_profit
FROM retail_sales;

SELECT ROUND(AVG(discount),2) AS average_discount
FROM retail_sales;

SELECT ROUND(AVG(quantity),2) AS average_quantity
FROM retail_sales;

-- ==========================================
-- GROUP BY Analysis - Category
-- ==========================================
SELECT
    category,
    ROUND(SUM(sales), 2) AS total_sales
FROM retail_sales
GROUP BY category;

# What is the total profit for each category?
SELECT
    category,
    ROUND(SUM(profit), 2) AS total_profit
FROM retail_sales
GROUP BY category;

# How many orders belong to each category?
SELECT
    category,
    COUNT(*) AS total_orders
FROM retail_sales
GROUP BY category;

# Average sales per category
SELECT
    category,
    ROUND(AVG(sales), 2) AS average_sales
FROM retail_sales
GROUP BY category;

# Average profit per category
SELECT
    category,
    ROUND(AVG(profit), 2) AS average_profit
FROM retail_sales
GROUP BY category;

-- ==========================================
-- GROUP BY Analysis - Region, Segment, State & Sub-Category
-- ==========================================

# Total Sales by Region
SELECT
    region,
    ROUND(SUM(sales),2) AS total_sales
FROM retail_sales
GROUP BY region;

# Total Profit by Region
SELECT
    region,
    ROUND(SUM(profit),2) AS total_profit
FROM retail_sales
GROUP BY region;

# Total Sales by Customer Segment
SELECT
    segment,
    ROUND(SUM(sales),2) AS total_sales
FROM retail_sales
GROUP BY segment;

# Total Profit by Customer Segment
SELECT
    segment,
    ROUND(SUM(profit),2) AS total_profit
FROM retail_sales
GROUP BY segment;

# Top States by Sales
SELECT
    state,
    ROUND(SUM(sales),2) AS total_sales
FROM retail_sales
GROUP BY state
ORDER BY total_sales DESC;

# Top States by Profit
SELECT
    state,
    ROUND(SUM(profit),2) AS total_profit
FROM retail_sales
GROUP BY state
ORDER BY total_profit DESC;

# Sales by Sub-Category
SELECT
    sub_category,
    ROUND(SUM(sales),2) AS total_sales
FROM retail_sales
GROUP BY sub_category
ORDER BY total_sales DESC;

# Profit by Sub-Category
SELECT
    sub_category,
    ROUND(SUM(profit),2) AS total_profit
FROM retail_sales
GROUP BY sub_category
ORDER BY total_profit DESC;

-- ==========================================
-- ORDER BY, LIMIT & DISTINCT
-- ==========================================

# Top 5 States by Sales
SELECT
    state,
    ROUND(SUM(sales),2) AS total_sales
FROM retail_sales
GROUP BY state
ORDER BY total_sales DESC
LIMIT 5;

# Top 5 States by Profit
SELECT
    state,
    ROUND(SUM(profit),2) AS total_profit
FROM retail_sales
GROUP BY state
ORDER BY total_profit DESC
LIMIT 5;

# Top 5 Most Profitable Sub-Categories
SELECT
    sub_category,
    ROUND(SUM(profit),2) AS total_profit
FROM retail_sales
GROUP BY sub_category
ORDER BY total_profit DESC
LIMIT 5;

# Bottom 5 Loss-Making Sub-Categories
SELECT
    sub_category,
    ROUND(SUM(profit),2) AS total_profit
FROM retail_sales
GROUP BY sub_category
ORDER BY total_profit ASC
LIMIT 5;

# List All Unique Categories
SELECT DISTINCT category
FROM retail_sales;

# List All Unique Regions
SELECT DISTINCT region
FROM retail_sales;

# Count the Number of Unique Cities
SELECT COUNT(DISTINCT city) AS total_cities
FROM retail_sales;

-- ==========================================
-- Business Case Study Queries - Part 1
-- ==========================================

# Which category generated the highest total profit?
SELECT
    category,
    ROUND(SUM(profit), 2) AS total_profit
FROM retail_sales
GROUP BY category
ORDER BY total_profit DESC;

# Which region has the highest average sales per order?
SELECT
    region,
    ROUND(AVG(sales), 2) AS average_sales
FROM retail_sales
GROUP BY region
ORDER BY average_sales DESC;

# Which customer segment generated the highest total quantity sold?
SELECT
    segment,
    SUM(quantity) AS total_quantity
FROM retail_sales
GROUP BY segment
ORDER BY total_quantity DESC;

# Which sub-category offers the highest average discount?
SELECT
    sub_category,
    ROUND(AVG(discount), 2) AS average_discount
FROM retail_sales
GROUP BY sub_category
ORDER BY average_discount DESC;

# Which states generated both high sales and high profit?
SELECT
    state,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM retail_sales
GROUP BY state
ORDER BY total_profit DESC, total_sales DESC;

-- ==========================================
-- Business Case Study Queries - Part 2
-- ==========================================

# Top 5 most profitable cities
SELECT
    city,
    ROUND(SUM(profit), 2) AS total_profit
FROM retail_sales
GROUP BY city
ORDER BY total_profit DESC
LIMIT 5;

# Bottom 5 loss-making cities
SELECT
    city,
    ROUND(SUM(profit), 2) AS total_profit
FROM retail_sales
GROUP BY city
ORDER BY total_profit ASC
LIMIT 5;

# Category-wise average profit margin
SELECT
    category,
    ROUND(AVG(profit_margin), 2) AS avg_profit_margin
FROM retail_sales
GROUP BY category
ORDER BY avg_profit_margin DESC;

# Region-wise average discount
SELECT
    region,
    ROUND(AVG(discount), 2) AS avg_discount
FROM retail_sales
GROUP BY region
ORDER BY avg_discount DESC;

# Segment-wise average selling price
SELECT
    segment,
    ROUND(AVG(average_selling_price), 2) AS avg_selling_price
FROM retail_sales
GROUP BY segment
ORDER BY avg_selling_price DESC;

# Top 5 sub-categories by quantity sold
SELECT
    sub_category,
    SUM(quantity) AS total_quantity
FROM retail_sales
GROUP BY sub_category
ORDER BY total_quantity DESC
LIMIT 5;

# Bottom 5 sub-categories by quantity sold
SELECT
    sub_category,
    SUM(quantity) AS total_quantity
FROM retail_sales
GROUP BY sub_category
ORDER BY total_quantity ASC
LIMIT 5;

# Number of orders in each region
SELECT
    region,
    COUNT(*) AS total_orders
FROM retail_sales
GROUP BY region
ORDER BY total_orders DESC;

# Average sales by ship mode
SELECT
    ship_mode,
    ROUND(AVG(sales), 2) AS average_sales
FROM retail_sales
GROUP BY ship_mode
ORDER BY average_sales DESC;

# Average profit by ship mode
SELECT
    ship_mode,
    ROUND(AVG(profit), 2) AS average_profit
FROM retail_sales
GROUP BY ship_mode
ORDER BY average_profit DESC;