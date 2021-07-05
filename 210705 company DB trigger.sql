-- sql 코드 블록
-- 발생해야하는 특정 작업을 정의
-- DB 테이블에 값 입력시, 값 삭제 시... : 이건 다른 곳에 insert 하는게 맞아! 라고 알려줄 수 있음

create table trigger_test(
	message VARCHAR(100)
);

-- local terminal 사용하기
delimiter $$
create trigger my_trigger before insert
	on employee
	for each row begin
		insert into trigger_test values('added new employee');
	end$$
delimiter;



