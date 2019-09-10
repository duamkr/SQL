# ���� �� ���̺� Ȯ��
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

--insert into STUDENT values(20153075, '���Ѻ�', '���', '1', 'C', 'M', 177, 80);
--insert into STUDENT values(20153088, '���¿�', '���', '1', 'C', 'F', 162, 50);
--insert into STUDENT values(20143054, '������', '���', '2', 'F', 'C', 154, 47);
--insert into STUDENT values(20152088, '���ο�', '��������', '1', 'C', 'M', 188, 90);
--insert into STUDENT values(20142021, '�ɼ���', '��������', '2', 'A', 'F', 168, 45);
--insert into STUDENT values(20132003, '����ö', '��������', '3', 'B', 'M', null, 63);
--insert into STUDENT values(20151062, '������', '��ǻ������', '1', 'B', 'M', 166, 67);
--insert into STUDENT values(20141007, '������', '��ǻ������', '2', 'A', 'M', 174, 64);
--insert into STUDENT values(20131001, '������', '��ǻ������', '3', 'C', 'M', null, 72);
--insert into STUDENT values(20131025, '������', '��ǻ������', '3', 'A', 'F', 172, 63);
--
--insert into SUBJECT values('111','�����ͺ��̽�','���翵','2','��ǻ������');
--insert into SUBJECT values('110','�ڵ�����','������','2','��������');
--insert into SUBJECT values('109','�ڵ�ȭ����','�ڹο�','3','���');
--insert into SUBJECT values('101','��ǻ�Ͱ���','������','3','��ǻ������');
--insert into SUBJECT values('102','�����۹�','���¿�','1','���');
--insert into SUBJECT values('103','�������ڽ���','������','2','��������');
--insert into SUBJECT values('104','�ý��ۺм�����','������','2','��ǻ������');
--insert into SUBJECT values('105','����Ҽ���','���','2','���');
--insert into SUBJECT values('106','����ȸ�ν���','�ֿ���','2','��������');
--insert into SUBJECT values('107','CAD����ǽ�','������','2','���');
--insert into SUBJECT values('108','����Ʈ�������','�ǹμ�','2','��ǻ������');
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

--# DESC ��Ű�� ���� �ľ� ����
desc student;
desc subject;


select stu_no,stu_name from STUDENT;
select 5+3 from DUAL;

--# �÷��� ���� ���� ����
select ENR_GRADE,ENR_GRADE+5 from ENROL;
select ENR_GRADE,ENR_GRADE+5 AS UPGRADE from ENROL;

--# �÷� ���� || A + B + C = ABC
SELECT STU_DEPT || '��'|| STU_NAME AS �а����� FROM STUDENT;

--# WHERE ���� �̿��� Ư�� �÷��� Ư���� ���� (AND , OR���� �ߺ����Ǽ�������)
SELECT * FROM STUDENT WHERE STU_DEPT = '��ǻ������';
SELECT * FROM STUDENT WHERE STU_DEPT = '��ǻ������' AND STU_GRADE=2;
SELECT * FROM STUDENT WHERE STU_HEIGHT BETWEEN 170 AND 180;

--# LIKE���� �����ϴ� ���� ���� ����( �̸� ù��°�� ��~~���� �����ϴ»��)
SELECT STU_NO, STU_NAME FROM STUDENT WHERE STU_NAME LIKE '��%';
--# LIKE���� �����ϴ� ���� ���� ����( �̸� �ι�°�� ~��~�λ��)
SELECT STU_NO, STU_NAME FROM STUDENT WHERE STU_NAME LIKE '_��%';
--# LIKE���� �����ϴ� ���� ���� ����( �̸� �ι�°�� ~~�� �λ��)
SELECT STU_NO, STU_NAME FROM STUDENT WHERE STU_NAME LIKE '__��';
--# LIKE���� �����ϴ� ���� ���� ����( �й��� 2014~�� ���)
SELECT STU_NO FROM STUDENT WHERE STU_NO LIKE '2014%';
--# NULL�� ������  IS NULL
SELECT STU_NAME, STU_HEIGHT FROM STUDENT WHERE STU_HEIGHT IS NULL;

--# ORDER BY ���� �̿��� SORT ( ASC - ��������, DESC - ��������, DEFAULT�� ASC)
SELECT STU_NO, STU_NAME, STU_HEIGHT FROM STUDENT ORDER BY STU_NO ASC;

--# NULL�� ����
SELECT STU_NO, STU_NAME, STU_HEIGHT FROM STUDENT WHERE STU_HEIGHT IS NOT NULL;

SELECT STU_NO, STU_NAME, STU_HEIGHT, STU_HEIGHT+10 AS UPGRADE FROM STUDENT ORDER BY 4 ASC;
SELECT STU_NO, STU_NAME, STU_DEPT, STU_WEIGHT-5 AS TARGET FROM STUDENT ORDER BY TARGET;


--# �Լ�(Function)

SELECT ROUND(345.678), ROUND(345.678, 0), ROUND(345.678, 1), ROUND(345.678, -1) FROM DUAL;

SELECT CEIL(3.1), CEIL(-3.1), FLOOR(3.1), FLOOR(-3.1), ABS(-10), MOD(10,3) FROM DUAL;

--# ��ҹ���  LOWER, UPPER��, INITCAP��
SELECT LOWER('abcdefg') FROM DUAL;
SELECT UPPER('abcdefg') FROM DUAL;
SELECT INITCAP('abcdefg') FROM DUAL;

--# ���� �μ��� ���� �� ��ȯ
SELECT CONCAT (STU_NAME,STU_NO) FROM STUDENT;
--# ���ڿ��� �߰��� ���� ����(������ MID�� ����)
SELECT SUBSTR('ABCDEFG',2,3) FROM DUAL;
--# ���ڿ� ���� ���� LENGTH��
SELECT LENGTH ('ABCD') FROM DUAL;
--# Ư�� ������ ������ġ�� ��ȯ
SELECT ENAME,INSTR(ENAME, 'A',2,1) FROM EMP;

--# �¿� ���� �ڸ��� ���� , ä��� LPAD, RPAD��
SELECT LPAD(ENAME,10,'%') FROM EMP;
SELECT RPAD(ENAME,10,'$') FROM EMP;

--# �ý��� ��¥ ��ȸ
SELECT SYSDATE FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM DUAL; -- # TO_CHAR�� ���ڷ� ��ȯ
SELECT TO_CHAR(SYSDATE+1, 'YYYY-MM-DD') FROM DUAL; -- # TO_CHAR�� +1�� ������ ���� ��ȯ

SELECT HIREDATE FROM EMP;
SELECT ROUND(MONTHS_BETWEEN(SYSDATE, HIREDATE),1) FROM EMP;

SELECT LAST_DAY(SYSDATE) FROM DUAL;

SELECT TO_CHAR(TO_NUMBER(SAL), '$9999') FROM EMP;
SELECT TO_CHAR(TO_NUMBER(SAL), 'L9999') FROM EMP;

--# NVL, NVL2 �� ���Ƕ� ?
SELECT STU_NAME, NVL(STU_HEIGHT,0) FROM STUDENT;
SELECT * FROM EMP;
SELECT ENAME, NVL2(COMM, SAL+COMM,SAL) AS SALARY FROM EMP;

SELECT NVL(NULLIF('A','A'), '�ΰ�') FROM DUAL;

SELECT COALESCE(NULL,NULL,NULL, 10, 20, NULL) FROM DUAL;

--# ������ ������Ʈ �Ҷ�, 
SELECT EMPNO,ENAME,SAL, 
CASE JOB WHEN 'SALESMAN' THEN SAL*1.1
        WHEN 'CLERK' THEN SAL*1.15 
        WHEN 'MANAGER' THEN SAL*1.2
        ELSE SAL
        END AS �޿��λ�
        FROM EMP;
        
SELECT EMPNO, ENAME, JOB, SAL,
DECODE(JOB, 'SALESMAN', SAL*1.1,
            'CLERK',SAL*1.15,
            'MANAGER',SAL*1.2,
            SAL) AS �λ�ȱ޿�
            FROM EMP;
            
            
--# �׷� �Լ�
--# MAX, MIN �Լ�
select max(enr_grade), min(enr_grade) from enrol;
--# COUNT �Լ� , COUNT(*) -> ?
SELECT COUNT(*), COUNT(STU_HEIGHT) FROM STUDENT;
--# SUM, AVG�Լ� 
SELECT SUM(STU_WEIGHT), TO_CHAR(AVG(STU_WEIGHT), '9999.99') FROM STUDENT WHERE STU_DEPT = '��ǻ������' ;

--# ������ GROUP BY�� 
SELECT STU_DEPT, AVG(STU_WEIGHT) FROM STUDENT GROUP BY STU_DEPT;

SELECT STU_DEPT, COUNT(*) FROM STUDENT WHERE STU_WEIGHT >=50 GROUP BY STU_DEPT, STU_GRADE;

SELECT STU_GRADE, AVG(STU_HEIGHT) FROM STUDENT WHERE STU_DEPT = '���' GROUP BY STU_GRADE HAVING AVG(STU_HEIGHT) >=160;

SELECT STU_DEPT, MAX(STU_HEIGHT) FROM STUDENT GROUP BY STU_DEPT HAVING MAX(STU_HEIGHT) >= 175;

SELECT STU_DEPT, MAX(AVG(STU_HEIGHT)) FROM STUDENT GROUP BY STU_DEPT;

--# �������� 
-- 3. �޿� ���̺� ���� �˻�
DESCRIBE SALGRADE;

-- 4. �����ȣ,�̸�,���� �˻�
SELECT EMPNO, ENAME, JOB FROM EMP;

-- 6. �μ� �̸��� �μ�����(LOC)�˻�
SELECT DEPTNO, LOC FROM DEPT;

-- 8. ��� �Ի��� �ߺ� ���� �˻�
SELECT DISTINCT HIREDATE FROM EMP;

-- 11. ��� 6���� �޿� ��
SELECT ENAME, SAL*6 FROM EMP;

-- 12. ������� 5���� Ŀ�̼��� ��
SELECT ENAME, COMM*6 FROM EMP;

-- 13. ����̸��� NAME����, �޿��� SALARY ���� �̸�
SELECT ENAME AS "Name", SAL AS "Salary" FROM EMP;

-- 17. �Ի��� ����̸� 80-12-17�� �Ի��� SMITH�Դϴ� ������ �˻�
SELECT HIREDATE || '�� �Ի��� ' || ENAME || ' �Դϴ�' FROM EMP;

-- 19. �޿��� 2000�̻��� ��� �����ȣ, ����̸� �˻�
SELECT EMPNO, ENAME FROM EMP WHERE SAL >= 2000;

-- 21. 1980 12�� 17�Ͽ� �Ի��� ����̸� �˻�
SELECT ENAME FROM EMP WHERE HIREDATE = '80-12-17';

-- 22. �޿������ 5�� �޿��� �����޿��� �����޿� �˻�
SELECT HISAL, LOSAL FROM SALGRADE WHERE GRADE = 5;

-- 25. 10�� �μ��� �ٹ��ϴ� MANAGER�� ��� �̸� �˻�
SELECT ENAME, JOB, DEPTNO FROM EMP WHERE DEPTNO = 10 AND JOB = 'MANAGER';



---------------------- ��������(¦��)-------------------
-- 2. �ǽ��� ���� ���� ���̺�(SUBJECT) ���� �˻�
DESCRIBE SUBJECT;

-- 4. �ǽ��� ���� ����(ENROL) ���̺��� ��� ������ �˻�
SELECT * FROM ENROL;
SELECT * FROM SUBJECT;
SELECT * FROM STUDENT;

-- 6. ������� �����ȣ�� �����̸� �˻�
SELECT SUB_NO, SUB_NAME FROM SUBJECT;

-- 8. �л����� ��� ������ �˻��϶�
SELECT * FROM STUDENT;

-- 10. ������� �����̸�, �����̸��� �˻��϶�
SELECT SUB_NAME, SUB_PROF FROM SUBJECT;

-- 12. �л����� ü�߰� ������, �й� �̸��� �Բ� �˻��϶�
SELECT STU_NO,STU_NAME,STU_HEIGHT,STU_WEIGHT FROM STUDENT;

-- 14. �л����� ���� �ߺ��� �����ϰ� �˻�
SELECT DISTINCT STU_GENDER FROM STUDENT;

-- 16. �л����� �а�, �г� �ߺ��� �����ϰ� �˻�
SELECT DISTINCT STU_DEPT, STU_GRADE FROM STUDENT;

-- 18. �л����� ü���� 5��ŭ ������Ų �� �˻�
SELECT STU_NAME,STU_WEIGHT + 5 FROM STUDENT;

-- 20. �л����� �й��� �̸� ��Ī�� '�й�' , '�̸�'���� �ο� �˻�
SELECT STU_NO AS "�й�", STU_NAME AS "�й�" FROM STUDENT;

-- 22. ����(SUBJECT)���̺��� �����̸���, �������� �Ӹ�(heading)�� �ѱ۷� �˻��϶�  ???? ���� ���� �Ұ�

-- 24. �л��� �̸��� �а��� '��ǻ�������� ���Ѻ� �Դϴ�' ������ ǥ��
SELECT STU_DEPT || '�� ' || STU_NAME || '�Դϴ�' FROM STUDENT;

-- 26. ���� �л��� �˻�
SELECT STU_NAME,STU_DEPT FROM STUDENT WHERE STU_DEPT = '���';

-- 28. ������ 170�̻��� �л����� �˻�
SELECT STU_NAME, STU_HEIGHT FROM STUDENT WHERE STU_HEIGHT >= 170;

-- 30. ���� �л����� �й�, �̸��� �˻�
SELECT STU_NO, STU_NAME, STU_DEPT || '��' FROM STUDENT WHERE STU_DEPT = '���';

-- 32. �������ڰ� �л����� �й�, �̸� �˻�
SELECT STU_NO, STU_NAME, STU_DEPT || '��' FROM STUDENT WHERE STU_DEPT = '��������';

-- 34. ���л��� �̸� �˻�
SELECT STU_NAME, STU_GENDER FROM STUDENT WHERE STU_GENDER = 'F';

-- 36. ���� �̿� �л����� ��� ������ �˻�
SELECT * FROM STUDENT WHERE STU_DEPT != '���';

-- 38. '������'�л��� ��� ���� �˻�
SELECT * FROM STUDENT WHERE STU_NAME = '������';

-- 40. ���� �̸鼭 2�г��� �л����� ��� ������ �˻�
SELECT * FROM STUDENT WHERE STU_DEPT = '���' AND STU_GRADE = 2;

-- 42. ��ǻ�������� �ܿ� 1�г� �л����� �̸��� �˻��϶�
SELECT STU_NAME, STU_DEPT, STU_GRADE FROM STUDENT WHERE STU_DEPT != '��ǻ������' AND STU_GRADE = 1;

-- 44. ��ǻ�� ������ 2�г� A���� �л��� �̸��� �˻�
SELECT * FROM STUDENT WHERE STU_DEPT = '��ǻ������' AND STU_GRADE = 2 AND STU_CLASS = 'A';

-- 46. 2013 �й��� �л��� �й��� �̸�, �а��� �˻�
SELECT STU_NO, STU_NAME, STU_DEPT FROM STUDENT WHERE STU_NO LIKE '2013%';

-- 48. �达���� ���� �л��� �й��� �˻�
SELECT STU_NO, STU_NAME FROM STUDENT WHERE STU_NAME LIKE '��%';

-- 50. �й��� 2006�� �й� �л��� ��� ���� �˻�
SELECT * FROM STUDENT WHERE STU_NO LIKE '2006%';

-- 52. ������ NULL�� �л��� �̸��� �˻�
SELECT STU_NAME FROM STUDENT WHERE STU_HEIGHT IS NULL;

-- 54. �а��� ��ǻ������ �Ǵ� ����� �ϰ����� �й�, �̸��� �˻�
SELECT STU_NO, STU_NAME FROM STUDENT WHERE STU_GENDER = 'M' OR STU_GRADE = 1;

-- 56. �л����� �й�, �̸��� �й������� �˻��϶�
SELECT STU_NO, STU_NAME FROM STUDENT ORDER BY STU_NO;

-- 58. �л����� �й�, �̸�, �а��� �а��� �̸������� �˻��϶�.
SELECT STU_NO, STU_NAME, STU_DEPT FROM STUDENT ORDER BY STU_DEPT, STU_NAME;

-- 60. �л����� ������ �а��� �� ������ �˻��϶�
SELECT * FROM STUDENT ORDER BY STU_DEPT, STU_CLASS;

-- 62. �л����� ������ �ҹ��ڷ� �˻��϶�
SELECT * FROM STUDENT;
SELECT STU_NAME,LOWER(STU_GENDER) FROM STUDENT;

-- 64. �л����� �а�, �̸��� �����Ͽ� �˻�
SELECT CONCAT(STU_DEPT,STU_NAME) FROM STUDENT;

-- 66. �л����� �̸��� �̸��� ù 2���ڸ� �˻�
SELECT STU_NAME, SUBSTR(STU_NAME,1,2) FROM STUDENT;

-- 68. �л����� �̸��� �̸��� ���̸� �˻�
SELECT STU_NAME, LENGTH(STU_NAME) FROM STUDENT;

-- 70. �л����� �̸��� '��'�� �� ��° �ִ��� �˻�
SELECT STU_NAME, INSTR(STU_NAME,'��') FROM STUDENT;

-- 72. �л����� �̸��� 15�ڸ��� �ϰ� �ڿ� &�� ä�� �˻�











