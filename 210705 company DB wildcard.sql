-- 와일드 카드 : 다른 패턴을 정의하는 방법 = 특정 데이터 일치
-- % = any # characters, _ = one character

-- find any client who are an LLC
select * 
from client
where client_name like '%LLC';
-- %LLC : LLC로 끝나는 자료만 출력시켜야만 한다
-- LLC로 끝나는 회사명이 있을 경우 출력시킨다

-- find any branch suppliers who are in the label business
select *
from branch_supplier
where supplier_name like '% Label%';

-- find any employee born in october
select *
from employee
where birth_day::text like '____-02%';

-- find any clients who are schools
select *
from client
where client_name like '%school%';

