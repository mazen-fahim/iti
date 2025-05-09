-- ====== QUESTION 1 ======
-- Display the last name concatenated with the job id, 
-- separated by a comma and space and name the column 
-- [Employee and Title]  as alias
SET search_path = hr;
select last_name || ', ' || job_id as "Employee and Title"
from employees
--=========================================================

-- ====== QUESTION 2 ======
-- Display the last name and salary for all employees
-- whose salary is not in the range of $1500 and $7000.
SET search_path = hr;
select last_name, salary
from employees
where salary not between 1500 and 7000

-- ====== QUESTION 3 ======
-- Display the last name, salary and commission for all employees 
-- who earn commissions, Sort data in descending order of salary and commissions.
SET search_path = hr;
select last_name, salary, commission_pct
from employees
where commission_pct is not null
order by salary desc, commission_pct desc

-- ====== QUESTION 4 ======
-- Display the last name, job id and salary for all employees 
-- whose job id is SA_REP or PU_MAN and their salary is not equal to $9500, $9000 or $8000 
SET search_path = hr;
select last_name, job_id, salary
from employees
where (job_id = 'SA_REP' or job_id = 'PU_MAN')
and salary not in (9500, 9000, 8000)

-- ====== QUESTION 5 ======
-- Display all information about employees whose last name begin with letter 'S’ or letter ‘s’
SET search_path = hr;
select last_name
from employees
where lower(last_name) like 's%'

-- ====== QUESTION 6 ======
-- Display all employees whose first name contains letter before last ‘e’ or ‘E’
SET search_path = hr;
select first_name
from employees
where lower(first_name) like '%e_'
