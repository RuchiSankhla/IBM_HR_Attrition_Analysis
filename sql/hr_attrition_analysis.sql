#Database Setup
CREATE DATABASE ibm_hr_project;
USE ibm_hr_project;

#Data Validation
SELECT * 
FROM hr_attrition
LIMIT 10;

#Overall Attrition Rate
SELECT 
    COUNT(*) AS total_employees,
    SUM(Attrition_Flag) AS employees_left,
    ROUND(SUM(Attrition_Flag) * 100.0 / COUNT(*), 2) AS attrition_rate_percent
FROM hr_attrition;

#Department Risk Analysis
SELECT 
    Department,
    COUNT(*) AS total_emp,
    SUM(Attrition_Flag) AS left_emp,
    ROUND(SUM(Attrition_Flag) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM hr_attrition
GROUP BY Department
ORDER BY attrition_rate DESC;

#Age Group Attrition
SELECT 
    CASE 
        WHEN `ï»¿Age` < 25 THEN 'Below 25'
        WHEN `ï»¿Age` BETWEEN 25 AND 34 THEN '25-34'
        WHEN `ï»¿Age` BETWEEN 35 AND 44 THEN '35-44'
        ELSE '45+' 
    END AS age_group,
    COUNT(*) AS total_emp,
    SUM(Attrition_Flag) AS left_emp,
    ROUND(SUM(Attrition_Flag) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM hr_attrition
GROUP BY age_group
ORDER BY attrition_rate DESC;

#Job Level Analysis
SELECT 
    Job_Level,
    COUNT(*) AS total_emp,
    SUM(Attrition_Flag) AS left_emp,
    ROUND(SUM(Attrition_Flag) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM hr_attrition
GROUP BY Job_Level
ORDER BY attrition_rate DESC;

#Business Travel Impact
SELECT 
    Business_Travel,
    COUNT(*) AS total_emp,
    SUM(Attrition_Flag) AS left_emp,
    ROUND(SUM(Attrition_Flag) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM hr_attrition
GROUP BY Business_Travel
ORDER BY attrition_rate DESC;

#High-Risk Employee Profile
SELECT 
    Job_Level,
    Business_Travel,
    Education_Field,
    COUNT(*) AS total_emp,
    SUM(Attrition_Flag) AS left_emp,
    ROUND(SUM(Attrition_Flag) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM hr_attrition
GROUP BY Job_Level, Business_Travel, Education_Field
ORDER BY attrition_rate DESC
LIMIT 10;