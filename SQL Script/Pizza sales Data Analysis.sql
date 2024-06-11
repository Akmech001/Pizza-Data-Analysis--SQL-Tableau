SELECT * FROM pizza_sales;
-- 1. Total Revenue
SELECT SUM(total_price) AS total_revenue FROM pizza_sales;

-- 2. Average Order Value
SELECT SUM(total_price)/COUNT(DISTINCT order_id) AS AVG_Order_value FROM pizza_sales;

-- 3. Total Pizzas Sold
SELECT SUM(quantity) AS Total_Pizza_Sold FROM pizza_sales;

-- 4. Total Number of Orders
SELECT COUNT(DISTINCT order_id) AS Total FROM pizza_sales;

-- 5. Average Quantity of Pizzas per Order
SELECT CAST( CAST(SUM(quantity) AS DECIMAL(10,2))/CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS AVERAGE FROM pizza_sales;

-- 6. Total Orders by Day of the Week
SELECT DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_day, COUNT(DISTINCT order_id) AS total_orders FROM pizza_sales GROUP BY order_day;

-- 7. Hourly Trend of Orders
SELECT HOUR(order_time) AS order_hours, COUNT(DISTINCT order_id) AS total_orders FROM pizza_sales GROUP BY order_hours ORDER BY order_hours;

-- 8. Percentage of Orders by Pizza Category
SELECT DISTINCT(pizza_category), SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) FROM pizza_sales GROUP BY pizza_category;

-- 9. Percentage of Orders by Pizza Size
SELECT DISTINCT(pizza_size), SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) FROM pizza_sales GROUP BY pizza_size;

-- 10. Sum of Quantity by Pizza Category
SELECT DISTINCT(pizza_category), SUM(quantity) FROM pizza_sales GROUP BY pizza_category;

-- 11. Top 5 Best-Selling Pizzas
SELECT pizza_name, SUM(quantity) FROM pizza_sales GROUP BY pizza_name ORDER BY SUM(quantity) DESC LIMIT 5;

