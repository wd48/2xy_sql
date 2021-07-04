-- 210704 데이터베이스 테이블 만들기
CREATE TABLE student(
	student_id INT PRIMARY KEY,
	name VARCHAR(20),
	major VARCHAR(20)
);

select * from student;

-- 테이블 삭제, 수정

DROP TABLE student;
-- 삭제되었는지 확인
select * from student;
-- 테이블 수정: column 추가
ALTER TABLE student ADD gap DECIMAL(3,2);
-- 테이블 수정 확인
select * from student;
-- 테이블 수정: column 삭제
ALTER TABLE student DROP gap;

select * from student;

ALTER TABLE student ADD gpa DECIMAL(3,2);

ALTER TABLE student DROP gpa;
select * from student;

-- 데이터 추가하기
INSERT INTO student(student_id, "name") VALUES (1, 'Jack');
INSERT INTO student VALUES (2, 'Kate', 'Sociology');
INSERT INTO student VALUES (3, null, 'Chemistry');
INSERT INTO student VALUES (4, 'Jack', 'Biology');
INSERT INTO student VALUES (5, 'Mike','Comp. Sci');
-- 컬럼값이 없는 경우 데이터 추가하기
-- 중복값 입력 불가 : student_id 1~3이 student 테이블에 있기 때문에,
-- student_id로 1~3을 다시 쓸 수 없다
select * from student;


-- C : DB에 데이터 추가하기
DROP table student;
CREATE TABLE student(
	student_id INT ,
	name VARCHAR(20),
	major VARCHAR(20) DEFAULT 'undecided',
	PRIMARY KEY(student_id)
);
select * from student;

-- AUTO INCREMENT : in postgreSQL
-- 1 sequence 생성
create SEQUENCE student_seq;
-- 생성한 sequence 사용
CREATE TABLE student(
	student_id INT default nextval('student_seq'),
	name VARCHAR(20),
	major VARCHAR(20) DEFAULT 'undecided',
	PRIMARY KEY(student_id)
);
-- student_id 자동입력 옵션 설정 후,
INSERT INTO student("name", major) VALUES ('Jack', 'Biology');
INSERT INTO student("name", major) VALUES ('Kate', 'Sociolygy');
INSERT INTO student("name", major) VALUES ('Claire', 'Chemistry');
INSERT INTO student("name", major) VALUES ('Jack', 'Biology');
INSERT INTO student("name", major) VALUES ('Mike', 'Computer Science');
select * from student;

-- 시퀀스 최종값 확인
select lastval();

-- 시퀀스 초기화하기
alter sequence "student_seq" restart with 1;

-- 업데이트 하기: 이름 바꾸기 - MAJOR 이름 변경한다
UPDATE student SET major = 'Bio' WHERE major = 'Biology';
UPDATE student SET major = 'Comp Sci' WHERE major = 'Computer Science';
UPDATE student SET major = 'Comp Sci' WHERE student_id = 4;
select * from student order by student_id asc;
-- 합치기
UPDATE student SET major = 'Biochemistry' WHERE major = 'Bio' or major = 'Chemistry';
select * from student order by student_id asc;

UPDATE student SET "name" = 'Tom', major = 'undecided' WHERE student_id = 1;
select * from student order by student_id asc;

UPDATE student SET major = 'undecided';
select * from student order by student_id asc;

-- 삭제하기 : 테이블의 모든 행 삭제 가능
--student_id = 5
DELETE FROM student WHERE student_id = 5;
select * from student order by student_id asc;
DELETE FROM student WHERE "name" = 'Tom' AND major = 'undecided';
select * from student order by student_id asc;


-- basic query : select
select * from student;

-- 특정 정보를 가진 값만 불러오는 방법 : 매우 구체적인 항목
select "name" from student;

select "name", major from student;

select student."name", student.major from student;
-- 기본값 asc
select student."name", student.major from student order by name;
select student."name", student.major from student order by name desc;

select * from student order by student_id;
-- 1 major 순으로 정렬 2 그 다음 student_id 순으로 정렬
select * from student order by major, student_id desc;
-- major 순으로 정렬 > 같은 major일 경우 student_id를 desc 순으로 정렬

select * from student order by major, student_id desc limit 2;

-- 필터링
select * from student where major = 'Biology';
select * from student where major = 'Chemistry';
select "name", major from student where major = 'Chemistry';
select "name", major from student where major = 'Chemistry' or major = 'Biology';
select "name", major from student where major = 'Chemistry' or "name" = 'Kate';

-- 비교 연산자 <, >, <=, >=, =, <>, AND, OR
-- <> : 해당되는 자료 외의 모든 값
select "name", major from student where major <> 'Chemistry';

-- 
select "name", major from student where student_id < 3;

select "name", major from student where student_id <= 3 and "name" <> 'Jack';

-- IN
select * from student 
where "name" IN ('Claire','Kate','Mike');

select * from student 
where "name" IN ('Biology','Chemistry');

select * from student 
where major IN ('Biology','Chemistry') and student_id > 2;





