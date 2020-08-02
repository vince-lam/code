/* Comparing a Row to Previous Row
In the previous video, Derek outlines how to compare a row to a previous or
subsequent row. This technique can be useful when analyzing time-based events.
Imagine you're an analyst at Parch & Posey and you want to determine how the
current order's total revenue ("total" meaning from sales of all types of paper)
compares to the next order's total revenue.

Modify Derek's query from the previous video in the SQL Explorer below to
perform this analysis. You'll need to use occurred_at and total_amt_usd in the
orders table along with LEAD to do so. In your query results, there should be
four columns: occurred_at, total_amt_usd, lead, and lead_difference. */


# example
SELECT account_id,
       standard_sum,
       LAG(standard_sum) OVER (ORDER BY standard_sum) AS lag,
       LEAD(standard_sum) OVER (ORDER BY standard_sum) AS lead,
       standard_sum - LAG(standard_sum) OVER (ORDER BY standard_sum) AS lag_difference,
       LEAD(standard_sum) OVER (ORDER BY standard_sum) - standard_sum AS lead_difference
FROM (
SELECT account_id,
       SUM(standard_qty) AS standard_sum
  FROM orders
 GROUP BY 1
 ) sub


 # after
SELECT occurred_at,
       total_amt_usd,
       LEAD(total_amt_usd) OVER (ORDER BY occurred_at) AS lead,
       LEAD(total_amt_usd) OVER (ORDER BY occurred_at) - total_amt_usd AS lead_difference
FROM (
 SELECT occurred_at,
        SUM(total_amt_usd) AS total_amt_usd
      FROM orders
    GROUP BY 1
) sub
      
