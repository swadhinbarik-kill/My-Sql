-- windows function

select gender,avg(salary) over()	-- all salary avg
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
;

select gender,avg(salary) over(partition by gender)  -- avg salary by gender
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
; 

select dem.first_name,dem.last_name,gender,avg(salary) over(partition by gender) as avg_salary  -- avg salary by gender
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
; 

-- sum

select dem.first_name,dem.last_name,gender,sum(salary) over(partition by gender) as avg_salary  -- sum of salary on basis on gender
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
;

-- Rolling total

select dem.employee_id,dem.first_name,dem.last_name,gender,salary,
sum(salary) over(partition by gender order by dem.mployee_id) as avg_salary  -- sum of consecutive salary on basis on gender
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
;

-- row number

select dem.employee_id,dem.first_name,dem.last_name,gender,salary,
row_number() over() -- gives row number of all as empty brackets
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
;

-- rank	

select dem.employee_id,dem.first_name,dem.last_name,gender,salary,
row_number() over(partition by gender order by salary desc) as row_num, -- gives row number of gender and resets when gender changes
rank() over(partition by gender order by salary desc) as rank_num,	-- ranks gender based on salary it gives number positionally
dense_rank() over(partition by gender order by salary desc) as dense_rank_num	-- ranks gender based on salary it gives number numerically
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
;