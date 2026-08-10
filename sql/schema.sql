-- Bank Customer Churn Analysis
-- Table structure for imported European Bank customer data

DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    Year INTEGER,
    CustomerId BIGINT,
    Surname VARCHAR(100),
    CreditScore INTEGER,
    Geography VARCHAR(50),
    Gender VARCHAR(10),
    Age INTEGER,
    Tenure INTEGER,
    Balance DOUBLE PRECISION,
    NumOfProducts INTEGER,
    HasCrCard INTEGER,
    IsActiveMember INTEGER,
    EstimatedSalary DOUBLE PRECISION,
    Exited INTEGER
);
