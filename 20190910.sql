# 계정 내 테이블 확인
--SELECT TABLE_NAME
--FROM USER_TABLES;
--
--CREATE TABLE STUDENT(
--STU_NO CHAR(9),
--STU_NAME VARCHAR2(12),
--STU_DEPT VARCHAR2(20),
--STU_GRADE NUMBER(1),
--STU_CLASS CHAR(1),
--STU_GENDER CHAR(1),
--STU_HEIGHT NUMBER(5,2),
--STU_WEIGHT NUMBER(5,2),
--    CONSTRAINT P_STU_NO PRIMARY KEY(STU_NO));
--
--DESC STUDENT;
--
--CREATE TABLE SUBJECT(
--SUB_NO CHAR(3),
--SUB_NAME VARCHAR2(30),
--SUB_PROF VARCHAR2(12),
--SUB_GRADE NUMBER(1),
--SUB_DEPT VARCHAR(20),
--    CONSTRAINT P_SUB_NO PRIMARY KEY(SUB_NO));
--    
--DESC SUBJECT;
--
--CREATE TABLE ENROL(
--SUB_NO CHAR(3),
--STU_NO CHAR(9),
--ENR_GRADE NUMBER(3),
--    CONSTRAINT P_COURSE PRIMARY KEY(SUB_NO,STU_NO));
--    
--DESC ENROL;

--insert into STUDENT values(20153075, '옥한빛', '기계', '1', 'C', 'M', 177, 80);
--insert into STUDENT values(20153088, '이태연', '기계', '1', 'C', 'F', 162, 50);
--insert into STUDENT values(20143054, '유가인', '기계', '2', 'F', 'C', 154, 47);
--insert into STUDENT values(20152088, '조민우', '전기전자', '1', 'C', 'M', 188, 90);
--insert into STUDENT values(20142021, '심수정', '전기전자', '2', 'A', 'F', 168, 45);
--insert into STUDENT values(20132003, '박희철', '전기전자', '3', 'B', 'M', null, 63);
--insert into STUDENT values(20151062, '김인중', '컴퓨터정보', '1', 'B', 'M', 166, 67);
--insert into STUDENT values(20141007, '진현무', '컴퓨터정보', '2', 'A', 'M', 174, 64);
--insert into STUDENT values(20131001, '김종헌', '컴퓨터정보', '3', 'C', 'M', null, 72);
--insert into STUDENT values(20131025, '옥성우', '컴퓨터정보', '3', 'A', 'F', 172, 63);
--
--insert into SUBJECT values('111','데이터베이스','이재영','2','컴퓨터정보');
--insert into SUBJECT values('110','자동제어','정순정','2','전기전자');
--insert into SUBJECT values('109','자동화설계','박민영','3','기계');
--insert into SUBJECT values('101','컴퓨터개론','강종영','3','컴퓨터정보');
--insert into SUBJECT values('102','기계공작법','김태영','1','기계');
--insert into SUBJECT values('103','기초전자실험','김유석','2','전기전자');
--insert into SUBJECT values('104','시스템분석설계','강석현','2','컴퓨터정보');
--insert into SUBJECT values('105','기계요소설계','김명성','2','기계');
--insert into SUBJECT values('106','전자회로실험','최영민','2','전기전자');
--insert into SUBJECT values('107','CAD응용실습','구봉규','2','기계');
--insert into SUBJECT values('108','소프트웨어공학','권민성','2','컴퓨터정보');
--
--insert into ENROL values('101','20131001',80);
--insert into ENROL values('104','20131001',56);
--insert into ENROL values('106','20132003',72);
--insert into ENROL values('103','20152088',45);
--insert into ENROL values('101','20131025',65);
--insert into ENROL values('104','20131025',65);
--insert into ENROL values('108','20151062',81);
--insert into ENROL values('107','20143054',41);
--insert into ENROL values('102','20153075',66);
--insert into ENROL values('105','20153075',56);
--insert into ENROL values('102','20153088',61);
--insert into ENROL values('105','20153088',78);

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

--# 실전문제 
-- 3. 급여 테이블 구조 검색
DESCRIBE SALGRADE;

-- 4. 사원번호,이름,직무 검색
SELECT EMPNO, ENAME, JOB FROM EMP;

-- 6. 부서 이름과 부서지역(LOC)검색
SELECT DEPTNO, LOC FROM DEPT;

-- 8. 사원 입사일 중복 제거 검색
SELECT DISTINCT HIREDATE FROM EMP;

-- 11. 사원 6개월 급여 합
SELECT ENAME, SAL*6 FROM EMP;

-- 12. 사원들의 5개월 커미션의 합
SELECT ENAME, COMM*6 FROM EMP;

-- 13. 사원이름을 NAME으로, 급여를 SALARY 열의 이름
SELECT ENAME AS "Name", SAL AS "Salary" FROM EMP;

-- 17. 입사일 사원이름 80-12-17에 입사한 SMITH입니다 식으로 검색
SELECT HIREDATE || '에 입사한 ' || ENAME || ' 입니다' FROM EMP;

-- 19. 급여가 2000이상인 사람 사원번호, 사원이름 검색
SELECT EMPNO, ENAME FROM EMP WHERE SAL >= 2000;

-- 21. 1980 12월 17일에 입사한 사원이름 검색
SELECT ENAME FROM EMP WHERE HIREDATE = '80-12-17';

-- 22. 급여등급이 5인 급여의 상위급여와 하위급여 검색
SELECT HISAL, LOSAL FROM SALGRADE WHERE GRADE = 5;

-- 25. 10번 부서에 근무하는 MANAGER의 사원 이름 검색
SELECT ENAME, JOB, DEPTNO FROM EMP WHERE DEPTNO = 10 AND JOB = 'MANAGER';



---------------------- 연습문제(짝수)-------------------
-- 2. 실습에 사용될 과목 테이블(SUBJECT) 구조 검색
DESCRIBE SUBJECT;

-- 4. 실습에 사용될 수강(ENROL) 테이블의 모든 데이터 검색
SELECT * FROM ENROL;
SELECT * FROM SUBJECT;
SELECT * FROM STUDENT;

-- 6. 과목들의 과목번호와 과목이름 검색
SELECT SUB_NO, SUB_NAME FROM SUBJECT;

-- 8. 학생들의 모든 정보를 검색하라
SELECT * FROM STUDENT;

-- 10. 과목들의 과목이름, 교수이름을 검색하라
SELECT SUB_NAME, SUB_PROF FROM SUBJECT;

-- 12. 학생들의 체중과 신장을, 학번 이름과 함꼐 검색하라
SELECT STU_NO,STU_NAME,STU_HEIGHT,STU_WEIGHT FROM STUDENT;

-- 14. 학생들의 성별 중복을 제거하고 검색
SELECT DISTINCT STU_GENDER FROM STUDENT;

-- 16. 학생들의 학과, 학년 중복을 제거하고 검색
SELECT DISTINCT STU_DEPT, STU_GRADE FROM STUDENT;

-- 18. 학생들의 체중을 5만큼 증가시킨 값 검색
SELECT STU_NAME,STU_WEIGHT + 5 FROM STUDENT;

-- 20. 학생들의 학번과 이름 별칭을 '학번' , '이름'으로 부여 검색
SELECT STU_NO AS "학번", STU_NAME AS "학번" FROM STUDENT;

-- 22. 과목(SUBJECT)테이블에서 과목이름과, 교수명을 머리(heading)은 한글로 검색하라  ???? 문제 이해 불가

-- 24. 학생의 이름과 학과를 '컴퓨터정보과 옥한빛 입니다' 식으로 표현
SELECT STU_DEPT || '과 ' || STU_NAME || '입니다' FROM STUDENT;

-- 26. 기계과 학생들 검색
SELECT STU_NAME,STU_DEPT FROM STUDENT WHERE STU_DEPT = '기계';

-- 28. 신장이 170이상인 학생들을 검색
SELECT STU_NAME, STU_HEIGHT FROM STUDENT WHERE STU_HEIGHT >= 170;

-- 30. 기계과 학생들의 학번, 이름을 검색
SELECT STU_NO, STU_NAME, STU_DEPT || '과' FROM STUDENT WHERE STU_DEPT = '기계';

-- 32. 전기전자과 학생들의 학번, 이름 검색
SELECT STU_NO, STU_NAME, STU_DEPT || '과' FROM STUDENT WHERE STU_DEPT = '전기전자';

-- 34. 여학생의 이름 검색
SELECT STU_NAME, STU_GENDER FROM STUDENT WHERE STU_GENDER = 'F';

-- 36. 기계과 이외 학생들의 모든 정보를 검색
SELECT * FROM STUDENT WHERE STU_DEPT != '기계';

-- 38. '김인중'학생의 모든 정보 검색
SELECT * FROM STUDENT WHERE STU_NAME = '김인중';

-- 40. 기계과 이면서 2학년인 학생들의 모든 정보를 검색
SELECT * FROM STUDENT WHERE STU_DEPT = '기계' AND STU_GRADE = 2;

-- 42. 컴퓨터정보과 외에 1학년 학생들의 이름을 검색하라
SELECT STU_NAME, STU_DEPT, STU_GRADE FROM STUDENT WHERE STU_DEPT != '컴퓨터정보' AND STU_GRADE = 1;

-- 44. 컴퓨터 정보과 2학년 A반의 학생의 이름을 검색
SELECT * FROM STUDENT WHERE STU_DEPT = '컴퓨터정보' AND STU_GRADE = 2 AND STU_CLASS = 'A';

-- 46. 2013 학번인 학생의 학번과 이름, 학과를 검색
SELECT STU_NO, STU_NAME, STU_DEPT FROM STUDENT WHERE STU_NO LIKE '2013%';

-- 48. 김씨성을 가진 학생과 학번을 검색
SELECT STU_NO, STU_NAME FROM STUDENT WHERE STU_NAME LIKE '김%';

-- 50. 학번이 2006년 학번 학생의 모든 정보 검색
SELECT * FROM STUDENT WHERE STU_NO LIKE '2006%';

-- 52. 신장이 NULL인 학생의 이름을 검색
SELECT STU_NAME FROM STUDENT WHERE STU_HEIGHT IS NULL;

-- 54. 학과가 컴퓨터정보 또는 기계인 하갯ㅇ의 학번, 이름을 검색
SELECT STU_NO, STU_NAME FROM STUDENT WHERE STU_GENDER = 'M' OR STU_GRADE = 1;

-- 56. 학생들의 학번, 이름을 학번순으로 검색하라
SELECT STU_NO, STU_NAME FROM STUDENT ORDER BY STU_NO;

-- 58. 학생들의 학번, 이름, 학과를 학과별 이름순으로 검색하라.
SELECT STU_NO, STU_NAME, STU_DEPT FROM STUDENT ORDER BY STU_DEPT, STU_NAME;

-- 60. 학생들의 정보를 학과별 반 순으로 검색하라
SELECT * FROM STUDENT ORDER BY STU_DEPT, STU_CLASS;

-- 62. 학생들의 성별을 소문자로 검색하라
SELECT * FROM STUDENT;
SELECT STU_NAME,LOWER(STU_GENDER) FROM STUDENT;

-- 64. 학생들의 학과, 이름은 연결하여 검색
SELECT CONCAT(STU_DEPT,STU_NAME) FROM STUDENT;

-- 66. 학생들의 이름과 이름의 첫 2글자를 검색
SELECT STU_NAME, SUBSTR(STU_NAME,1,2) FROM STUDENT;

-- 68. 학생들의 이름과 이름의 길이를 검색
SELECT STU_NAME, LENGTH(STU_NAME) FROM STUDENT;

-- 70. 학생들의 이름에 '김'이 몇 번째 있는지 검색
SELECT STU_NAME, INSTR(STU_NAME,'김') FROM STUDENT;

-- 72. 학생들의 이름을 15자리로 하고 뒤에 &을 채워 검색











