# SQL Error [1248] [42000]: Every derived table must have its own alias
/*
    서브쿼리에 Alias를 주지 않았을 경우 발생하는 에러이다
    오라클의 경우 서브쿼리에 alias 주지 않아도 정상적으로 동작하지만,
    MySQL의 경우는 에러가 난다.
*/
-- error at MySQL
SELECT *
FROM (
        SELECT 'A' AS COL
     )

-- FIX
SELECT *
FROM (
        SELECT 'A' AS COL
     ) A;

