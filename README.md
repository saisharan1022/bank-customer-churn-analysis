# Bank Customer Churn Analysis

An end-to-end data analytics project analyzing customer churn in a European banking dataset using PostgreSQL and Python. The project focuses on data exploration, business-oriented SQL analysis, exploratory data analysis, correlation analysis, customer segmentation, and actionable business insights.

---

## 📌 Project Overview

Customer churn is an important business problem for banks because losing existing customers can affect revenue, customer lifetime value, and long-term growth.

This project analyzes customer-level banking data to understand churn patterns and identify customer groups that show higher churn rates.

The project follows a practical data analytics workflow:

Raw Dataset  
↓  
Data Exploration & Cleaning  
↓  
PostgreSQL  
↓  
SQL Business Analysis  
↓  
Python EDA  
↓  
Data Visualization  
↓  
Correlation Analysis  
↓  
Customer Segmentation  
↓  
Business Insights

---

## 🎯 Business Objectives

The main objectives of this project are:

- Measure the overall customer churn rate.
- Identify customer groups with higher churn.
- Analyze churn across different geographical regions.
- Examine the relationship between churn and customer demographics.
- Analyze account characteristics such as balance, tenure, and number of products.
- Analyze customer activity and its relationship with churn.
- Identify patterns using exploratory data analysis.
- Segment customers into meaningful groups.
- Generate actionable business insights from the analysis.

---

## 🗂️ Dataset

The project uses a European Bank Customer Churn dataset containing customer-level information.

### Key Features

| Feature | Description |
|---|---|
| CustomerId | Unique customer identifier |
| Surname | Customer surname |
| CreditScore | Customer credit score |
| Geography | Customer country |
| Gender | Customer gender |
| Age | Customer age |
| Tenure | Number of years with the bank |
| Balance | Customer account balance |
| NumOfProducts | Number of bank products used |
| HasCrCard | Whether the customer has a credit card |
| IsActiveMember | Whether the customer is an active member |
| EstimatedSalary | Estimated customer salary |
| Exited | Customer churn indicator |

### Target Variable

`Exited`

- `0` → Customer stayed
- `1` → Customer left

---

## 🛠️ Tools & Technologies

### Programming & Data Analysis

- Python
- Pandas
- NumPy

### Data Visualization

- Matplotlib
- Seaborn

### Database & SQL

- PostgreSQL
- SQL
- pgAdmin

### Development & Documentation

- Jupyter Notebook
- GitHub

---

## 🔄 Project Workflow

### 1. Data Exploration & Cleaning

The dataset was initially explored to understand:

- Dataset dimensions
- Column names
- Data types
- Missing values
- Duplicate records
- Unique values
- Basic statistical properties

Data cleaning and preprocessing were performed before the main analysis.

### 2. PostgreSQL & SQL Business Analysis

The dataset was loaded into PostgreSQL for structured business analysis.

SQL was used to answer business questions such as:

- How many customers are in the dataset?
- How many customers churned?
- What is the overall churn percentage?
- How many customers are present in each country?
- How does churn vary by geography?
- How does churn vary by gender?
- How does customer activity relate to churn?
- How does the number of products relate to churn?
- Which customer groups show higher churn?

The SQL analysis is available in:

`sql/schema.sql`

`sql/business_analysis.sql`

### 3. Exploratory Data Analysis

Python was used to perform detailed exploratory data analysis.

The analysis includes:

- Data cleaning
- Missing-value analysis
- Duplicate analysis
- Descriptive statistics
- Univariate analysis
- Bivariate analysis
- Churn distribution analysis
- Demographic analysis
- Numerical feature analysis
- Distribution analysis
- Data visualization

### 4. Correlation Analysis

Correlation analysis was performed to examine relationships between numerical variables and understand their association with customer churn.

Correlation analysis was used as an exploratory technique and does not establish causation.

### 5. Customer Segmentation

Customer segmentation was performed to identify meaningful customer groups based on customer characteristics and behavior.

The segmentation analysis helps identify:

- Different customer profiles
- Active and inactive customer groups
- Age-based customer groups
- Churn behavior across customer segments
- Higher-risk customer segments

The resulting segmentation dataset is available in:

`data/customer_segments.csv`

---

## 💡 Key Business Insights

### Overall Churn

The dataset contains 10,000 customers.

Among them, 2,037 customers churned, resulting in an overall churn rate of approximately 20.37%.

This indicates that roughly one in five customers in the dataset left the bank.

### Geographic Churn

Germany recorded a substantially higher churn rate than France and Spain.

Approximate churn rates:

| Geography | Churn Rate |
|---|---:|
| Germany | 32.44% |
| France | 16.15% |
| Spain | 16.67% |

Germany therefore represents an important area for further investigation and customer-retention analysis.

### Customer Activity

Inactive members showed a significantly higher churn rate than active members.

| Customer Status | Churn Rate |
|---|---:|
| Active Member | 14.27% |
| Inactive Member | 26.85% |

This indicates a strong association between customer activity and churn.

Inactive customers may therefore represent an important group for engagement and retention initiatives.

### Number of Products

Churn varies considerably according to the number of products used.

| Number of Products | Churn Rate |
|---:|---:|
| 1 | 27.71% |
| 2 | 7.58% |
| 3 | 82.71% |
| 4 | 100.00% |

The 3-product and 4-product groups contain relatively few customers, so their extremely high churn rates should be interpreted cautiously.

### Gender

Female customers had a higher observed churn rate than male customers.

| Gender | Churn Rate |
|---|---:|
| Female | 25.07% |
| Male | 16.46% |

Gender alone should not be treated as a cause of churn, but the difference is useful for further customer-segment analysis.

### Account Balance

Churned customers had a higher average account balance than retained customers.

| Customer Group | Average Balance |
|---|---:|
| Churned Customers | 91,108.54 |
| Retained Customers | 72,745.30 |

This suggests that customer churn is not limited to customers with low account balances.

### Credit Score and Tenure

The differences in average credit score and tenure between churned and retained customers were relatively smaller than the stronger patterns observed for geography, customer activity, and product usage.

---

## 👥 Customer Segmentation Insights

The customer segmentation analysis identified several groups with relatively high observed churn rates.

| Customer Segment | Churn Rate |
|---|---:|
| 50–60, Inactive | 85.71% |
| 60+, Inactive | 82.02% |
| 40–50, Inactive | 41.60% |
| 50–60, Active | 34.71% |

These segments can help the business prioritize customers for further investigation and targeted retention strategies.

Important: These findings represent patterns and associations observed in the dataset. They do not prove that a specific characteristic directly causes customer churn.

---

## 📈 Business Recommendations

Based on the analysis, the following areas could be considered for customer-retention strategies:

### 1. Improve Engagement Among Inactive Customers

Inactive customers show substantially higher churn than active customers.

The bank could consider targeted engagement campaigns, personalized communication, and relevant product or service recommendations for inactive customers.

### 2. Investigate Geographic Differences

Germany shows a considerably higher churn rate than France and Spain.

The bank should investigate whether differences in customer experience, products, competition, pricing, or regional behavior could explain this variation.

### 3. Prioritize High-Risk Customer Segments

Customer segmentation can be used to identify groups with elevated churn rates.

Retention strategies can be prioritized toward these groups rather than applying the same approach to every customer.

### 4. Investigate Product Usage Patterns

The analysis shows significant differences in churn according to the number of products used.

The unusually high churn observed among customers with three or four products should be investigated further, while considering the smaller sample sizes of these groups.

### 5. Consider High-Value Customers

Churned customers have a higher average account balance than retained customers.

This suggests that some churned customers may represent financially valuable relationships, making targeted retention efforts potentially important.

### 6. Use Data-Driven Retention Strategies

Customer characteristics and behavioral patterns can be combined to identify customers who may require additional attention.

Instead of using a single retention strategy, the bank can consider segment-specific approaches.

---

## 📁 Project Structure

bank-customer-churn-analysis/

├── data/

│   ├── European_Bank.csv

│   └── customer_segments.csv

├── notebooks/

│   ├── 01_Data_Exploration.ipynb

│   ├── 02_PostgreSQL_Connection.ipynb

│   ├── 03_EDA.ipynb

│   └── 04_Customer_Segmentation.ipynb

├── sql/

│   ├── schema.sql

│   └── business_analysis.sql

└── README.md

---

## 🔍 Skills Demonstrated

### SQL & PostgreSQL

- SELECT
- WHERE
- GROUP BY
- HAVING
- ORDER BY
- Aggregate Functions
- CASE Statements
- Conditional Aggregation
- Subqueries
- CTEs
- Business-oriented SQL analysis
- PostgreSQL

### Python

- Pandas
- NumPy
- Data Cleaning
- Data Preprocessing
- Exploratory Data Analysis
- Descriptive Statistics
- Data Visualization
- Correlation Analysis
- Customer Segmentation

### Data Analytics

- Customer Churn Analysis
- Exploratory Data Analysis
- Customer Segmentation
- Pattern Identification
- Business Question Formulation
- Business Insight Generation
- Data-Driven Recommendations

---

## 📓 Analysis Notebooks

The project contains separate notebooks for different stages of the analysis:

### 01_Data_Exploration.ipynb

Initial dataset exploration and understanding of the available variables.

### 02_PostgreSQL_Connection.ipynb

PostgreSQL database connection and SQL-based data analysis.

### 03_EDA.ipynb

Detailed exploratory data analysis, statistical analysis, and visualizations.

### 04_Customer_Segmentation.ipynb

Customer segmentation and analysis of churn behavior across different customer groups.

---

## 🚀 Conclusion

This project demonstrates an end-to-end data analytics workflow for analyzing customer churn.

PostgreSQL was used for structured SQL and business analysis, while Python was used for data exploration, visualization, correlation analysis, and customer segmentation.

The analysis identified meaningful differences in churn across geography, customer activity, product usage, demographics, and customer segments.

These findings can help a bank identify higher-risk customer groups and develop more targeted customer-retention strategies.

---

## 👤 Author

**Sai Saran**

Data Analytics | SQL | Python | PostgreSQL | Excel
