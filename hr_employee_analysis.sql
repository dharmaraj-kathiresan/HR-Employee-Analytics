-- HR Employee Analytics
-- Database: PostgreSQL

-- 1. View total employees
SELECT COUNT(*) AS total_employees
FROM hr_employee;


-- 2. Employees who left the company
SELECT COUNT(*) AS employees_left
FROM hr_employee
WHERE attrition = 'Yes';


-- 3. Employees who stayed
SELECT COUNT(*) AS employees_stayed
FROM hr_employee
WHERE attrition = 'No';


-- 4. Attrition rate
SELECT
    ROUND(
        100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS attrition_rate
FROM hr_employee;


-- 5. Attrition by department
SELECT
    department,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS attrition_rate
FROM hr_employee
GROUP BY department
ORDER BY attrition_rate DESC;


-- 6. Attrition by job role
SELECT
    jobrole,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS attrition_rate
FROM hr_employee
GROUP BY jobrole
ORDER BY attrition_rate DESC;


-- 7. Attrition by overtime
SELECT
    overtime,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS attrition_rate
FROM hr_employee
GROUP BY overtime
ORDER BY attrition_rate DESC;


-- 8. Attrition by gender
SELECT
    gender,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS attrition_rate
FROM hr_employee
GROUP BY gender
ORDER BY attrition_rate DESC;


-- 9. Average years at company
SELECT
    ROUND(AVG(yearsatcompany), 2) AS average_years_at_company
FROM hr_employee;


-- 10. Attrition by job satisfaction
SELECT
    jobsatisfaction,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS attrition_rate
FROM hr_employee
GROUP BY jobsatisfaction
ORDER BY jobsatisfaction;


-- 11. Attrition by work-life balance
SELECT
    worklifebalance,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        100.0 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS attrition_rate
FROM hr_employee
GROUP BY worklifebalance
ORDER BY worklifebalance;