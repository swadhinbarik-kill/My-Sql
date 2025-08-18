-- stored procedure 

-- First let's just write a super simple query
SELECT *
FROM employee_salary
WHERE salary >= 50000;

-- Now let's put this into a stored procedure.
CREATE PROCEDURE large_salaries()
SELECT *
FROM employee_salary
WHERE salary >= 50000;	

call parks_and_recreation.large_salaries();



-- When we change this delimiter it now reads in everything as one whole unit or query instead of stopping
-- after the first semi colon
DELIMITER $$  -- changing delimiter to $$
CREATE PROCEDURE large_salaries2()
BEGIN
	SELECT *
	FROM employee_salary
	WHERE salary >= 60000;
	SELECT *
	FROM employee_salary
	WHERE salary >= 50000;
END $$

call parks_and_recreation.large_salaries2()

Delimiter ; -- again changing delimiter to ;
 
drop procedure if exists `large_salaries4`
delimiter $$
CREATE PROCEDURE large_salaries4(var_name int)  -- the empty bracket indicates that it accepts values in the bracket that is being written in bracket
BEGIN
	SELECT *
	FROM employee_salary
    where employee_id=var_name
    ;
END $$

call large_salaries4(4);