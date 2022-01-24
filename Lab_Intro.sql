-- 1. Review the tables in the database.
show tables from sakila;

-- 2. Explore tables by selecting all columns from each table or using the in built review features for your client.
select * from sakila.actor;
-- show one table

select * from information_schema.columns
where table_schema = 'sakila'
order by table_name,ordinal_position;

select table_name, column_name from information_schema.columns
where table_schema = 'sakila'
order by table_name,ordinal_position;
-- show all the tables

-- 3. Select one column from a table. Get film titles.
select title from sakila.film;
-- show a column

-- 4. Select one column from a table and alias it. Get unique list of film languages under the alias language. Note that we are not asking you to obtain the language per each film, but this is a good time to think about how you might get that information in the future.
select distinct language_id as language from sakila.language;
-- select one column from a table and alias it
-- get unique list of film languages under the alias language

-- 5.1 Find out how many stores does the company have?
select count(store_id) from sakila.store;

-- 5.2 Find out how many employees staff does the company have?
select count(staff_id) from sakila.staff;

-- 5.3 Return a list of employee first names only?
select first_name from sakila.staff;





