-- 여기는 user1 screen

-- 표준SQL
-- CASE WHEN은 조건문 THEN TRue일때값 ENSE false일때값 END
-- DECODE(칼럼, 조건값 true일때 false일때)
SELECT io_bcode, 
SUM(CASE WHEN io_inOut = '매입' THEN io_amt ELSE 0 END) 매입합계,
SUM(CASE WHEN io_inOut = '매출' THEN io_amt ELSE 0 END) 매출합계
FROM tbl_iolist
GROUP BY io_bcode;

-- 오라클에서 차후에 PK를 생성하는 방법
-- 기존의 PK가 있으면 중복 생성되지 않는다
-- PK_iolist : 오라클에서만 사용되는 PK를 찾는 별명
--      혹시 PK를 삭제할 일이 있을때 필요한 이름
ALTER TABLE tbl_iolist ADD CONSTRAINT PK_iolist PRIMARY KEY (io_seq, io_date);
ALTER TABLE tbl_iolist DROP PRIMARY KEY;      --(pk_iolist

CREATE TABLE tbl_test (
    t_seq NUMBER PRIMARY KEY,
    t_name nVARCHAR2(20)

);

-- 오라클에는 TABLE에 AUTO_INCREMENT 설정이 없다.
-- 만약 일련번호와 같은 칼럼을 사용하여 PK로 만들고 싶을때는 상당히 곤란한 상황이 된다.
-- INSERT를 수행할때마다 이전에 저장된 일련번호 값을 조회하고 +1을 수행하여 다시 INSERT를 수행하는 일을
--      반복해야 하기 때문!

-- 다행히 오라클에는 SEQUENCE라는 다른 DBMS에 없는 특별한 객체가 있다.
-- 이 객체는 객체.NEXTVAL이라는 특별한 호출자가 있는데, 
-- 이 호출자를 호출할때마다(SELECT, INSERT등에서) 내부에 가지고 있는 변수값을
-- 사전에 정의한 규칙에 따라 자동 증가하여 보관을 한다.
-- 이 객체.NEXTVAL이 가지고 있는 값을 
-- INSERT를 수행할때 PK인 seq칼럼에 주입을 하면 AUTO_INCREMENT 효과를 낼 수 있다.
CREATE SEQUENCE seq_test
START WITH 1  -- 최초에 스타트하는 값
INCREMENT BY 1; -- 호출될때마다 증가할 값

INSERT INTO tbl_test(t_seq, t_name)
VALUES (seq_test.NEXTVAL, '홍길동'); -- 호출자 넥스트 스타트부터 시작해서 인크리먼트를 수행한다.
SELECT * FROM tbl_test;