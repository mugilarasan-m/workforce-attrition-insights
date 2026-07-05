-- Overall attrition rate
SELECT
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_pct
FROM hr_employee_attrition;

-- Attrition by Department
SELECT
    Department,
    COUNT(*) AS total_employees,
    ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_pct
FROM hr_employee_attrition
GROUP BY Department
ORDER BY attrition_rate_pct DESC;

-- Attrition by Job Role
SELECT
    JobRole,
    COUNT(*) AS total_employees,
    ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_pct
FROM hr_employee_attrition
GROUP BY JobRole
ORDER BY attrition_rate_pct DESC;

-- Attrition by OverTime
SELECT
    OverTime,
    COUNT(*) AS total_employees,
    ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_pct
FROM hr_employee_attrition
GROUP BY OverTime;

-- Monthly Income comparison (avg/median) by attrition
SELECT
    Attrition,
    ROUND(AVG(MonthlyIncome), 0) AS avg_income,
    MIN(MonthlyIncome) AS min_income,
    MAX(MonthlyIncome) AS max_income
FROM hr_employee_attrition
GROUP BY Attrition;

-- Age buckets by attrition
SELECT
    CASE
        WHEN Age < 25 THEN '18-24'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS age_bucket,
    Attrition,
    COUNT(*) AS employee_count
FROM hr_employee_attrition
GROUP BY age_bucket, Attrition
ORDER BY age_bucket, Attrition;

-- Attrition by Job Satisfaction
SELECT
    JobSatisfaction,
    COUNT(*) AS total_employees,
    ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_pct
FROM hr_employee_attrition
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;

-- Attrition by Work-Life Balance
SELECT
    WorkLifeBalance,
    COUNT(*) AS total_employees,
    ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_pct
FROM hr_employee_attrition
GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance;

-- Attrition by Tenure Bucket
SELECT
    CASE
        WHEN YearsAtCompany <= 2 THEN '0-2 yrs'
        WHEN YearsAtCompany <= 5 THEN '3-5 yrs'
        WHEN YearsAtCompany <= 10 THEN '6-10 yrs'
        ELSE '10+ yrs'
    END AS tenure_bucket,
    COUNT(*) AS total_employees,
    ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_pct
FROM hr_employee_attrition
GROUP BY tenure_bucket;