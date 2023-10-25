select * from employees;

select salary,salary+100,salary-100 from employees;

select sysdate,sysdate+365 from dual; --dual 임시더미테이블

select 1+3 from dual;

-- 문자 '3'을 사칙연산을 하면 숫자로 자동변환
select 1+'3' from dual;

-- 문자 'a'는 사칙연산 하면 에러
select 1+'a' from dual;

-- 문자는 사칙연산을 할수 없음.
select 'a'+'b' from dual;

-- 문자 결합은 ||, concat명령어
select 'a'||'b' from dual;
select concat('a','b') from dual;

select * from employees;

-- emp_name(email) 이렇게 출력하시오.
-- 운이조아(onulee)
-- Donald OConnell(DOCONNEL)
select emp_name||'('||email||')' u_nicId from employees;
select concat(emp_name,concat('(',concat(email,')'))) from employees;

select employee_id,emp_name,hire_date from employees
order by hire_date asc
;

-- 00/01/01 이후 입사한 사원을 출력하시오.
-- 00/01/24, 00-01-01, 2000-01-01 같은 형태임.
select * from employees
where hire_date >= '00-01-01'
order by hire_date asc
;

select * from employees
order by salary desc
;

select max(salary) from employees; 
--24000

select * from employees
where salary = 24000
;
select * from employees
where salary=(select max(salary) from employees)
;

select * from employees
where commission_pct is not null
;

-- 부서번호가 80번 이상인 사원을 출력하시오.
select * from employees
where department_id >=80
order by department_id asc
;

-- 부서번호 80만 제외하고 출력하시오.
select * from employees
where not department_id = 80
order by department_id asc
;

-- <> != not
select * from employees
where department_id != 80
order by department_id asc
;

-- 부서번호가 50번이면서 6000이상인 사원을 출력하시오.
select * from employees
where department_id=50 and salary>=6000
;

-- and,  between and
select * from employees
where salary>2000 and salary<3000
;

-- between A and B
select * from employees
where salary between 2000 and 3000
;

-- avg,count,max,min
select avg(salary) from employees
;

select * from employees
where salary <=6461
order by salary desc
;

select * from employees
where salary <=(select avg(salary) from employees)
order by salary desc
;

--월급 3000,4000,6000
select * from employees
where salary=3000 or salary=4000 or salary=6000
;

select * from employees
where salary in(3000,4000,6000)
;

select * from employees;

-- 사원번호 101,151,200
select employee_id,salary from employees
where employee_id=101 or employee_id=151 or employee_id=200
;
select employee_id,salary from employees
where employee_id in(101,151,200)
;

-- 월급이 2000미만, 3000초과 인 사원을 출력하시오.
select * from employees
where salary<2000 or salary>3000
; --81

select * from employees
where salary not between 2000 and 3000
;

-- 입사일 00/01/01 - 00/12/31 사원을 출력하시오.
select * from employees
where hire_date between '00/01/01' and '00/12/31'
;

select * from employees
where hire_date>='00/01/01' and hire_date <='00/12/31'
;


select emp_name from employees;

-- S로 시작되는 이름을 출력하시오.
select emp_name from employees
where emp_name like 'S%'
;

-- n로 끝나는 이름을 출력하시오.
select emp_name from employees
where emp_name like '%n'
;

-- 처음,끝,중간 e 가 있는 이름을 출력하시오.
select emp_name from employees
where emp_name like '%e%'
;


select * from board;

-- bcontent 컬럼에 'faucibus' 단어가 들어가 있는 게시글을 출력하시오.
select * from board
where bcontent like '%faucibus%'
;

--bcontent 컬럼에 'ven' 개수 - 256
select * from board
where bcontent like '%ven%'
;
-- btitle 'ven' 개수 - 15
select * from board
where btitle like '%ven%'
;
-- btitle 또는bcontent 컬럼에 ven 들어간 게시글을 출력하시오. - 270
select * from board
where bcontent like '%ven%' or btitle like '%ven%'
;

-- bcontent n으로 시작하면서 4개의 문자단어가 있는 게시글을 출력하시오.
-- nibh naabb uisque
-- % n___ %
select bcontent from board
where bcontent like '%n_'
;

select * from employees;

select emp_name from employees
where emp_name like 'P__ %';

-- D로 시작되는 이름출력
select * from employees
where emp_name like 'D%'
;


-- 중간 a가 들어간 이름 출력
select * from employees
where emp_name like '%a%'
;

-- 두번째 글자가 a 인 사원이름을 출력하시오.
select * from employees
where emp_name like '_a%'
;

-- 월급을 낮은 순부터 출력하시오.
select emp_name,salary from employees
order by salary desc
;

select employee_id,emp_name,job_id,hire_date from employees
order by hire_date desc
;

-- 사원명 역순정렬
select employee_id,emp_name,job_id,hire_date from employees
order by emp_name desc
;

-- 부서번호는 순차정렬, 이름은 역순정렬
-- 사원번호,사원명,부서번호,직급,입사일,월급 만 출력하시오.
select employee_id,emp_name,department_id,job_id,hire_date,salary from employees
order by department_id asc, emp_name desc
;

-- 월급으로 순차정렬, 입사일 역순정렬
select employee_id,emp_name,department_id,job_id,hire_date,salary from employees
order by salary asc, hire_date desc
;

-- abs : 절대값
select -10,abs(-10) "절대값" from dual;

--floor : 버림
select 10.54578, floor(10.54578) from dual; 

-- trunc(값,버림위치) : 특정자리 버림
select 10.54578,trunc(10.54578,2),floor(10.54578) from dual;

-- round : 특정자리 반올림
select 10.54578,round(10.54578), round(10.54578,3) from dual;


select * from stuscore;
select stunum,name,math,eng,kor+eng,floor((kor+math)/2) from stuscore;

-- 월급을 원화로 환산, 1342.32 소수점2자리 반올림해서 출력하시오.
-- 사번,사원명,월급,월급환산, 월급환산 3자리 반올림

select salary,salary*1342.32,round(salary*1342.32,2) from employees
;

-- 입사일이 현재날짜까지 걸린 일자를 출력하시오.
-- 소수점 3자리에서 반올림
select round(sysdate-hire_date,2) from employees
;

-- 입사일에서 현재날짜까지 걸린 일자를 출력하시오.\
-- 소수점 자리는 반올림하고, 일을 년으로 환산해서 출력하시오.
-- 순차정렬
select emp_name, floor(round(sysdate-hire_date)/365) sdate from employees
order by sdate asc
;


select * from member;

select * from employees;


-- 나머지 함수
select mod(27,2), mod(27,5), mod(27,7) from dual;

-- employees 사번이 홀수 인 사원을 출력하시오.
select * from employees
where mod(employee_id,2)=1
order by employee_id asc
;

-- 관리자가 짝수인 사원을 출력하시오
-- 사번,사원명,입사일,월급,관리자번호, 부서번호
select employee_id,emp_name,hire_date,salary,manager_id,department_id from employees
where mod(manager_id,2)=0
order by employee_id asc
;

select bhit from board;

select avg(bhit) from board;

-- 평균조회수를 2자리에서 반올림 출력하시오.
select round(avg(bhit),1) from board;
-- 평균조회수 소수점 버림
select floor(avg(bhit)) from board;

-- 평균받아 높은 조회수를 가진 게시글 출력
select * from board
where bhit >= (select avg(bhit) from board)
;

select  to_char(salary,'999,999'),to_char(round(salary*1342.32),'999,999,999') from employees;

-- 시퀀스
create sequence member_seq
start with 1
increment by 1
minvalue 1
maxvalue 99999
nocycle
nocache
;

-- 시퀀스
create sequence board_seq
start with 1001
increment by 1
minvalue 1
maxvalue 99999
nocycle
nocache
;


select * from board
order by bno desc
;

select board_seq.currval from dual;
select board_seq.nextval from dual;

select member_seq.nextval from dual;


insert into board values (
board_seq.nextval,'제목입니다.','내용입니다.',sysdate,'aaa',board_seq.currval,0,0,1,'1.jpg'
);

-- dept_seq2 시작10, 증분 10

select dept_seq.nextval from dual;

desc stuscore;

select * from stuscore;

--delete stuscore;

commit;

select * from stuscore
order by total desc
;

select stunum,rank,rank() over (order by total desc) m_rank
from stuscore
;

-- total을 기준으로 역순정렬해서 등수를 출력
select stunum,rank() over (order by total desc) 
from stuscore;

update stuscore
set rank = 1; --1개의 컬럼만 들어와야 저장이 가능함.

update stuscore a
set rank = ( -- select stunum,rank from stuscore 
select b_rank from
(select stunum b_num, rank() over (order by total desc) as b_rank from stuscore) b
where a.stunum = b.b_num
);

select total,rank from stuscore
order by total desc;

commit;

select stunum,rank() over (order by total desc) from stuscore;
select stunum b_num, rank() over (order by total desc) as b_rank from stuscore;




select * from stuscore a,member b;

select employee_id,emp_name,a.department_id,department_name,parent_id 
from employees a,departments b
where a.department_id = b.department_id
;


select department_id,department_name from departments;

select * from departments;

update stuscore a
set rank=1





where stunum=1;


--emp2
-- drop table emp2;

--테이블 복사
create table emp2 as select * from employees;

select * from emp2;

update emp2 set manager_id='';

commit;

select * from emp2;

update (select a.manager_id a_m,b.manager_id b_m
from emp2 a,employees b
where a.employee_id = b.employee_id) 
set a_m = b_m
;

select salary from employees
where salary >= (select avg(salary) from employees)
;

-- 1. emp2의 사원번호와 employees 사원번호 똑같이 일치.
-- 2. emp2의 관리자번호와 employees 관리자번호를 검색함.
-- 3. employees관리자번호를 emp2의관리자번호에 입력시킴
update ( select a.manager_id a_m,b.manager_id b_m from emp2 a,employees b where a.employee_id = b.employee_id  )
set a_m = b_m;

select manager_id from emp2;


select a.manager_id a_m,b.manager_id b_m
from emp2 a,employees b
where a.employee_id = b.employee_id;

select manager_id from employees;

rollback;

-- emp_seq 시작 1, 증분 1, 최대 100000, 최소1
create sequence emp_seq
start with 1
increment by 1
minvalue 1
maxvalue 100000
nocycle
nocache
;


create table emp01(
empno number(4) primary key,
ename varchar2(10),
hiredate date
);

drop table emp01;

insert into emp01 values( emp_seq.nextval, '홍길동',sysdate );
insert into emp01 values( emp_seq.nextval, '유관순',sysdate );
insert into emp01 values( emp_seq.nextval, '이순신',sysdate );
insert into emp01 values( emp_seq.nextval, '홍길자',sysdate );
insert into emp01 values( emp_seq.nextval, '홍길순',sysdate );

commit;

select emp_seq.currval from dual;

select * from emp01;

select emp_seq.nextval from dual;

