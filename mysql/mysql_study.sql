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

# w3c school SQL
# SELECT
-- write a statement that will select the city column from the customers table
select city from Customers;

# WHERE
-- select all records where the City column has the value Berlin
select * from Customers
where City = 'Berlin';

-- select all records where City is NOT Berlin
select * from Customers
where not City = 'Berlin';

# ORDER BY
-- select all records from the Customers table, sort the result alphabetically by the column City
select * from Customers
order by City;

-- select all records from the Customers table, sort the result reversed alphabetically by the column city
select * from Customers
order by City desc;

-- select all records from the Customers table, sort the result alphabetically,
-- first by the column Country, then by the column City
select * from Customers
order by Country, City;

# NULL
-- select all record from the Customers where the PostalCode column is empty
select * from Customers
where postalCode is null;

-- select all record from the customers where the postalCode column is not empty
select * from Customers
where postalCode is not null;

# LIKE
-- select all records where the value of the city column starts with the letter "a"
select * from Customers
where City like "a%";

-- select all records where the value of the city column ends with the letter "a"
select * from Customers
where City like "%a";

-- select all records where the value of the city column contains the letter "a"
select * from Customers
where City like "%a%";

-- select all records where the value of the city column starts with "a" and ends with the letter "b"
select * from Customers
where City like "a%b";

-- select all records where the value of the City column does not start with the letter "a"
select * from Customers
where City not like "a%";