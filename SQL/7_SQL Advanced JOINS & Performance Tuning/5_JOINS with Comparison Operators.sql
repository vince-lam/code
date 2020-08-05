/* Inequality JOINs
In the following SQL Explorer, write a query that left joins the accounts
table and the sales_reps tables on each sale rep's ID number and joins it
using the < comparison operator on accounts.primary_poc and sales_reps.name, like so:
accounts.primary_poc < sales_reps.name

The query results should be a table with three columns: the account name
(e.g. Johnson Controls), the primary contact name (e.g. Cammy Sosnowski),
and the sales representative's name (e.g. Samuel Racine). Then answer the
subsequent multiple choice question. */

# mine
SELECT a.name account, a.primary_poc poc, s.name rep
FROM accounts a
JOIN sales_reps s
ON a.sales_rep_id = s.id
AND a.primary_poc < s.name

#example
SELECT accounts.name as account_name,
       accounts.primary_poc as poc_name,
       sales_reps.name as sales_rep_name
  FROM accounts
  LEFT JOIN sales_reps
    ON accounts.sales_rep_id = sales_reps.id
   AND accounts.primary_poc < sales_reps.name
