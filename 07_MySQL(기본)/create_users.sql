use jdbc_ex;

CREATE TABLE users (
id VARCHAR(12) NOT NULL PRIMARY KEY,
password VARCHAR(12) NOT NULL,
name VARCHAR(30) NOT NULL,
role VARCHAR(6) NOT NULL
);

INSERT INTO users(id, password, name, role)
VALUES('guest', 'guest123', '방문자', 'USER');
INSERT INTO users(id, password, name, role)
VALUES('admin', 'admin123', '관리자', 'ADMIN');
INSERT INTO users(id, password, name, role)
VALUES('member', 'member1234', '일반회원', 'USER');
SELECT * FROM users;