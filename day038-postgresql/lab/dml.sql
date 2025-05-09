-- Insert new location with suitable data
insert into locations (street_address, postal_code, city, state_province, country_id)
values ('mesaha square', '00000', 'cairo', 'doki', 'EG')
-- NOTE: this created a new location with id 3300

-- Insert new department with suitable data for this location
insert into departments (department_name, manager_id, location_id)
values ('mazen_department', 200, 3300)
-- NOTE: this created a new department with id 300

-- Insert new employee with suitable data for this department
insert into employees (first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
values ('mazen', 'fahim', 'mazenfahim.g@gmail.com', '01067979501', to_date('1-1-2026'), 'SA_REP', 90000, 0, 200, 300)

-- Update your salary + 4000, update your job_id to have the same job_id for employee no. 107, updte your phone_number to null
update employees
set salary = salary + 4000,
job_id = (select job_id from employees where employee_id = 107),
phone_number = null
where first_name='mazen'

-- Be sure to Delete the created location;
delete from employees where first_name='mazen'
delete from departments where department_name='mazen_department'
delete from locations where location_id=3300
