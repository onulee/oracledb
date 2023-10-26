-- 사번이 홀수 인 사원을 출력하시오.
select employee_id from employees
where mod(employee_id,2) = 1;

-- board
select * from board;

desc board;

-- 현재 날짜 출력
select sysdate from dual;

select * from board
order by bno desc
;

insert into board values (
board_seq.nextval,'이벤트 진행','내용입니다.',sysdate,'ccc',board_seq.currval,0,0,1,''
);

insert into board values (
board_seq.nextval,'게시글을 등록합니다.','게시글 내용입니다.',sysdate,'ccc',board_seq.currval,0,0,1,'2.jpg'
);

insert into board values (
board_seq.nextval,'게시글을 등록합니다.2','게시글 내용입니다.2',sysdate,'ccc',board_seq.currval,0,0,1,'3.jpg'
);

select * from board
order by bno desc
;

commit;

select sysdate-1 어제,sysdate 오늘,sysdate+1 내일
from dual;

select bno,btitle, bdate from board
order by bdate desc
;

-- 현재날짜 기준 5일 이전에 게시글을 출력하시오.
-- 번호,제목,작성일만 출력
select sysdate-5 from dual;

select bno,btitle, bdate from board
where bdate > sysdate-7
order by bdate desc
;


-- employees 입사일에서 현재날짜까지 기간을 출력하시오.
-- 사원번호,사원명,입사일,월급,부서번호, 현재까지기간
-- 소수점은 절사
select employee_id,emp_name,hire_date,salary,department_id,
trunc(sysdate-hire_date)
from employees;


-- 다가올 요일을 출력
select next_day(sysdate,'목요일') from dual;
select next_day(sysdate,'목') from dual;
select next_day(sysdate,7) from dual;

-- 입력한 날의 마지막 일을 출력
select last_day(sysdate) from dual;
select last_day('20231101') from dual;
select last_day('20220201') from dual;

-- add_months
select add_months(sysdate,-2) from dual;
select add_months(sysdate,+12) from dual;
select add_months('20220101',+6) from dual;

-- 현재달에서 입사한 달까지의 개월수
select round(months_between(sysdate,hire_date))||'개월' from employees;


-- 현재기준으로 6개월동안 작성된 글을 출력하시오. board사용
select bno,btitle,bdate
from board
where bdate >add_months(sysdate,-6)
order by bdate desc
;

-- 날짜 중 년도만, 달만, 일만 출력 : extract
select extract( year from bdate ) from board;
select extract(month from bdate) from board;
select extract(day from bdate) from board;

-- 3,5,7월에 입력한 게시글을 출력하시오.
select bno,btitle,bdate from board
where extract(month from bdate) in (3,5,7)
order by bdate asc
;

-- 날짜 round - 15일이하는 1일 세팅, 16일부터는 1달 추가, trunc 1일기준으로 변경함.
select bno,btitle,bdate from board;
select bdate,round(bdate,'month'),trunc(bdate,'month') from board;

-- to_date 는 형변환 함수
select round(to_date('2023-02-16'),'month') from dual;

select bdate from board;


