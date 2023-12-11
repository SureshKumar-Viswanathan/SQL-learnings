select * from tab;
select * from countries;
select * from regions;
select * from locations;
select * from DEPARTMENTS; 
select * from EMPLOYEES;
select * from EMP_DETAILS_VIEW;
select * from JOBS;
select * from JOB_HISTORY;
select * from all_mviews;

select distinct job_id from job_history;
select * from EMPLOYEES;
select * from countries where country_name='India';
Select * from Jobs where min_salary>12345;
select * from employees order by first_name desc;
select * from employees where last_name in ('Smith') and first_name = 'William';
select * from employees where last_name in ('Smith')  or first_name = 'William';
select * from employees where last_name in ('Smith') and  not first_name = 'William';
select * from employees where manager_id is null;
select * from employees where manager_id is not null;
select * from employees order by first_name desc fetch FIRST 3 ROWS only;
select max(salary) as maxprice from employees;
select min(salary) from employees;
select count(*) from employees;
select count(distinct department_id) as deps from employees;
select sum(salary*2)  from employees where department_id=90;
select Avg(salary) as "sur kum"  from employees where department_id=90;
select * from employees where salary >(select Avg(salary) as "sur kum"  from employees);
select * from employees where last_name like 'k%';
select * from employees where last_name LIKE 'K%';

select * from employees where last_name like 'Ki__';
select * from employees where last_name like '%ing';
select * from employees where hire_date in ('17-jun-03','18-may-03');
select * from employees where hire_date not in ('17-jun-03','18-may-03');

select * from employees where salary  in (select distinct salary as "sur kum"  from employees);
select * from employees where salary between 10000 and 23000;
select * from employees where hire_date between '18-may-03' and  '17-jun-03';
select salary "s k" from employees where hire_date between '18-may-03' and  '17-jun-03';
SELECT CONCAT(first_name, ' ', last_name) AS name FROM employees;

select * from countries;
select * from regions;

select * from countries  join regions on countries.region_id=regions.region_id;
select * from countries left join regions on countries.region_id=regions.region_id;
select * from countries Right join regions on countries.region_id=regions.region_id;
select * from countries full outer join regions on countries.region_id=regions.region_id;

select * from countries  join regions on countries.region_id=regions.region_id;
select * from countries, regions where countries.region_id=regions.region_id; -- self join
select locations.country_id from locations UNION select countries.country_id from countries;
select locations.country_id from locations UNION ALL select countries.country_id from countries;
select count(*), employees.department_id from employees group by employees.department_id order by count(*) desc;
select count(*), employees.department_id from employees group by employees.department_id having count(*)>3 order by count(*) desc;
select * from employees where exists (select * from countries where countries.country_id='AR');
select * from employees where employees.department_id = ANY (Select departments.department_id from  departments);
select * from employees where employees.department_id = ALL (Select departments.department_id from  departments);
select * from employees where employees.department_id = some (Select departments.department_id from  departments);
select * from countries where country_name!='India';
select * from countries where country_name<>'India';
select nvl(employees.department_id,123455) from employees ;
select salary,
case
when salary > 20000 then 'high salary'
else 'low salary'
end as salaryDescription from employees;

select * from countries;
insert into countries values ('PR', 'Portugal',1);
insert into  countries (countries.country_id,region_id) values ('sp',1);
update countries set countries.country_name='spain'where countries.country_id='sp';
delete from countries where countries.country_id='sp';
--INSERT INTO countries (country_code, country_name, column_name)
--VALUES 
--  ('RS', 'Rome', 1),
--  ('RD', 'Remo', 1);

update countries set countries.country_name='Spain', countries.country_id='SP' where countries.country_id='PR';
commit;

create table Person(
id number(9) primary key,
name varchar(10)
);

create table Trip (
tripno number(1) not null primary key,
tripname varchar(255) default 'don trip',
pid number(9) references Person(id)
);

select * from tab;
drop table Alien;
create table Alien(
id number unique,
name varchar2(255),
age timestamp default SYSDATE
);

alter table Alien add lifeExpectancy number(9);
alter table Alien drop column lifeExpectancy;
alter table Alien add tripno number references Trip(tripno);
insert into Person values (1,'kumar');
insert into trip values (1,'',1);
delete from Alien;
select * from Alien;
insert into Alien (id,name,tripno)values (2,'sur',1);
alter table alien drop CONSTRAINT  fk_constraint_name;
alter table Alien add CONSTRAINT Fk_don foreign key (id) references Trip(tripno);
alter table alien drop constraint Fk_don;
alter table Alien add doy number(4) check (doy>2002);
ALTER TABLE Alien
MODIFY age date;
alter table Alien add check (age < SYSDATE);
--Select * into country from countries;
create table country as select * from countries;
insert into country select * from countries;
delete from country where region_id=1;
select * from countries;



create index conIndex on country (country_name);
create view mwcountry as select countries.country_name from country, countries where countries.country_name=country.country_name;
CREATE sequence sq_country minvalue 1 start with 5 increment by 1 cache 10;
CREATE OR REPLACE TRIGGER before_insert_country
BEFORE INSERT ON country
FOR EACH ROW
BEGIN
    -- Modify the new country name to uppercase before insertion
    :NEW.country_name := UPPER(:NEW.country_name);
END; 


-- got to bin of sqlplus d drive dhomexe  type   sqlplus /@xe as sysdba;
-- alter pluggable database dev open;
-- show pdbs;









SELECT object_name, status FROM user_objects WHERE object_type = 'PROCEDURE' AND object_name = 'LIST_COUNTRY1';

EXEC list_country1;

CREATE OR REPLACE PROCEDURE list_country1
IS
  -- Declare a cursor to fetch data
  CURSOR country_cursor IS
    SELECT * FROM country;
  
  -- Declare a record variable to store cursor data
  country_rec country%ROWTYPE;
BEGIN
  -- Open the cursor
  OPEN country_cursor;

  -- Fetch and display data
  LOOP
    FETCH country_cursor INTO country_rec;
    EXIT WHEN country_cursor%NOTFOUND;

    -- Display or use the fetched data as needed
    DBMS_OUTPUT.PUT_LINE(country_rec.region_id || ' : ' || country_rec.region_id);
  END LOOP;

  -- Close the cursor
  CLOSE country_cursor;
END;







--procedure










/*SELECT constraint_name
FROM user_cons_columns
WHERE table_name = 'alien'
AND column_name = 'tripno';
SELECT constraint_name
FROM user_constraints
WHERE table_name = 'alien' AND constraint_type = 'R';*/

/*  8 */
--sssjsnjsnjs:






