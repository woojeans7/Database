-- tabledb 데이터베이스를 생성하세요. (존재 시 삭제)
drop database tabledb;
create database tabledb;

-- usertbl을 만드세요
use tabledb;

CREATE TABLE usertbl(
	userID CHAR(8) NOT NULL PRIMARY KEY,
	name VARCHAR(10) NOT NULL,
	birthYear INT NOT NULL,	
	addr CHAR(2) NOT NULL,
	mobile1 CHAR(3) NULL,
	mobile2 CHAR(8) NULL,
	height SMALLINT NULL,
	mDate DATE NULL
);

-- buytbl 테이블을 만드세요.
CREATE TABLE buytbl(
	num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	userid CHAR(8) NOT NULL,
	prodName CHAR(6) NOT NULL,
	groupName CHAR(4) NULL,
	price INT NOT NULL,
	amount SMALLINT NOT NULL,
FOREIGN KEY(userid) REFERENCES usertbl(userID)
);

-- 회원 테이블에 다음 데이터를 입력하세요.
INSERT INTO usertbl VALUES('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
INSERT INTO usertbl VALUES('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-4-4');
INSERT INTO usertbl VALUES('KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-7-7');

select * from usertbl;

-- 구매 테이블에 다음 데이터를 입력하세요.
INSERT INTO buytbl VALUES(NULL, 'KBS', '운동화', NULL, 30, 2);
INSERT INTO buytbl VALUES(NULL, 'KBS', '노트북', '전자', 1000, 1);
INSERT INTO buytbl VALUES(NULL, 'JYP', '모니터', '전자', 200, 1); -- 에러!
-- 에러 이유 : userid는 외래키이지만 usertbl에 'JYP'가 없기 때문에!

select * from buytbl;

drop table if exists usertbl;

-- usertbl을 정의하세요 (기본키는 테이블 레벨에서 정의하고, 제약조건명을 함께 지정함)
CREATE TABLE usertbl (
	userID CHAR(8) NOT NULL,
	name VARCHAR(10) NOT NULL,
	birthYear INT NOT NULL,
CONSTRAINT PRIMARY KEY PK_userTBL_userID(userID)
);

-- prodTbl 을 정의하세요.
drop table if exists prodTbl;

CREATE TABLE prodTbl (
	prodCode CHAR(3) NOT NULL,
	prodID CHAR(4) NOT NULL,
	prodDate DATETIME NOT NULL,
	prodCur CHAR(10) NULL,
CONSTRAINT PK_prodTbl_proCode_prodID
PRIMARY KEY (prodCode, prodID)
);

use sqldb;

-- usertbl과 buytbl을 바탕으로 다음 결과가 나오는 뷰를 정의하세요.
CREATE VIEW v_userbuytbl
AS
SELECT U.userid, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
FROM usertbl U
	INNER JOIN buytbl B	
	ON U.userid = B.userid;

-- 위에서 정의한 뷰에서 userid가'김범수'인 데이터만 출력하세요.
SELECT * FROM v_userbuytbl WHERE name = '김범수';
