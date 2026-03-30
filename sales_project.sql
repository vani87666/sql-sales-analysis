-- =========================================
-- PROJECT: SQL SALES & CUSTOMER ANALYSIS
-- =========================================

-- STEP 1: Create Database
CREATE DATABASE sales_project;
USE sales_project;

-- =========================================
-- STEP 2: Create Table
-- =========================================
CREATE TABLE sales (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    product VARCHAR(50),
    category VARCHAR(50),
    quantity INT,
    price INT,
    order_date DATE
);

-- =========================================
-- STEP 3: Insert Data
-- =========================================
INSERT INTO sales VALUES
(1, 'Amit', 'Mobile', 'Electronics', 1, 15000, '2024-01-10'),
(2, 'Sneha', 'Laptop', 'Electronics', 1, 50000, '2024-01-12'),
(3, 'Amit', 'Headphones', 'Electronics', 2, 2000, '2024-02-05'),
(4, 'Rahul', 'Shoes', 'Fashion', 1, 3000, '2024-02-10'),
(5, 'Sneha', 'Bag', 'Fashion', 2, 2000, '2024-03-01'),
(6, 'Priya', 'Laptop', 'Electronics', 1, 52000, '2024-03-05'),
(7, 'Rahul', 'T-shirt', 'Fashion', 3, 500, '2024-03-10'),
(8, 'Neha', 'Watch', 'Accessories', 1, 7000, '2024-03-15'),
(9, 'Amit', 'Charger', 'Electronics', 1, 800, '2024-03-18'),
(10, 'Sneha', 'Shoes', 'Fashion', 1, 3000, '2024-03-20');

-- =========================================
-- STEP 4: PROJECT QUESTIONS (SOLVE BELOW)
-- =========================================

-- -----------------------------------------
-- BASIC LEVEL
-- -----------------------------------------

-- Q1: Total Revenue (price * quantity)
-- Expected: Use SUM()
-- WRITE YOUR QUERY BELOW
   
    select sum(price* quantity) as total_revenue from sales ;

-- Q2: Total Number of Orders
-- Expected: COUNT(*)
   select count(*) as total_orders from sales;


-- Q3: Total Unique Customers
-- Expected: COUNT(DISTINCT customer_name)
   select COUNT(DISTINCT customer_name) as unique_customers from sales;

-- -----------------------------------------
-- INTERMEDIATE LEVEL
-- -----------------------------------------

-- Q4: Revenue per Customer
-- Expected: GROUP BY customer_name
   select customer_name, sum(price * quantity) as Revenue_per_customer
from sales 
group by customer_name;


-- Q5: Top 3 Customers by Spending
-- Expected: ORDER BY + LIMIT
SELECT customer_name,
       SUM(price * quantity) AS total_spent
FROM sales
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 3;
-- Q6: Most Sold Product (by quantity)

select product ,sum(quantity) as total_quantity_sold from sales group by product order by total_quantity_sold DESC limit 1;
-- -----------------------------------------
-- ADVANCED LEVEL
-- -----------------------------------------
- Q7: Category-wise Revenue
select category,sum(price*quantity) as Revenue from sales group by category ;

-- Q8: Monthly Revenue Trend
-- Hint: Use MONTH(order_date)
SELECT MONTH(order_date) AS Monthly_revenue_trend,
       SUM(price * quantity) AS revenue
FROM sales
GROUP BY MONTH(order_date)
ORDER BY Monthly_revenue_trend;

-- Q9: Customers who placed more than 1 order
-- Hint: COUNT(order_id) > 1
SELECT customer_name, 
       COUNT(order_id) AS order_count
FROM sales
GROUP BY customer_name
HAVING COUNT(order_id) > 1;
-- -----------------------------------------
-- BONUS (REAL ANALYST LEVEL)
-- -----------------------------------------

-- Q10: Highest Spending Customer in each Category
-- Hint: GROUP BY + subquery / window function

SELECT category, customer_name, total_spent
FROM (
    SELECT category,
           customer_name,
           SUM(price * quantity) AS total_spent,
           RANK() OVER (PARTITION BY category 
                        ORDER BY SUM(price * quantity) DESC) AS rnk
    FROM sales
    GROUP BY category, customer_name
) t
WHERE rnk = 1;
-- =========================================
-- END OF PROJECT
-- =========================================