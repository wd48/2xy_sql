-- 여러 데이터베이스 스키마 company schema : 5 tables
DROP TABLE student;
-- employee table 생성 : 직원
create table employee (
	emp_id INT primary key,
	first_name varchar(40),
	last_name varchar(40),
	birth_day date,
	sex varchar(1),
	salary int,
	super_id int,
	branch_id int
);

-- 아직 FK 만들 수 없음 super_id, branch_id
-- branch table 생성 : 지점
create table branch(
	branch_id int primary key,
	branch_name varchar(40),
	mgr_id int,
	mgr_start_date date,
	foreign key(mgr_id) references employee(emp_id) on delete set null
);
-- on delete set null : fk 만들때마다 넣자
-- 직원 테이블 변경 : 지점id, 감독자id
alter table employee add foreign key(branch_id) 
REFERENCES branch(branch_id) on delete set null;

alter table employee add foreign key(super_id) 
REFERENCES employee(emp_id) on delete set null;

-- client table 생성 : 고객
create table client (
	client_id int primary key,
	client_name varchar(40),
	branch_id int,
	foreign key(branch_id) references branch(branch_id) on delete set null
);

-- works_with table 생성 : 협력사
create table works_with(
	emp_id int,
	client_id int,
	total_sales int,
	primary key(emp_id, client_id),
	foreign key(emp_id) REFERENCES employee(emp_id) on delete cascade,
	foreign key(client_id) REFERENCES client(client_id) on delete cascade
);

-- branch_supplier table 생성 : 지점 공급처
create table branch_supplier(
	branch_id int,
	supplier_name varchar(40),
	supply_type varchar(40),
	primary key(branch_id, supplier_name),
	foreign key(branch_id) REFERENCES branch(branch_id) on delete cascade
);