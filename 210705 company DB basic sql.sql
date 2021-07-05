-- 210705 more basic queries
-- find all employees
select * 
from employee;

select * 
from client;

-- find all employees orderd by salary
select *
from employee
order by salary;
-- desc 내림차순
select *
from employee
order by salary desc;

-- find all employees orderd by sex than name
select *
from employee
order by sex, first_name, last_name;

-- find the first 5 employees in the table
-- 처음 5명의 직원명단 출력
select *
from employee
limit 5;

-- find the first&last name of all employees
select first_name, last_name
from employee;

-- Find the forename and surnames names of all employees
-- as : 속성명 별칭 짓기
select first_name as forename, last_name as surname
from employee;

-- Find out all the different genders
select distinct sex
from employee;

select distinct branch_id
from employee;

-- Find all male employees


-- Find all employees at branch 2


-- Find all employee's id's and names who were born after 1969


-- Find all female employees at branch 2


-- Find all employees who are female & born after 1969 or who make over 80000


-- Find all employees born between 1970 and 1975


-- Find all employees named Jim, Michael, Johnny or David