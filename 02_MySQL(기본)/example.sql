-- SELECT : 데이터 불러오기 
-- * : 전체, 특정 컬럼만 불러오려면 컬럼명을 사용
-- FROM 테이블명 : 테이블 불러오기 

-- productTBL의 데이터를 출력하세요.
SELECT * FROM shopdb.productTBL; 

-- memberTBL의 데이터를 출력하세요. (단, memberName과 memberAddress만 출력함)
SELECT memberName, memberAddress FROM membertbl;

-- memberTBL의 데이터 중 이름이 '지운이'인 데이터만 출력하세요.
SELECT * FROM membertbl WHERE memberName = '지운이'; 