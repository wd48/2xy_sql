-- 1 ON DELETE SET NULL
create table branch(
	branch_id int primary key,
	branch_name varchar(40),
	mgr_id int,
	mgr_start_date date,
	foreign key(mgr_id) references employee(emp_id) on delete set null
);

foreign key(mgr_id) references employee(emp_id) on delete set null

delete from employee where emp_id = 102;

select * from branch order by branch_id asc;
--on delete set null : 삭제했을 때 null 값으로 대체

select * from employee order by emp_id asc;
-- emp_id 102를 super_id로 두었던 직원들의 super_id가 null이 되었음


-- 2 ON DELETE CASCADE
-- branch_supplier table 생성 : 지점 공급처
create table branch_supplier(
	branch_id int,
	supplier_name varchar(40),
	supply_type varchar(40),
	primary key(branch_id, supplier_name),
	foreign key(branch_id) REFERENCES branch(branch_id) on delete cascade
);

delete from branch
where branch_id = 2;

select * from branch_supplier;
-- foreign key(branch_id) REFERENCES branch(branch_id) on delete cascade
-- branch테이블의 branch_id 2를 삭제하면, 위 제약조건으로 인해서
-- branch_supplier가 branch 테이블의 branch_id를 FK로 가져왔고, branch_id를 삭제하면
-- 이와 연관된 fk의 row(행)를 차례대로 삭제하기로 제약조건에 명시되어있다
-- 따라서 branch 테이블의 branch_id =2 를 삭제하면,
-- branch_supplier 테이블의 branch_id = 2를 가진 행이 전부 삭제된다



create table branch(
	branch_id int primary key,
	branch_name varchar(40),
	mgr_id int,
	mgr_start_date date,
	foreign key(mgr_id) references employee(emp_id) on delete set null
	-- mgr_id : 필수키는 아니다
);

create table branch_supplier(
	branch_id int,
	supplier_name varchar(40),
	supply_type varchar(40),
	primary key(branch_id, supplier_name),
	foreign key(branch_id) REFERENCES branch(branch_id) on delete cascade
	-- branch_id : 기본키의 일부 => branch_supplier의 branch_id를 의미함
	-- DB row에서 중요한 값임
	-- 이 값(branch_supplier의 branch_id)이 사라지면, 이에 null 값을 부여할 수 없다
	-- : PK는 null을 가질 수 없기 때문에!
);