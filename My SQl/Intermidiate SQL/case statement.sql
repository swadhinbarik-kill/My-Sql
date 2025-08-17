-- case statements
-- remeber to use ',' at the end of select before using case
select first_name,last_name,age,
case 
	when age <=30 then 'young'
	when age between 30 and 50 then 'teen'
    else 'old'
end    as type	
from employee_demographics;

-- project 
-- Pawnee Council sent out a memo of their bonus and pay increase structure so we need to follow it
-- Basically if they make less than 45k then they get a 5% raise - very generous
-- if they make more than 45k they get a 7% raise
-- they get a bonus of 10% if they work for the Finance Department

select first_name,last_name,salary,
case
	when salary < 45000 then (salary*1.05)
    when salary > 45000 then salary + (salary*0.07)
    when dept_id = 6 then salary + (salary*0.1)
end as new_salary
from employee_salary;


