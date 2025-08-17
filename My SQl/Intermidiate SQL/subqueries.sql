-- subqueries

select *
from employee_salary
;

select *
from employee_demographics
where employee_id in 	-- this is a operator
				(select employee_id
					from employee_salary
                    where dept_id=1) -- this is an operand
;

-- works completely well

SELECT *
FROM employee_demographics
WHERE employee_id IN 
			(SELECT employee_id, salary
				FROM employee_salary
                WHERE dept_id = 1);

# now if we try to have more than 1 column in the subquery we get an error saying the operand should contain 1 column only 

#We can also use subqueries in the select and the from statements - let's see how we can do this

-- Let's say we want to look at the salaries and compare them to the average salary

select first_name,salary,
(select avg(salary)
from employee_salary) as avg
from employee_salary
group by first_name,salary;

SELECT gender, MIN(age), MAX(age), COUNT(age),AVG(age)
FROM employee_demographics
group by gender
;

SELECT *
FROM (SELECT gender, MIN(age), MAX(age), COUNT(age),AVG(age)
FROM employee_demographics
GROUP BY gender) as agg_table
;


SELECT gender, avg('min(age)') -- need to use min(age) as a name its not a aggregation anymore
FROM (SELECT gender, MIN(age), MAX(age), COUNT(age),AVG(age)
FROM employee_demographics
GROUP BY gender) as agg_table
;