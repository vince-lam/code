/* 1) Write a query to look at the top 10 rows to understandthe columns
and the raw data in the dataset called sf_crime_data */


SELECT *
FROM sf_crime_data
LIMIT 10


/* 2) Remembering back to the lesson on dates, use the QUiz Question at the
bottom of this page to make sure you remember the format that dates should use in SQL. */

yyyy-mm-dd


/* 4) Write a query to change the date into the correct SQL date format.
You will need to use at least SUBSTR and CONCAT to perform this oepration */
#example
SELECT date orig_date,
(SUBSTR(date, 7, 4) || '-' || LEFT(date, 2) || '-' || SUBSTR(date, 4, 2)) new_date
FROM sf_crime_data;


#mine
WITH t1 AS (SELECT date,
            SUBSTR(date, 1, 2) as month,
            REPLACE(SUBSTR(date, 3,4), '/','') as day,
            RIGHT(SUBSTR(date, 5,6),4) as year
            FROM sf_crime_data
            LIMIT 10)
SELECT CONCAT(year, '-', month, '-', day)
FROM t1


/* 5) Once you have created a columnin the correct format,
use either CAST or :: to convert this to a date. */

#example
SELECT date orig_date,
(SUBSTR(date, 7, 4) || '-' || LEFT(date, 2) || '-' || SUBSTR(date, 4, 2))::DATE new_date
FROM sf_crime_data;


#mine
WITH t1 AS (SELECT date, SUBSTR(date, 1, 2) as month, REPLACE(SUBSTR(date, 3,4), '/','') as day,
            RIGHT(SUBSTR(date, 5,6),4) as year
            FROM sf_crime_data
            LIMIT 10)
SELECT CAST(CONCAT(year, '-', month, '-', day) AS DATE)
FROM t1
