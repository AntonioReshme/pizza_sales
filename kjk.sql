drop table department;
drop table employee;
drop table if exists department;
create table department(
dept_id int,
dept_name varchar(50)
);
insert into department(dept_id,dept_name)
values
(1,'Marketing'),
(2,'Sales'),
(3,'IT'),
(4,'Production')
select*from department

drop table if exists employee;
create table employee(
emp_id int,
emp_name varchar(50),
dept_id int,
salary int,
join_date date
);
insert into employee(emp_id,emp_name,dept_id,salary,join_date)
values
(1,'Michael',3,25000,'2022-07-30'),
(2,'Parul',1,30000,'2023-08-16'),
(3,'Davis',3,28000,'2024-02-03'),
(4,'Ginni',2,17000,'2024-11-28'),
(5,'Raj',1,22000,'2024-11-01'),
(6,'Amar',2,9200,'2024-01-03')

select*from employee

(1)find second highest salary from an employee table:

select
salary as second_highest_salary
from employee
order by 1 desc
limit 1 offset 1

(2)how to join both table employee and department:

select*from department as d
join employee as e
on e.dept_id=d.dept_id

(3)retrieve employees who joined in the last 30 days:

select
emp_id,
emp_name,
join_date
from employee
where join_date>=now()-interval'30days'

(4)handle null values in postgresql when performing calculations:

--Use the ISNULL function or the IS NULL operator in combination with conditional statements such as IF, CASE, or COALESCE1.
--Include nulls in your calculations using conditional expressions or the FILTER clause2.
--Replace null with a default value using the COALESCE function3.
--Convert NULL to zero using the COALESCE function

(5)diff b/w where and having clauses:

(6)find count of employees in each department:

select
d.dept_name,
count(e.emp_id)as no_of_emp
from employee as e
join department as d
on d.dept_id=e.dept_id
group by 1

(7)how would you optimize a slow running query:

(8)update the salary of all employees by 10%:

update employee
set salary=salary*0.10
where emp_id in(1,2,3,4,5,6);

(9)purpose of indexes and how they improve query performance:

(10) create a new table with columns for employee id,name,salary:
(11)top 5 high paid employees:
select
emp_name,
salary as top_five_salary
from employee
order by 2 desc
limit 5

(12)delete duplicate rows from a table based on specific column:

delete from employee
where emp_id=6

(13)diff b/w inner join,left join,right join and full outer join:

(14)average salary for each department:

select
d.dept_name,
round(avg(e.salary)::numeric,2)as average_salary
from department as d
join employee as e
on e.dept_id=d.dept_id
group by 1

(15)use case statement in sql with example:
(16)find the employees who have not been assigned to any department:

select
emp_name
from employee
where dept_id is null

(17)add new column:
alter table department
add column issued_date date