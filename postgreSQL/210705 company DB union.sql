 -- union
-- find a list of employee and branch names
select e.first_name, e.last_name, b.branch_name
from employee e, branch b;

select first_name as company_names
from employee
union
select branch_name
from branch
union
select client_name
from client;
-- role
-- 1. 각 select 문장에서 쓰이는 column 수가 같아야 한다.
-- 각각의 UNION query 는 같은 수의 columns 를 가져야 한다.

-- 2. 둘다 유사항 데이터 유형이어야 한다
-- 다른 데이터타입을 UNION 실행하면 오류가 있을 수 있다.

-- find a list of all clients & branch supplier's name
select client_name
from client
union 
select supplier_name
from branch_supplier;
-- 같은 branch_id (column)를 가지고 있다.
select client_name, client.branch_id
from client
union 
select supplier_name, branch_supplier.branch_id
from branch_supplier;

-- find a list of all money spent or earned by the company
-- 기본형
select salary
from employee
union
select total_sales
from works_with;


