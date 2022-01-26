-- 210705 function
-- find the number of employees
-- count() : 내가 세고싶은 모든 것을 넣을 수 있음
select count(*) from employee;

select count(emp_id) from employee;

select count(super_id) from employee;

-- find the number of female employess born after 1970
select count(emp_id)
from employee
where sex = 'F' and birth_day >'1971-01-01';

-- find the average of all employee's salaries
select avg(salary)
from employee;
-- 남성 평균
select avg(salary)
from employee
where sex = 'M';

-- find the sum of all emloyee salaries
select sum(salary)
from employee;

-- find out how many males and females there are
select count(sex), sex
from employee
group by sex;

-- find the total sales of each salesman
select e, ww.total_sales
from works_with ww, employee e
where ww.emp_id = e.emp_id;

select sum(total_sales) as sum_sales, emp_id
from works_with
group by emp_id 
order by sum_sales desc;

select sum(total_sales), client_id
from works_with
group by client_id
order by client_id asc;

