-- 년봉
select salary,salary*12,(salary*12)+ salary*12*nvl(commission_pct,0)
from employees
;

select manager_id from employees
where manager_id is null
;

select manager_id from employees;

-- null 0으로 표시 출력하시오.
select nvl(manager_id,0)
from employees
;

