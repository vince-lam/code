/* Aggregates in Window Functions with and without ORDER BY
Run the query that Derek wrote in the previous video in the first SQL Explorer below.
Keep the query results in mind; you'll be comparing them to the results of another query next. */


SELECT id,
       account_id,
       standard_qty,
       DATE_TRUNC('month', occurred_at) AS month,
       DENSE_RANK() OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('month',occurred_at)) AS dense_rank,
       SUM(standard_qty) OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('month',occurred_at)) AS sum_std_qty,
       COUNT(standard_qty) OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('month',occurred_at)) AS count_std_qty,
       AVG(standard_qty) OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('month',occurred_at)) AS avg_std_qty,
       MIN(standard_qty) OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('month',occurred_at)) AS min_std_qty,
       MAX(standard_qty) OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('month',occurred_at)) AS max_std_qty
FROM orders


/* Now remove ORDER BY DATE_TRUNC('month',occurred_at) in each line of the query
that contains it in the SQL Explorer below. Evaluate your new query,
compare it to the results in the SQL Explorer above, and answer the subsequent quiz questions. */

SELECT id,
       account_id,
       standard_qty,
       DATE_TRUNC('month', occurred_at) AS month,
       DENSE_RANK() OVER (PARTITION BY account_id) AS dense_rank,
       SUM(standard_qty) OVER (PARTITION BY account_id) AS sum_std_qty,
       COUNT(standard_qty) OVER (PARTITION BY account_id) AS count_std_qty,
       AVG(standard_qty) OVER (PARTITION BY account_id) AS avg_std_qty,
       MIN(standard_qty) OVER (PARTITION BY account_id) AS min_std_qty,
       MAX(standard_qty) OVER (PARTITION BY account_id) AS max_std_qty
FROM orders


What is the value of dense_rank in every row for the following account_id values?
1
Nice! That's correct. dense_rank is constant at 1 for all rows for all account_id values, actually.


What is the value of sum_std_qty in the first row for the following account_id values?
Nice! That's correct. If you look closely, sum_std_qty is constant as well for all rows for all account_id values.


What is happening when you omit the ORDER BY clause when doing aggregates with window functions?
Use the results from the queries above to guide your thoughts then jot these thoughts down in a few sentences in the text box below.

The ORDER BY clause is one of two clauses integral to window functions.
The ORDER and PARTITION define what is referred to as the “window”—the ordered
subset of data over which calculations are made. Removing ORDER BY just leaves
an unordered partition; in our query's case, each column's value is simply an
aggregation (e.g., sum, count, average, minimum, or maximum) of all the
standard_qty values in its respective account_id.

The easiest way to think about this - leaving the ORDER BY out is equivalent to
 "ordering" in a way that all rows in the partition are "equal" to each other.
Indeed, you can get the same effect by explicitly adding the ORDER BY clause
like this: ORDER BY 0 (or "order by" any constant expression), or even, more
emphatically, ORDER BY NULL.
