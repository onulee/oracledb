-- 테이블 생성 및 데이터 복사
create table emp2 as select * from employees;

-- 테이블명 변경
-- rename emp2 to emp02;
-- 테이블 삭제
-- drop table emp01;


-- 테이블 컬럼 추가
alter table fboard
add u_id varchar2(30) ;

-- 테이블 컬럼명을 변경
alter table fboard
rename column userid to uuid;

-- 테이블 컬럼타입을 변경
alter table fboard
modify uuid varchar(40);

-- 컬럼 삭제
alter table fboard
drop column uuid;



desc member;

create table mem (
id varchar2(30) primary key,  -- not null, unique
pw varchar2(30) not null, --null값 허용안됨
name varchar2(30) not null,
phone varchar2(13), -- 010-1111-1111
gender varchar2(1) check(gender in('M','F','m','f')),  -- M,F
hobby varchar2(80),
mlevel number(2) check(mlevel between 1 and 10), --1~10사이 값만 가능
mdate date default sysdate -- 입력하지 않으면 현재날짜 등록
);

alter table mem 
modify phone varchar2(13); 

insert into mem values (
'aaa','1111','홍길동','010-1111-1111','M','game',1,sysdate
);

insert into mem(id,pw,name) values (
'bbb','1111','유관순'
);

insert into mem(id,pw,name,gender) values (
'ccc','222','이순신','M'
);

select * from mem;

commit;

select * from member;

desc member;

-- 오라클 switch, if 조건문
-- decode 같은 값인 경우만 비교 가능함.

select * from employees;

select department_id from employees;

select department_id,department_name from departments;

-- 10 총무기획부 20마케팅 30 구매/생산부 40 인사부 50배송부
select department_id from employees;

-- decode 조건문
select department_id,
decode(department_id,
10,'총무기획부',
20, '마케팅',
30, '구매/생산부',
40, '인사부',
50, '배송부'
)
from employees;

-- 테이블 조인
select a.department_id,a.department_name 
from departments a,employees b
where a.department_id = b.department_id
;

-- 학생성적 테이블
create table sscore (
sno number(4) primary key, -- 점수에 보여되는 순번
sid varchar2(20), 
total number(3) default 0
);

insert into sscore values (
sscore_seq.nextval,'a1',50
);

insert into sscore values (
sscore_seq.nextval,'a2',90
);

insert into sscore values (
sscore_seq.nextval,'a3',80
);

insert into sscore values (
sscore_seq.nextval,'a4',10
);

insert into sscore values (
sscore_seq.nextval,'a5',100
);

insert into sscore values (
sscore_seq.nextval,'a6',70
);

insert into sscore values (
sscore_seq.nextval,'a7',60
);

insert into sscore values (
sscore_seq.nextval,'a8',30
);

insert into sscore values (
sscore_seq.nextval,'a9',20
);

insert into sscore values (
sscore_seq.nextval,'a10',80
);

commit;

select * from sscore;

select sno,sid,total,decode(total,
10,'F',
20,'F',
30,'F',
40,'F',
50,'F',
60,'F',
70,'D',
80,'B',
90,'A',
100,'A'
) as hak from sscore;

select avg from stuscore;

select avg,
case 
when avg>=90 then 'A'
when avg>=80 then 'B'
when avg>=70 then 'C'
when avg>=60 then 'D'
when avg<60 then 'F'
end as hak
from stuscore;

-- 월급이 3000미만 E등급 3000~5000 D등급, 5001~8000 C등급, 8001~10000 B등급, 10000이상 A등급으로 출력하시오.
-- employees salary
select salary,
case 
when salary>=10000 then 'A'
when salary>=8001 then 'B'
when salary>=5001 then 'C'
when salary>=3000 then 'D'
when salary<3000 then 'F'
end rank
from employees;

alter table emp02
add rank varchar2(10);


