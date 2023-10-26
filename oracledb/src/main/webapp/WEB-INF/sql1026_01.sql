-- ����� Ȧ�� �� ����� ����Ͻÿ�.
select employee_id from employees
where mod(employee_id,2) = 1;

-- board
select * from board;

desc board;

-- ���� ��¥ ���
select sysdate from dual;

select * from board
order by bno desc
;

insert into board values (
board_seq.nextval,'�̺�Ʈ ����','�����Դϴ�.',sysdate,'ccc',board_seq.currval,0,0,1,''
);

insert into board values (
board_seq.nextval,'�Խñ��� ����մϴ�.','�Խñ� �����Դϴ�.',sysdate,'ccc',board_seq.currval,0,0,1,'2.jpg'
);

insert into board values (
board_seq.nextval,'�Խñ��� ����մϴ�.2','�Խñ� �����Դϴ�.2',sysdate,'ccc',board_seq.currval,0,0,1,'3.jpg'
);

select * from board
order by bno desc
;

commit;

select sysdate-1 ����,sysdate ����,sysdate+1 ����
from dual;

select bno,btitle, bdate from board
order by bdate desc
;

-- ���糯¥ ���� 5�� ������ �Խñ��� ����Ͻÿ�.
-- ��ȣ,����,�ۼ��ϸ� ���
select sysdate-5 from dual;

select bno,btitle, bdate from board
where bdate > sysdate-7
order by bdate desc
;


-- employees �Ի��Ͽ��� ���糯¥���� �Ⱓ�� ����Ͻÿ�.
-- �����ȣ,�����,�Ի���,����,�μ���ȣ, ��������Ⱓ
-- �Ҽ����� ����
select employee_id,emp_name,hire_date,salary,department_id,
trunc(sysdate-hire_date)
from employees;


-- �ٰ��� ������ ���
select next_day(sysdate,'�����') from dual;
select next_day(sysdate,'��') from dual;
select next_day(sysdate,7) from dual;

-- �Է��� ���� ������ ���� ���
select last_day(sysdate) from dual;
select last_day('20231101') from dual;
select last_day('20220201') from dual;

-- add_months
select add_months(sysdate,-2) from dual;
select add_months(sysdate,+12) from dual;
select add_months('20220101',+6) from dual;

-- ����޿��� �Ի��� �ޱ����� ������
select round(months_between(sysdate,hire_date))||'����' from employees;


-- ����������� 6�������� �ۼ��� ���� ����Ͻÿ�. board���
select bno,btitle,bdate
from board
where bdate >add_months(sysdate,-6)
order by bdate desc
;

-- ��¥ �� �⵵��, �޸�, �ϸ� ��� : extract
select extract( year from bdate ) from board;
select extract(month from bdate) from board;
select extract(day from bdate) from board;

-- 3,5,7���� �Է��� �Խñ��� ����Ͻÿ�.
select bno,btitle,bdate from board
where extract(month from bdate) in (3,5,7)
order by bdate asc
;

-- ��¥ round - 15�����ϴ� 1�� ����, 16�Ϻ��ʹ� 1�� �߰�, trunc 1�ϱ������� ������.
select bno,btitle,bdate from board;
select bdate,round(bdate,'month'),trunc(bdate,'month') from board;

-- to_date �� ����ȯ �Լ�
select round(to_date('2023-02-16'),'month') from dual;

select bdate from board;


