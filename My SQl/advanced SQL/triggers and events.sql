-- triggers and events

select*
from employee_demographics;	

select*
from employee_salary;	

delimiter $$
Create trigger employee_insert
	after insert on employee_salary
    for each row 
Begin
	Insert into employee_demographics (employee_id,first_name,last_name)
	VALUES (NEW.employee_id,NEW.first_name,NEW.last_name);
end $$
delimiter ;

INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES(13, 'Jean-Ralphio', 'Saperstein', 'Entertainment 720 CEO', 1000000, NULL);

SET SQL_SAFE_UPDATES = 0;

-- delimiter $$
-- Begin;
-- 	DELETE FROM employee_salary
-- 	WHERE employee_id = 13;

-- 	DELETE FROM employee_demographics
-- 	WHERE employee_id = 13;
-- end$$


-- events

-- now let's look at Events

-- Now I usually call these "Jobs" because I called them that for years in MSSQL, but in MySQL they're called Events

-- Events are task or block of code that gets executed according to a schedule. These are fantastic for so many reasons. Importing data on a schedule. 
-- Scheduling reports to be exported to files and so many other things
-- you can schedule all of this to happen every day, every monday, every first of the month at 10am. Really whenever you want

-- This really helps with automation in MySQL

-- let's say Parks and Rec has a policy that anyone over the age of 60 is immediately retired with lifetime pay
-- All we have to do is delete them from the demographics table


SELECT * 
FROM parks_and_recreation.employee_demographics;

-- SHOW EVENTS; 

we can drop or alter these events like this:
-- DROP EVENT IF EXISTS delete_retirees;
DELIMITER $$
CREATE EVENT delete_retirees
ON SCHEDULE EVERY 30 SECOND
DO 
BEGIN
	DELETE
	FROM parks_and_recreation.employee_demographics
    WHERE age >= 60;
END $$

delimiter ;

show events;

SELECT * 
FROM parks_and_recreation.employee_demographics;