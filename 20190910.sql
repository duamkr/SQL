# 계정 내 테이블 확인
SELECT TABLE_NAME
FROM USER_TABLES;

CREATE TABLE STUDENT(
STU_NO CHAR(9),
STU_NAME VARCHAR2(12),
STU_DEPT VARCHAR2(20),
STU_GRADE NUMBER(1),
STU_CLASS CHAR(1),
STU_GENDER CHAR(1),
STU_HEIGHT NUMBER(5,2),
STU_WEIGHT NUMBER(5,2),
    CONSTRAINT P_STU_NO PRIMARY KEY(STU_NO));

DESC STUDENT;

CREATE TABLE SUBJECT(
SUB_NO CHAR(3),
SUB_NAME VARCHAR2(30),
SUB_PROF VARCHAR2(12),
SUB_GRADE NUMBER(1),
SUB_DEPT VARCHAR(20),
    CONSTRAINT P_SUB_NO PRIMARY KEY(SUB_NO));
    
DESC SUBJECT;

CREATE TABLE ENROL(
SUB_NO CHAR(3),
STU_NO CHAR(9),
ENR_GRADE NUMBER(3),
    CONSTRAINT P_COURSE PRIMARY KEY(SUB_NO,STU_NO));
    
DESC ENROL;

insert into STUDENT values(20153075, '옥한빛', '기계', '1', 'C', 'M', 177, 80);
insert into STUDENT values(20153088, '이태연', '기계', '1', 'C', 'F', 162, 50);
insert into STUDENT values(20143054, '유가인', '기계', '2', 'F', 'C', 154, 47);
insert into STUDENT values(20152088, '조민우', '전기전자', '1', 'C', 'M', 188, 90);
insert into STUDENT values(20142021, '심수정', '전기전자', '2', 'A', 'F', 168, 45);
insert into STUDENT values(20132003, '박희철', '전기전자', '3', 'B', 'M', null, 63);
insert into STUDENT values(20151062, '김인중', '컴퓨터정보', '1', 'B', 'M', 166, 67);
insert into STUDENT values(20141007, '진현무', '컴퓨터정보', '2', 'A', 'M', 174, 64);
insert into STUDENT values(20131001, '김종헌', '컴퓨터정보', '3', 'C', 'M', null, 72);
insert into STUDENT values(20131025, '옥성우', '컴퓨터정보', '3', 'A', 'F', 172, 63);

insert into SUBJECT values('111','데이터베이스','이재영','2','컴퓨터정보');
insert into SUBJECT values('110','자동제어','정순정','2','전기전자');
insert into SUBJECT values('109','자동화설계','박민영','3','기계');
insert into SUBJECT values('101','컴퓨터개론','강종영','3','컴퓨터정보');
insert into SUBJECT values('102','기계공작법','김태영','1','기계');
insert into SUBJECT values('103','기초전자실험','김유석','2','전기전자');
insert into SUBJECT values('104','시스템분석설계','강석현','2','컴퓨터정보');
insert into SUBJECT values('105','기계요소설계','김명성','2','기계');
insert into SUBJECT values('106','전자회로실험','최영민','2','전기전자');
insert into SUBJECT values('107','CAD응용실습','구봉규','2','기계');
insert into SUBJECT values('108','소프트웨어공학','권민성','2','컴퓨터정보');

insert into ENROL values('101','20131001',80);
insert into ENROL values('104','20131001',56);
insert into ENROL values('106','20132003',72);
insert into ENROL values('103','20152088',45);
insert into ENROL values('101','20131025',65);
insert into ENROL values('104','20131025',65);
insert into ENROL values('108','20151062',81);
insert into ENROL values('107','20143054',41);
insert into ENROL values('102','20153075',66);
insert into ENROL values('105','20153075',56);
insert into ENROL values('102','20153088',61);
insert into ENROL values('105','20153088',78);

select * from STUDENT;
select * from SUBJECT;
select * from ENROL;

select * from EMP;
select * from dept;
select * from BUY;

--# DESC 스키마 구조 파악 쿼리
desc student;
desc subject;


select stu_no,stu_name from STUDENT;
select 5+3 from DUAL;

--# 컬럼에 수식 적용 가능
select ENR_GRADE,ENR_GRADE+5 from ENROL;
select ENR_GRADE,ENR_GRADE+5 AS UPGRADE from ENROL;

--# 컬럼 연결 || A + B + C = ABC
SELECT STU_DEPT || '과'|| STU_NAME AS 학과성명 FROM STUDENT;

--# WHERE 절을 이용한 특정 컬럼의 특정값 선택 (AND , OR절로 중복조건설정가능)
SELECT * FROM STUDENT WHERE STU_DEPT = '컴퓨터정보';
SELECT * FROM STUDENT WHERE STU_DEPT = '컴퓨터정보' AND STU_GRADE=2;
SELECT * FROM STUDENT WHERE STU_HEIGHT BETWEEN 170 AND 180;

--# LIKE절은 포함하는 값을 선택 가능( 이름 첫번째가 김~~으로 시작하는사람)
SELECT STU_NO, STU_NAME FROM STUDENT WHERE STU_NAME LIKE '김%';
--# LIKE절은 포함하는 값을 선택 가능( 이름 두번째가 ~수~인사람)
SELECT STU_NO, STU_NAME FROM STUDENT WHERE STU_NAME LIKE '_수%';
--# LIKE절은 포함하는 값을 선택 가능( 이름 두번째가 ~~정 인사람)
SELECT STU_NO, STU_NAME FROM STUDENT WHERE STU_NAME LIKE '__정';
--# LIKE절은 포함하는 값을 선택 가능( 학번이 2014~인 사람)
SELECT STU_NO FROM STUDENT WHERE STU_NO LIKE '2014%';
--# NULL값 선택은  IS NULL
SELECT STU_NAME, STU_HEIGHT FROM STUDENT WHERE STU_HEIGHT IS NULL;

--# ORDER BY 절을 이용한 SORT ( ASC - 내림차순, DESC - 오름차순, DEFAULT는 ASC)
SELECT STU_NO, STU_NAME, STU_HEIGHT FROM STUDENT ORDER BY STU_NO ASC;

--# NULL값 제외
SELECT STU_NO, STU_NAME, STU_HEIGHT FROM STUDENT WHERE STU_HEIGHT IS NOT NULL;

SELECT STU_NO, STU_NAME, STU_HEIGHT, STU_HEIGHT+10 AS UPGRADE FROM STUDENT ORDER BY 4 ASC;
SELECT STU_NO, STU_NAME, STU_DEPT, STU_WEIGHT-5 AS TARGET FROM STUDENT ORDER BY TARGET;


--# 함수(Function)

SELECT ROUND(345.678), ROUND(345.678, 0), ROUND(345.678, 1), ROUND(345.678, -1) FROM DUAL;

SELECT CEIL(3.1), CEIL(-3.1), FLOOR(3.1), FLOOR(-3.1), ABS(-10), MOD(10,3) FROM DUAL;

--# 대소문자  LOWER, UPPER절, INITCAP절
SELECT LOWER('abcdefg') FROM DUAL;
SELECT UPPER('abcdefg') FROM DUAL;
SELECT INITCAP('abcdefg') FROM DUAL;

--# 문자 인수를 연결 후 반환
SELECT CONCAT (STU_NAME,STU_NO) FROM STUDENT;
--# 문자열의 중간값 설정 추출(엑셀의 MID랑 같음)
SELECT SUBSTR('ABCDEFG',2,3) FROM DUAL;
--# 문자열 갯수 산정 LENGTH절
SELECT LENGTH ('ABCD') FROM DUAL;
--# 특정 문자의 절대위치를 반환
SELECT ENAME,INSTR(ENAME, 'A',2,1) FROM EMP;

--# 좌우 기준 자리수 지정 , 채우기 LPAD, RPAD절
SELECT LPAD(ENAME,10,'%') FROM EMP;
SELECT RPAD(ENAME,10,'$') FROM EMP;

--# 시스템 날짜 조회
SELECT SYSDATE FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM DUAL; -- # TO_CHAR로 문자로 반환
SELECT TO_CHAR(SYSDATE+1, 'YYYY-MM-DD') FROM DUAL; -- # TO_CHAR로 +1된 다음날 일자 반환

SELECT HIREDATE FROM EMP;
SELECT ROUND(MONTHS_BETWEEN(SYSDATE, HIREDATE),1) FROM EMP;

SELECT LAST_DAY(SYSDATE) FROM DUAL;

SELECT TO_CHAR(TO_NUMBER(SAL), '$9999') FROM EMP;
SELECT TO_CHAR(TO_NUMBER(SAL), 'L9999') FROM EMP;

--# NVL, NVL2 의 정의란 ?
SELECT STU_NAME, NVL(STU_HEIGHT,0) FROM STUDENT;
SELECT * FROM EMP;
SELECT ENAME, NVL2(COMM, SAL+COMM,SAL) AS SALARY FROM EMP;

SELECT NVL(NULLIF('A','A'), '널값') FROM DUAL;

SELECT COALESCE(NULL,NULL,NULL, 10, 20, NULL) FROM DUAL;

--# 내용을 업데이트 할때, 
SELECT EMPNO,ENAME,SAL, 
CASE JOB WHEN 'SALESMAN' THEN SAL*1.1
        WHEN 'CLERK' THEN SAL*1.15 
        WHEN 'MANAGER' THEN SAL*1.2
        ELSE SAL
        END AS 급여인상
        FROM EMP;
        
SELECT EMPNO, ENAME, JOB, SAL,
DECODE(JOB, 'SALESMAN', SAL*1.1,
            'CLERK',SAL*1.15,
            'MANAGER',SAL*1.2,
            SAL) AS 인상된급여
            FROM EMP;
            
            
--# 그룹 함수
--# MAX, MIN 함수
select max(enr_grade), min(enr_grade) from enrol;
--# COUNT 함수 , COUNT(*) -> ?
SELECT COUNT(*), COUNT(STU_HEIGHT) FROM STUDENT;
--# SUM, AVG함수 
SELECT SUM(STU_WEIGHT), TO_CHAR(AVG(STU_WEIGHT), '9999.99') FROM STUDENT WHERE STU_DEPT = '컴퓨터정보' ;

--# 단일행 GROUP BY절 
SELECT STU_DEPT, AVG(STU_WEIGHT) FROM STUDENT GROUP BY STU_DEPT;

SELECT STU_DEPT, COUNT(*) FROM STUDENT WHERE STU_WEIGHT >=50 GROUP BY STU_DEPT, STU_GRADE;

SELECT STU_GRADE, AVG(STU_HEIGHT) FROM STUDENT WHERE STU_DEPT = '기계' GROUP BY STU_GRADE HAVING AVG(STU_HEIGHT) >=160;

SELECT STU_DEPT, MAX(STU_HEIGHT) FROM STUDENT GROUP BY STU_DEPT HAVING MAX(STU_HEIGHT) >= 175;

SELECT STU_DEPT, MAX(AVG(STU_HEIGHT)) FROM STUDENT GROUP BY STU_DEPT;















