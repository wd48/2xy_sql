-- sql 코드 블록
-- 발생해야하는 특정 작업을 정의
-- DB 테이블에 값 입력시, 값 삭제 시... : 이건 다른 곳에 insert 하는게 맞아! 라고 알려줄 수 있음

create table trigger_test(
	message VARCHAR(100)
);

-- local terminal 사용하기 : mysql 식
delimiter $$
create trigger my_trigger before insert
	on employee
	for each row begin
		insert into trigger_test values('added new employee');
	end$$
delimiter;

-- postgreSQL 식
-- 1. 트리거 선언
-- CREATE [ CONSTRAINT ] TRIGGER name { BEFORE | AFTER | INSTEAD OF } { event [ OR ... ] }
--     ON table_name
--     [ FROM referenced_table_name ]
--     [ NOT DEFERRABLE | [ DEFERRABLE ] [ INITIALLY IMMEDIATE | INITIALLY DEFERRED ] ]
--     [ REFERENCING { { OLD | NEW } TABLE [ AS ] transition_relation_name } [ ... ] ]
--     [ FOR [ EACH ] { ROW | STATEMENT } ]
--     [ WHEN ( condition ) ]
--     EXECUTE { FUNCTION | PROCEDURE } function_name ( arguments )

-- where event can be one of:

--     INSERT
--     UPDATE [ OF column_name [, ... ] ]
--     DELETE
--     TRUNCATE

-- 2. 실행할(EXECUTE) 함수 선언
-- SYNOPSIS
-- CREATE [ OR REPLACE ] FUNCTION
--     name ( [ [ argmode ] [ argname ] argtype [ { DEFAULT | = } default_expr ] [, ...] ] )
--     [ RETURNS rettype
--       | RETURNS TABLE ( column_name column_type [, ...] ) ]
--   { LANGUAGE lang_name
--     | TRANSFORM { FOR TYPE type_name } [, ... ]
--     | WINDOW
--     | IMMUTABLE | STABLE | VOLATILE | [ NOT ] LEAKPROOF
--     | CALLED ON NULL INPUT | RETURNS NULL ON NULL INPUT | STRICT
--     | [ EXTERNAL ] SECURITY INVOKER | [ EXTERNAL ] SECURITY DEFINER
--     | PARALLEL { UNSAFE | RESTRICTED | SAFE }
--     | COST execution_cost
--     | ROWS result_rows
--     | SUPPORT support_function
--     | SET configuration_parameter { TO value | = value | FROM CURRENT }
--     | AS 'definition'
--     | AS 'obj_file', 'link_symbol'
--   } ...

-- REF) https://severalnines.com/database-blog/postgresql-triggers-and-stored-function-basics
-- 1. create function
CREATE FUNCTION trigger_func() 
	RETURNS trigger 
	LANGUAGE plpgsql
	AS $$
		BEGIN
			insert into trigger_test values('added new employee!');
			RETURN NEW;
		END;
	$$;


drop function trigger_func() cascade;

-- 2. create trigger (=start function)
CREATE TRIGGER my_trigger 
	BEFORE INSERT ON employee
	FOR EACH ROW 
	EXECUTE PROCEDURE trigger_func();
		
insert into employee values(109, 'Oscar', 'Martinez', '1968-02-19', 'M', 69000, 106, 3);

select * from employee;
select * from trigger_test;

--  NEW.table_column --
CREATE FUNCTION trigger_func2() 
	RETURNS trigger 
	LANGUAGE plpgsql
	AS $$
		BEGIN
			insert into trigger_test values(NEW.first_name);
			RETURN NEW;
		END;
	$$;

CREATE TRIGGER my_trigger2
	BEFORE INSERT ON employee
		FOR EACH ROW 
			EXECUTE PROCEDURE trigger_func2();		
-- 안되면 지우고 다시해
drop function trigger_func2() cascade;

insert into employee values(110, 'Kevin', 'Malone', '1978-02-19', 'M', 69000, 106, 3);

select * from trigger_test;

-- ex3. if, elseif 추가
CREATE FUNCTION trigger_func3() 
	RETURNS trigger 
	LANGUAGE plpgsql
	AS $$
		BEGIN
			IF NEW.sex = 'M' THEN
				INSERT INTO trigger_test VALUES('added male employee');	
			ELSEIF NEW.sex = 'F' THEN
				INSERT INTO trigger_test VALUES('added female employee');
			ELSE
				INSERT INTO trigger_test VALUES('added other employee');
			END IF;
			RETURN NEW;
		END;
	$$;

CREATE TRIGGER my_trigger3
	BEFORE INSERT ON employee
		FOR EACH ROW 
			EXECUTE PROCEDURE trigger_func3();		
-- 안되면 지우고 다시해 : 연결된 trigger도 같이 지워줌
drop function trigger_func3() cascade;

insert into employee values (111, 'Pam', 'Beesly', '1988-02-19', 'F', 69000, 106, 3);

select * from employee;
select * from trigger_test;
