/* This is a exericse for practicing SQL skills in data cleaning */
/* Skills were used: MIN, MAX, UPDATE, */


/* Preview the table */
SELECT *
FROM SQL_Tutorial.dbo.automobile_data;


/* Step 1: Inspect the fuel_type column */
SELECT DISTINCT fuel_type
FROM SQL_Tutorial.dbo.automobile_data;


/* Step 2: Inspect the length column, the correct range is 141.1 - 208.1 */
SELECT
	MIN(length) AS min_length,
	MAX(length) AS max_lenth
FROM 
	SQL_Tutorial.dbo.automobile_data;


/* Step 3: Fill in missing data */
/* Check num_of_doors column has null values or not, you can use this query after update for double checking*/
SELECT *
FROM SQL_Tutorial.dbo.automobile_data
WHERE num_of_doors IS NULL;

/* Fill NA values after double check with the manager, both should be 4 doors */
UPDATE SQL_Tutorial.dbo.automobile_data
SET num_of_doors = 4
WHERE
	make = 'dodge'
	AND fuel_type = 'gas'
	AND body_style = 'sedan';

UPDATE SQL_Tutorial.dbo.automobile_data
SET num_of_doors = 4
WHERE
	make = 'mazda'
	AND fuel_type = 'diesel'
	AND body_style = 'sedan';


/* Step 4: Identify potential errors */
/* Clean Data with misspelling in num_of_cylinders*/
SELECT
	DISTINCT num_of_cylinders
FROM SQL_Tutorial.dbo.automobile_data;

UPDATE SQL_Tutorial.dbo.automobile_data
SET num_of_cylinders = 'two'
WHERE num_of_cylinders = 'tow';


/* Checking on compression ratio column (The correct range is 7-23 */
SELECT
	MIN(compression_ratio) AS min_compression_ratio,
	MAX(compression_ratio) AS max_compression_ratio
FROM
	SQL_Tutorial.dbo.automobile_data;

/* To observe if we exclude record with 70 compression_ratio, the range is correct or not*/
SELECT
	MIN(compression_ratio) AS min_compression_ratio,
	MAX(compression_ratio) AS max_compression_ratio
FROM
	SQL_Tutorial.dbo.automobile_data
WHERE
	compression_ratio <> 70;

/* We need to remove the above record for precise data */
DELETE SQL_Tutorial.dbo.automobile_data
WHERE compression_ratio = 70;



/* Answer Practice Quiz Question */
SELECT MAX(price) AS max_price
FROM SQL_Tutorial.dbo.automobile_data;




