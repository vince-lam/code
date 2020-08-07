/* Appending Data via UNION
1) Write a query that uses UNION ALL on two instances (and selecting all columns) of the accounts table.
Then inspect the results and answer the subsequent quiz. */

SELECT *
  FROM accounts

UNION ALL

SELECT *
  FROM accounts



/* Pretreating Tables before doing a UNION
2) ADD a WHERE clause to each of the tables that you unioned in the query above,
filtering the first table where name equals Walmart and filtering the second table where name equals Disney.
Inspect the results then answer the subsequent quiz */

SELECT *
  FROM accounts
  WHERE name = 'Walmart'

UNION ALL

SELECT *
  FROM accounts
  WHERE name = 'Disney'



/* Performing Operations on a Combined Dataset
3) Perform the union in the first query (under the Appending Data via UNION header)
in a common table expression and name it double_accounts.
Then do a COUNT the number of times a name appears in the double_accounts table. 
If you do this correctly, the query results should have a count of 2 for each name. */


WITH double_accounts AS (
  SELECT *
    FROM accounts

  UNION all

  SELECT *
    FROM accounts
  )

SELECT
      name,
      COUNT(name) AS name_count
    FROM double_accounts
  GROUP BY 1
  ORDER BY 2 DESC;
