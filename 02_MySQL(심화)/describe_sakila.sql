use sakila;
show tables;
SELECT 
  COLUMN_NAME AS '컬럼명', 
  COLUMN_TYPE AS '데이터타입', 
  IS_NULLABLE AS 'NN',
  COLUMN_KEY AS 'PK',
  COLUMN_DEFAULT AS '기본값'
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = '테이블명' AND TABLE_SCHEMA = 'sakila';
-- 테이블명에 보고싶은 Table 작성 