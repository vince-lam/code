/* 1) Run the query entered below in the SQL workspace to notice the row with
missing data */

SELECT *
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total IS NULL


/* 2) Use COALESCE to fill in the accounts.id column with the account.id for
the NULL value for the table in 1. */

SELECT
  COALESCE(a.id, a.id) filled_id,
  a.name,
  a.website,
  a.lat,
  a.long,
  a.primary_poc,
  a.sales_rep_id, o.*
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total IS NULL;




/* 3) Use COALESCE to fill in the orders.account_id column with the account.id
for the NULL value for the table in 1. */

#mine
SELECT
  COALESCE(a.id, a.id) filled_id,
  a.name,
  a.website,
  a.lat,
  a.long,
  a.primary_poc,
  a.sales_rep_id,
  COALESCE(o.account_id, a.id) account_id,
  o.id,
  o.standard_qty,
  o.poster_qty,
  o.gloss_qty,
  o.total,
  o.occurred_at,
  o.standard_amt_usd,
  o.gloss_amt_usd,
  o.poster_amt_usd,
  o.total_amt_usd
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total IS NULL;

#example
SELECT COALESCE(a.id, a.id) filled_id, a.name, a.website, a.lat, a.long, a.primary_poc, a.sales_rep_id, COALESCE(o.account_id, a.id) account_id, o.occurred_at, o.standard_qty, o.gloss_qty, o.poster_qty, o.total, o.standard_amt_usd, o.gloss_amt_usd, o.poster_amt_usd, o.total_amt_usd
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total IS NULL;

/* 4) Use COALESCE to fill in each of the qty and usd columns with 0 for the table in 1. */

#mine
SELECT
  COALESCE(a.id, a.id) filled_id,
  a.name,
  a.website,
  a.lat,
  a.long,
  a.primary_poc,
  a.sales_rep_id,
  COALESCE(o.account_id, a.id) account_name,
  o.id,
  COALESCE(o.standard_qty, 0) standard_qty,
  COALESCE(o.poster_qty, 0) poster_qty,
  COALESCE(o.gloss_qty, 0) gloss_qty,
  COALESCE(o.total, 0) total_qty,
  o.occurred_at,
  COALESCE(o.standard_amt_usd, 0) standard_usd,
  COALESCE(o.gloss_amt_usd, 0) gloss_usd,
  COALESCE(o.poster_amt_usd, 0) poster_usd,
  COALESCE(o.total_amt_usd, 0) total_usd
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total IS NULL;

#example
SELECT COALESCE(a.id, a.id) filled_id, a.name, a.website, a.lat, a.long, a.primary_poc, a.sales_rep_id, COALESCE(o.account_id, a.id) account_id, o.occurred_at, COALESCE(o.standard_qty, 0) standard_qty, COALESCE(o.gloss_qty,0) gloss_qty, COALESCE(o.poster_qty,0) poster_qty, COALESCE(o.total,0) total, COALESCE(o.standard_amt_usd,0) standard_amt_usd, COALESCE(o.gloss_amt_usd,0) gloss_amt_usd, COALESCE(o.poster_amt_usd,0) poster_amt_usd, COALESCE(o.total_amt_usd,0) total_amt_usd
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total IS NULL;

/* 5) Run the query in 1 with the WHERE removed and COUNT the number of ids. */

SELECT COUNT(*)
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id

/* Run the query in 5 but with the COALESCE function used in question 2 through 4. */

#mine
SELECT
  COALESCE(a.id, a.id) filled_id,
  a.name,
  a.website,
  a.lat,
  a.long,
  a.primary_poc,
  a.sales_rep_id,
  COALESCE(o.account_id, a.id) account_name,
  o.id,
  COALESCE(o.standard_qty, 0) standard_qty,
  COALESCE(o.poster_qty, 0) poster_qty,
  COALESCE(o.gloss_qty, 0) gloss_qty,
  COALESCE(o.total, 0) total_qty,
  o.occurred_at,
  COALESCE(o.standard_amt_usd, 0) standard_usd,
  COALESCE(o.gloss_amt_usd, 0) gloss_usd,
  COALESCE(o.poster_amt_usd, 0) poster_usd,
  COALESCE(o.total_amt_usd, 0) total_usd
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id


#example
SELECT COALESCE(a.id, a.id) filled_id, a.name, a.website, a.lat, a.long, a.primary_poc, a.sales_rep_id, COALESCE(o.account_id, a.id) account_id, o.occurred_at, COALESCE(o.standard_qty, 0) standard_qty, COALESCE(o.gloss_qty,0) gloss_qty, COALESCE(o.poster_qty,0) poster_qty, COALESCE(o.total,0) total, COALESCE(o.standard_amt_usd,0) standard_amt_usd, COALESCE(o.gloss_amt_usd,0) gloss_amt_usd, COALESCE(o.poster_amt_usd,0) poster_amt_usd, COALESCE(o.total_amt_usd,0) total_amt_usd
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id;
