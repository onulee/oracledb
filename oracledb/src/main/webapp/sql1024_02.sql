-- drop table member;

create table member(
id varchar2(20) primary key,
pw varchar2(20),
name varchar2(20),
phone varchar2(20),
gender varchar2(6),
hobby varchar2(80)
);

insert into member(id,pw,name,phone,gender,hobby) values (
'aaa','1111','홍길동','010-1111-1111','M','game,golf,run'
);

insert into member values (
'bbb','1111','유관순','010-2222-2222','F','golf,book'
);

insert into member values (
'ccc','1111','이순신','010-3333-3333','M','cook,book'
);

insert into member values (
'ddd','1111','강감찬','010-4444-4444','M','game,run,book'
);

insert into member values (
'eee','2222','김구','010-5555-5555','M','golf,book,cook'
);


commit;

select * from member;

delete member where id='ccc';

select * from member;

update member set phone='010-3333-3333' where id='ddd';

select * from member;

commit;

select * from tab; --모든테이블 보여줌
desc member;

desc employees;

select create_date from employees;

select * from member;

select id,name from member;

select * from member;

select * from employees;

select  emp_name, employee_id, salary*1342*12, commission_pct from employees order by salary desc;

desc employees;

select hire_date,sysdate from employees;










