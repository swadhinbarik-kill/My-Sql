-- CTEs (common table empression)
-- type of subquery but more standardaise	

-- using CTE

WITH CTE_Example AS 
( 
SELECT gender, SUM(salary), MIN(salary), MAX(salary), COUNT(salary), AVG(salary) as avg_sal
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
select *
FROM CTE_Example
;

WITH CTE_Example AS -- names of our CTE
( 
SELECT gender, SUM(salary), MIN(salary), MAX(salary), COUNT(salary), AVG(salary) as avg_sal
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
) -- subquery

select avg(avg_sal)
-- SELECT AVG(AVG(salary)) 
-- This will not work in most SQL engines.Why? 
-- Because you’re nesting AVG() inside AVG() at the same query level — SQL doesn’t allow aggregate functions on top of aggregate functions directly, unless you’re in a subquery.
FROM CTE_Example
;

WITH CTE_Example AS 
( 
SELECT gender, SUM(salary), MIN(salary), MAX(salary), COUNT(salary), AVG(salary) as avg_sal
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
select avg_sal
FROM CTE_Example
;

-- we need to immidiately use CTE we can not use after it
select *
FROM CTE_Example
;

-- we also have the ability to create multiple CTEs with just one With Expression

WITH CTE_Example AS 
(
SELECT employee_id, gender, birth_date
FROM employee_demographics dem
WHERE birth_date > '1985-01-01'
), -- just have to separate by using a comma
CTE_Example2 AS 
(
SELECT employee_id, salary
FROM parks_and_recreation.employee_salary
WHERE salary >= 50000
)
-- Now if we change this a bit, we can join these two CTEs together
SELECT *
FROM CTE_Example cte1
LEFT JOIN CTE_Example2 cte2
	ON cte1. employee_id = cte2. employee_id;

-- we can rename them like this
WITH CTE_Example (gender, sum_salary, min_salary, max_salary, count_salary) AS 
(
SELECT gender, SUM(salary) , MIN(salary),max(SALARY),COUNT(salary)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
-- notice here I have to use back ticks to specify the table names  - without them it doesn't work
SELECT *
FROM CTE_Example;

-- using subquery which is bit hard to understand
SELECT AVG(avg_salary)
FROM (
   SELECT AVG(salary) AS avg_salary
   FROM employee_demographics dem
   JOIN employee_salary sal
     ON dem.employee_id = sal.employee_id
   GROUP BY gender
) subquery_syntax
;  -- gives same result

	 
