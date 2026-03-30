# SQL Sales & Customer Analysis

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
## Sample Insights

- Top Customer: Sneha (₹57,000)
- Highest Spending Category: Electronics
- Most Sold Product: T-shirt
- Total Revenue: ₹140,300
  
## Example Query

```sql
SELECT customer_name, 
       SUM(price * quantity) AS total_spent
FROM sales
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 3;
