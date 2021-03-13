--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT E.EMP_NO,
	E.LAST_NAME,
	E.FIRST_NAME,
	E.SEX,
	CAST(S.SALARY AS MONEY) AS SALARY
FROM EMPLOYEES E
INNER JOIN SALARIES S ON E.EMP_NO = S.EMP_NO;

--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT E.FIRST_NAME,
	E.LAST_NAME,
	E.HIRE_DATE
FROM EMPLOYEES E
WHERE HIRE_DATE BETWEEN '1/1/1986' AND '12/31/1986';


--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT D.DEPT_NO,
	D.DEPT_NAME,
	E.EMP_NO,
	E.LAST_NAME,
	E.FIRST_NAME
FROM DEPARTMENTS D
INNER JOIN DEPT_MANAGER DM ON D.DEPT_NO = DM.DEPT_NO
INNER JOIN EMPLOYEES E ON E.EMP_NO = DM.EMP_NO;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT E.EMP_NO,
	E.LAST_NAME,
	E.FIRST_NAME,
	D.DEPT_NAME
FROM DEPARTMENTS D
INNER JOIN DEPT_EMP DE ON D.DEPT_NO = DE.DEPT_NO
INNER JOIN EMPLOYEES E ON E.EMP_NO = DE.EMP_NO;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT E.FIRST_NAME,
	E.LAST_NAME,
	E.SEX
FROM EMPLOYEES E
WHERE E.FIRST_NAME = 'Hercules'
				AND LAST_NAME like 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT E.EMP_NO,
	E.LAST_NAME,
	E.FIRST_NAME,
	D.DEPT_NAME
FROM DEPARTMENTS D
INNER JOIN DEPT_EMP DE ON D.DEPT_NO = DE.DEPT_NO
INNER JOIN EMPLOYEES E ON E.EMP_NO = DE.EMP_NO
WHERE D.DEPT_NAME = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT E.EMP_NO,
	E.LAST_NAME,
	E.FIRST_NAME,
	D.DEPT_NAME
FROM DEPARTMENTS D
INNER JOIN DEPT_EMP DE ON D.DEPT_NO = DE.DEPT_NO
INNER JOIN EMPLOYEES E ON E.EMP_NO = DE.EMP_NO
WHERE D.DEPT_NAME = 'Sales'
				OR D.DEPT_NAME = 'Development';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT E.LAST_NAME,
	COUNT(E.EMP_NO)
FROM EMPLOYEES E
GROUP BY E.LAST_NAME
ORDER BY E.LAST_NAME DESC;