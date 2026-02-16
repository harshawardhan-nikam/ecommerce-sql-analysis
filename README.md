# ecommerce-sql-analysis
# 🛒 E-commerce SQL Data Analysis (MySQL)

## 📌 Project Overview
This project demonstrates SQL-based data analysis using the Olist E-commerce dataset. The objective is to extract business insights from structured data using MySQL queries.

---

## 🎯 Objectives
- Analyze customer orders and revenue
- Identify top-performing product categories
- Examine payment patterns
- Perform joins and aggregations for insights
- Optimize queries using indexes and views

---

## 🛠 Tools Used
- MySQL
- SQL
- Data Analysis

---

## 📂 Dataset
Dataset: Olist Brazilian E-commerce Dataset  
Source: Kaggle

Tables used:

- customers
- orders
- order_items
- payments
- products

---

## 🗄 Database Schema

### Customers
- customer_id
- customer_unique_id
- customer_city
- customer_state

### Orders
- order_id
- customer_id
- order_status
- order_purchase_timestamp

### Order Items
- order_id
- product_id
- price
- freight_value

### Payments
- order_id
- payment_type
- payment_value

### Products
- product_id
- product_category_name

---

## 📊 SQL Concepts Covered

✔ SELECT & WHERE  
✔ ORDER BY  
✔ GROUP BY  
✔ Aggregate Functions (SUM, AVG, COUNT)  
✔ JOINS  
✔ Subqueries  
✔ Views  
✔ Index Optimization  

---

## 🔍 Key Queries & Insights

### ✔ Total Revenue
Calculates total revenue from all orders.

### ✔ Orders by State
Identifies regions with the highest order volume.

### ✔ Revenue by Payment Type
Analyzes customer payment preferences.

### ✔ Product Category Sales
Determines best-selling product categories.

### ✔ High-Value Orders
Finds orders above average payment value.

---

## 📈 Sample Insights

- Total revenue generated from all orders.
- Certain states contribute the highest number of orders.
- Credit card is the most used payment method.
- Some product categories dominate total sales.
- High-value transactions exceed the average payment.

---

## ▶️ How to Run the Project

### 1️⃣ Create Database
sql
CREATE DATABASE ecommerce;
USE ecommerce;
2️⃣ Create Tables

Use the SQL file provided.

3️⃣ Import CSV Files

Use MySQL Workbench Table Import Wizard.

4️⃣ Run Queries

Open:

sql/analysis_queries.sql


Execute queries to generate insights.

👤 Author
Harsh Nikam
