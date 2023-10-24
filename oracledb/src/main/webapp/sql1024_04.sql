select * from departments;

select * from departments order by manager_id asc;

-- employees 테이블에서 employee_id로 순차정렬
select * from employees order by employee_id desc;

-- 사번이 200이상인 사원
select * from employees where employee_id>=200;

-- 사번이 190이상 205번이하
select * from employees 
where employee_id>=190 and employee_id<=205;

-- salary 5000이상인 사원을 salary 순차정렬 검색하시오.
select * from employees 
where salary>=5000 order by salary asc;

-- 사번,이름,직급,부서,월급순으로 출력하시오.
select employee_id,emp_name,job_id,department_id,salary from employees ;

-- 테이블의 데이터 복사
create table emp2 as select * from employees;

select email from emp2;

-- 컬럼 타입 
desc emp2;

-- 컬럼이름 변경
alter table emp2 rename column emp_name to e_name;

-- 컬럼 데이터타입,길이 변경
-- email 안에 데이터가 숫자가 아니면 변경이 안됨.
alter table emp2 modify email varchar2(50);

-- 컬럼 삭제
alter table emp2 drop column create_date;

-- 컬럼 추가
alter table emp2 add create_date date;

-- 컬럼순서 변경
alter table emp2 modify update_date invisible;
alter table emp2 modify update_date visible;
select * from emp2;

-- 컬럼의 데이터만 복사
insert into emp2 select * from employees
;

-- 이름,급여,입사일 출력
select emp_name,salary,hire_date from emp2 
order by emp_name asc;

alter table emp2 modify SALARY invisible;
alter table emp2 modify MANAGER_ID invisible;
alter table emp2 modify COMMISSION_PCT invisible;
alter table emp2 modify RETIRE_DATE invisible;
alter table emp2 modify DEPARTMENT_ID invisible;
alter table emp2 modify JOB_ID invisible;

alter table emp2 modify SALARY visible;
alter table emp2 modify MANAGER_ID visible;
alter table emp2 modify COMMISSION_PCT visible;
alter table emp2 modify RETIRE_DATE visible;
alter table emp2 modify DEPARTMENT_ID visible;
alter table emp2 modify JOB_ID visible;



-- 별칭선언, as 생략이 가능함
select salary,salary*12 y_salary,salary*12*1342 as k_salary from employees;

select * from employees;

-- 년봉 nvl(변수,0) null경우 0으로 표시
select salary, salary*12,commission_pct from employees;
select 
salary, 
salary*12 as y_salary, 
(salary*12)*nvl(commission_pct,0) as "인센티브",
(salary*12)+(salary*12)*nvl(commission_pct,0) as c_salary  from employees;

select nvl(manager_id,0) from employees;

-- 사번,월급,직급,커미션,년봉,년봉+커미션 을 출력하시오.

-- 월급이 6000인 사원 검색
select salary as "em p" from employees  where salary=6000;

-- 커미션이 null 인 사원을 출력하시오. null비교 is null
-- select * from employees where commission_pct=null;
select * from employees where commission_pct is null;
select * from employees where commission_pct is not null;

-- 부서번호,부서명을 출력하시오.
select department_id as "부서번호",department_name "부서명" from departments
where department_id>=10 and department_id<=40;

-- 문자타입을 붙여서 출력
select emp_name||'is a'||job_id from employees;

select concat(concat(emp_name,'is a'),job_id) con_name from employees;

select * from stuscore;

select kor,eng,math,kor+eng+math,(kor+eng+math)/3 from stuscore;

-- 부서번호 중복제거 출력
select DISTINCT department_id from employees
order by department_id asc;

-- job_id 중복제거 출력하시오.
select distinct job_id from employees;


-- 월급 3000,6000,7000 출력하시오.
select * from employees
where salary=3000 or salary=6000 or salary=7000;

select * from employees
where salary>=3000 and salary <=10000
order by salary desc;

-- 월급이 5000이하 인 사람에게 +1000 월급을 인상해서 출력하시오.
select salary,salary+1000,(salary+1000)*1342 "원화"
from employees
where salary<=5000;

--부서번호가 10,30,50 인 사원번호,사원이름,부서번호,직급,월급,입사일을 출력하시오.
select employee_id,emp_name,department_id,job_id
from employees
where department_id=10 or department_id=30 or department_id=50
order by department_id asc, employee_id desc
;

select * from employees;

-- 입사일이 2003/09/01 이후이면서, 4000이상 8000이하 사원번호,사원이름,급여,입사일,부서번호 출력하시오.

select employee_id,emp_name,salary,hire_date,hire_date+100,department_id 
from employees
where salary>=4000 and salary<=8000 and hire_date>'03/09/01'
;

commit;



select * from employees;

update emp2 set create_date = '';
commit;

update (select a.create_date as a_date, b.create_date as b_date from emp2 a, employees b where a.employee_id = b.employee_id)
set a_date = b_date;

rollback;

select * from emp2;

