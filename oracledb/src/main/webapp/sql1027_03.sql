select userid from fboard;

-- id 1번째부터 3개, bdate 월을 합친 값을 userid에 입력하시오.
select substr(id,1,3)||substr(bdate,4,2) from fboard;

update fboard a
set userid = (
select substr(id,1,3)||substr(bdate,4,2) from fboard b where a.bno = b.bno
)
;

select userid from fboard;

-- 테이블 컬럼 추가
alter table fboard
add u_id varchar2(30) ;

-- 테이블 컬럼명을 변경
alter table fboard
rename column userid to uuid;

-- 테이블 컬럼타입을 변경
alter table fboard
modify uuid varchar(40);


