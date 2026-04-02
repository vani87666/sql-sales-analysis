
## Project 1: SQL Sales & Customer Analysis

## Objective
Analyze sales data to extract meaningful business insights using SQL.

## Key Analysis
- Total revenue calculation
- Customer spending analysis
- Top customers identification
- Product performance analysis
- Monthly revenue trends
- Category-wise revenue breakdown

## Skills Used
- SQL Aggregations (SUM, COUNT)
- GROUP BY, HAVING
- Subqueries
- Window Functions (RANK)
  ## Tools
- MySQL
- GitHub
## Conclusion
This project demonstrates strong SQL skills and the ability to derive insights from data.


## Project 2: E-commerce Analysis (JOIN)

### Objective:
Analyze customer order data using multiple tables to generate meaningful business insights.

### Dataset Structure:
- customers (customer_id, name, city)
- orders (order_id, customer_id, order_date)
- order_details (order_id, product, quantity, price)

### Key Analysis Performed:
- Total revenue calculation using JOINs
- Revenue generated per customer
- Top 3 customers based on spending
- Identified customers with no orders
- Most sold product based on quantity
- Monthly revenue trend analysis
- City-wise revenue distribution
- Customer Lifetime Value (CLV)

### Key Insights:
- Identified highest spending customers
- Found inactive customers (no orders)
- Detected top-performing products
- Observed revenue trends over months
- Compared revenue contribution by cities

### Skills Used:
- INNER JOIN
- LEFT JOIN
- GROUP BY
- ORDER BY
- Aggregate Functions (SUM, COUNT)
- Data Analysis using SQL

### File:
- ecommerce_analysis.sql


## Project 3: Student Performance Analysis

### Objective:
Analyze student academic performance and behavior using SQL to identify patterns and insights.

### Dataset Structure:
- students (student_id, name, department)
- exams (exam_id, student_id, subject, marks)
- attendance (student_id, attendance_percentage)

### Key Analysis Performed:
- Calculated average and total marks per student
- Identified top-performing students
- Found students scoring below average
- Analyzed department-wise performance
- Detected students with high attendance but low marks
- Ranked students using RANK() window function
- Classified students as PASS/FAIL using CASE statements

### Key Insights:
- Identified top and low-performing students
- Found mismatch between attendance and performance
- Compared performance across departments
- Highlighted students needing improvement

### Skills Used:
- INNER JOIN
- GROUP BY & HAVING
- Subqueries
- Window Functions (RANK)
- CASE Statements
- Aggregate Functions (SUM, AVG)

### File:
- student_performance.sql
