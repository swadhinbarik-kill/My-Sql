-- joins

select *
from employee_demographics
;

select *
from employee_salary
;

select *
from employee_demographics as dem
inner Join employee_salary as sal
	on dem.employee_id = sal.employee_id	
;

select dem.employee_id,age,occupation
from employee_demographics as dem
inner Join employee_salary as sal
	on dem.employee_id = sal.employee_id	
;

select *
from employee_demographics as dem
right Join employee_salary as sal
	on dem.employee_id = sal.employee_id	
;

-- self joint

Select *
from employee_salary As emp1 
join employee_salary as emp2
	on emp1.employee_id = emp2.employee_id
;

select emp1.employee_id as emp_santa,
emp1.first_name as first_name_santa,
emp1.last_name as first_name_santa,
emp2.employee_id as emp_id,
emp2.first_name as first_name_emp,
emp2.last_name as first_name_emp
from employee_salary As emp1 
join employee_salary as emp2
	on emp1.employee_id = emp2.employee_id
;

-- joining multiple tables together

select *
from employee_demographics as dem
Inner join employee_salary as sal
	on dem.employee_id = sal.employee_id
inner join parks_departments as parks 
	on sal.dept_id = parks.department_id
;

select *
from parks_departments
;