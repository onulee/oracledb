create table customer (
name varchar2(20) primary key,
age varchar2(3),
gender varchar2(1)
);

insert into customer(name,age,gender) values (
'ȫ�浿','20','M' );

insert into customer(name,age,gender) values (
'������','21','F');

insert into customer(name,gender) values (
'�̼���','M');

commit;

select * from customer;


insert into customer values (
'������','22','M');

commit;

select * from customer;

create table freeboard (
bno number(4),
btitle varchar2(2000),
bcontent varchar2(2000),
bdate date,
buser varchar2(20),
bfile varchar2(300)
);

insert into freeboard values (
1,'�Խñ��� ����մϴ�.',
'�Խ��ǿ��� ������ �Է��ϴ� �κп� ���ڸ� ���� ���Դϴ�.',
sysdate,'aaa','1.jpg');

insert into freeboard values (
2, '�Խñ�02','������ �ִ� �κ�',
sysdate,'bbb','2.jpg');

commit;

select * from freeboard;

delete from freeboard where bno=1;

select * from freeboard;

rollback;

commit;

update freeboard set btitle='�Խñ����� ������' where bno=2;


select * from freeboard;

rollback;

select bno,btitle,bcontent,bdate,buser,bfile from freeboard;

select * from freeboard;

select bno,bdate,buser,btitle,bcontent from freeboard;




