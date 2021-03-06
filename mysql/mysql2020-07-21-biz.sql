-- MySQL에서 사용자는 기본적으로 root시작을 한다.
-- 오라클과 차이점
---------------------------------------------
-- 구분       오라클			MySQL
-- 저장소   TableSpace       DataBase
-- Scheme    User		   DataBase
-- 데이터저장   User.Table형식  DataBase
-- User의 개념 Scheme		 login하는 Account
-- -----------------------------------------
-- 1. MySQL 데이터를 저장하기 위해서 최초로 DataBase를 생성
-- 2. 생성된 DataBase를 사용가능하도록 Open 절차 필요
-- 3. 사용자 login 권한과 접속하는 용도의 Account
DROP DATABASE myDB;

-- MySQL CHARACTER SET
-- 저장하는 문자열의 코드길이(Byte)관련한 설정
-- MySQL 5.x(5.7)에서는 문자 Locale 설정이 기본값이 Lathin이어서
-- 한글과 같은 UNICODE 저장에 상당히 문제가 되었던 적이 있다.
-- 최근에는 기본 문자 Locale UTF8M4 라는 방식으로 거의 통일 되었다.
-- 따라서 별도로 CHARACTER SET을 지정하지 않아도 큰 문제가 없다.
-- 오래된 MySQL 버전에서는 DATABASE를 생성할때 CHARACTER SET을
-- 명시해 주었으나 최근 버전에서는 오히려 경고를 내고 있다.

-- 현지 PC에 설치된 MySQL서버에 myDB라고 하는 Scheme(DataBase)를 생성
CREATE database myDB; -- DEFAULT CHARACTER SET UTF8;

-- My SQL 칼럼 Type
-- 문자열: CHAR(개수), VARCHAR(개수)
--  CHAR : 고정된 문자열을 저장하는 칼럼(코드 등의 데이터)
-- 255까지 가능
-- VARCHAR : 한글을 포함한 가변형
-- 문자열을 저장하는 칼럼 : 65565까지 가능

-- 정수형 : INT(4byte, 2의 32승), BIGINT(8byte 무제한),
--  TINYINT(1byte, -128 ~127, 0  ~ 255), 
-- 	SMALLINT(0 ~ 65535), 
--	MEDIUM(0 ~ 1677215)
-- 정수형의 경우 자릿수를 명시하지 않으면 최대지원 크기까지 저장가능
-- 실제 저장을 해보면 INT형은 정수11자리를 넘어가면 저장이 안된다.
    
-- 실수형 : FLOAT(길이, 소수점) DECIMAL(길이, 소수점)    
--		DOUBLE(길이, 소수점, 8Byte) 

-- MySQL에서는 데이터와 관련된 DDL, DML, DCL등의 명령을 수행하기전에
-- 사용할 Scheme를 Open 절차가 반드시 필요하다.

-- myDB DataBase Open 시키기
USE myDB;
DROP TABLE tbl_student;
CREATE TABLE tbl_student(
st_num CHAR(5) PRIMARY KEY,
st_name VARCHAR(20) NOT NULL,
st_dept VARCHAR(10),
st_grade INT,
st_tel  VARCHAR(20),
st_addr VARCHAR(125),
st_age INT
);
DESC tbl_student;

SELECT * FROM tbl_student;

-- PROJECTION
SELECT st_num, st_name, st_tel FROM tbl_student;

-- SELECTION
SELECT st_num, st_name
FROM tbl_student
WHERE st_num BETWEEN '20001' AND '20010';

SELECT * FROM  tbl_dept;

CREATE TABLE tbl_score(
sc_num	CHAR(5)	NOT NULL,
sc_scode	CHAR(4)	NOT NULL,
sc_sname	VARCHAR(30),	
sc_score	INT	
);

SELECT ST.st_name, ST.st_num, ST.st_dept, D. d_name, D.d_prof
FROM tbl_student ST
	LEFT JOIN tbl_dept D
		ON ST.st_dept = D.d_code;
    
SELECT COUNT(*) FROM tbl_iolist;
DESC tbl_iolist;
SELECT io_bcode FROM tbl_iolist;

-- DECODE()
SELECT io_bcode, 
SUM(CASE WHEN io_input = '매입' THEN io_amt ELSE 0 END) AS '매입합계',
SUM(CASE WHEN io_input = '매출' THEN io_amt ELSE 0 END) AS '매출합계'
FROM tbl_iolist
GROUP BY io_bcode;
