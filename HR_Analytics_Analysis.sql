/*
========================================================
HR Analytics SQL Portfolio Project
========================================================
Project: HR Analytics
Database: HR_Analytics
Table: dbo.EmployeeData

Purpose:
Analyze employee data to identify workforce patterns,
attrition trends, and important HR insights.

Tool:
Microsoft SQL Server

Total Analyses:
50 SQL Business Questions
========================================================
*/

USE HR_Analytics;
GO

/* ========================================================
   QUERY 1
   ======================================================== */

/* Analyze the total number of employees in the organization */
SELECT
    COUNT(*) AS Total_Employees
FROM dbo.EmployeeData;


/* ========================================================
   QUERY 2
   ======================================================== */

/* Analyze the number of employees in each department */
SELECT 
    Department,
    COUNT(*) AS Total_Employees
FROM dbo.EmployeeData
GROUP BY Department
ORDER BY Total_Employees DESC;


/* ========================================================
   QUERY 3
   ======================================================== */

/* Analyze the number of employees in each job role */
SELECT
    JobRole,
    COUNT(*) AS Total_Employees
FROM dbo.EmployeeData
GROUP BY JobRole
ORDER BY Total_Employees DESC;


/* ========================================================
   QUERY 4
   ======================================================== */

/* Analyze the number of employees who have left the organization */
SELECT
    Attrition,
    COUNT(*) AS Total_Employees
FROM dbo.EmployeeData
GROUP BY Attrition
ORDER BY Total_Employees DESC;


/* ========================================================
   QUERY 5
   ======================================================== */

/* Analyze the overall employee attrition rate */
SELECT
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,
    CAST(
        SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Attrition_Rate_Percent
FROM dbo.EmployeeData;


/* ========================================================
   QUERY 6
   ======================================================== */

/* Analyze employee attrition across each department */
SELECT
    Department,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left
FROM dbo.EmployeeData
GROUP BY Department
ORDER BY Employees_Left DESC;


/* ========================================================
   QUERY 7
   ======================================================== */

/* Analyze the employee attrition rate for each department */
SELECT
    Department,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,
    CAST(
        SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Attrition_Rate_Percent
FROM dbo.EmployeeData
GROUP BY Department
ORDER BY Attrition_Rate_Percent DESC;


/* ========================================================
   QUERY 8
   ======================================================== */

/* Analyze employee attrition based on overtime status */
SELECT
    OverTime,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left
FROM dbo.EmployeeData
GROUP BY OverTime
ORDER BY Employees_Left DESC;


/* ========================================================
   QUERY 9
   ======================================================== */

/* Analyze the employee attrition rate based on overtime status */
SELECT
    OverTime,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,
    CAST(
        SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Attrition_Rate_Percent
FROM dbo.EmployeeData
GROUP BY OverTime
ORDER BY Attrition_Rate_Percent DESC;


/* ========================================================
   QUERY 10
   ======================================================== */

/* Analyze the employee attrition rate for each job role */
SELECT
    JobRole,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,
    CAST(
        SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Attrition_Rate_Percent
FROM dbo.EmployeeData
GROUP BY JobRole
ORDER BY Attrition_Rate_Percent DESC;


/* ========================================================
   QUERY 11
   ======================================================== */

/* Analyze employee attrition based on job satisfaction levels */
SELECT
    JobSatisfaction,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,
    CAST(
        SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Attrition_Rate_Percent
FROM dbo.EmployeeData
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;


/* ========================================================
   QUERY 12
   ======================================================== */

/* Analyze employee attrition based on work-life balance levels */
SELECT
    WorkLifeBalance,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,
    CAST(
        SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Attrition_Rate_Percent
FROM dbo.EmployeeData
GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance;


/* ========================================================
   QUERY 13
   ======================================================== */

/* Analyze employee attrition based on business travel frequency */
SELECT
    BusinessTravel,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,
    CAST(
        SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Attrition_Rate_Percent
FROM dbo.EmployeeData
GROUP BY BusinessTravel
ORDER BY Attrition_Rate_Percent DESC;


/* ========================================================
   QUERY 14
   ======================================================== */

/* Analyze employee attrition based on marital status */
SELECT
    MaritalStatus,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,
    CAST(
        SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Attrition_Rate_Percent
FROM dbo.EmployeeData
GROUP BY MaritalStatus
ORDER BY Attrition_Rate_Percent DESC;


/* ========================================================
   QUERY 15
   ======================================================== */

/* Analyze employee attrition across different age groups */
SELECT
    CASE
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS Age_Group,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,
    CAST(
        SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Attrition_Rate_Percent
FROM dbo.EmployeeData
GROUP BY
    CASE
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END
ORDER BY Attrition_Rate_Percent DESC;


/* ========================================================
   QUERY 16
   ======================================================== */

/* Analyze employee attrition across different education levels */
SELECT
    Education,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,
    CAST(
        SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Attrition_Rate_Percent
FROM dbo.EmployeeData
GROUP BY Education
ORDER BY Education;


/* ========================================================
   QUERY 17
   ======================================================== */

/* Analyze employee attrition across different job levels */
SELECT
    JobLevel,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,
    CAST(
        SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Attrition_Rate_Percent
FROM dbo.EmployeeData
GROUP BY JobLevel
ORDER BY JobLevel;


/* ========================================================
   QUERY 18
   ======================================================== */

/* Analyze employee attrition based on work environment satisfaction levels */
SELECT
    EnvironmentSatisfaction,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,
    CAST(
        SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Attrition_Rate_Percent
FROM dbo.EmployeeData
GROUP BY EnvironmentSatisfaction
ORDER BY EnvironmentSatisfaction;


/* ========================================================
   QUERY 19
   ======================================================== */

/* Analyze employee attrition based on performance rating */
SELECT
    PerformanceRating,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,
    CAST(
        SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Attrition_Rate_Percent
FROM dbo.EmployeeData
GROUP BY PerformanceRating
ORDER BY PerformanceRating;


/* ========================================================
   QUERY 20
   ======================================================== */

/* Analyze the average monthly income across each department */
SELECT
    Department,
    COUNT(*) AS Total_Employees,
    CAST(AVG(MonthlyIncome) AS DECIMAL(10,2)) AS Average_Monthly_Income
FROM dbo.EmployeeData
GROUP BY Department
ORDER BY Average_Monthly_Income DESC;


/* ========================================================
   QUERY 21
   ======================================================== */

/* Analyze the average monthly income across different job roles */
SELECT
    JobRole,
    COUNT(*) AS Total_Employees,
    CAST(AVG(MonthlyIncome) AS DECIMAL(10,2)) AS Average_Monthly_Income
FROM dbo.EmployeeData
GROUP BY JobRole
ORDER BY Average_Monthly_Income DESC;


/* ========================================================
   QUERY 22
   ======================================================== */

/* Analyze the average years employees have worked in each department */
SELECT
    Department,
    COUNT(*) AS Total_Employees,
    CAST(AVG(YearsAtCompany) AS DECIMAL(10,2)) AS Average_Years_At_Company
FROM dbo.EmployeeData
GROUP BY Department
ORDER BY Average_Years_At_Company DESC;


/* ========================================================
   QUERY 23
   ======================================================== */

/* Analyze the average monthly income across different job levels */
SELECT
    JobLevel,
    COUNT(*) AS Total_Employees,
    CAST(AVG(MonthlyIncome) AS DECIMAL(10,2)) AS Average_Monthly_Income
FROM dbo.EmployeeData
GROUP BY JobLevel
ORDER BY JobLevel;


/* ========================================================
   QUERY 24
   ======================================================== */

/* Analyze the average years employees have worked in each job role */
SELECT
    JobRole,
    COUNT(*) AS Total_Employees,
    CAST(AVG(YearsAtCompany) AS DECIMAL(10,2)) AS Average_Years_At_Company
FROM dbo.EmployeeData
GROUP BY JobRole
ORDER BY Average_Years_At_Company DESC;


/* ========================================================
   QUERY 25
   ======================================================== */

/* Analyze the average number of training sessions completed in each department */
SELECT
    Department,
    COUNT(*) AS Total_Employees,
    CAST(AVG(TrainingTimesLastYear) AS DECIMAL(10,2)) AS Average_Training_Sessions
FROM dbo.EmployeeData
GROUP BY Department
ORDER BY Average_Training_Sessions DESC;


/* ========================================================
   QUERY 26
   ======================================================== */

/* Analyze the average years employees have waited since their last promotion in each department */
SELECT
    Department,
    COUNT(*) AS Total_Employees,
    CAST(AVG(YearsSinceLastPromotion) AS DECIMAL(10,2)) AS Average_Years_Since_Promotion
FROM dbo.EmployeeData
GROUP BY Department
ORDER BY Average_Years_Since_Promotion DESC;


/* ========================================================
   QUERY 27
   ======================================================== */

/* Analyze the average years employees have worked with their current manager in each department */
SELECT
    Department,
    COUNT(*) AS Total_Employees,
    CAST(AVG(YearsWithCurrManager) AS DECIMAL(10,2)) AS Average_Years_With_Current_Manager
FROM dbo.EmployeeData
GROUP BY Department
ORDER BY Average_Years_With_Current_Manager DESC;


/* ========================================================
   QUERY 28
   ======================================================== */

/* Analyze the average years employees have worked in their current role in each department */
SELECT
    Department,
    COUNT(*) AS Total_Employees,
    CAST(AVG(YearsInCurrentRole) AS DECIMAL(10,2)) AS Average_Years_In_Current_Role
FROM dbo.EmployeeData
GROUP BY Department
ORDER BY Average_Years_In_Current_Role DESC;


/* ========================================================
   QUERY 29
   ======================================================== */

/* Analyze the average total work experience of employees in each department */
SELECT
    Department,
    COUNT(*) AS Total_Employees,
    CAST(AVG(TotalWorkingYears) AS DECIMAL(10,2)) AS Average_Total_Working_Years
FROM dbo.EmployeeData
GROUP BY Department
ORDER BY Average_Total_Working_Years DESC;


/* ========================================================
   QUERY 30
   ======================================================== */

/* Analyze the average years employees have waited since their last promotion in each job role */
SELECT
    JobRole,
    COUNT(*) AS Total_Employees,
    CAST(AVG(YearsSinceLastPromotion) AS DECIMAL(10,2)) AS Average_Years_Since_Last_Promotion
FROM dbo.EmployeeData
GROUP BY JobRole
ORDER BY Average_Years_Since_Last_Promotion DESC;


/* ========================================================
   QUERY 31
   ======================================================== */

/* Analyze the average distance employees travel from home in each department */
SELECT
    Department,
    COUNT(*) AS Total_Employees,
    CAST(AVG(DistanceFromHome) AS DECIMAL(10,2)) AS Average_Distance_From_Home
FROM dbo.EmployeeData
GROUP BY Department
ORDER BY Average_Distance_From_Home DESC;


/* ========================================================
   QUERY 32
   ======================================================== */

/* Analyze the average age of employees in each department */
SELECT
    Department,
    COUNT(*) AS Total_Employees,
    CAST(AVG(Age) AS DECIMAL(10,2)) AS Average_Age
FROM dbo.EmployeeData
GROUP BY Department
ORDER BY Average_Age DESC;


/* ========================================================
   QUERY 33
   ======================================================== */

/* Analyze the average daily rate of employees in each department */
SELECT
    Department,
    COUNT(*) AS Total_Employees,
    CAST(AVG(DailyRate) AS DECIMAL(10,2)) AS Average_Daily_Rate
FROM dbo.EmployeeData
GROUP BY Department
ORDER BY Average_Daily_Rate DESC;


/* ========================================================
   QUERY 34
   ======================================================== */

/* Analyze the number of employees by gender */
SELECT
    Gender,
    COUNT(*) AS Total_Employees
FROM dbo.EmployeeData
GROUP BY Gender
ORDER BY Total_Employees DESC;


/* ========================================================
   QUERY 35
   ======================================================== */

/* Analyze the employee attrition rate based on gender */
SELECT
    Gender,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,
    CAST(
        SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Attrition_Rate_Percent
FROM dbo.EmployeeData
GROUP BY Gender
ORDER BY Attrition_Rate_Percent DESC;


/* ========================================================
   QUERY 36
   ======================================================== */

/* Analyze the average salary hike percentage across each department */
SELECT
    Department,
    COUNT(*) AS Total_Employees,
    CAST(AVG(PercentSalaryHike) AS DECIMAL(10,2)) AS Average_Salary_Hike_Percent
FROM dbo.EmployeeData
GROUP BY Department
ORDER BY Average_Salary_Hike_Percent DESC;


/* ========================================================
   QUERY 37
   ======================================================== */

/* Analyze the average job involvement level of employees in each department */
SELECT
    Department,
    COUNT(*) AS Total_Employees,
    CAST(AVG(JobInvolvement) AS DECIMAL(10,2)) AS Average_Job_Involvement
FROM dbo.EmployeeData
GROUP BY Department
ORDER BY Average_Job_Involvement DESC;


/* ========================================================
   QUERY 38
   ======================================================== */

/* Analyze the average monthly rate of employees in each department */
SELECT
    Department,
    COUNT(*) AS Total_Employees,
    CAST(AVG(MonthlyRate) AS DECIMAL(10,2)) AS Average_Monthly_Rate
FROM dbo.EmployeeData
GROUP BY Department
ORDER BY Average_Monthly_Rate DESC;


/* ========================================================
   QUERY 39
   ======================================================== */

/* Analyze the average stock option level of employees in each department */
SELECT
    Department,
    COUNT(*) AS Total_Employees,
    CAST(AVG(StockOptionLevel) AS DECIMAL(10,2)) AS Average_Stock_Option_Level
FROM dbo.EmployeeData
GROUP BY Department
ORDER BY Average_Stock_Option_Level DESC;


/* ========================================================
   QUERY 40
   ======================================================== */

/* Analyze the number of employees working overtime in each department */
SELECT
    Department,
    OverTime,
    COUNT(*) AS Total_Employees
FROM dbo.EmployeeData
GROUP BY
    Department,
    OverTime
ORDER BY
    Department,
    Total_Employees DESC;


/* ========================================================
   QUERY 41
   ======================================================== */

/* Analyze the percentage of employees working overtime in each department */
SELECT
    Department,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN OverTime = 1 THEN 1 ELSE 0 END) AS Overtime_Employees,
    CAST(
        SUM(CASE WHEN OverTime = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Overtime_Rate_Percent
FROM dbo.EmployeeData
GROUP BY Department
ORDER BY Overtime_Rate_Percent DESC;


/* ========================================================
   QUERY 42
   ======================================================== */

/* Analyze employee attrition rates by overtime status within each department */
SELECT
    Department,
    OverTime,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,
    CAST(
        SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Attrition_Rate_Percent
FROM dbo.EmployeeData
GROUP BY
    Department,
    OverTime
ORDER BY
    Department,
    Attrition_Rate_Percent DESC;


/* ========================================================
   QUERY 43
   ======================================================== */

/* Analyze the average monthly income of employees who stayed and employees who left */
SELECT
    Attrition,
    COUNT(*) AS Total_Employees,
    CAST(AVG(MonthlyIncome) AS DECIMAL(10,2)) AS Average_Monthly_Income
FROM dbo.EmployeeData
GROUP BY Attrition
ORDER BY Attrition;


/* ========================================================
   QUERY 44
   ======================================================== */

/* Analyze average monthly income for employees who stayed and left across job levels */
SELECT
    JobLevel,
    Attrition,
    COUNT(*) AS Total_Employees,
    CAST(AVG(MonthlyIncome) AS DECIMAL(10,2)) AS Average_Monthly_Income
FROM dbo.EmployeeData
GROUP BY
    JobLevel,
    Attrition
ORDER BY
    JobLevel,
    Attrition;


/* ========================================================
   QUERY 45
   ======================================================== */

/* Analyze employee attrition rates by overtime status within each job level */
SELECT
    JobLevel,
    OverTime,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,
    CAST(
        SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Attrition_Rate_Percent
FROM dbo.EmployeeData
GROUP BY
    JobLevel,
    OverTime
ORDER BY
    JobLevel,
    Attrition_Rate_Percent DESC;


/* ========================================================
   QUERY 46
   ======================================================== */

/* Analyze employee attrition across different tenure groups */
SELECT
    CASE
        WHEN YearsAtCompany <= 2 THEN '0-2 Years'
        WHEN YearsAtCompany BETWEEN 3 AND 5 THEN '3-5 Years'
        WHEN YearsAtCompany BETWEEN 6 AND 10 THEN '6-10 Years'
        ELSE '11+ Years'
    END AS Tenure_Group,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,
    CAST(
        SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Attrition_Rate_Percent
FROM dbo.EmployeeData
GROUP BY
    CASE
        WHEN YearsAtCompany <= 2 THEN '0-2 Years'
        WHEN YearsAtCompany BETWEEN 3 AND 5 THEN '3-5 Years'
        WHEN YearsAtCompany BETWEEN 6 AND 10 THEN '6-10 Years'
        ELSE '11+ Years'
    END
ORDER BY Attrition_Rate_Percent DESC;


/* ========================================================
   QUERY 47
   ======================================================== */

/* Analyze employee attrition across different periods since their last promotion */
SELECT
    CASE
        WHEN YearsSinceLastPromotion = 0 THEN 'Less than 1 Year'
        WHEN YearsSinceLastPromotion BETWEEN 1 AND 2 THEN '1-2 Years'
        WHEN YearsSinceLastPromotion BETWEEN 3 AND 5 THEN '3-5 Years'
        ELSE '6+ Years'
    END AS Promotion_Wait_Group,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,
    CAST(
        SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Attrition_Rate_Percent
FROM dbo.EmployeeData
GROUP BY
    CASE
        WHEN YearsSinceLastPromotion = 0 THEN 'Less than 1 Year'
        WHEN YearsSinceLastPromotion BETWEEN 1 AND 2 THEN '1-2 Years'
        WHEN YearsSinceLastPromotion BETWEEN 3 AND 5 THEN '3-5 Years'
        ELSE '6+ Years'
    END
ORDER BY Attrition_Rate_Percent DESC;


/* ========================================================
   QUERY 48
   ======================================================== */

/* Analyze employee attrition across different distance-from-home groups */
SELECT
    CASE
        WHEN DistanceFromHome <= 5 THEN '0-5'
        WHEN DistanceFromHome BETWEEN 6 AND 10 THEN '6-10'
        WHEN DistanceFromHome BETWEEN 11 AND 20 THEN '11-20'
        ELSE '21+'
    END AS Distance_Group,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,
    CAST(
        SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Attrition_Rate_Percent
FROM dbo.EmployeeData
GROUP BY
    CASE
        WHEN DistanceFromHome <= 5 THEN '0-5'
        WHEN DistanceFromHome BETWEEN 6 AND 10 THEN '6-10'
        WHEN DistanceFromHome BETWEEN 11 AND 20 THEN '11-20'
        ELSE '21+'
    END
ORDER BY Attrition_Rate_Percent DESC;


/* ========================================================
   QUERY 49
   ======================================================== */

/* Analyze employee attrition based on job involvement levels */
SELECT
    JobInvolvement,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,
    CAST(
        SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Attrition_Rate_Percent
FROM dbo.EmployeeData
GROUP BY JobInvolvement
ORDER BY Attrition_Rate_Percent DESC;


/* ========================================================
   QUERY 50
   ======================================================== */

/* Analyze employee attrition based on the number of training sessions completed */
SELECT
    TrainingTimesLastYear,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,
    CAST(
        SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Attrition_Rate_Percent
FROM dbo.EmployeeData
GROUP BY TrainingTimesLastYear
ORDER BY TrainingTimesLastYear;