-- TEMPRORAY TABLES

create temporary TABLE Temp_table
(first_name varchar(50),
last_name varchar(50),
favourite_movie varchar(100)
);

insert into temp_table
VALUES ('Swadhin','Barik','Lord of the Rings: The Twin Towers');

SELECT *
FROM temp_table;

-- the second way is much faster and my preferred method
-- 2. Build it by inserting data into it - easier and faster

CREATE TEMPORARY TABLE salary_over_50k
SELECT *
FROM employee_salary
WHERE salary > 50000;

-- if we run this query we get our output
SELECT *
FROM temp_table_2;

-- this is the primary way I've used temp tables especially if I'm just querying data and have some complex data I want to put into boxes or these temp tables to use later
-- it helps me kind of categorize and separate it out
