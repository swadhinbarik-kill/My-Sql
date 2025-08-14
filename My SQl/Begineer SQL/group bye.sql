-- group by

select *
FROM employee_demographics;

select gender, avg(age), max(age), min(age), count(age)
FROM employee_demographics
group by gender
;

select occupation, salary
FROM employee_salary
group by occupation, salary
;

-- order by
select *
from employee_demographics
order by first_name desc
;
