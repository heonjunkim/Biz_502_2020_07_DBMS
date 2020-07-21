-- 여기는 관리자 화면입니다.
-- 새로운 tablespace와 사용자를 등록하기
-- tablespace: User2Ts,
-- user : User2, passworde user2
-- C:\bizwork\workspace\oracledata
CREATE TABLESPACE User2Ts
DATAFILE 'C:/bizwork/workspace/oracledata/user2.dbf'
SIZE 1M AUTOEXTEND ON NEXT 10K;

CREATE USER user2 IDENTIFIED BY user2
DEFAULT TABLESPACE user2TS;

GRANT DBA TO user2;