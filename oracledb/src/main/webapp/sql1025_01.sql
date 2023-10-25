select * from employees;

select salary,salary+100,salary-100 from employees;

select sysdate,sysdate+365 from dual; --dual �ӽô������̺�

select 1+3 from dual;

-- ���� '3'�� ��Ģ������ �ϸ� ���ڷ� �ڵ���ȯ
select 1+'3' from dual;

-- ���� 'a'�� ��Ģ���� �ϸ� ����
select 1+'a' from dual;

-- ���ڴ� ��Ģ������ �Ҽ� ����.
select 'a'+'b' from dual;

-- ���� ������ ||, concat��ɾ�
select 'a'||'b' from dual;
select concat('a','b') from dual;

select * from employees;

-- emp_name(email) �̷��� ����Ͻÿ�.
-- ��������(onulee)
-- Donald OConnell(DOCONNEL)
select emp_name||'('||email||')' u_nicId from employees;
select concat(emp_name,concat('(',concat(email,')'))) from employees;

select employee_id,emp_name,hire_date from employees
order by hire_date asc
;

-- 00/01/01 ���� �Ի��� ����� ����Ͻÿ�.
-- 00/01/24, 00-01-01, 2000-01-01 ���� ������.
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

-- �μ���ȣ�� 80�� �̻��� ����� ����Ͻÿ�.
select * from employees
where department_id >=80
order by department_id asc
;

-- �μ���ȣ 80�� �����ϰ� ����Ͻÿ�.
select * from employees
where not department_id = 80
order by department_id asc
;

-- <> != not
select * from employees
where department_id != 80
order by department_id asc
;

-- �μ���ȣ�� 50���̸鼭 6000�̻��� ����� ����Ͻÿ�.
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

--���� 3000,4000,6000
select * from employees
where salary=3000 or salary=4000 or salary=6000
;

select * from employees
where salary in(3000,4000,6000)
;

select * from employees;

-- �����ȣ 101,151,200
select employee_id,salary from employees
where employee_id=101 or employee_id=151 or employee_id=200
;
select employee_id,salary from employees
where employee_id in(101,151,200)
;

-- ������ 2000�̸�, 3000�ʰ� �� ����� ����Ͻÿ�.
select * from employees
where salary<2000 or salary>3000
; --81

select * from employees
where salary not between 2000 and 3000
;

-- �Ի��� 00/01/01 - 00/12/31 ����� ����Ͻÿ�.
select * from employees
where hire_date between '00/01/01' and '00/12/31'
;

select * from employees
where hire_date>='00/01/01' and hire_date <='00/12/31'
;


select emp_name from employees;

-- S�� ���۵Ǵ� �̸��� ����Ͻÿ�.
select emp_name from employees
where emp_name like 'S%'
;

-- n�� ������ �̸��� ����Ͻÿ�.
select emp_name from employees
where emp_name like '%n'
;

-- ó��,��,�߰� e �� �ִ� �̸��� ����Ͻÿ�.
select emp_name from employees
where emp_name like '%e%'
;


select * from board;

-- bcontent �÷��� 'faucibus' �ܾ �� �ִ� �Խñ��� ����Ͻÿ�.
select * from board
where bcontent like '%faucibus%'
;

--bcontent �÷��� 'ven' ���� - 256
select * from board
where bcontent like '%ven%'
;
-- btitle 'ven' ���� - 15
select * from board
where btitle like '%ven%'
;
-- btitle �Ǵ�bcontent �÷��� ven �� �Խñ��� ����Ͻÿ�. - 270
select * from board
where bcontent like '%ven%' or btitle like '%ven%'
;

-- bcontent n���� �����ϸ鼭 4���� ���ڴܾ �ִ� �Խñ��� ����Ͻÿ�.
-- nibh naabb uisque
-- % n___ %
select bcontent from board
where bcontent like '%n_'
;

select * from employees;

select emp_name from employees
where emp_name like 'P__ %';

-- D�� ���۵Ǵ� �̸����
select * from employees
where emp_name like 'D%'
;


-- �߰� a�� �� �̸� ���
select * from employees
where emp_name like '%a%'
;

-- �ι�° ���ڰ� a �� ����̸��� ����Ͻÿ�.
select * from employees
where emp_name like '_a%'
;

-- ������ ���� ������ ����Ͻÿ�.
select emp_name,salary from employees
order by salary desc
;

select employee_id,emp_name,job_id,hire_date from employees
order by hire_date desc
;

-- ����� ��������
select employee_id,emp_name,job_id,hire_date from employees
order by emp_name desc
;

-- �μ���ȣ�� ��������, �̸��� ��������
-- �����ȣ,�����,�μ���ȣ,����,�Ի���,���� �� ����Ͻÿ�.
select employee_id,emp_name,department_id,job_id,hire_date,salary from employees
order by department_id asc, emp_name desc
;

-- �������� ��������, �Ի��� ��������
select employee_id,emp_name,department_id,job_id,hire_date,salary from employees
order by salary asc, hire_date desc
;

-- abs : ���밪
select -10,abs(-10) "���밪" from dual;

--floor : ����
select 10.54578, floor(10.54578) from dual; 

-- trunc(��,������ġ) : Ư���ڸ� ����
select 10.54578,trunc(10.54578,2),floor(10.54578) from dual;

-- round : Ư���ڸ� �ݿø�
select 10.54578,round(10.54578), round(10.54578,3) from dual;


select * from stuscore;
select stunum,name,math,eng,kor+eng,floor((kor+math)/2) from stuscore;

-- ������ ��ȭ�� ȯ��, 1342.32 �Ҽ���2�ڸ� �ݿø��ؼ� ����Ͻÿ�.
-- ���,�����,����,����ȯ��, ����ȯ�� 3�ڸ� �ݿø�

select salary,salary*1342.32,round(salary*1342.32,2) from employees
;

-- �Ի����� ���糯¥���� �ɸ� ���ڸ� ����Ͻÿ�.
-- �Ҽ��� 3�ڸ����� �ݿø�
select round(sysdate-hire_date,2) from employees
;

-- �Ի��Ͽ��� ���糯¥���� �ɸ� ���ڸ� ����Ͻÿ�.\
-- �Ҽ��� �ڸ��� �ݿø��ϰ�, ���� ������ ȯ���ؼ� ����Ͻÿ�.
-- ��������
select emp_name, floor(round(sysdate-hire_date)/365) sdate from employees
order by sdate asc
;


select * from member;

select * from employees;


-- ������ �Լ�
select mod(27,2), mod(27,5), mod(27,7) from dual;

-- employees ����� Ȧ�� �� ����� ����Ͻÿ�.
select * from employees
where mod(employee_id,2)=1
order by employee_id asc
;

-- �����ڰ� ¦���� ����� ����Ͻÿ�
-- ���,�����,�Ի���,����,�����ڹ�ȣ, �μ���ȣ
select employee_id,emp_name,hire_date,salary,manager_id,department_id from employees
where mod(manager_id,2)=0
order by employee_id asc
;

select bhit from board;

select avg(bhit) from board;

-- �����ȸ���� 2�ڸ����� �ݿø� ����Ͻÿ�.
select round(avg(bhit),1) from board;
-- �����ȸ�� �Ҽ��� ����
select floor(avg(bhit)) from board;

-- ��չ޾� ���� ��ȸ���� ���� �Խñ� ���
select * from board
where bhit >= (select avg(bhit) from board)
;

select  to_char(salary,'999,999'),to_char(round(salary*1342.32),'999,999,999') from employees;

-- ������
create sequence member_seq
start with 1
increment by 1
minvalue 1
maxvalue 99999
nocycle
nocache
;

-- ������
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
board_seq.nextval,'�����Դϴ�.','�����Դϴ�.',sysdate,'aaa',board_seq.currval,0,0,1,'1.jpg'
);

-- dept_seq2 ����10, ���� 10

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

-- total�� �������� ���������ؼ� ����� ���
select stunum,rank() over (order by total desc) 
from stuscore;

update stuscore
set rank = 1; --1���� �÷��� ���;� ������ ������.

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

--���̺� ����
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

-- 1. emp2�� �����ȣ�� employees �����ȣ �Ȱ��� ��ġ.
-- 2. emp2�� �����ڹ�ȣ�� employees �����ڹ�ȣ�� �˻���.
-- 3. employees�����ڹ�ȣ�� emp2�ǰ����ڹ�ȣ�� �Է½�Ŵ
update ( select a.manager_id a_m,b.manager_id b_m from emp2 a,employees b where a.employee_id = b.employee_id  )
set a_m = b_m;

select manager_id from emp2;


select a.manager_id a_m,b.manager_id b_m
from emp2 a,employees b
where a.employee_id = b.employee_id;

select manager_id from employees;

rollback;

-- emp_seq ���� 1, ���� 1, �ִ� 100000, �ּ�1
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

insert into emp01 values( emp_seq.nextval, 'ȫ�浿',sysdate );
insert into emp01 values( emp_seq.nextval, '������',sysdate );
insert into emp01 values( emp_seq.nextval, '�̼���',sysdate );
insert into emp01 values( emp_seq.nextval, 'ȫ����',sysdate );
insert into emp01 values( emp_seq.nextval, 'ȫ���',sysdate );

commit;

select emp_seq.currval from dual;

select * from emp01;

select emp_seq.nextval from dual;

