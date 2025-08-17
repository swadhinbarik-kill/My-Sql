-- unions

Select age,employee_id
from employee_demographics
union
select first_name,last_name
from employee_salary
;

-- by default union has union distinct

Select first_name,last_name
from employee_demographics
union
select first_name,last_name
from employee_salary
;

-- by using union all it display repeated data

Select first_name,last_name
from employee_demographics
union
select first_name,last_name
from employee_salary
;

Select first_name,last_name
from employee_demographics
union
select first_name,last_name
from employee_salary
;

Select first_name,last_name
from employee_demographics
union
select first_name,last_name
from employee_salary
;

Select first_name,last_name,'old man' as Label
from employee_demographics
where age > 40 and gender = 'Male'
 
union
Select first_name,last_name,'old lady' as Label
from employee_demographics
where age > 35 and gender = 'Female' 
union
select first_name,last_name,'highly paid' as label
from employee_salary
where salary > 70000
order by first_name , last_name 
;