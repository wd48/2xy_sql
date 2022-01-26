-- 중첩쿼리
-- 여러 select 문 사용한다
-- 특정 정보들

-- find names of all emloyees who have sold over 30,000 to a single client
-- 1) 30,000 이상 판매한 emp_id를 찾아내는 select문
select w.emp_id
from works_with w
where w.total_sales > 30000;

-- 2) 1)의 first, lastname 알아내기
select e.first_name, e.last_name
from employee e 
where e.emp_id IN (
	select w.emp_id
	from works_with w
	where w.total_sales > 30000
);

-- find all client who are handled by the branch
-- that Michael Scott manages
-- => Scranton 지점에서 관리하는 모든 클라이언트의 정보
-- Assume you know Michael's ID

-- 1) michael id 찾기
select b.branch_id
from branch b
where b.mgr_id = 102;

-- 2) client name 출력
select clt.client_name
from client clt
where clt.branch_id = 2;

-- sol.
-- Michael Scott의 branch_id를 알아내고, 이것과 같은 branch_id를 가진 client_name을 출력한다
select clt.client_name
from client clt
where clt.branch_id = (	
	select b.branch_id
	from branch b
	where b.mgr_id = 102
);
-- limit 1 : 
select clt.client_name
from client clt
where clt.branch_id = (	
	select b.branch_id
	from branch b
	where b.mgr_id = 102
	limit 1
);

 -- Find all clients who are handles by the branch that Michael Scott manages
 -- Assume you DONT'T know Michael's ID
 -- 1) Michael ID 찾기 2) 1)의 emp_id로 branch_id 찾기 3) branch_id와 같은 client_name 출력
 -- 1) 
 select e.emp_id
 from employee e
 where e.first_name = 'Michael' and e.last_name = 'Scott';
 
 -- 2)
 select b.branch_id
 from branch b
 where b.mgr_id = (
	 select e.emp_id
 	from employee e
 	where e.first_name = 'Michael' and e.last_name = 'Scott'
	 limit 1
 );
 
 -- 3) client name
 select clt.client_name
 from client clt
 where clt.branch_id = (
 	select b.branch_id
	 from branch b
	 where b.mgr_id = (
		 select e.emp_id
		from employee e
		where e.first_name = 'Michael' and e.last_name = 'Scott'
		 limit 1
	 )
 );
 
-- Find the names of employees who work with clients handled by the scranton branch
-- 1) 직원이름 찾기 2) client와 같이 일하는 직원 3) Scranton 지점 관리하는 관리자!
-- 1) 
select e.first_name, e.last_name
from employee e
where e.branch_id = 2;

-- 2)  : branch_id는 Scranton 지점이라고 명칭했기 때문에 알고있다 = 2
-- 3) work with
select ww.emp_id
from works_with ww;

select e.first_name, e.last_name
from employee e
where e.emp_id IN (
	select ww.emp_id
	from works_with ww
) and e.branch_id = 2;

-- Find the names of all clients who have spent more than 100,000 dollars
-- 1) client name 출력 2) works_with 금액 client 별 합산금액 출력 3) 
-- 1)
select clt.client_name
from client clt
where clt.client_id = 402;

-- 2)
select sum(ww.total_sales) as totals, ww.client_id
from works_with ww
group by ww.client_id;

-- 3)
select clt.client_name
from client clt
where clt.client_id IN (
	select client_id
	from (
		select sum(ww.total_sales) as totals, ww.client_id
		from works_with ww
		group by ww.client_id) as total_client_sales
	where totals > 100000
);




