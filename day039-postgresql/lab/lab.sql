-- 1. Write a Query that get the date of the Third day in the next month
-- Print it in format   like 14-december-2020, Saturday
select date_trunc('month', now()) + interval '1 month + 2 days' as third_day_of_next_month

--  2. Write a Query that get the last day date of the current month from today
-- Print it in format   like 14-december-2020, Saturday
select date_trunc('month', now()) + interval '1 month - 1 day' as last_day_of_current_month

--  3. Display the employee’s name, hire date and salary review date,  
-- The salary review date is the day after six months and Five days of service.
-- Label the column Review. Format the dates to appear in the format similar to “Sunday, the 7th of September, 1981 “.
select first_name, last_name, to_char(hire_date, 'Day"," "the" ddth "of" FMMonth"," yyyy'),
to_char(hire_date + interval '6 months + 5 days', 'Day"," "the" ddth "of" FMMonth"," yyyy') as review
from employees

--  4. Write a query that will display the difference between the highest and lowest salaries in each department.
select department_id, department_name, (select coalesce(max(salary)-min(salary), 0) from employees  where department_id = outer_department.department_id)
from departments outer_department

--  5. write a query that will display the city, department name number of employees and the average salary for all employee in that department, round the average salary to two decimal places. 
select location_id, department_name, (select count(*) from employees where department_id = outer_departments.department_id) as count,
(select coalesce(avg(salary),0) from employees where department_id = outer_departments.department_id) as average
from departments outer_departments

--  6. Display the employee number, name and salary for all employee who earn more than the average salary in his department
select employee_id, first_name, salary
from employees outer_emp
where salary > (select coalesce(avg(salary), 0) from employees where department_id = outer_emp.department_id)

--  7. Show Employees data Whose Salary is Higher Than Their Manager's
--  and show Manager name, salary ( use sub query not join )
select first_name, salary, (select first_name from employees where employee_id = outer_emp.manager_id)
from employees outer_emp
where salary > (select salary from employees where employee_id = outer_emp.manager_id)

--  8. Show Employees data Who Earn the Lowest Salary in Their Department ( use subquery not join )
select first_name, salary
from employees outer_emp
where salary = (select min(salary) from employees where department_id = outer_emp.department_id)

--  9. Find employees who have been hired earlier than anyone else in the same job ( use subquery not join )
select first_name, salary
from employees outer_emp
where hire_date = (select min(hire_date) from employees where job_id = outer_emp.job_id)

--  10. Write a query to display employee_id, last_name, salary, dept id, 
-- dept name, job Id, job title, city, street address, country id, country name, 
-- region id, region name for all employees including those employees whose have no department too.
--select country_id, region_id, region_name
select e.employee_id, e.last_name, e.salary, d.department_id, d.department_name, j.job_id, j.job_title, l.city, l.street_address, c.country_id, r.region_id, r.region_name
from employees e 
inner join jobs j
on e.job_id = j.job_id
left outer join departments d
on e.department_id = d.department_id
left outer join locations l
on d.location_id = l.location_id
left outer join countries c
on l.country_id = c.country_id
left outer join regions r
on c.region_id = r.region_id





