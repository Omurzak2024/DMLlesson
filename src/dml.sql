create table course(
                       id serial primary key ,
                       course_name varchar not null,
                       price int not null
);

create table students(
                         id serial primary key ,
                         first_name varchar not null ,
                         last_name varchar not null ,
                         age int,
                         email varchar unique,
                         course_id int references course(id)
);

drop table course;
drop table students;

insert into course(course_name, price)
values ('Java',14000),
       ('JS',12000);

insert into students(first_name, last_name, age, email, course_id)
values ('Omurzak','Soorbaev',35,'omurzak97@gmail.com',1),
       ('Kurmanbek','Abdullaev',23,'kurmanbek@gmail.com',2),
       ('Kasiet','Kubandykova',22,'kasiet@gmail.com',2),
       ('Nurkyz','Adylbekova',22,'nurkyz@gmail.com',1),
       ('Sattarali','Jananov',35,'sattarali@gmail.com',2),
       ('Nurbek','Japarov',35,'nurbek@gmail.com',1),
       ('Akylbek','Sutalinov',25,'akylbek@gmail.com',1);

insert into students(first_name, last_name, age, email, course_id)
values ('aizat','Anarkulova',27,'aizat@gmail.com',1);

--курстардын баарын чыгарып берет консольго
select * from course;
--курстардын аттарын чыгарат
select course_name from course;
--студенттердин баарын коргозот
select * from students;
--студенттердин атын, фамилиясын жана кайсы курста окуурун коргозот
select first_name,last_name,course_name from students s join course c on c.id = s.course_id;
--студенттердин таблицасындагы аталышын озгортуп коргозот, бирок дата базада озгорбойт
select first_name as name from students;
--эки таблицаны кошуп коргозот
select concat(first_name,' ',last_name) as full_name from students;
--сортировка кылат осуу тартибинде
select first_name,last_name from students order by first_name;
--сортировка кылат кемуу тартибинде
select first_name,last_name from students order by first_name desc ;
--distinct окшошторду кыскартып коргозот
select distinct age from students;
select distinct course_name  from students s join course c on c.id = s.course_id;
--where каалаган маанини чыгарууга болот
select first_name,last_name,course_name from students s join course c on c.id=s.course_id where course_name='Java';
--
select first_name,last_name,age,course_name from students s join course c on c.id = s.course_id where course_name='Java' and age>25;
--
select first_name,last_name,age,course_name from students s join course c on c.id = s.course_id where course_name='Java' or age>25;
--limit чектеп чыгарып берет
select first_name,last_name from students limit 4;
--offset бул берилген сандан кийинкилерди чыгарат
select first_name,last_name from students offset 3;
--fetch-ушунчаны чыгарып берет
select first_name,last_name from students fetch first 1 row only ;
select first_name,last_name from students fetch first 4 rows only ;
--in-биз сурагандын ичиндегилерди чыгарып берет
select first_name,last_name,course_name from students s join course c on c.id=s.course_id where course_name in ('Java') ;
--not in-биз сурагандан сырткарыларды чыгарып берет
select first_name,last_name,course_name from students s join course c on c.id=s.course_id where course_name not in ('Java') ;
--between
select first_name,age from students where age between 23 and 35;
--like
select first_name from students where first_name like 'A%';
select first_name from students where first_name like '_______';
select * from students where first_name like '%k';
--iLike
select * from students where first_name ilike 'a%';
--groupBy-группировка кылып берет
select course_name from students s join course c on c.id = s.course_id group by course_name;
select count(c.id),course_name from students s join course c on c.id = s.course_id group by course_name;
--groupBy having
select count(c.id),course_name from students s join course c on c.id=s.course_id group by course_name having count(course_name)<5;
--max максимум санды чыгарат
select max(age) from students;
--min минимум санды чыгарат
select min(age) from students;
--avg орточо арифметикалык санын чыгарып берет
select avg(age) from students;
--round тегеректеп берет
select round( avg(age)) from students;
--sum бардыгын кошуп берет
select sum(age) from students;
--coalesce
select first_name,coalesce(course_name,'kiyin tandayt') from students s join course c on c.id = s.course_id;

select now();
select now()::date;
select now()::time;
set time zone'asia/bishkek';
--extract ажыратып берет
select extract(year from now());
select extract(month from now());
select extract(day from now());
select extract(century from now());
--delete
delete from students where id in (1,2);
--update
update students set first_name='Jyldyz' where first_name='Sattarali';