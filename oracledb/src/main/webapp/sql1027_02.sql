select max(salary),min(salary) from employees;

select department_id from employees;

select emp_name, max(salary) from employees
where department_id = 50
group by emp_name
;

select emp_name,salary from employees
where salary = (select max(salary) from employees)
;

select department_id,max(salary),min(salary) from employees
group by department_id
;

select emp_name, max(salary) from employees
group by emp_name
;

select emp_name,salary from employees;


-- count(*) 
select count(*) from employees;

-- null값은 count되지 않음.
select count(manager_id) from employees;

select id from board;

select emp_name from employees;

select emp_name from employees
where emp_name like('%D%') or emp_name like('%d%');

-- 소문자로 변경후 d를 검색
select emp_name from employees
where lower(emp_name) like('%d%');

-- 빈공백을 0으로 표시
select to_char(12,'000,000') from dual;
select lpad(12,6,'0') from dual;

select id from board;
select substr(id,3,3) from board;
select bdate from board;
-- 20230816

select to_char(bdate,'YYYYMMDD') from board;
select substr(to_char(bdate,'YYYYMMDD'),1,6) from board;

select id,instr(id,'ff') i_id from board
where instr(id,'ff') !=0;

select length(id) from board;


-- hire_date employees
-- substr 사용해서 월을 출력하시오.
select hire_date from employees;
select substr(hire_date,4,2) from employees;

-- 이름에서 3번째부터 3개와 월을 함께 출력하시오. emp_name,hire_date,employees
--    aaa06
select substr(emp_name,3,3)||substr(hire_date,4,2) from employees;

-- 마지막 날짜 last_day(
select hire_date,last_day(hire_date) from employees;

select * from emp01;

-- 테이블생성되면서 모든 데이터 추가
create table fboard as select * from board;

select bhit,bhit+100 from board;

update board
set bhit = bhit+100;

select bno,bhit from board;

rollback;

update board
set bhit = bhit+1
where bno =31 ;


update fboard
set bhit = 1;

select a.bno,a.bhit, b.bno,b.bhit from fboard a, board b;
commit;

select bno,bhit from board;


update fboard a
set bhit = (select bhit from board b where a.bno=b.bno)
;

desc fboard;

alter table fboard
add userid varchar2(30)
;

select userid from fboard;



