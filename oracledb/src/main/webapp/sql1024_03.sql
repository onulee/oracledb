select * from employees;

-- sysdate 현재날짜 출력, round 반올림
select hire_date,sysdate,round(sysdate-hire_date) from employees;

-- distinct 중복방지
select distinct department_id from employees order by department_id  asc;

select * from departments;

SELECT * FROM DEPARTMENTS;

desc stuscore;

select emp_name from employees;

-- 변수,테이블명,컬럼명은 대소문자 구별없음, 데이터값은 대소문자구별함.
select emp_name from employees where EMP_NAME='Donald OConnell';
