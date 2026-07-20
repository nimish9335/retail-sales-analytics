-- ==========================================
-- Day 8 - WHERE Clause & Logical Operators
-- ==========================================

# Technology category orders
SELECT *
FROM retail_sales
WHERE category = 'Technology';

# Furniture category orders
SELECT *
FROM retail_sales
WHERE category = 'Furniture';

# Office Supplies category orders
SELECT *
FROM retail_sales
WHERE category = 'Office Supplies';

# Sales greater than 1000
SELECT *
FROM retail_sales
WHERE sales > 1000;

# Sales less than 100
SELECT *
FROM retail_sales
WHERE sales < 100;

# Profit greater than 500
SELECT *
FROM retail_sales
WHERE profit > 500;

# Loss making orders
SELECT *
FROM retail_sales
WHERE profit < 0;

# Discount greater than 20%
SELECT *
FROM retail_sales
WHERE discount > 0.20;

# Quantity greater than 5
SELECT *
FROM retail_sales
WHERE quantity > 5;

# Orders from West region
SELECT *
FROM retail_sales
WHERE region = 'West';

# Orders from East region
SELECT *
FROM retail_sales
WHERE region = 'East';

# Orders from Consumer segment
SELECT *
FROM retail_sales
WHERE segment = 'Consumer';

# Orders from Corporate segment
SELECT *
FROM retail_sales
WHERE segment = 'Corporate';

-- ==========================================
-- Comparison Operators
-- ==========================================

# Sales between 500 and 1000
SELECT *
FROM retail_sales
WHERE sales BETWEEN 500 AND 1000;

# Profit between 100 and 500
SELECT *
FROM retail_sales
WHERE profit BETWEEN 100 AND 500;

# Quantity between 2 and 5
SELECT *
FROM retail_sales
WHERE quantity BETWEEN 2 AND 5;

# Discount between 10% and 30%
SELECT *
FROM retail_sales
WHERE discount BETWEEN 0.10 AND 0.30;

# Region IN
SELECT *
FROM retail_sales
WHERE region IN ('East','West');

# Segment IN
SELECT *
FROM retail_sales
WHERE segment IN ('Consumer','Corporate');

# Category NOT IN
SELECT *
FROM retail_sales
WHERE category NOT IN ('Furniture');

-- ==========================================
-- LIKE Operator
-- ==========================================

# Cities starting with N
SELECT *
FROM retail_sales
WHERE city LIKE 'N%';

# States starting with C
SELECT *
FROM retail_sales
WHERE state LIKE 'C%';

# Sub-categories ending with s
SELECT *
FROM retail_sales
WHERE sub_category LIKE '%s';

# Cities containing "York"
SELECT *
FROM retail_sales
WHERE city LIKE '%York%';

-- ==========================================
-- Logical Operators
-- ==========================================

# High sales AND high profit
SELECT *
FROM retail_sales
WHERE sales > 1000
AND profit > 100;

# High sales OR high discount
SELECT *
FROM retail_sales
WHERE sales > 1000
OR discount > 0.30;

# West region AND Technology category
SELECT *
FROM retail_sales
WHERE region='West'
AND category='Technology';

# Consumer segment AND Furniture category
SELECT *
FROM retail_sales
WHERE segment='Consumer'
AND category='Furniture';

# NOT Furniture
SELECT *
FROM retail_sales
WHERE NOT category='Furniture';

# NOT West Region
SELECT *
FROM retail_sales
WHERE NOT region='West';

# Loss making Technology orders
SELECT *
FROM retail_sales
WHERE category='Technology'
AND profit<0;

# High Discount Loss Orders
SELECT *
FROM retail_sales
WHERE discount>0.30
AND profit<0;

-- ==========================================
-- HAVING Clause
-- ==========================================

# Categories having total sales greater than 500000
SELECT
    category,
    ROUND(SUM(sales),2) AS total_sales
FROM retail_sales
GROUP BY category
HAVING SUM(sales) > 500000;

# Regions having total profit greater than 50000
SELECT
    region,
    ROUND(SUM(profit),2) AS total_profit
FROM retail_sales
GROUP BY region
HAVING SUM(profit) > 50000;

# States having sales greater than 100000
SELECT
    state,
    ROUND(SUM(sales),2) AS total_sales
FROM retail_sales
GROUP BY state
HAVING SUM(sales) > 100000
ORDER BY total_sales DESC;

# Sub-categories having average profit greater than 50
SELECT
    sub_category,
    ROUND(AVG(profit),2) AS average_profit
FROM retail_sales
GROUP BY sub_category
HAVING AVG(profit) > 50
ORDER BY average_profit DESC;

# Customer segments with more than 200 orders
SELECT
    segment,
    COUNT(*) AS total_orders
FROM retail_sales
GROUP BY segment
HAVING COUNT(*) > 200;

# Cities having total quantity sold greater than 200
SELECT
    city,
    SUM(quantity) AS total_quantity
FROM retail_sales
GROUP BY city
HAVING SUM(quantity) > 200
ORDER BY total_quantity DESC;

-- ==========================================
-- HAVING + WHERE
-- ==========================================

# Technology category states with sales greater than 50000
SELECT
    state,
    ROUND(SUM(sales),2) AS total_sales
FROM retail_sales
WHERE category='Technology'
GROUP BY state
HAVING SUM(sales) > 50000
ORDER BY total_sales DESC;

# Consumer segment cities with profit greater than 10000
SELECT
    city,
    ROUND(SUM(profit),2) AS total_profit
FROM retail_sales
WHERE segment='Consumer'
GROUP BY city
HAVING SUM(profit) > 10000
ORDER BY total_profit DESC;

# West region sub-categories with sales greater than 30000
SELECT
    sub_category,
    ROUND(SUM(sales),2) AS total_sales
FROM retail_sales
WHERE region='West'
GROUP BY sub_category
HAVING SUM(sales) > 30000
ORDER BY total_sales DESC;

-- ==========================================
-- Business Case Study Queries
-- ==========================================

# Which category has the highest average sales?
SELECT
    category,
    ROUND(AVG(sales),2) AS average_sales
FROM retail_sales
GROUP BY category
ORDER BY average_sales DESC;

# Which region has the highest average profit?
SELECT
    region,
    ROUND(AVG(profit),2) AS average_profit
FROM retail_sales
GROUP BY region
ORDER BY average_profit DESC;

# Which state gives the highest average discount?
SELECT
    state,
    ROUND(AVG(discount),2) AS average_discount
FROM retail_sales
GROUP BY state
ORDER BY average_discount DESC;

# Which sub-category has the highest average selling price?
SELECT
    sub_category,
    ROUND(AVG(average_selling_price),2) AS average_selling_price
FROM retail_sales
GROUP BY sub_category
ORDER BY average_selling_price DESC;

# Which ship mode generates the highest sales?
SELECT
    ship_mode,
    ROUND(SUM(sales),2) AS total_sales
FROM retail_sales
GROUP BY ship_mode
ORDER BY total_sales DESC;

# Which ship mode generates the highest profit?
SELECT
    ship_mode,
    ROUND(SUM(profit),2) AS total_profit
FROM retail_sales
GROUP BY ship_mode
ORDER BY total_profit DESC;

-- ==========================================
-- CASE WHEN
-- ==========================================

# Classify orders based on profit
SELECT
    sales,
    profit,
    CASE
        WHEN profit > 500 THEN 'High Profit'
        WHEN profit > 100 THEN 'Medium Profit'
        WHEN profit >= 0 THEN 'Low Profit'
        ELSE 'Loss'
    END AS profit_category
FROM retail_sales;

# Classify orders based on discount
SELECT
    discount,
    CASE
        WHEN discount >= 0.30 THEN 'High Discount'
        WHEN discount >= 0.10 THEN 'Medium Discount'
        ELSE 'Low Discount'
    END AS discount_category
FROM retail_sales;

# Count orders by profit category
SELECT
    CASE
        WHEN profit > 500 THEN 'High Profit'
        WHEN profit > 100 THEN 'Medium Profit'
        WHEN profit >= 0 THEN 'Low Profit'
        ELSE 'Loss'
    END AS profit_category,
    COUNT(*) AS total_orders
FROM retail_sales
GROUP BY profit_category;

# ==========================================
# String Functions
# ==========================================

# Convert category names to uppercase
SELECT
    category,
    UPPER(category) AS upper_category
FROM retail_sales;

# Convert region names to lowercase
SELECT
    region,
    LOWER(region) AS lower_region
FROM retail_sales;

# Length of city names
SELECT
    city,
    LENGTH(city) AS city_length
FROM retail_sales;

# Concatenate city and state
SELECT
    CONCAT(city, ', ', state) AS location
FROM retail_sales;

# ==========================================
# Final Business Case Study
# ==========================================

# Top 5 states with highest average sales
SELECT
    state,
    ROUND(AVG(sales),2) AS average_sales
FROM retail_sales
GROUP BY state
ORDER BY average_sales DESC
LIMIT 5;

# Top 5 cities with highest average profit
SELECT
    city,
    ROUND(AVG(profit),2) AS average_profit
FROM retail_sales
GROUP BY city
ORDER BY average_profit DESC
LIMIT 5;

# Region-wise average quantity sold
SELECT
    region,
    ROUND(AVG(quantity),2) AS average_quantity
FROM retail_sales
GROUP BY region
ORDER BY average_quantity DESC;

# Category-wise maximum sale
SELECT
    category,
    MAX(sales) AS highest_sale
FROM retail_sales
GROUP BY category
ORDER BY highest_sale DESC;

# Sub-category with maximum profit
SELECT
    sub_category,
    MAX(profit) AS highest_profit
FROM retail_sales
GROUP BY sub_category
ORDER BY highest_profit DESC;

# Ship mode with lowest average discount
SELECT
    ship_mode,
    ROUND(AVG(discount),2) AS average_discount
FROM retail_sales
GROUP BY ship_mode
ORDER BY average_discount ASC;

# Number of cities in each region
SELECT
    region,
    COUNT(DISTINCT city) AS total_cities
FROM retail_sales
GROUP BY region
ORDER BY total_cities DESC;

# Number of states in each region
SELECT
    region,
    COUNT(DISTINCT state) AS total_states
FROM retail_sales
GROUP BY region
ORDER BY total_states DESC;

# Overall dashboard KPIs
SELECT
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit,
    SUM(quantity) AS total_quantity,
    ROUND(AVG(discount),2) AS average_discount,
    COUNT(*) AS total_orders
FROM retail_sales;