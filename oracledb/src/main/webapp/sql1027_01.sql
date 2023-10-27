select sysdate from dual;

select sysdate,sysdate+1,add_months(sysdate,1) from dual;

-- 그달의 마지막 일자를 알려줌.
select last_day(sysdate) from dual;

select last_day('2022-01-01') from dual;

-- 날짜에서 년도,월,일만 출력
select extract(year from sysdate) from dual;
select extract(month from sysdate) from dual;
select extract(day from sysdate) from dual;

-- 날짜에서 날짜를 빼면 기간의 일을 알수 있음.
select bdate, trunc(sysdate - bdate)||'일' from board;

-- 지난 개월수를 출력
select bdate,trunc(months_between(sysdate,bdate))||'개월' from board;

-- 날짜->문자로 형변환, 날짜포맷 변경
select sysdate from dual;
select to_char(sysdate,'YYYY-MM-DD AM HH:MI:SS') from dual;

select to_char (sysdate,'YYYY"년" MM"월" DD"일" DAY') from dual;

-- 숫자->문자로 형변환, 천단위표시, 원화표시
-- 9로 자리수 표시를 하면, 없을때는 빈공백, 0으로 자리수 표시를 하면, 없을때 0으로 출력됨.
select 1234500000 from dual;
select to_char(1234500000,'999,999,999,999') from dual; --빈공백
select trim(to_char(1234500000,'999,999,999,999')) from dual; -- trim 빈공백제거
select to_char(1234500000,'000,999,999,999') from dual; --0으로 표시
select to_char(1234500000,'L999,999,999,999') from dual; --원화표시 L, $

-- 문자->날짜 형변환, 기존의 날짜가 얼만큼 지났는지 확인
select '2023-10-01' from dual;
select add_months('2023-10-01',1) from dual;
select sysdate-to_date('2023-10-01','YYYY-MM-DD') from dual;

