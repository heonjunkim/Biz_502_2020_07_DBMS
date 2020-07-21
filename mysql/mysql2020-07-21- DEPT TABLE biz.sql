--------------------------------------------------------
--  파일이 생성됨 - 화요일-7월-21-2020   
--------------------------------------------------------
USE myDB;
-- 만약 tbl_dept가 있으면 삭제하고 다시 만들어라
DROP TABLE IF EXISTS tbl_dept;
-- 테이블이 없으면 만들어라
CREATE TABLE IF NOT EXISTS tbl_dept(
	d_code CHAR(4) PRIMARY KEY,
	d_name VARCHAR(30) NOT NULL,
	d_prof VARCHAR(30)
);
Insert into TBL_DEPT (D_CODE,D_NAME,D_PROF) values ('DO01','관광학','홍길동');
Insert into TBL_DEPT (D_CODE,D_NAME,D_PROF) values ('DO02','국어국문','이몽룡');
Insert into TBL_DEPT (D_CODE,D_NAME,D_PROF) values ('DO03','법학','성춘향');
Insert into TBL_DEPT (D_CODE,D_NAME,D_PROF) values ('DO04','전자공학','임꺽정');
Insert into TBL_DEPT (D_CODE,D_NAME,D_PROF) values ('DO05','컴퓨터공학','장영실');
