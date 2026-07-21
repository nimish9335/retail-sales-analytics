-- =====================================================
-- DAY 10 : PART 1
-- SALES KPI ANALYSIS
-- =====================================================

-- KPI 1: Total Sales
SELECT
ROUND(SUM(Sales),2) AS Total_Sales
FROM retail_sales;

-- KPI 2: Average Sales per Order
SELECT
ROUND(AVG(Sales),2) AS Average_Sales
FROM retail_sales;

-- KPI 3: Total Orders
SELECT
COUNT(*) AS Total_Orders
FROM retail_sales;

-- KPI 4: Total Quantity Sold
SELECT
SUM(Quantity) AS Total_Quantity
FROM retail_sales;

-- KPI 5: Average Quantity per Order
SELECT
ROUND(AVG(Quantity),2) AS Average_Quantity
FROM retail_sales;

-- KPI 6: Highest Sale
SELECT
MAX(Sales) AS Highest_Sale
FROM retail_sales;

-- KPI 7: Lowest Sale
SELECT
MIN(Sales) AS Lowest_Sale
FROM retail_sales;

-- KPI 8: Sales by Category
SELECT
Category,
ROUND(SUM(Sales),2) AS Total_Sales
FROM retail_sales
GROUP BY Category
ORDER BY Total_Sales DESC;

-- KPI 9: Sales by Region
SELECT
Region,
ROUND(SUM(Sales),2) AS Total_Sales
FROM retail_sales
GROUP BY Region
ORDER BY Total_Sales DESC;

-- KPI 10: Sales by Customer Segment
SELECT
Segment,
ROUND(SUM(Sales),2) AS Total_Sales
FROM retail_sales
GROUP BY Segment
ORDER BY Total_Sales DESC;

-- KPI 11: Top 10 States by Sales
SELECT
State,
ROUND(SUM(Sales),2) AS Total_Sales
FROM retail_sales
GROUP BY State
ORDER BY Total_Sales DESC
LIMIT 10;

-- KPI 12: Top 10 Cities by Sales
SELECT
City,
ROUND(SUM(Sales),2) AS Total_Sales
FROM retail_sales
GROUP BY City
ORDER BY Total_Sales DESC
LIMIT 10;

-- KPI 13: Top 10 Customers by Sales
SELECT
Customer_ID,
ROUND(SUM(Sales),2) AS Total_Sales
FROM retail_sales
GROUP BY Customer_ID
ORDER BY Total_Sales DESC
LIMIT 10;

-- KPI 14: Top 10 Products by Sales
SELECT
Product_Name,
ROUND(SUM(Sales),2) AS Total_Sales
FROM retail_sales
GROUP BY Product_Name
ORDER BY Total_Sales DESC
LIMIT 10;

-- KPI 15: Sales Contribution (%) by Category
SELECT
Category,
ROUND(SUM(Sales),2) AS Total_Sales,
ROUND(
SUM(Sales)*100/
(SELECT SUM(Sales) FROM retail_sales),
2
) AS Contribution_Percentage
FROM retail_sales
GROUP BY Category
ORDER BY Contribution_Percentage DESC;

-- =====================================================
-- END OF PART 1
-- =====================================================

-- =====================================================
-- DAY 10 : PART 2
-- PROFIT KPI ANALYSIS
-- =====================================================

-- KPI 16: Total Profit
SELECT
ROUND(SUM(Profit),2) AS Total_Profit
FROM retail_sales;

-- KPI 17: Average Profit per Order
SELECT
ROUND(AVG(Profit),2) AS Average_Profit
FROM retail_sales;

-- KPI 18: Highest Profit
SELECT
MAX(Profit) AS Highest_Profit
FROM retail_sales;

-- KPI 19: Biggest Loss
SELECT
MIN(Profit) AS Biggest_Loss
FROM retail_sales;

-- KPI 20: Total Profit by Category
SELECT
Category,
ROUND(SUM(Profit),2) AS Total_Profit
FROM retail_sales
GROUP BY Category
ORDER BY Total_Profit DESC;

-- KPI 21: Total Profit by Region
SELECT
Region,
ROUND(SUM(Profit),2) AS Total_Profit
FROM retail_sales
GROUP BY Region
ORDER BY Total_Profit DESC;

-- KPI 22: Total Profit by Customer Segment
SELECT
Segment,
ROUND(SUM(Profit),2) AS Total_Profit
FROM retail_sales
GROUP BY Segment
ORDER BY Total_Profit DESC;

-- KPI 23: Top 10 States by Profit
SELECT
State,
ROUND(SUM(Profit),2) AS Total_Profit
FROM retail_sales
GROUP BY State
ORDER BY Total_Profit DESC
LIMIT 10;

-- KPI 24: Bottom 10 States by Profit
SELECT
State,
ROUND(SUM(Profit),2) AS Total_Profit
FROM retail_sales
GROUP BY State
ORDER BY Total_Profit ASC
LIMIT 10;

-- KPI 25: Top 10 Cities by Profit
SELECT
City,
ROUND(SUM(Profit),2) AS Total_Profit
FROM retail_sales
GROUP BY City
ORDER BY Total_Profit DESC
LIMIT 10;

-- KPI 26: Bottom 10 Cities by Profit
SELECT
City,
ROUND(SUM(Profit),2) AS Total_Profit
FROM retail_sales
GROUP BY City
ORDER BY Total_Profit ASC
LIMIT 10;

-- KPI 27: Top 10 Products by Profit
SELECT
Product_Name,
ROUND(SUM(Profit),2) AS Total_Profit
FROM retail_sales
GROUP BY Product_Name
ORDER BY Total_Profit DESC
LIMIT 10;

-- KPI 28: Top 10 Customers by Profit
SELECT
Customer_ID,
ROUND(SUM(Profit),2) AS Total_Profit
FROM retail_sales
GROUP BY Customer_ID
ORDER BY Total_Profit DESC
LIMIT 10;

-- KPI 29: Profit Contribution (%) by Region
SELECT
Region,
ROUND(SUM(Profit),2) AS Total_Profit,
ROUND(
SUM(Profit)*100/
(SELECT SUM(Profit) FROM retail_sales),
2
) AS Profit_Contribution
FROM retail_sales
GROUP BY Region
ORDER BY Profit_Contribution DESC;

-- KPI 30: Average Profit Margin by Category
SELECT
Category,
ROUND(AVG(Profit_Margin),2) AS Avg_Profit_Margin
FROM retail_sales
GROUP BY Category
ORDER BY Avg_Profit_Margin DESC;

-- =====================================================
-- END OF PART 2
-- =====================================================

-- =====================================================
-- DAY 10 : PART 3
-- CUSTOMER KPI ANALYSIS
-- =====================================================

-- KPI 31: Total Unique Customers
SELECT
COUNT(DISTINCT Customer_ID) AS Total_Customers
FROM retail_sales;

-- KPI 32: Average Sales per Customer
SELECT
ROUND(SUM(Sales)/COUNT(DISTINCT Customer_ID),2) AS Avg_Sales_Per_Customer
FROM retail_sales;

-- KPI 33: Average Profit per Customer
SELECT
ROUND(SUM(Profit)/COUNT(DISTINCT Customer_ID),2) AS Avg_Profit_Per_Customer
FROM retail_sales;

-- KPI 34: Top 10 Customers by Number of Orders
SELECT
Customer_ID,
COUNT(*) AS Total_Orders
FROM retail_sales
GROUP BY Customer_ID
ORDER BY Total_Orders DESC
LIMIT 10;

-- KPI 35: Top 10 Customers by Quantity Purchased
SELECT
Customer_ID,
SUM(Quantity) AS Total_Quantity
FROM retail_sales
GROUP BY Customer_ID
ORDER BY Total_Quantity DESC
LIMIT 10;

-- KPI 36: Top 10 Customers by Average Order Value
SELECT
Customer_ID,
ROUND(AVG(Sales),2) AS Avg_Order_Value
FROM retail_sales
GROUP BY Customer_ID
ORDER BY Avg_Order_Value DESC
LIMIT 10;

-- KPI 37: Customer Contribution (%) to Total Sales
SELECT
Customer_ID,
ROUND(SUM(Sales),2) AS Total_Sales,
ROUND(
SUM(Sales)*100/
(SELECT SUM(Sales) FROM retail_sales),
2
) AS Sales_Contribution
FROM retail_sales
GROUP BY Customer_ID
ORDER BY Sales_Contribution DESC
LIMIT 10;

-- KPI 38: Customer Contribution (%) to Total Profit
SELECT
Customer_ID,
ROUND(SUM(Profit),2) AS Total_Profit,
ROUND(
SUM(Profit)*100/
(SELECT SUM(Profit) FROM retail_sales),
2
) AS Profit_Contribution
FROM retail_sales
GROUP BY Customer_ID
ORDER BY Profit_Contribution DESC
LIMIT 10;

-- KPI 39: Customer Segment-wise Sales
SELECT
Segment,
COUNT(DISTINCT Customer_ID) AS Customers,
ROUND(SUM(Sales),2) AS Total_Sales
FROM retail_sales
GROUP BY Segment
ORDER BY Total_Sales DESC;

-- KPI 40: Customer Segment-wise Profit
SELECT
Segment,
COUNT(DISTINCT Customer_ID) AS Customers,
ROUND(SUM(Profit),2) AS Total_Profit
FROM retail_sales
GROUP BY Segment
ORDER BY Total_Profit DESC;

-- =====================================================
-- END OF PART 3
-- =====================================================

-- =====================================================
-- DAY 10 : PART 4
-- PRODUCT KPI ANALYSIS
-- =====================================================

-- KPI 41: Total Unique Products
SELECT
COUNT(DISTINCT Product_Name) AS Total_Products
FROM retail_sales;

-- KPI 42: Top 10 Best Selling Products
SELECT
Product_Name,
ROUND(SUM(Sales),2) AS Total_Sales
FROM retail_sales
GROUP BY Product_Name
ORDER BY Total_Sales DESC
LIMIT 10;

-- KPI 43: Top 10 Most Profitable Products
SELECT
Product_Name,
ROUND(SUM(Profit),2) AS Total_Profit
FROM retail_sales
GROUP BY Product_Name
ORDER BY Total_Profit DESC
LIMIT 10;

-- KPI 44: Top 10 Loss-Making Products
SELECT
Product_Name,
ROUND(SUM(Profit),2) AS Total_Profit
FROM retail_sales
GROUP BY Product_Name
ORDER BY Total_Profit ASC
LIMIT 10;

-- KPI 45: Top 10 Products by Quantity Sold
SELECT
Product_Name,
SUM(Quantity) AS Total_Quantity
FROM retail_sales
GROUP BY Product_Name
ORDER BY Total_Quantity DESC
LIMIT 10;

-- KPI 46: Category-wise Product Count
SELECT
Category,
COUNT(DISTINCT Product_Name) AS Product_Count
FROM retail_sales
GROUP BY Category
ORDER BY Product_Count DESC;

-- KPI 47: Sub-Category-wise Sales
SELECT
Sub_Category,
ROUND(SUM(Sales),2) AS Total_Sales
FROM retail_sales
GROUP BY Sub_Category
ORDER BY Total_Sales DESC;

-- KPI 48: Sub-Category-wise Profit
SELECT
Sub_Category,
ROUND(SUM(Profit),2) AS Total_Profit
FROM retail_sales
GROUP BY Sub_Category
ORDER BY Total_Profit DESC;

-- KPI 49: Average Selling Price by Category
SELECT
Category,
ROUND(AVG(Average_Selling_Price),2) AS Avg_Selling_Price
FROM retail_sales
GROUP BY Category
ORDER BY Avg_Selling_Price DESC;

-- KPI 50: Product Contribution (%) to Total Sales
SELECT
Product_Name,
ROUND(SUM(Sales),2) AS Total_Sales,
ROUND(
SUM(Sales)*100/
(SELECT SUM(Sales) FROM retail_sales),
2
) AS Sales_Contribution
FROM retail_sales
GROUP BY Product_Name
ORDER BY Sales_Contribution DESC
LIMIT 10;

-- =====================================================
-- END OF PART 4
-- =====================================================

-- =====================================================
-- DAY 10 : PART 5
-- EXECUTIVE DASHBOARD KPI ANALYSIS
-- =====================================================

-- KPI 51: Executive Summary
SELECT
ROUND(SUM(Sales),2) AS Total_Sales,
ROUND(SUM(Profit),2) AS Total_Profit,
SUM(Quantity) AS Total_Quantity,
COUNT(*) AS Total_Orders
FROM retail_sales;

-- KPI 52: Profit Margin (%)
SELECT
ROUND(
(SUM(Profit) / SUM(Sales)) * 100,
2
) AS Profit_Margin_Percentage
FROM retail_sales;

-- KPI 53: Average Order Value (AOV)
SELECT
ROUND(
SUM(Sales) / COUNT(*),
2
) AS Average_Order_Value
FROM retail_sales;

-- KPI 54: Average Profit per Order
SELECT
ROUND(
SUM(Profit) / COUNT(*),
2
) AS Average_Profit_Per_Order
FROM retail_sales;

-- KPI 55: Total Customers, Products & Categories
SELECT
COUNT(DISTINCT Customer_ID) AS Total_Customers,
COUNT(DISTINCT Product_Name) AS Total_Products,
COUNT(DISTINCT Category) AS Total_Categories
FROM retail_sales;

-- KPI 56: Total Regions, States & Cities
SELECT
COUNT(DISTINCT Region) AS Total_Regions,
COUNT(DISTINCT State) AS Total_States,
COUNT(DISTINCT City) AS Total_Cities
FROM retail_sales;

-- KPI 57: Average Discount
SELECT
ROUND(
AVG(Discount),
2
) AS Average_Discount
FROM retail_sales;

-- KPI 58: Category-wise Profit Margin
SELECT
Category,
ROUND(SUM(Sales),2) AS Total_Sales,
ROUND(SUM(Profit),2) AS Total_Profit,
ROUND(
(SUM(Profit) / SUM(Sales)) * 100,
2
) AS Profit_Margin
FROM retail_sales
GROUP BY Category
ORDER BY Profit_Margin DESC;

-- KPI 59: Region-wise Profit Margin
SELECT
Region,
ROUND(SUM(Sales),2) AS Total_Sales,
ROUND(SUM(Profit),2) AS Total_Profit,
ROUND(
(SUM(Profit) / SUM(Sales)) * 100,
2
) AS Profit_Margin
FROM retail_sales
GROUP BY Region
ORDER BY Profit_Margin DESC;

-- KPI 60: Complete Business Dashboard Summary
SELECT
ROUND(SUM(Sales),2) AS Total_Sales,
ROUND(SUM(Profit),2) AS Total_Profit,
ROUND((SUM(Profit)/SUM(Sales))*100,2) AS Profit_Margin,
COUNT(*) AS Total_Orders,
COUNT(DISTINCT Customer_ID) AS Total_Customers,
COUNT(DISTINCT Product_Name) AS Total_Products,
SUM(Quantity) AS Total_Quantity,
ROUND(AVG(Discount),2) AS Average_Discount
FROM retail_sales;

-- =====================================================
-- END OF DAY 10
-- BUSINESS KPI ANALYSIS COMPLETED
-- =====================================================