-- BANK CUSTOMER CHURN ANALYSIS
-- PostgreSQL Business Analysis Queries

-- 1. TOTAL CUSTOMERS

SELECT COUNT(*) AS total_customers
FROM customers;



-- 2. CUSTOMERS WHO STAYED VS. CHURNED

SELECT
    Exited,
    COUNT(*) AS total_customers
FROM customers
GROUP BY Exited;

/*
0 = CUSTOMER STAYED
1 = CUSTOMER LEFT
*/

-- 3. OVERALL CHURN PERCENTAGE


SELECT
    ROUND(
        SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS churn_percentage
FROM customers;


-- 4. CUSTOMER COUNT AND CHURN RATE BY GEOGRAPHY


SELECT
    Geography,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS churn_rate
FROM customers
GROUP BY Geography
ORDER BY churn_rate DESC;


-- 5. CHURN RATE BY GENDER


SELECT
    Gender,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS churn_rate
FROM customers
GROUP BY Gender
ORDER BY churn_rate DESC;

-- 6. CHURN RATE BY ACTIVE MEMBER STATUS

SELECT
    IsActiveMember,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS churn_rate
FROM customers
GROUP BY IsActiveMember
ORDER BY churn_rate DESC;

-- 7. CHURN RATE BY NUMBER OF PRODUCTS

SELECT
    NumOfProducts,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS churn_rate
FROM customers
GROUP BY NumOfProducts
ORDER BY NumOfProducts;


-- 8. AGE GROUP ANALYSIS

SELECT
    CASE
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 39 THEN '30-39'
        WHEN Age BETWEEN 40 AND 49 THEN '40-49'
        WHEN Age BETWEEN 50 AND 59 THEN '50-59'
        ELSE '60+'
    END AS age_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS churn_rate
FROM customers
GROUP BY age_group
ORDER BY churn_rate DESC;

-- 9. CREDIT SCORE GROUP ANALYSIS

SELECT
    CASE
        WHEN CreditScore < 600 THEN 'Low'
        WHEN CreditScore BETWEEN 600 AND 699 THEN 'Medium'
        WHEN CreditScore BETWEEN 700 AND 799 THEN 'Good'
        ELSE 'Excellent'
    END AS credit_score_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS churn_rate
FROM customers
GROUP BY credit_score_group
ORDER BY churn_rate DESC;


-- 10. TENURE GROUP ANALYSIS

SELECT
    CASE
        WHEN Tenure <= 2 THEN '0-2 Years'
        WHEN Tenure BETWEEN 3 AND 5 THEN '3-5 Years'
        WHEN Tenure BETWEEN 6 AND 8 THEN '6-8 Years'
        ELSE '9-10 Years'
    END AS tenure_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS churn_rate
FROM customers
GROUP BY tenure_group
ORDER BY churn_rate DESC;

-- 11. CUSTOMERS WITH ABOVE-AVERAGE BALANCE

SELECT
    CustomerId,
    Geography,
    Age,
    Balance,
    Exited
FROM customers
WHERE Balance > (
    SELECT AVG(Balance)
    FROM customers
)
ORDER BY Balance DESC;

-- 12. CUSTOMERS WITH ABOVE-AVERAGE SALARY

SELECT
    CustomerId,
    Geography,
    EstimatedSalary,
    Exited
FROM customers
WHERE EstimatedSalary > (
    SELECT AVG(EstimatedSalary)
    FROM customers
)
ORDER BY EstimatedSalary DESC;


-- 13. GEOGRAPHIES WITH ABOVE-AVERAGE CHURN RATE

WITH geography_churn AS (
    SELECT
        Geography,
        COUNT(*) AS total_customers,
        SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned_customers,
        SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) * 100.0
            / COUNT(*) AS churn_rate
    FROM customers
    GROUP BY Geography
)

SELECT
    Geography,
    total_customers,
    churned_customers,
    ROUND(churn_rate, 2) AS churn_rate
FROM geography_churn
WHERE churn_rate > (
    SELECT AVG(churn_rate)
    FROM geography_churn
)
ORDER BY churn_rate DESC;


-- 14. CUSTOMER SEGMENTS BASED ON CHURN RISK

SELECT
    CustomerId,
    Geography,
    Age,
    Balance,
    NumOfProducts,
    IsActiveMember,
    Exited,
    CASE
        WHEN Exited = 1 AND IsActiveMember = 0
            THEN 'High Risk'
        WHEN Exited = 1
            THEN 'Churned'
        WHEN IsActiveMember = 0
            THEN 'Inactive'
        ELSE 'Active'
    END AS customer_status
FROM customers;


-- 15. HIGH-VALUE CHURNED CUSTOMERS

SELECT
    CustomerId,
    Geography,
    Age,
    Balance,
    EstimatedSalary,
    NumOfProducts
FROM customers
WHERE Exited = 1
  AND Balance > (
      SELECT AVG(Balance)
      FROM customers
  )
ORDER BY Balance DESC;


-- 16. COUNTRIES WITH MORE THAN 1,000 CUSTOMERS

SELECT
    Geography,
    COUNT(*) AS total_customers
FROM customers
GROUP BY Geography
HAVING COUNT(*) > 1000
ORDER BY total_customers DESC;


-- 17. PRODUCT SEGMENTS WITH MORE THAN 500 CUSTOMERS

SELECT
    NumOfProducts,
    COUNT(*) AS total_customers,
    ROUND(AVG(Balance), 2) AS average_balance
FROM customers
GROUP BY NumOfProducts
HAVING COUNT(*) > 500
ORDER BY total_customers DESC;


-- 18. CHURN ANALYSIS BY GEOGRAPHY AND ACTIVE STATUS

SELECT
    Geography,
    IsActiveMember,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS churn_rate
FROM customers
GROUP BY Geography, IsActiveMember
ORDER BY Geography, churn_rate DESC;


-- 19. AVERAGE CUSTOMER METRICS BY CHURN STATUS

SELECT
    Exited,
    COUNT(*) AS total_customers,
    ROUND(AVG(Age), 2) AS average_age,
    ROUND(AVG(CreditScore), 2) AS average_credit_score,
    ROUND(AVG(Balance), 2) AS average_balance,
    ROUND(AVG(EstimatedSalary), 2) AS average_salary,
    ROUND(AVG(Tenure), 2) AS average_tenure
FROM customers
GROUP BY Exited;


-- 20. MULTI-FACTOR CHURN ANALYSIS

SELECT
    Geography,
    IsActiveMember,
    NumOfProducts,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS churn_rate
FROM customers
GROUP BY Geography, IsActiveMember, NumOfProducts
HAVING COUNT(*) >= 50
ORDER BY churn_rate DESC;
