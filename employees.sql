-- CREATE DATABASE employeesDB;

-- USE employeesDB;

/*
SELECT 
	*
FROM
	Employee_Details$;
*/


/*
SELECT 
	*
FROM
	Department_Details$;
*/

/*
SELECT 
	*
FROM
	Job_Details$;
*/

--1. Total number of employees

SELECT 
	COUNT(EmployeeID) 'Total Employees'
FROM
	Employee_Details$;

--2. How many male and female employees are there?

SELECT
	Gender
	,COUNT(EmployeeID) 'Total Employees'
FROM
	Employee_Details$
GROUP BY
	Gender;

--3. What is the average age of employees?
 
SELECT 
    AVG(DATEDIFF(YY,DateOfBirth, GETDATE())) AS average_age 
FROM 
    Employee_Details$;

--4. What is the distribution of marital statuses among employees? 

SELECT 
	MaritalStatus
	,COUNT(EmployeeID) 'Total Employees'
FROM
	Employee_Details$
GROUP BY
	MaritalStatus;

--5. How many employees have a PhD?

SELECT 
	COUNT(*) 'Total Employees With PhD'
FROM
	Employee_Details$
WHERE	
	Education = 'PhD';

--6. What is the most common education level among employees?

SELECT 
	Education
	,COUNT(*) 'Total Employees'
FROM
	Employee_Details$
GROUP BY 
	Education
ORDER BY 'Total Employees' DESC;

--7. Calculate the average salary for employees with a Master's degree.

SELECT
	AVG(jd.Salary) 'Average Salary'
FROM
	Employee_Details$ ed
JOIN 
	Job_Details$ jd
ON
	ed.EmployeeID = jd.EmployeeID
WHERE
	ed.Education = 'Masters';

--8. Which city has the highest number of employees?

SELECT 
	TOP 1
	WorkingLocation
	,COUNT(EmployeeID) 'Total Employees'
FROM
	Employee_Details$
GROUP BY 
	WorkingLocation
ORDER BY
	'Total Employees' DESC;


--9. How many employees work in each city?

SELECT 
	
	WorkingLocation
	,COUNT(EmployeeID) 'Total Employees'
FROM
	Employee_Details$
GROUP BY 
	WorkingLocation
ORDER BY
	WorkingLocation;

--10. How many departments are there in the company?

SELECT 
	COUNT(DepartmentID) 'Total Department'
FROM
	Department_Details$;

--11. Which department has the highest number of employees?

SELECT 
	TOP 1
	dd.DepartmentName
	,COUNT(jd.EmployeeID) 'Total Employees'
FROM
	Department_Details$ dd
JOIN
	Job_Details$ jd
ON
	dd.DepartmentID = jd.DepartmentID
GROUP BY
	dd.DepartmentName
ORDER BY 
	'Total Employees' DESC;

--12. Calculate the average salary for each department.

SELECT
	DD.DepartmentName Department
	,ROUND(AVG(JD.Salary),2) 'Average Salary'
FROM
	Department_Details$ DD
JOIN
	Job_Details$ JD
ON
	DD.DepartmentID = JD.DepartmentID
GROUP BY
	DD.DepartmentName
ORDER BY 
	Department;

--13. How many employees are there in each department?

SELECT 
	dd.DepartmentName
	,COUNT(jd.EmployeeID) 'Total Employees'
FROM
	Department_Details$ dd
JOIN
	Job_Details$ jd
ON
	dd.DepartmentID = jd.DepartmentID
GROUP BY
	dd.DepartmentName
ORDER BY 
	'Total Employees' DESC;


--14. List all unique job titles in the company.
SELECT 
	DISTINCT JobTitle
FROM
	Job_Details$;

--15. Calculate the average salary for each job title.

SELECT 
	JobTitle
	,ROUND(AVG(Salary),2) 'Average Salary'
FROM
	Job_Details$
GROUP BY
	JobTitle;

--16. Identify the highest and lowest-paid employees.

-- Highest Paid Employee

SELECT TOP 1
	CONCAT(ED.FirstName,' ', ED.LastName) 'Full Name'
	,JD.Salary
FROM 
	Employee_Details$ ED
JOIN
	Job_Details$ JD
ON
	ED.EmployeeID = JD.EmployeeID
ORDER BY 
	JD.Salary DESC;

-- Lowest paid employee

SELECT TOP 1
	CONCAT(ED.FirstName,' ', ED.LastName) 'Full Name'
	,JD.Salary
FROM 
	Employee_Details$ ED
JOIN
	Job_Details$ JD
ON
	ED.EmployeeID = JD.EmployeeID
ORDER BY 
	JD.Salary ;

-- 17. Join the Job_Details and Department_Details to display job details along with department names.

SELECT
	DD.DepartmentName Department
	,JD.JobTitle
FROM
	Department_Details$ DD
JOIN
	Job_Details$ JD
ON
	DD.DepartmentID = JD.DepartmentID
GROUP BY
	DD.DepartmentName
	,JD.JobTitle;

-- 18. Calculate the average salary for each department.
SELECT
	DD.DepartmentName Department
	
	,ROUND(AVG(JD.Salary),2) 'Average Salary'
FROM
	Department_Details$ DD
JOIN
	Job_Details$ JD
ON
	DD.DepartmentID = JD.DepartmentID
GROUP BY
	DD.DepartmentName
	
ORDER BY
	DD.DepartmentName;

-- 19. Calculate the tenure (years of service) for each employee.

-- DATEDIFF(YY,DateOfBirth, GETDATE())

SELECT
	CONCAT(ED.FirstName, ' ', ED.LastName) EmployeeName
	,DATEDIFF(YY, JD.DateOfJoining, GETDATE()) 'Years of Service'
FROM
	Employee_Details$ ED
JOIN
	Job_Details$ JD
ON 
	ED.EmployeeID = JD.EmployeeID
ORDER BY 
	'Years of Service' DESC;

--20. For each department, determine the city with the highest number of employees working in that department.

SELECT 
	DD.DepartmentName Department
	,ED.City
	,COUNT(ED.EmployeeID) 'Total Employees'
FROM
	Employee_Details$ ED
JOIN
	Job_Details$ JD
ON 
	ED.EmployeeID = JD.EmployeeID
JOIN 
	Department_Details$ DD
ON 
	JD.DepartmentID = DD.DepartmentID
GROUP BY
	DD.DepartmentName 
	,ED.City
ORDER BY
	'Total Employees' DESC;







 





