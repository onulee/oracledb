select * from departments;

select * from departments order by manager_id asc;

-- employees ���̺��� employee_id�� ��������
select * from employees order by employee_id desc;

-- ����� 200�̻��� ���
select * from employees where employee_id>=200;

-- ����� 190�̻� 205������
select * from employees 
where employee_id>=190 and employee_id<=205;

-- salary 5000�̻��� ����� salary �������� �˻��Ͻÿ�.
select * from employees 
where salary>=5000 order by salary asc;

-- ���,�̸�,����,�μ�,���޼����� ����Ͻÿ�.
select employee_id,emp_name,job_id,department_id,salary from employees ;

-- ���̺��� ������ ����
create table emp2 as select * from employees;

select email from emp2;

-- �÷� Ÿ�� 
desc emp2;

-- �÷��̸� ����
alter table emp2 rename column emp_name to e_name;

-- �÷� ������Ÿ��,���� ����
-- email �ȿ� �����Ͱ� ���ڰ� �ƴϸ� ������ �ȵ�.
alter table emp2 modify email varchar2(50);

-- �÷� ����
alter table emp2 drop column create_date;

-- �÷� �߰�
alter table emp2 add create_date date;

-- �÷����� ����
alter table emp2 modify update_date invisible;
alter table emp2 modify update_date visible;
select * from emp2;

-- �÷��� �����͸� ����
insert into emp2 select * from employees
;

-- �̸�,�޿�,�Ի��� ���
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



-- ��Ī����, as ������ ������
select salary,salary*12 y_salary,salary*12*1342 as k_salary from employees;

select * from employees;

-- ��� nvl(����,0) null��� 0���� ǥ��
select salary, salary*12,commission_pct from employees;
select 
salary, 
salary*12 as y_salary, 
(salary*12)*nvl(commission_pct,0) as "�μ�Ƽ��",
(salary*12)+(salary*12)*nvl(commission_pct,0) as c_salary  from employees;

select nvl(manager_id,0) from employees;

-- ���,����,����,Ŀ�̼�,���,���+Ŀ�̼� �� ����Ͻÿ�.

-- ������ 6000�� ��� �˻�
select salary as "em p" from employees  where salary=6000;

-- Ŀ�̼��� null �� ����� ����Ͻÿ�. null�� is null
-- select * from employees where commission_pct=null;
select * from employees where commission_pct is null;
select * from employees where commission_pct is not null;

-- �μ���ȣ,�μ����� ����Ͻÿ�.
select department_id as "�μ���ȣ",department_name "�μ���" from departments
where department_id>=10 and department_id<=40;

-- ����Ÿ���� �ٿ��� ���
select emp_name||'is a'||job_id from employees;

select concat(concat(emp_name,'is a'),job_id) con_name from employees;

select * from stuscore;

select kor,eng,math,kor+eng+math,(kor+eng+math)/3 from stuscore;

-- �μ���ȣ �ߺ����� ���
select DISTINCT department_id from employees
order by department_id asc;

-- job_id �ߺ����� ����Ͻÿ�.
select distinct job_id from employees;


-- ���� 3000,6000,7000 ����Ͻÿ�.
select * from employees
where salary=3000 or salary=6000 or salary=7000;

select * from employees
where salary>=3000 and salary <=10000
order by salary desc;

-- ������ 5000���� �� ������� +1000 ������ �λ��ؼ� ����Ͻÿ�.
select salary,salary+1000,(salary+1000)*1342 "��ȭ"
from employees
where salary<=5000;

--�μ���ȣ�� 10,30,50 �� �����ȣ,����̸�,�μ���ȣ,����,����,�Ի����� ����Ͻÿ�.
select employee_id,emp_name,department_id,job_id
from employees
where department_id=10 or department_id=30 or department_id=50
order by department_id asc, employee_id desc
;

select * from employees;

-- �Ի����� 2003/09/01 �����̸鼭, 4000�̻� 8000���� �����ȣ,����̸�,�޿�,�Ի���,�μ���ȣ ����Ͻÿ�.

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

