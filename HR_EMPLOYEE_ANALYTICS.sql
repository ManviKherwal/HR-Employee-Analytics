-- ============================================================
--        HR EMPLOYEE ATTRITION & PERFORMANCE ANALYTICS
--              IBM HR Analytics Dataset - SQL Project
-- ============================================================

-- ============================================================
-- STEP 1 : DATABASE SETUP
-- ============================================================

CREATE DATABASE hr_analytics;
USE hr_analytics;

-- ============================================================
-- STEP 2 : BASIC DATA EXPLORATION
-- ============================================================

-- Preview first 5 records
SELECT *
FROM hr_employee
LIMIT 5;

-- Total number of employees in the company
SELECT COUNT(*) AS Total_Employees
FROM hr_employee;

-- ============================================================
-- STEP 3 : WHERE CLAUSE QUERIES
-- Business Insight: Filter specific employee groups to
-- understand workforce segments and attrition patterns.
-- ============================================================

-- Employees who left the company
-- Business Insight: Identifying employees with attrition helps
-- HR teams understand how many people are leaving the company.
SELECT * FROM hr_employee
WHERE Attrition = 'Yes';

-- Employees in the Sales department
-- Business Insight: Helps analyze Sales team size and composition.
SELECT * FROM hr_employee
WHERE Department = 'Sales';

-- High earning employees (Monthly Income > 10,000)
-- Business Insight: Understand how many employees fall in the
-- high salary bracket.
SELECT * FROM hr_employee
WHERE MonthlyIncome > 10000;

-- Employees below age 30 (Young Workforce)
-- Business Insight: Younger employees may have different attrition
-- patterns and career expectations.
SELECT * FROM hr_employee
WHERE Age < 30;

-- Employees in Human Resources department
-- Business Insight: Helps analyze the size of the HR team.
SELECT * FROM hr_employee
WHERE Department = 'Human Resources';

-- Top-level employees (Job Level 5)
-- Business Insight: Senior-level employees represent leadership
-- and are critical for organizational stability.
SELECT * FROM hr_employee
WHERE JobLevel = 5;

-- Female employees
-- Business Insight: Helps assess gender diversity in the workforce.
SELECT * FROM hr_employee
WHERE Gender = 'Female';

-- ============================================================
-- STEP 4 : ORDER BY QUERIES
-- Business Insight: Sorting data helps identify top/bottom
-- performers and salary ranges quickly.
-- ============================================================

-- Employees sorted by Monthly Income (Ascending)
SELECT EmployeeNumber, MonthlyIncome
FROM hr_employee
ORDER BY MonthlyIncome ASC;

-- Employees sorted by Age (Descending - Oldest First)
SELECT EmployeeNumber, Age
FROM hr_employee
ORDER BY Age DESC;

-- Departments listed in alphabetical order
SELECT Department
FROM hr_employee
ORDER BY Department;

-- Employees sorted by Daily Rate (Highest First)
SELECT EmployeeNumber, DailyRate
FROM hr_employee
ORDER BY DailyRate DESC;

-- Highest paid employee
-- Business Insight: Identifies the top earner in the company.
SELECT EmployeeNumber, MonthlyIncome
FROM hr_employee
ORDER BY MonthlyIncome DESC
LIMIT 1;

-- Lowest paid employee
-- Business Insight: Identifies the lowest earner, useful for
-- salary gap analysis.
SELECT EmployeeNumber, MonthlyIncome
FROM hr_employee
ORDER BY MonthlyIncome ASC
LIMIT 1;

-- ============================================================
-- STEP 5 : AGGREGATE FUNCTIONS
-- Business Insight: Aggregate functions summarize key metrics
-- like average salary, max income across the organization.
-- ============================================================

-- Average salary of all employees
-- Business Insight: Gives a company-wide benchmark for salary.
SELECT AVG(MonthlyIncome) AS Average_Salary
FROM hr_employee;

-- Highest salary in the company
-- Business Insight: Identifies the maximum compensation offered.
SELECT MAX(MonthlyIncome) AS Highest_Salary
FROM hr_employee;

-- Average salary by Department
-- Business Insight: Helps compare compensation across departments
-- and identify underpaid or overpaid teams.
SELECT Department,
AVG(MonthlyIncome) AS Average_Salary
FROM hr_employee
GROUP BY Department;

-- Highest salary by Department
-- Business Insight: Shows the top earner in each department.
SELECT Department,
MAX(MonthlyIncome) AS Highest_Salary
FROM hr_employee
GROUP BY Department;

-- Total employees by Department
-- Business Insight: Understand department-wise workforce distribution.
SELECT Department,
COUNT(*) AS Total_Employees
FROM hr_employee
GROUP BY Department;

-- Average salary by Job Role
-- Business Insight: Helps benchmark compensation for each role.
SELECT JobRole,
AVG(MonthlyIncome) AS Average_Salary
FROM hr_employee
GROUP BY JobRole;

-- Highest salary by Job Role
-- Business Insight: Identifies highest earning role in each category.
SELECT JobRole,
MAX(MonthlyIncome) AS Highest_Salary
FROM hr_employee
GROUP BY JobRole;

-- Employee count by Education Field
-- Business Insight: Shows which educational backgrounds are most
-- common in the workforce.
SELECT EducationField,
COUNT(*) AS Number_of_Employee
FROM hr_employee
GROUP BY EducationField;

-- Average age by Marital Status
-- Business Insight: Helps understand age distribution across
-- different marital groups for HR policy planning.
SELECT MaritalStatus,
AVG(Age) AS Average_Age_of_Employee
FROM hr_employee
GROUP BY MaritalStatus;

-- Maximum years at company by Department
-- Business Insight: Identifies which department retains employees
-- the longest.
SELECT Department,
MAX(YearsAtCompany) AS Max_Years
FROM hr_employee
GROUP BY Department;

-- Average Job Satisfaction by Job Role
-- Business Insight: Roles with low satisfaction scores need
-- immediate HR attention and intervention.
SELECT JobRole,
AVG(JobSatisfaction) AS Avg_JobSatisfaction
FROM hr_employee
GROUP BY JobRole;

-- Employee count by Age Group
-- Business Insight: Shows the age demographic spread across
-- young, mid-age and senior employees.
SELECT Age_Group,
COUNT(*) AS Age_Group_of_Employee
FROM hr_employee
GROUP BY Age_Group;

-- Average distance from home by Department
-- Business Insight: Departments with high commute distances may
-- see higher attrition due to travel fatigue.
SELECT Department,
AVG(DistanceFromHome) AS Average_Distance_From_Home
FROM hr_employee
GROUP BY Department;

-- ============================================================
-- STEP 6 : HAVING CLAUSE QUERIES
-- Business Insight: HAVING filters grouped results to focus on
-- departments or roles that meet specific thresholds.
-- ============================================================

-- Departments with more than 100 employees
-- Business Insight: Identifies the largest departments in the company.
SELECT Department,
COUNT(*) AS Total_Employees
FROM hr_employee
GROUP BY Department
HAVING COUNT(*) > 100;

-- Job Roles with average salary above 7000
-- Business Insight: Highlights well-compensated roles in the company.
SELECT JobRole,
AVG(MonthlyIncome) AS Average_Salary
FROM hr_employee
GROUP BY JobRole
HAVING AVG(MonthlyIncome) > 7000;

-- Departments with average salary above 6500
-- Business Insight: Helps identify high-paying departments.
SELECT Department,
AVG(MonthlyIncome) AS Average_Salary
FROM hr_employee
GROUP BY Department
HAVING AVG(MonthlyIncome) > 6500;

-- Education fields with more than 200 employees
-- Business Insight: Most represented educational backgrounds
-- in the company.
SELECT EducationField,
COUNT(*) AS Total_Employee
FROM hr_employee
GROUP BY EducationField
HAVING COUNT(*) > 200;

-- Job Roles where average age is above 35
-- Business Insight: Identifies senior/experienced role categories.
SELECT JobRole,
AVG(Age) AS Average_Age
FROM hr_employee
GROUP BY JobRole
HAVING AVG(Age) > 35;

-- Marital status groups with more than 300 employees
-- Business Insight: Dominant marital demographic in the workforce.
SELECT MaritalStatus,
COUNT(*) AS Total_Employee
FROM hr_employee
GROUP BY MaritalStatus
HAVING COUNT(*) > 300;

-- Departments where maximum salary exceeds 18000
-- Business Insight: Shows which departments have top-tier earners.
SELECT Department,
MAX(MonthlyIncome) AS Maximum_Salary
FROM hr_employee
GROUP BY Department
HAVING MAX(MonthlyIncome) > 18000;

-- ============================================================
-- STEP 7 : CASE WHEN QUERIES
-- Business Insight: CASE WHEN creates custom categories to
-- classify employees into meaningful business segments.
-- ============================================================

-- Classify employees by Income Category
-- Business Insight: Groups employees into Low, Medium, High income
-- brackets for salary distribution analysis.
SELECT
    EmployeeNumber,
    MonthlyIncome,
    CASE
        WHEN MonthlyIncome < 5000 THEN 'Low'
        WHEN MonthlyIncome BETWEEN 5000 AND 10000 THEN 'Medium'
        ELSE 'High'
    END AS Income_Category
FROM hr_employee;

-- Classify employees by Age Category
-- Business Insight: Age segmentation helps target retention
-- strategies for different life stages.
SELECT
    EmployeeNumber,
    Age,
    CASE
        WHEN Age < 30 THEN 'Young'
        WHEN Age BETWEEN 30 AND 40 THEN 'Adult'
        ELSE 'Senior'
    END AS Age_Category
FROM hr_employee;

-- Classify employees by Work Experience Level
-- Business Insight: Experience classification helps in workforce
-- planning, training, and succession strategies.
SELECT
    EmployeeNumber,
    TotalWorkingYears,
    CASE
        WHEN TotalWorkingYears < 5 THEN 'Beginner'
        WHEN TotalWorkingYears BETWEEN 5 AND 10 THEN 'Intermediate'
        ELSE 'Experienced'
    END AS Work_Experience_Category
FROM hr_employee;

-- Classify employees by Business Travel Frequency
-- Business Insight: High travel frequency can be a key factor
-- in employee burnout and attrition.
SELECT
    EmployeeNumber,
    BusinessTravel,
    CASE
        WHEN BusinessTravel = 'Travel_Rarely' THEN 'Low Travel'
        WHEN BusinessTravel = 'Travel_Frequently' THEN 'High Travel'
        ELSE 'No Travel'
    END AS Travel_Category
FROM hr_employee;

-- ============================================================
-- STEP 8 : AND / OR / BETWEEN / IN / != QUERIES
-- Business Insight: Combining multiple conditions helps HR
-- identify very specific employee segments for targeted action.
-- ============================================================

-- Female employees in Research & Development
-- Business Insight: Analyze gender diversity within R&D department.
SELECT *
FROM hr_employee
WHERE Department = 'Research & Development'
AND Gender = 'Female';

-- Employees aged between 25 and 35
-- Business Insight: Core working-age group that drives
-- most of the company output.
SELECT *
FROM hr_employee
WHERE Age BETWEEN 25 AND 35;

-- Employees who are Manager or Research Scientist
-- Business Insight: Compare two key roles side by side.
SELECT *
FROM hr_employee
WHERE JobRole = 'Manager'
OR JobRole = 'Research Scientist';

-- High income senior employees (Income > 10000 AND Job Level 3)
-- Business Insight: Identify mid-to-senior level high earners.
SELECT *
FROM hr_employee
WHERE MonthlyIncome > 10000 AND JobLevel = 3;

-- Single or Divorced employees
-- Business Insight: Marital status can influence attrition rates
-- and work-life balance needs.
SELECT *
FROM hr_employee
WHERE MaritalStatus = 'Single'
OR MaritalStatus = 'Divorced';

-- Specific employees by Employee Number
-- Business Insight: Useful for HR to pull individual employee records.
SELECT *
FROM hr_employee
WHERE EmployeeNumber IN (101, 205, 309, 450);

-- All employees NOT in Human Resources
-- Business Insight: Excludes HR team to analyze rest of the workforce.
SELECT *
FROM hr_employee
WHERE Department != 'Human Resources';

-- ============================================================
-- STEP 9 : TABLE CREATION & INSERT
-- ============================================================

-- Create department_info reference table
CREATE TABLE department_info (
    Department VARCHAR(50),
    Department_Head VARCHAR(50),
    Budget_Crore INT
);

-- Insert department records
INSERT INTO department_info
VALUES
('Sales', 'Rahul Sharma', 50),
('Research & Development', 'Priya Mehta', 120),
('Human Resources', 'Neha Gupta', 20);

-- Preview department_info table
SELECT * FROM department_info;

-- ============================================================
-- STEP 10 : JOINS
-- Business Insight: JOINs combine employee data with department
-- info to get a richer, more complete view of the workforce.
-- ============================================================

-- INNER JOIN: Employee with their Department Head
-- Business Insight: Links each employee to their department
-- leadership for org chart analysis.
SELECT
    hr_employee.EmployeeNumber,
    hr_employee.Department,
    department_info.Department_Head
FROM hr_employee
INNER JOIN department_info
ON hr_employee.Department = department_info.Department;

-- INNER JOIN: Employee with Department Head and Budget
-- Business Insight: Shows each employee alongside their department's
-- budget allocation.
SELECT
    hr_employee.EmployeeNumber,
    hr_employee.Department,
    hr_employee.Gender,
    department_info.Department_Head,
    department_info.Budget_Crore
FROM hr_employee
INNER JOIN department_info
ON hr_employee.Department = department_info.Department;

-- INNER JOIN: Average Salary per Department Head
-- Business Insight: Shows how much each department head's team
-- earns on average.
SELECT
    d.Department_Head,
    h.Department,
    AVG(h.MonthlyIncome) AS Average_Salary
FROM hr_employee AS h
INNER JOIN department_info AS d
ON h.Department = d.Department
GROUP BY d.Department_Head, h.Department;

-- INNER JOIN: Total Employees under each Department Head
-- Business Insight: Shows team size managed by each department head.
SELECT
    d.Department_Head,
    COUNT(*) AS Total_Employees
FROM hr_employee AS h
INNER JOIN department_info AS d
ON h.Department = d.Department
GROUP BY d.Department_Head, h.Department;

-- INNER JOIN with WHERE: High earners with Department info
-- Business Insight: Identifies high salary employees and links
-- them to their department head.
SELECT
    hr_employee.EmployeeNumber,
    hr_employee.Department,
    hr_employee.Gender,
    hr_employee.MonthlyIncome,
    department_info.Department_Head,
    department_info.Budget_Crore
FROM hr_employee
INNER JOIN department_info
ON hr_employee.Department = department_info.Department
WHERE MonthlyIncome > 10000;

-- INNER JOIN: Full Department Summary (Head, Budget, Avg Salary, Count)
-- Business Insight: One-stop summary of each department's key metrics.
SELECT
    d.Department_Head,
    h.Department,
    d.Budget_Crore,
    AVG(h.MonthlyIncome) AS Average_Salary,
    COUNT(*) AS Total_Employees
FROM hr_employee AS h
INNER JOIN department_info AS d
ON h.Department = d.Department
GROUP BY d.Department_Head, h.Department, d.Budget_Crore;

-- Add Finance department (not present in hr_employee)
INSERT INTO department_info
VALUES ('Finance', 'Rohit Kapoor', 40);

-- LEFT JOIN: All employees with department info (Finance shows NULL)
-- Business Insight: LEFT JOIN ensures no employee record is lost
-- even if their department has no match in department_info.
SELECT
    d.Department_Head,
    h.Department,
    d.Budget_Crore
FROM hr_employee AS h
LEFT JOIN department_info AS d
ON h.Department = d.Department;

-- LEFT JOIN: Employee count per Department Head (including unmatched)
-- Business Insight: Shows all departments with employee count,
-- Finance will appear with NULL since no employees are mapped to it.
SELECT
    d.Department_Head,
    h.Department,
    COUNT(*) AS Total_Employees
FROM hr_employee AS h
LEFT JOIN department_info AS d
ON h.Department = d.Department
GROUP BY d.Department_Head, h.Department;

-- ============================================================
-- STEP 11 : SUBQUERIES
-- Business Insight: Subqueries allow dynamic comparisons against
-- computed values like company average salary.
-- ============================================================

-- Employees earning above company average salary
-- Business Insight: Identifies above-average earners for
-- retention and performance tracking.
SELECT EmployeeNumber,
       JobRole,
       Department,
       MonthlyIncome
FROM hr_employee
WHERE MonthlyIncome >
(
    SELECT AVG(MonthlyIncome)
    FROM hr_employee
);

-- Employee with the highest salary
-- Business Insight: Pinpoints the top earner dynamically
-- without hardcoding any value.
SELECT EmployeeNumber,
       JobRole,
       Department,
       MonthlyIncome
FROM hr_employee
WHERE MonthlyIncome =
(
    SELECT MAX(MonthlyIncome)
    FROM hr_employee
);

-- Departments where average salary is above company average
-- Business Insight: Highlights departments with above-average
-- compensation, useful for budget review.
SELECT Department,
AVG(MonthlyIncome) AS Average_MonthlyIncome
FROM hr_employee
GROUP BY Department
HAVING AVG(MonthlyIncome) >
(
    SELECT AVG(MonthlyIncome)
    FROM hr_employee
);

-- Employees in the same department as Employee 101
-- Business Insight: Useful for HR to pull team members of a
-- specific employee without knowing their department manually.
SELECT EmployeeNumber,
       JobRole,
       Department
FROM hr_employee
WHERE Department =
(
    SELECT Department
    FROM hr_employee
    WHERE EmployeeNumber = 101
);

-- ============================================================
--                  END OF SQL PROJECT
-- ============================================================
