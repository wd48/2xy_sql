-- join
-- 둘 이상의 테이블을 합치는 데 사용한다
insert into branch values(4, 'Buffalo', null, null);

select * from branch;
-- 1 inner join
-- find all branchse and the names of their managers
-- 모든 지점과 지점 관리자 이름 찾기
select e.emp_id as employee_id , e.first_name as employee_name, b.branch_name as branch_name
from employee e
join branch b
on e.emp_id = b.mgr_id;

-- 2 left join
select e.emp_id, e.first_name, b.branch_name
from employee e
left join branch b
on e.emp_id = b.mgr_id;

-- 3 right jion
select e.emp_id, e.first_name, b.branch_name
from employee e
right join branch b 
on e.emp_id = b.mgr_id;

-- 4 full outer join : left join + right join
select e.emp_id, e.first_name, b.branch_name
from employee e
full outer join branch b
on e.emp_id = b.mgr_id;
