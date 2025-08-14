-- Limit & Aliasing

select *
From employee_demographics
Order by age desc
Limit 2,1 
;

-- aliasing

select occupation, avg(salary) as avg_salary
from employee_salary
where occupation like '%manager'
group by occupation
having avg_salary > 75000
;