-- where clause

select *
from employee_salary
where first_name = 'Leslie'
;

select *
from employee_salary
where salary = 50000
;

select *
from employee_salary
where salary != 50000
;

select *
from employee_demographics
where birth_date > '1985-01-01'
;

-- And Or Not --- Logical Operators

select *
from employee_demographics
where birth_date > '1985-01-01'
And gender = 'female'
;

select *
from employee_demographics
where birth_date > '1985-01-01'
Or gender = 'female'
;

-- Like statement --
-- % and _ --

select *
from employee_salary
where first_name Like 'Le%'
;

select *
from employee_salary
where first_name like 'a__'
;