# Pizza Sales Analysis

## Overview

This repository contains SQL queries and a Tableau dashboard used to analyze pizza sales data. The analysis covers various key performance indicators (KPIs) and trends in the sales data.

## Contents

1. **SQL Analysis Script**: `pizza_sales_analysis.sql`
2. **Tableau Dashboard**: `pizza_sales_dashboard.twbx`
3. **Dashboard Image**: `Dashboard_1.png`

## SQL Analysis

The SQL script `pizza_sales_analysis.sql` includes several queries to extract valuable insights from the pizza sales data. The queries cover the following analyses:

1. **Total Revenue**
    - Calculates the total revenue generated from pizza sales.

    ```sql
    SELECT SUM(total_price) AS total_revenue FROM pizza_sales;
    ```

2. **Average Order Value**
    - Computes the average value of an order.

    ```sql
    SELECT SUM(total_price)/COUNT(DISTINCT order_id) AS AVG_Order_value FROM pizza_sales;
    ```

3. **Total Pizzas Sold**
    - Counts the total number of pizzas sold.

    ```sql
    SELECT SUM(quantity) AS Total_Pizza_Sold FROM pizza_sales;
    ```

4. **Total Number of Orders**
    - Counts the total number of distinct orders.

    ```sql
    SELECT COUNT(DISTINCT order_id) AS Total FROM pizza_sales;
    ```

5. **Average Quantity of Pizzas per Order**
    - Calculates the average number of pizzas ordered per order.

    ```sql
    SELECT CAST( CAST(SUM(quantity) AS DECIMAL(10,2))/CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS AVERAGE FROM pizza_sales;
    ```

6. **Total Orders by Day of the Week**
    - Groups the total orders by the day of the week.

    ```sql
    SELECT DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_day, COUNT(DISTINCT order_id) AS total_orders FROM pizza_sales GROUP BY order_day;
    ```

7. **Hourly Trend of Orders**
    - Analyzes the trend of orders placed at different hours of the day.

    ```sql
    SELECT HOUR(order_time) AS order_hours, COUNT(DISTINCT order_id) AS total_orders FROM pizza_sales GROUP BY order_hours ORDER BY order_hours;
    ```

8. **Percentage of Orders by Pizza Category**
    - Calculates the percentage contribution of each pizza category to the total revenue.

    ```sql
    SELECT DISTINCT(pizza_category), SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) FROM pizza_sales GROUP BY pizza_category;
    ```

9. **Percentage of Orders by Pizza Size**
    - Calculates the percentage contribution of each pizza size to the total revenue.

    ```sql
    SELECT DISTINCT(pizza_size), SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) FROM pizza_sales GROUP BY pizza_size;
    ```

10. **Sum of Quantity by Pizza Category**
    - Sums up the quantity of pizzas sold for each category.

    ```sql
    SELECT DISTINCT(pizza_category), SUM(quantity) FROM pizza_sales GROUP BY pizza_category;
    ```

11. **Top 5 Best-Selling Pizzas**
    - Identifies the top 5 best-selling pizzas based on quantity sold.

    ```sql
    SELECT pizza_name, SUM(quantity) FROM pizza_sales GROUP BY pizza_name ORDER BY SUM(quantity) DESC LIMIT 5;
    ```

### Running the SQL Script

1. Ensure you have a MySQL database set up with the `pizza_sales` table populated.
2. Open your MySQL client and load the `pizza_sales_analysis.sql` script.
3. Execute the script to obtain the analysis results.

## Tableau Dashboard

The Tableau dashboard file `pizza_sales_dashboard.twbx` provides a visual representation of the pizza sales data analysis. The dashboard includes various views corresponding to the SQL queries mentioned above.

### Dashboard Views

The Tableau dashboard includes the following views:

1. **Total Revenue and Key Metrics**
    - Displays the total revenue, average order value, total pizzas sold, total orders, and average pizzas per order.

2. **Total Orders by Day of the Week**
    - Bar chart showing the distribution of total orders across different days of the week.

3. **Hourly Trend of Orders**
    - Line chart illustrating the trend of orders placed at different hours of the day.

4. **Percentage of Orders by Pizza Category**
    - Pie chart displaying the percentage contribution of each pizza category to the total revenue.

5. **Percentage of Orders by Pizza Size**
    - Pie chart showing the percentage contribution of each pizza size to the total revenue.

6. **Sum of Quantity by Pizza Category**
    - Treemap visualizing the total quantity of pizzas sold for each category.

7. **Top 5 Best-Selling Pizzas**
    - Bar chart listing the top 5 best-selling pizzas based on quantity sold.

### Using the Tableau Dashboard

1. Ensure you have Tableau installed on your machine.
2. Open the `pizza_sales_dashboard.twbx` file with Tableau.
3. Explore the different views and interact with the data to gain insights.

### Dashboard Preview

![Dashboard 1](https://github.com/Akmech001/Pizza-Data-Analysis--SQL-Tableau/assets/166203049/73ab5b6c-b254-4eee-91b8-92fe76d77e0a)


## Conclusion

This repository provides a comprehensive analysis of pizza sales data through SQL queries and a Tableau dashboard. The insights derived from this analysis can help in making informed business decisions to optimize sales and marketing strategies.

