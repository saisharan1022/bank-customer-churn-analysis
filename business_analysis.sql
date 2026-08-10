--How many customers do we have?
SELECT COUNT(*) AS TOTAL_CUSTOMERS
FROM CUSTOMERS;

--How many customers churned?
SELECT                                                                      
    Exited,
    COUNT(*) AS total_customers
FROM customers
GROUP BY Exited;
/*
0 => CUSTOMER STAYED
1 => CUSTOMER LEFT
*/

--Churn Percentage
SELECT
    Exited,
    COUNT(*) AS customers,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM customers), 2) AS percentage
FROM customers
GROUP BY Exited;

--Customers by Country
SELECT GEOGRAPHY,
		COUNT(*) AS TOTAL_CUSTOMERS
FROM CUSTOMERS 
GROUP BY GEOGRAPHY
ORDER BY TOTAL_CUSTOMERS DESC;

--Churn by Country
SELECT
    Geography,
    Exited,
    COUNT(*) AS total_customers
FROM customers
GROUP BY Geography, Exited
ORDER BY Geography, Exited;--
















SELECT * FROM CUSTOMERS;
