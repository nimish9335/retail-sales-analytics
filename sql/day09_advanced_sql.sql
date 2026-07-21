-- =====================================================
-- DAY 9 : ADVANCED SQL ANALYSIS (SUBQUERIES)
-- =====================================================

-- =====================================================
-- Question 1:
-- Find all orders where Sales is greater than the average Sales.
-- =====================================================

SELECT *
FROM retail_sales
WHERE Sales >
(
    SELECT AVG(Sales)
    FROM retail_sales
);

-- =====================================================
-- Question 2:
-- Find all orders where Profit is greater than the average Profit.
-- =====================================================

SELECT *
FROM retail_sales
WHERE Profit >
(
    SELECT AVG(Profit)
    FROM retail_sales
);

-- =====================================================
-- Question 3:
-- Find states whose total sales are greater than the average sales across all states.
-- =====================================================

SELECT
    State,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM retail_sales
GROUP BY State
HAVING SUM(Sales) >
(
    SELECT AVG(StateSales)
    FROM
    (
        SELECT SUM(Sales) AS StateSales
        FROM retail_sales
        GROUP BY State
    ) AS temp
)
ORDER BY Total_Sales DESC;

-- =====================================================
-- Question 4:
-- Find Sub-Categories whose total profit is above the average profit of all Sub-Categories.
-- =====================================================

SELECT
    Sub_Category,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM retail_sales
GROUP BY Sub_Category
HAVING SUM(Profit) >
(
    SELECT AVG(SubProfit)
    FROM
    (
        SELECT SUM(Profit) AS SubProfit
        FROM retail_sales
        GROUP BY Sub_Category
    ) AS temp
)
ORDER BY Total_Profit DESC;

-- =====================================================
-- Question 5:
-- Find customers whose purchased quantity is above the average customer quantity.
-- =====================================================

SELECT
    Customer_ID,
    SUM(Quantity) AS Total_Quantity
FROM retail_sales
GROUP BY Customer_ID
HAVING SUM(Quantity) >
(
    SELECT AVG(CustomerQty)
    FROM
    (
        SELECT SUM(Quantity) AS CustomerQty
        FROM retail_sales
        GROUP BY Customer_ID
    ) AS temp
)
ORDER BY Total_Quantity DESC;

-- =====================================================
-- Question 6:
-- Find the product with the highest sales.
-- =====================================================

SELECT *
FROM retail_sales
WHERE Sales =
(
    SELECT MAX(Sales)
    FROM retail_sales
);

-- =====================================================
-- Question 7:
-- Find the order with the maximum profit.
-- =====================================================

SELECT *
FROM retail_sales
WHERE Profit =
(
    SELECT MAX(Profit)
    FROM retail_sales
);

-- =====================================================
-- Question 8:
-- Find the order with the biggest loss.
-- =====================================================

SELECT *
FROM retail_sales
WHERE Profit =
(
    SELECT MIN(Profit)
    FROM retail_sales
);

-- =====================================================
-- Question 9:
-- Find categories whose average discount is greater than the overall average discount.
-- =====================================================

SELECT
    Category,
    ROUND(AVG(Discount),2) AS Avg_Discount
FROM retail_sales
GROUP BY Category
HAVING AVG(Discount) >
(
    SELECT AVG(Discount)
    FROM retail_sales
);

-- =====================================================
-- Question 10:
-- Find regions whose average profit is greater than the overall average profit.
-- =====================================================

SELECT
    Region,
    ROUND(AVG(Profit),2) AS Avg_Profit
FROM retail_sales
GROUP BY Region
HAVING AVG(Profit) >
(
    SELECT AVG(Profit)
    FROM retail_sales
)
ORDER BY Avg_Profit DESC;

-- =====================================================
-- Question 11:
-- Find customers who placed more orders than the average number of orders per customer.
-- =====================================================

SELECT
    Customer_ID,
    COUNT(*) AS Total_Orders
FROM retail_sales
GROUP BY Customer_ID
HAVING COUNT(*) >
(
    SELECT AVG(OrderCount)
    FROM
    (
        SELECT COUNT(*) AS OrderCount
        FROM retail_sales
        GROUP BY Customer_ID
    ) AS temp
)
ORDER BY Total_Orders DESC;

-- =====================================================
-- Question 12:
-- Find Sub-Categories whose average sales are greater than the overall average sales.
-- =====================================================

SELECT
    Sub_Category,
    ROUND(AVG(Sales),2) AS Avg_Sales
FROM retail_sales
GROUP BY Sub_Category
HAVING AVG(Sales) >
(
    SELECT AVG(Sales)
    FROM retail_sales
)
ORDER BY Avg_Sales DESC;

-- =====================================================
-- Question 13:
-- Find states whose average profit is above the overall average profit.
-- =====================================================

SELECT
    State,
    ROUND(AVG(Profit),2) AS Avg_Profit
FROM retail_sales
GROUP BY State
HAVING AVG(Profit) >
(
    SELECT AVG(Profit)
    FROM retail_sales
)
ORDER BY Avg_Profit DESC;

-- =====================================================
-- Question 14:
-- Find categories whose total quantity sold is greater than the average quantity sold across categories.
-- =====================================================

SELECT
    Category,
    SUM(Quantity) AS Total_Quantity
FROM retail_sales
GROUP BY Category
HAVING SUM(Quantity) >
(
    SELECT AVG(CategoryQty)
    FROM
    (
        SELECT SUM(Quantity) AS CategoryQty
        FROM retail_sales
        GROUP BY Category
    ) AS temp
)
ORDER BY Total_Quantity DESC;

-- =====================================================
-- Question 15:
-- Find regions whose total profit is greater than the average regional profit.
-- =====================================================

SELECT
    Region,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM retail_sales
GROUP BY Region
HAVING SUM(Profit) >
(
    SELECT AVG(RegionProfit)
    FROM
    (
        SELECT SUM(Profit) AS RegionProfit
        FROM retail_sales
        GROUP BY Region
    ) AS temp
)
ORDER BY Total_Profit DESC;

-- =====================================================
-- END OF DAY 9 (PART 1)
-- =====================================================

-- =====================================================
-- DAY 9 : PART 2
-- CORRELATED SUBQUERIES
-- =====================================================

-- =====================================================
-- Question 16:
-- Find orders where Sales is greater than the average Sales of the same Category.
-- =====================================================

SELECT *
FROM retail_sales r1
WHERE Sales >
(
    SELECT AVG(Sales)
    FROM retail_sales r2
    WHERE r1.Category = r2.Category
);

-- =====================================================
-- Question 17:
-- Find orders where Profit is greater than the average Profit of the same Region.
-- =====================================================

SELECT *
FROM retail_sales r1
WHERE Profit >
(
    SELECT AVG(Profit)
    FROM retail_sales r2
    WHERE r1.Region = r2.Region
);

-- =====================================================
-- Question 18:
-- Find customers whose order Sales is greater than their own average Sales.
-- =====================================================

SELECT *
FROM retail_sales r1
WHERE Sales >
(
    SELECT AVG(Sales)
    FROM retail_sales r2
    WHERE r1.Customer_ID = r2.Customer_ID
);

-- =====================================================
-- Question 19:
-- Find products whose Discount is higher than the average Discount of the same Sub-Category.
-- =====================================================

SELECT *
FROM retail_sales r1
WHERE Discount >
(
    SELECT AVG(Discount)
    FROM retail_sales r2
    WHERE r1.Sub_Category = r2.Sub_Category
);

-- =====================================================
-- Question 20:
-- Find orders whose Quantity is greater than the average Quantity of the same Segment.
-- =====================================================

SELECT *
FROM retail_sales r1
WHERE Quantity >
(
    SELECT AVG(Quantity)
    FROM retail_sales r2
    WHERE r1.Segment = r2.Segment
);

-- =====================================================
-- Question 21:
-- Find products whose Profit is greater than the average Profit of the same Category.
-- =====================================================

SELECT *
FROM retail_sales r1
WHERE Profit >
(
    SELECT AVG(Profit)
    FROM retail_sales r2
    WHERE r1.Category = r2.Category
);

-- =====================================================
-- Question 22:
-- Find cities where Sales is greater than the average Sales of that State.
-- =====================================================

SELECT *
FROM retail_sales r1
WHERE Sales >
(
    SELECT AVG(Sales)
    FROM retail_sales r2
    WHERE r1.State = r2.State
);

-- =====================================================
-- Question 23:
-- Find orders where Profit Margin (%) is greater than the average Profit Margin of the same Category.
-- =====================================================

SELECT *
FROM retail_sales r1
WHERE Profit_Margin >
(
    SELECT AVG(Profit_Margin)
    FROM retail_sales r2
    WHERE r1.Category = r2.Category
);

-- =====================================================
-- Question 24:
-- Find orders whose Average Selling Price is greater than the average ASP of the same Sub-Category.
-- =====================================================

SELECT *
FROM retail_sales r1
WHERE Average_Selling_Price >
(
    SELECT AVG(Average_Selling_Price)
    FROM retail_sales r2
    WHERE r1.Sub_Category = r2.Sub_Category
);

-- =====================================================
-- Question 25:
-- Find orders whose Sales is greater than the average Sales of the same State.
-- =====================================================

SELECT *
FROM retail_sales r1
WHERE Sales >
(
    SELECT AVG(Sales)
    FROM retail_sales r2
    WHERE r1.State = r2.State
);

-- =====================================================
-- END OF PART 2
-- =====================================================

-- =====================================================
-- DAY 9 : PART 3
-- COMMON TABLE EXPRESSIONS (CTEs)
-- =====================================================

-- =====================================================
-- Question 26:
-- Find total sales for each category using a CTE.
-- =====================================================

WITH CategorySales AS (
    SELECT
        Category,
        SUM(Sales) AS Total_Sales
    FROM retail_sales
    GROUP BY Category
)
SELECT *
FROM CategorySales
ORDER BY Total_Sales DESC;

-- =====================================================
-- Question 27:
-- Find total profit for each region.
-- =====================================================

WITH RegionProfit AS (
    SELECT
        Region,
        SUM(Profit) AS Total_Profit
    FROM retail_sales
    GROUP BY Region
)
SELECT *
FROM RegionProfit
ORDER BY Total_Profit DESC;

-- =====================================================
-- Question 28:
-- Find the top 5 states by total sales.
-- =====================================================

WITH StateSales AS (
    SELECT
        State,
        SUM(Sales) AS Total_Sales
    FROM retail_sales
    GROUP BY State
)
SELECT *
FROM StateSales
ORDER BY Total_Sales DESC
LIMIT 5;

-- =====================================================
-- Question 29:
-- Find the bottom 5 states by profit.
-- =====================================================

WITH StateProfit AS (
    SELECT
        State,
        SUM(Profit) AS Total_Profit
    FROM retail_sales
    GROUP BY State
)
SELECT *
FROM StateProfit
ORDER BY Total_Profit ASC
LIMIT 5;

-- =====================================================
-- Question 30:
-- Find category-wise average sales.
-- =====================================================

WITH AvgCategorySales AS (
    SELECT
        Category,
        AVG(Sales) AS Avg_Sales
    FROM retail_sales
    GROUP BY Category
)
SELECT *
FROM AvgCategorySales
ORDER BY Avg_Sales DESC;

-- =====================================================
-- Question 31:
-- Find sub-categories having profit greater than 10000.
-- =====================================================

WITH SubCategoryProfit AS (
    SELECT
        Sub_Category,
        SUM(Profit) AS Total_Profit
    FROM retail_sales
    GROUP BY Sub_Category
)
SELECT *
FROM SubCategoryProfit
WHERE Total_Profit > 10000
ORDER BY Total_Profit DESC;

-- =====================================================
-- Question 32:
-- Find regions having sales greater than 100000.
-- =====================================================

WITH RegionSales AS (
    SELECT
        Region,
        SUM(Sales) AS Total_Sales
    FROM retail_sales
    GROUP BY Region
)
SELECT *
FROM RegionSales
WHERE Total_Sales > 100000;

-- =====================================================
-- Question 33:
-- Find customer segments with average profit greater than 30.
-- =====================================================

WITH SegmentProfit AS (
    SELECT
        Segment,
        AVG(Profit) AS Avg_Profit
    FROM retail_sales
    GROUP BY Segment
)
SELECT *
FROM SegmentProfit
WHERE Avg_Profit > 30;

-- =====================================================
-- Question 34:
-- Find total quantity sold by category.
-- =====================================================

WITH CategoryQuantity AS (
    SELECT
        Category,
        SUM(Quantity) AS Total_Quantity
    FROM retail_sales
    GROUP BY Category
)
SELECT *
FROM CategoryQuantity
ORDER BY Total_Quantity DESC;

-- =====================================================
-- Question 35:
-- Find average discount by region.
-- =====================================================

WITH RegionDiscount AS (
    SELECT
        Region,
        AVG(Discount) AS Avg_Discount
    FROM retail_sales
    GROUP BY Region
)
SELECT *
FROM RegionDiscount
ORDER BY Avg_Discount DESC;

-- =====================================================
-- Question 36:
-- Find cities with total profit greater than 5000.
-- =====================================================

WITH CityProfit AS (
    SELECT
        City,
        SUM(Profit) AS Total_Profit
    FROM retail_sales
    GROUP BY City
)
SELECT *
FROM CityProfit
WHERE Total_Profit > 5000
ORDER BY Total_Profit DESC;

-- =====================================================
-- Question 37:
-- Find states where average quantity sold is greater than 4.
-- =====================================================

WITH StateQuantity AS (
    SELECT
        State,
        AVG(Quantity) AS Avg_Quantity
    FROM retail_sales
    GROUP BY State
)
SELECT *
FROM StateQuantity
WHERE Avg_Quantity > 4
ORDER BY Avg_Quantity DESC;

-- =====================================================
-- Question 38:
-- Find top-performing sub-categories by average sales.
-- =====================================================

WITH AvgSubCategorySales AS (
    SELECT
        Sub_Category,
        AVG(Sales) AS Avg_Sales
    FROM retail_sales
    GROUP BY Sub_Category
)
SELECT *
FROM AvgSubCategorySales
ORDER BY Avg_Sales DESC
LIMIT 10;

-- =====================================================
-- Question 39:
-- Find category-wise order count.
-- =====================================================

WITH CategoryOrders AS (
    SELECT
        Category,
        COUNT(*) AS Orders
    FROM retail_sales
    GROUP BY Category
)
SELECT *
FROM CategoryOrders
ORDER BY Orders DESC;

-- =====================================================
-- Question 40:
-- Find total sales and profit for each region.
-- =====================================================

WITH RegionSummary AS (
    SELECT
        Region,
        SUM(Sales) AS Total_Sales,
        SUM(Profit) AS Total_Profit
    FROM retail_sales
    GROUP BY Region
)
SELECT *
FROM RegionSummary
ORDER BY Total_Sales DESC;

-- =====================================================
-- END OF PART 3
-- =====================================================

-- =====================================================
-- DAY 9 : PART 4
-- WINDOW FUNCTIONS
-- =====================================================

-- =====================================================
-- Question 41:
-- Assign a row number to every order based on Sales (Highest First).
-- =====================================================

SELECT
    Order_ID,
    Customer_ID,
    Sales,
    ROW_NUMBER() OVER(ORDER BY Sales DESC) AS Row_Num
FROM retail_sales;

-- =====================================================
-- Question 42:
-- Rank all products by Profit.
-- =====================================================

SELECT
    Product_Name,
    Profit,
    RANK() OVER(ORDER BY Profit DESC) AS Profit_Rank
FROM retail_sales;

-- =====================================================
-- Question 43:
-- Rank products using Dense Rank.
-- =====================================================

SELECT
    Product_Name,
    Profit,
    DENSE_RANK() OVER(ORDER BY Profit DESC) AS Dense_Rank
FROM retail_sales;

-- =====================================================
-- Question 44:
-- Rank customers within each Region based on Sales.
-- =====================================================

SELECT
    Region,
    Customer_ID,
    Sales,
    ROW_NUMBER() OVER(
        PARTITION BY Region
        ORDER BY Sales DESC
    ) AS Region_Rank
FROM retail_sales;

-- =====================================================
-- Question 45:
-- Find Top Selling Product from every Category.
-- =====================================================

SELECT *
FROM
(
    SELECT
        Category,
        Product_Name,
        Sales,
        ROW_NUMBER() OVER(
            PARTITION BY Category
            ORDER BY Sales DESC
        ) AS rn
    FROM retail_sales
) t
WHERE rn = 1;

-- =====================================================
-- Question 46:
-- Find Top 3 Profitable Products from every Category.
-- =====================================================

SELECT *
FROM
(
    SELECT
        Category,
        Product_Name,
        Profit,
        DENSE_RANK() OVER(
            PARTITION BY Category
            ORDER BY Profit DESC
        ) AS rnk
    FROM retail_sales
) t
WHERE rnk <= 3;

-- =====================================================
-- Question 47:
-- Calculate Running Total of Sales.
-- =====================================================

SELECT
    Order_ID,
    Sales,
    SUM(Sales)
    OVER(
        ORDER BY Order_ID
    ) AS Running_Total
FROM retail_sales;

-- =====================================================
-- Question 48:
-- Calculate Running Profit.
-- =====================================================

SELECT
    Order_ID,
    Profit,
    SUM(Profit)
    OVER(
        ORDER BY Order_ID
    ) AS Running_Profit
FROM retail_sales;

-- =====================================================
-- Question 49:
-- Calculate Running Average Sales.
-- =====================================================

SELECT
    Order_ID,
    Sales,
    AVG(Sales)
    OVER(
        ORDER BY Order_ID
    ) AS Running_Average
FROM retail_sales;

-- =====================================================
-- Question 50:
-- Calculate Cumulative Quantity Sold.
-- =====================================================

SELECT
    Order_ID,
    Quantity,
    SUM(Quantity)
    OVER(
        ORDER BY Order_ID
    ) AS Running_Quantity
FROM retail_sales;

-- =====================================================
-- Question 51:
-- Compare current Sales with previous Sales.
-- =====================================================

SELECT
    Order_ID,
    Sales,
    LAG(Sales)
    OVER(
        ORDER BY Order_ID
    ) AS Previous_Sales
FROM retail_sales;

-- =====================================================
-- Question 52:
-- Compare current Profit with previous Profit.
-- =====================================================

SELECT
    Order_ID,
    Profit,
    LAG(Profit)
    OVER(
        ORDER BY Order_ID
    ) AS Previous_Profit
FROM retail_sales;

-- =====================================================
-- Question 53:
-- Compare current Sales with next Sales.
-- =====================================================

SELECT
    Order_ID,
    Sales,
    LEAD(Sales)
    OVER(
        ORDER BY Order_ID
    ) AS Next_Sales
FROM retail_sales;

-- =====================================================
-- Question 54:
-- Compare current Profit with next Profit.
-- =====================================================

SELECT
    Order_ID,
    Profit,
    LEAD(Profit)
    OVER(
        ORDER BY Order_ID
    ) AS Next_Profit
FROM retail_sales;

-- =====================================================
-- Question 55:
-- Divide all orders into 4 Sales Quartiles.
-- =====================================================

SELECT
    Order_ID,
    Sales,
    NTILE(4)
    OVER(
        ORDER BY Sales DESC
    ) AS Quartile
FROM retail_sales;

-- =====================================================
-- END OF PART 4
-- =====================================================

-- =====================================================
-- DAY 9 : PART 5
-- ADVANCED BUSINESS CASE STUDY QUERIES
-- =====================================================

-- =====================================================
-- Question 56:
-- Find the Top 10 Customers by Total Sales.
-- =====================================================

SELECT
    Customer_ID,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM retail_sales
GROUP BY Customer_ID
ORDER BY Total_Sales DESC
LIMIT 10;

-- =====================================================
-- Question 57:
-- Find each Category's contribution (%) to Total Sales.
-- =====================================================

SELECT
    Category,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(
        SUM(Sales) * 100 /
        (SELECT SUM(Sales) FROM retail_sales),
        2
    ) AS Contribution_Percentage
FROM retail_sales
GROUP BY Category
ORDER BY Contribution_Percentage DESC;

-- =====================================================
-- Question 58:
-- Find each Region's contribution (%) to Total Profit.
-- =====================================================

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

-- =====================================================
-- Question 59:
-- Find the Top Selling Product in each Category.
-- =====================================================

SELECT *
FROM
(
    SELECT
        Category,
        Product_Name,
        SUM(Sales) AS Total_Sales,
        ROW_NUMBER() OVER(
            PARTITION BY Category
            ORDER BY SUM(Sales) DESC
        ) AS rn
    FROM retail_sales
    GROUP BY Category, Product_Name
) t
WHERE rn=1;

-- =====================================================
-- Question 60:
-- Find the Most Profitable Product in every Category.
-- =====================================================

SELECT *
FROM
(
    SELECT
        Category,
        Product_Name,
        SUM(Profit) AS Total_Profit,
        ROW_NUMBER() OVER(
            PARTITION BY Category
            ORDER BY SUM(Profit) DESC
        ) rn
    FROM retail_sales
    GROUP BY Category, Product_Name
) t
WHERE rn=1;

-- =====================================================
-- Question 61:
-- Find Top 5 Cities by Sales.
-- =====================================================

SELECT
    City,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM retail_sales
GROUP BY City
ORDER BY Total_Sales DESC
LIMIT 5;

-- =====================================================
-- Question 62:
-- Find Bottom 5 Cities by Profit.
-- =====================================================

SELECT
    City,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM retail_sales
GROUP BY City
ORDER BY Total_Profit ASC
LIMIT 5;

-- =====================================================
-- Question 63:
-- Find Category-wise Average Profit Margin.
-- =====================================================

SELECT
    Category,
    ROUND(AVG(Profit_Margin),2) AS Avg_Profit_Margin
FROM retail_sales
GROUP BY Category
ORDER BY Avg_Profit_Margin DESC;

-- =====================================================
-- Question 64:
-- Find Region-wise Average Discount.
-- =====================================================

SELECT
    Region,
    ROUND(AVG(Discount),2) AS Avg_Discount
FROM retail_sales
GROUP BY Region
ORDER BY Avg_Discount DESC;

-- =====================================================
-- Question 65:
-- Find Customers having Total Sales greater than 10000.
-- =====================================================

SELECT
    Customer_ID,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM retail_sales
GROUP BY Customer_ID
HAVING SUM(Sales)>10000
ORDER BY Total_Sales DESC;

-- =====================================================
-- Question 66:
-- Find Products that generated Loss.
-- =====================================================

SELECT
    Product_Name,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM retail_sales
GROUP BY Product_Name
HAVING SUM(Profit)<0
ORDER BY Total_Profit;

-- =====================================================
-- Question 67:
-- Find Region having Highest Average Sales.
-- =====================================================

SELECT
    Region,
    ROUND(AVG(Sales),2) AS Avg_Sales
FROM retail_sales
GROUP BY Region
ORDER BY Avg_Sales DESC
LIMIT 1;

-- =====================================================
-- Question 68:
-- Find Category having Maximum Quantity Sold.
-- =====================================================

SELECT
    Category,
    SUM(Quantity) AS Total_Quantity
FROM retail_sales
GROUP BY Category
ORDER BY Total_Quantity DESC
LIMIT 1;

-- =====================================================
-- Question 69:
-- Find Top 5 Customers contributing highest Profit.
-- =====================================================

SELECT
    Customer_ID,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM retail_sales
GROUP BY Customer_ID
ORDER BY Total_Profit DESC
LIMIT 5;

-- =====================================================
-- Question 70:
-- Executive KPI Dashboard Query.
-- =====================================================

SELECT

COUNT(*) AS Total_Orders,

ROUND(SUM(Sales),2) AS Total_Sales,

ROUND(SUM(Profit),2) AS Total_Profit,

ROUND(AVG(Sales),2) AS Average_Sales,

ROUND(AVG(Profit),2) AS Average_Profit,

ROUND(AVG(Discount),2) AS Average_Discount,

SUM(Quantity) AS Total_Quantity,

COUNT(DISTINCT Customer_ID) AS Total_Customers,

COUNT(DISTINCT Product_Name) AS Total_Products,

COUNT(DISTINCT City) AS Total_Cities,

COUNT(DISTINCT State) AS Total_States,

COUNT(DISTINCT Region) AS Total_Regions

FROM retail_sales;

-- =====================================================
-- END OF DAY 9
-- =====================================================