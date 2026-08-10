# Bank Customer Churn Analysis

End-to-end bank customer churn analysis using PostgreSQL, Python, and Tableau to identify churn patterns, customer segments, and actionable business insights.

---

## 📌 Project Overview

Customer churn is an important business problem for banks because losing existing customers can affect revenue, customer lifetime value, and long-term growth.

This project analyzes bank customer data to understand:

- Overall customer churn
- Churn patterns across different customer characteristics
- Geographic differences in churn
- Customer behavior and account characteristics
- Customer segments based on business-relevant attributes
- Factors associated with higher customer churn

The project follows an end-to-end data analytics workflow from data exploration and SQL analysis to Python-based EDA, customer segmentation, and dashboard visualization.

---

## 🎯 Business Objectives

The main objectives of this project are:

1. Measure the overall customer churn rate.
2. Identify customer groups with higher churn.
3. Analyze churn across countries.
4. Examine the relationship between churn and customer demographics.
5. Analyze the impact of account characteristics such as tenure, balance, products, and activity.
6. Segment customers into meaningful groups.
7. Create visual dashboards to communicate key findings.
8. Provide actionable business insights for customer retention.

---

## 🗂️ Dataset

The project uses the European Bank Customer Churn dataset.

The main customer-level attributes include:

- Customer ID
- Surname
- Credit Score
- Geography
- Gender
- Age
- Tenure
- Balance
- Number of Products
- Credit Card Status
- Active Member Status
- Estimated Salary
- Churn Status (`Exited`)

### Target Variable

`Exited`

- `0` → Customer stayed
- `1` → Customer left

---

## 🛠️ Tools & Technologies

- **PostgreSQL** – Data storage and SQL business analysis
- **Python** – Data cleaning, exploratory data analysis, and segmentation
- **Pandas** – Data manipulation
- **NumPy** – Numerical operations
- **Matplotlib** – Data visualization
- **Seaborn** – Statistical visualization
- **Tableau** – Interactive dashboard and business visualization
- **Jupyter Notebook** – Analysis environment
- **GitHub** – Project version control and documentation

---

## 🔄 Project Workflow

```text
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
Correlation & Distribution Analysis
     ↓
Customer Segmentation
     ↓
Tableau Dashboard
     ↓
Business Insights
