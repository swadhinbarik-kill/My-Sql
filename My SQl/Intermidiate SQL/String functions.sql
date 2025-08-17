-- string functions

-- length

select length('swadhin')
;

select first_name,length(first_name) as word
from employee_demographics
union
select last_name,length(last_name) as word
from employee_demographics
order by 2
;

-- uppercase
select upper('swadhin');
-- lowercase 
select upper('SWADHIN');

-- trim
select trim('         sky          ');
-- ltrim (trims left spaces)
select ltrim('         sky          ');
-- rtrim (trims rigth spaces)
select rtrim('          sky          ');

-- Left , right 
select first_name,left(first_name, 3) as from_left_side, right(first_name, 3) as from_right_side
from employee_demographics
;

-- substrings
-- index starts from 1
select first_name,substring(first_name,3,2)
from employee_demographics
;

select birth_date,substring(birth_date,6,2) as month, right(birth_date,2) as date
from employee_demographics
;

-- replace -- this is case sensitive there is a difference in 'A' and 'a'
select first_name,replace(first_name,'a','z')
from employee_demographics
;

-- locate
select first_name, locate('es',first_name) -- gives the output of index number
from employee_demographics
;

-- concat
select first_name,last_name,concat(first_name,' ',last_name) as full_name
from employee_demographics
;
