-- 모든 테이블 정의는 create_table 참조!!

-- 앞에서 정의한 3개의 테이블(stdtbl, clubtbl, stdclubtbl)을 이용해서 다음을 처리하세요.
-- 학생 테이블, 동아리 테이블, 학생 동아리 테이블을 이용해서 학생을 기준으로 학생 이름/지역/가입한 동아리/동아리방을 출력하세요.
SELECT S.stdName, S.addr, SC.clubName, C.roomNo
FROM stdtbl S
	INNER JOIN stdclubtbl SC
		ON S.stdName = SC.stdName
	INNER JOIN clubtbl C
		ON SC.clubName = C.clubName
ORDER BY S.stdName;

-- 동아리를 기준으로 가입한 학생의 목록을 출력하세요.
-- 	출력정보: clubName, roomNo, stdName, addr
SELECT C.clubName, C.roomNo, S.stdName, S.addr
FROM stdtbl S
	INNER JOIN stdclubtbl SC
		ON SC.stdName = S.stdName
	INNER JOIN clubtbl C
		ON SC.clubName = C.clubName
ORDER BY C.clubName;

-- 앞에서 추가한 테이블(empTbl)에서'우대리'의 상관 연락처 정보를 확인하세요.
-- 출력할 정보 : 부하직원, 직속상관, 직속상관연락처
SELECT A.emp AS '부하직원', B.emp AS '직속상관', B.empTel AS '직속상관연락처'
FROM empTbl A
	INNER JOIN empTbl B
	ON A.manager = B.emp
WHERE A.emp = '우대리';

-- 모든 문제는 employees 데이터베이스에서 수행한다.
USE employees;

-- 현재 재직 중인 직원의 정보를 출력하세요
-- 	출력항목: emp_no, first_name, last_name, title
SELECT e.emp_no, e.first_name, e.last_name, title
FROM titles t
	INNER JOIN employees e
		ON t.emp_no = e.emp_no
WHERE t.to_date = '9999-01-01';

-- 현재 재직 중인 직원 정보를 출력하세요
-- 	출력항목: 직원의 기본 정보 모두, title, salary
SELECT e.*, t.title, s.salary
FROM current_titles t
	INNER JOIN employees e
		ON t.emp_no = e.emp_no
	INNER JOIN current_salaries s
		ON t.emp_no = s.emp_no
WHERE t.to_date = '9999-01-01'
	AND s.to_date = '9999-01-01';
    
-- 현재 재직중인 직원의 정보를 출력하세요.
-- 	출력항목: emp_no, first_name, last_name, department
-- 	정렬: emp_no 오름차순
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM departments d
	INNER JOIN dept_emp de
		ON d.dept_no = de.dept_no
	INNER JOIN employees e
		ON de.emp_no = e.emp_no
WHERE de.to_date = '9999-01-01'
ORDER BY e.emp_no;

-- 부서별 재직중인 직원의 수를 출력하세요.
-- 	출력 항목: 부서 번호, 부서명, 인원수
-- 	정렬: 부서 번호 오름차순
SELECT d.dept_no, d.dept_name, count(*)
FROM departments d
	INNER JOIN dept_emp de
		ON d.dept_no = de.dept_no
	INNER JOIN employees e
		ON de.emp_no = e.emp_no
WHERE de.to_date = '9999-01-01'
GROUP BY d.dept_no
ORDER BY d.dept_no;

-- 직원 번호가 10209인 직원의 부서 이동 히스토리를 출력하세요.
-- 	출력항목: emp_no, first_name, last_name, dept_name, from_date, to_date
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name, de.from_date, de.to_date
FROM departments d
	INNER JOIN dept_emp de
		ON d.dept_no = de.dept_no
	INNER JOIN employees e
		ON de.emp_no = e.emp_no
WHERE e.emp_no = 10209
ORDER BY e.emp_no, de.from_date;


