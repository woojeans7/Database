-- buytbl, usertbl 문제
use sqldb;

-- 다음 결과가 나오도록 buytbl에 대한 SQL문을 각각 작성하세요.
select userid as '사용자 아이디', sum(amount) as '총 구매 개수' from buytbl group by userid;

select userid as '사용자 아이디', sum(amount*price) as '총 구매액' from buytbl group by userid;

select avg(amount) as '평균 구매 개수' from buytbl;

select userid, avg(amount) as '평균 구매 개수' from buytbl group by userid;

-- 가장 키가 큰사람과 가장 키가 작은 사람을 출력함
select name, height from usertbl
where height = (select max(height) from usertbl) or height = (select min(height) from usertbl);

-- 다음결과가 나오도록 usertbl에 대한 SQL문을 작성하세요.
select count(mobile1) as '휴대폰이 있는 사용자' from usertbl;


-- buytbl 테이블로 사용자별 총 구매액을 출력하세요.
select userid as '사용자', sum(price * amount) as '총구매액' from buytbl group by userid;

-- 총구매액이 1,000이상인 사용자만 출력하세요.
select userid as '사용자', sum(price * amount) as '총구매액' 

-- world 문제
use world;

-- city 테이블에서 국가코드가 'KOR'인도시들의 인구수 총합을 구하시오
from buytbl group by userid having sum(price * amount) > 1000;

-- city 테이블에서 국가코드가 'KOR'인도시들의 인구수 중최소값을 구하시오. 단 결과를 나타내는 테이블의 필드는 "최소값"으로 표시하시오
select sun(population) from city where countrycode = 'KOR';

-- city 테이블에서 국가코드가 'KOR'인 도시들의 평균을 구하시오.
select min(population) as '최소값' from city where countrycode = 'KOR';

-- city 테이블에서 국가코드가 'KOR'인 도시들의 인구수 중 최대값을 구하시오. 단 결과를 나타내는 테이블의 필드는 "최대값"으로 표시하시오
select avg(population) from city where countrycode ='KOR';

-- country 테이블 각 레코드의 Name 칼럼의 글자수를 표시하시오.
select length (name) from country ;

-- country테이블의 나라명(Name 칼럼)을 앞 세글자만 대문자로 표시하시오.
select upper(mid(Name, 1, 3)) from country;

-- country테이블의 기대수명(LifeExpectancy)을 소수점 첫째자리에서 반올림해서 표시하시오.
select name as '이름' , round(lifeexpectancy,1) as '기대수명'  from country;

-- employees 문제
use employees;

-- employees db에서 각 부서별 관리자를 출력하세요. (단, 현 재직자만 출력한다.)
select * from dept_manager where to_date = '9999-01-01';

-- 부서번호 d005 부서의 현재 관리자 정보를 출력하세요.
select * from employees where emp_no = (
	select emp_no from dept_manager
	where to_date = '9999-01-01' and dept_no = 'd005'
);

-- employees 테이블에서 페이지네이션으로 페이지를 추출하려고 한다. 다음 조건하에서 8번 페이지의 데이터를 출력하세요.
-- 입사일을 내림차순으로 정렬한다, 한 페이지당 20명의 정보를 출력한다. 
select * from employees order by hire_date desc limit 140, 20;

-- employees db에서 재직자의 총 수를 구하시오 (재직자의 to_date값은 '9999-01-01'로 저장되어 있음)
select count(*) from dept_emp where to_date = '9999-01-01';

-- employees db에서 재직자의 평균 급여를 출력하시오.
select avg(salary) from salaries where to_date = '9999-01-01';

-- 재직자 전체 평균 급여 보다 급여를 더 많이 받는 재직자를 출력하세요.
select * from salaries 
where to_date = '9999-01-01' 
and salary > (
select avg(salary) from salaries
where to_date = '9999-01-01'
);

-- employees db에서 각 부서별 재직자의 수를 구하시오
-- 부서 번호로 구분하고, 부서번호로 오름차순 정렬하여 출력한다.
select dept_no, count(*) from dept_emp
where to_date = '9999-01-01'
group by dept_no
order by dept_no;