-- TRIM, LTRIM, RTRIM

-- TRIM : 문자열의 양쪽 공백 제거 (스페이스바)
-- TRIM('문자열','옵션')
WITH DEPT AS (
    SELECT '0100' DEPTNO, 'ACCOUNTING  ' DNAME, '   NEWYORK  ' LOC FROM DUAL
)

SELECT
    DNAME,
    TRIM(DNAME),
    LOC,
    TRIM(LOC)
FROM DEPT;

-- LTRIM : 문자열 좌측 공백, 반복적인 문자 제거
-- LTRIM('문자열','옵션')
WITH DEPT AS (
    SELECT '0100' DEPTNO, 'ACCOUNTING  ' DNAME, '   NEWYORK  ' LOC FROM DUAL
)

SELECT
    LOC,
    LTRIM(LOC),
    DEPTNO,
    LTRIM(DEPTNO, '0'),
    DNAME,
    LTRIM(LOC, 'ACC')
FROM DEPT;

-- RTRIM : 문자열 우측 공백, 반복적인 문자 제거
-- RTRIM('문자열','옵션')
WITH DEPT AS (
    SELECT '0010' DEPTNO, 'ACCOUNTING' DNAME, '  NEW YORK  ' LOC FROM DUAL
)

SELECT LOC
     , RTRIM(LOC)
     , DEPTNO
     , RTRIM(DEPTNO, '0')
     , DNAME
     , RTRIM(DNAME, 'ING')
  FROM DEPT;

