select nvl(manager_id,0)
from employees
;

-- ceo��� ���ڷ� ǥ���ؼ� ����Ͻÿ�.
-- ���ڸ� ���ڷ� ����ȯ�� CEO���� ���
select nvl(to_char(manager_id),'CEO')
from employees
;

-- �׷��Լ� --
-- �Խñ� ��ȸ�� ������ ����Ͻÿ�.
-- õ���� ǥ��
SELECT TRIM(TO_CHAR(SUM(BHIT),'999,999,999')) FROM BOARD;

-- ��� ǥ��
SELECT TRIM(TO_CHAR(AVG(BHIT),'999,999,999')) FROM BOARD;

-- ������ ��� ���, �Ҽ��� 2�ڸ����� �ݿø�
SELECT ROUND(AVG(SALARY),2) FROM EMPLOYEES;

-- EMP_NAME �����Լ��� �׷��Լ��� �Բ� ����� �ȵ�. 
SELECT EMP_NAME,AVG(SALARY) FROM EMPLOYEES;

-- MIN �ּҰ� ,MAX �ִ밪, AVG ���, COUNT ����, SUM �հ�
SELECT MIN(SALARY),MAX(SALARY),AVG(SALARY),COUNT(*) FROM EMPLOYEES;

-- �μ���ȣ�� 50 �� ������� SALARY �հ�,����� ����Ͻÿ�.
SELECT SUM(SALARY),AVG(SALARY)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50
;

SELECT DEPARTMENT_ID,SUM(SALARY),AVG(SALARY),COUNT(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID ASC
;

-- ����
-- ��¥ �Խñ� ������ ����Ͻÿ�.
SELECT BDATE,COUNT(*)
FROM BOARD
GROUP BY BDATE
ORDER BY BDATE ASC
;

-- �⵵�� ���� ������ ����Ͻÿ�.
SELECT TO_CHAR(BDATE,'YYYYMM') ���,COUNT(TO_CHAR(BDATE,'YYYYMM') ) ���������
FROM BOARD
GROUP BY TO_CHAR(BDATE,'YYYYMM')
ORDER BY TO_CHAR(BDATE,'YYYYMM')
;

SELECT ADD_MONTHS(BDATE,1) 
FROM BOARD
;

-- �⵵�� ���
SELECT EXTRACT(YEAR FROM BDATE) FROM BOARD;
-- ���� ���
SELECT EXTRACT(MONTH FROM BDATE) FROM BOARD;
-- �ϸ� ���
SELECT EXTRACT(DAY FROM BDATE) FROM BOARD;

-- �⵵�� ������� ���� �Խñۼ� ���
SELECT EXTRACT(MONTH FROM BDATE),COUNT(EXTRACT(MONTH FROM BDATE))
FROM BOARD
GROUP BY EXTRACT(MONTH FROM BDATE)
ORDER BY EXTRACT(MONTH FROM BDATE)
;

-- �����Լ� ����� GROUP BY ���� �߰��ؼ� ����ؾ� ��.
SELECT DEPARTMENT_ID,COUNT(*) FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID
;
SELECT COUNT(EMPLOYEE_ID) FROM EMPLOYEES; --107
SELECT COUNT(MANAGER_ID) FROM EMPLOYEES; --106 : NULL


-- ��ȸ���� ���� ���� ����,������ ����Ͻÿ�.
SELECT MIN(BHIT) FROM BOARD;
SELECT BNO, BTITLE, MIN(BHIT) FROM BOARD
GROUP BY BNO,BTITLE,BCONTENT
;

SELECT * FROM BOARD
WHERE BHIT = (SELECT MIN(BHIT) FROM BOARD)
;

-- ��ȸ���� ���� ���� �Խñ��� ����Ͻÿ�.
SELECT * FROM BOARD
WHERE BHIT = (SELECT MAX(BHIT) FROM BOARD)
;


-- [ �����Լ� ] --
SELECT EMP_NAME FROM EMPLOYEES;

-- ��ҹ��� ���� ���� si �� ���Ե� �̸��� ��� ����Ͻÿ�.
-- SI, Si, sI, si
SELECT EMP_NAME
FROM EMPLOYEES
WHERE EMP_NAME LIKE ('%DA%') OR EMP_NAME LIKE ('%Da%') OR EMP_NAME LIKE ('%dA%') OR EMP_NAME LIKE ('%da%')
;

-- �ҹ��� ��ȯ�Լ�
SELECT EMP_NAME
FROM EMPLOYEES
WHERE LOWER(EMP_NAME) LIKE ('%da%')
;
-- �빮�� ��ȯ�Լ�
SELECT EMP_NAME
FROM EMPLOYEES
WHERE UPPER(EMP_NAME) LIKE ('%DA%')
;

-- employees���� �̸��� �빮�ڷ� ����Ͻÿ�.
SELECT UPPER(EMP_NAME) FROM EMPLOYEES;

-- �ڸ����� ���� ������ ���ڸ� ä�� ���.
SELECT LPAD(12345,10,'0') FROM DUAL;
SELECT RPAD(12345,10,'#') FROM DUAL;

-- 12345 10�ڸ��� õ����ǥ�ÿ� ��ȭ ǥ�ø� �߰��ؼ� ����Ͻÿ�.
-- ������� 0���� ǥ��
SELECT TO_CHAR(12345,'L0,000,000,000') FROM DUAL
;

--LTRIM - ���� ���� ����, RTRIM-�����ʰ�������, TRIM-��� ��������
-- '    ABC DEF   C    '
SELECT TRIM('   ABC DEF   C    ') FROM DUAL;


SELECT * FROM EMPLOYEES;

-- JOB_ID ASST -> SS -> I  ASST ->AIT
SELECT JOB_ID,REPLACE(JOB_ID,'SS','I') FROM EMPLOYEES;

-- JOB_ID �ȿ� �ִ� ���� ����
SELECT EMP_NAME, REPLACE(EMP_NAME,' ','') FROM EMPLOYEES;
SELECT '   ABC DEF   C    ',REPLACE('   ABC DEF   C    ',' ','') FROM DUAL;


SELECT JOB_ID FROM EMP2;
-- SH_CLERK -> CLERK �����ؼ� �����Ͻÿ�.
UPDATE EMP2
SET JOB_ID = 'CLERK'
WHERE JOB_ID = 'SH_CLERK'
;

rollback;

-- SH_CLERK�� CLERK���� ������Ʈ 
update emp2 a
set job_id = (SELECT REPLACE(JOB_ID,'CL','SH_CLERK') j_id from emp2 b where a.employee_id = b.employee_id)
;


SELECT REPLACE(JOB_ID,'SH_CLERK','CLERK') FROM EMP2;


ROLLBACK;

-- SUBSTR(�ش��÷�,3,2 ) �ش��÷����� 3��° ���ں��� 2���� ©��� ���
--  4��°���� �̸� 3���� ������.
SELECT EMP_NAME,SUBSTR(EMP_NAME,1,5) FROM EMPLOYEES;

SELECT HIRE_DATE FROM EMPLOYEES;

-- �̸� 5���� �Ի�⵵ ��� 
-- Donal(1995)
SELECT SUBSTR(EMP_NAME,1,5)||'('||EXTRACT(YEAR FROM HIRE_DATE)||')'
FROM EMPLOYEES
;
-- 
SELECT * FROM EMPLOYEES;

-- �Ի����� 06�� ����߿� �̸��� d�� �� �ִ� ����� ����Ͻÿ�.
SELECT * FROM EMPLOYEES
WHERE EXTRACT(MONTH FROM HIRE_DATE) = 6
AND EMP_NAME LIKE ('%d%')
;


rollback;
select job_id from emp2;


update board
set bhit =1
;

select bhit from board;

rollback;

select bno,bhit,bhit+100 from board;


select job_id from emp2;

update emp2 a
set job_id = (select replace(job_id,'SH_CLERK','CLERK') from emp2 b where a.employee_id = b.employee_id)
;

commit;

select * from board;

-- �Խñ��� ��¥�� 1�������ؼ� update�Ͻÿ�.
-- bdate

update board a
set bdate = (select bdate+1 from board b where a.bno = b.bno)
;

rollback;


select * from stuscore;

update stuscore
set rank = 0
;

commit;

select * from stuscore;

select b_num, b_rank from
(select stunum b_num,rank() over (order by total desc) b_rank from stuscore)
;

update stuscore a
set rank = (select b_rank from
(select stunum b_num,rank() over (order by total desc) b_rank from stuscore b) where a.stunum = b_num  )
;


select length(emp_name),emp_name from employees
;

-- length ��� ���
select avg(length(emp_name)) from employees;

-- �̸��� ������� ���̸�ŭ�� ����Ͻÿ�.


-- employees  ����ȣ 5��° 3���� �̸� 1,5��°���� 2���� �Բ� ����Ͻÿ�.
select * from employees;
select substr(phone_number,5,3)||substr(emp_name,1,5) from employees;


-- instr ã���� �ϴ� ��ġ �������
select instr(emp_name,'o') from
employees
where employee_id=198
;

select emp_name, instr(emp_name,' '), instr(emp_name,' ')+1 from employees;

-- 1��° �������ĺ��� �̸���������
select substr(emp_name,instr(emp_name,' ')+1) from employees;

-- �ֹι�ȣ �տ� �ڸ� ��������
select substr('880101-1101111',1,instr('880101-1101111','-')-1) from dual;

-- �ֹι�ȣ �ڿ� �ڸ� ��������
select substr('880101-1101111',instr('880101-1101111','-')+1) from dual;

-- employees�� phone_number ù��° �� �������� �պκа� �ںκ� ����Ͻÿ�.
select phone_number from employees;

select instr('123.456.789','.') from dual; -- ���� �ִ� ��ġ��

select instr('123.456.789.000','.',1,3) from dual; -- ù��° ����-������ġ, �ι�° ���� ���� �ι�° ��ġ��

select instr('123.456.789.000','.',-1,1) from dual; -- ù��° ����-������ġ, �ι�° ���� ���� �ι�° ��ġ��

select * from member;

-- ��ȭ��ȣ - ù��° �� ���, �ι�° ,����° ���� ����Ͻÿ�.\
-- 010
-- 1111
-- 1111
select substr(phone,1,instr(phone,'-')-1) from member; -- 1��°
select substr(phone, instr(phone,'-')+1, 4 ) from member; -- 2��°
select substr(phone, instr(phone,'-',1,2)+1, 4 ) from member; -- 3��°


select phone_number from employees;
-- ����ȣ���� 123���ԵǾ� �ִ� ����ȣ�� ����Ͻÿ�.
select phone_number from employees
where phone_number like ('%123%')
;


-- �μ��� �ִ������ ����Ͻÿ�.

select department_id, count(*),max(salary),min(salary)
from employees
group by department_id
order by department_id
;

--�̸�
select emp_name,hire_date, to_char( hire_date,'YYYY"��"MM"��"DD"��" DAY')
from employees
;


