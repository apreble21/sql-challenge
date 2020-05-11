--List the employee number, last name, 
--first name, sex, and salary for each employee. 
SELECT EM.EMP_NO, EM.LAST_NAME, EM.FIRST_NAME, EM.SEX, SA.SALARY
FROM EMPLOYEES AS EM
INNER JOIN SALARIES AS SA ON
EM.EMP_NO = SA.EMP_NO;

-- List first name, last name, and hire date for employees hired in 1986.
SELECT FIRST_NAME, LAST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE LIKE '%86';

-- List the department number, department name, the manager's 
-- employee number, last name, first name of each department.
SELECT DM.DEPT_NO, DEP.DEPT_NAME, EM.EMP_NO, EM.LAST_NAME, EM.FIRST_NAME
FROM DEPT_MANAGER AS DM
LEFT JOIN DEPARTMENTS AS DEP ON (DM.DEPT_NO = DEP.DEPT_NO)
LEFT JOIN EMPLOYEES AS EM ON (DM.EMP_NO = EM.EMP_NO);

--List the employee number, last name, first name, 
--and department name of each employee.
SELECT EM.EMP_NO, EM.LAST_NAME, EM.FIRST_NAME, DEP.DEPT_NAME
FROM EMPLOYEES AS EM
LEFT JOIN DEPT_EMP ON (EM.EMP_NO = DEPT_EMP.EMP_NO)
LEFT JOIN DEPARTMENTS AS DEP ON (DEPT_EMP.DEPT_NO = DEP.DEPT_NO);

--List first name, last name, and sex for employees whose 
--first name is "Hercules" and last names begin with "B."
SELECT FIRST_NAME, LAST_NAME, SEX
FROM EMPLOYEES
WHERE FIRST_NAME = 'Hercules' AND LAST_NAME LIKE 'B%';

--List the employee number, last name, first name, and 
--department name of all employees in the Sales department.
SELECT EM.EMP_NO, EM.LAST_NAME, EM.FIRST_NAME, DEP.DEPT_NAME
FROM EMPLOYEES AS EM
LEFT JOIN DEPT_EMP ON (EM.EMP_NO = DEPT_EMP.EMP_NO)
LEFT JOIN DEPARTMENTS AS DEP ON (DEPT_EMP.DEPT_NO = DEP.DEPT_NO) 
WHERE DEP.DEPT_NAME = 'Sales';

--List the employee number, last name, first name, and department name
--for all of the employees in the Sales and Development departments.
SELECT EM.EMP_NO, EM.LAST_NAME, EM.FIRST_NAME, DEP.DEPT_NAME
FROM EMPLOYEES AS EM
LEFT JOIN DEPT_EMP ON (EM.EMP_NO = DEPT_EMP.EMP_NO)
LEFT JOIN DEPARTMENTS AS DEP ON (DEPT_EMP.DEPT_NO = DEP.DEPT_NO) 
WHERE DEP.DEPT_NAME = 'Sales' OR DEP.DEPT_NAME = 'Development';

--In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
SELECT LAST_NAME, COUNT(LAST_NAME) AS "frequency_count"
FROM EMPLOYEES
GROUP BY LAST_NAME
ORDER BY COUNT(LAST_NAME) DESC;