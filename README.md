# Pizza Sales Data Analysis

## Key Performance Indicators (KPI)

### 1. Total Revenue
```sql
SELECT SUM(total_price) AS total_revenue FROM pizza_sales;
```
**Result:** 817860.049999993

### 2. Average Order Value
```sql
SELECT SUM(total_price)/COUNT(DISTINCT order_id) AS AVG_Order_value FROM pizza_sales;
```
**Result:** 38.307262295081635

### 3. Total Pizzas Sold
```sql
SELECT SUM(quantity) AS Total_Pizza_Sold FROM pizza_sales;
```
**Result:** 49574

### 4. Total Number of Orders
```sql
SELECT COUNT(DISTINCT order_id) AS Total FROM pizza_sales;
```
**Result:** 21350

### 5. Average Quantity of Pizzas per Order
```sql
SELECT CAST( CAST(SUM(quantity) AS DECIMAL(10,2))/CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS AVERAGE FROM pizza_sales;
```
**Result:** 2.32

### 6. Total Orders by Day of the Week
```sql
SELECT DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_day, COUNT(DISTINCT order_id) AS total_orders FROM pizza_sales GROUP BY order_day;
```
**Results:**
- Friday: 3538
- Monday: 2794
- Saturday: 3158
- Sunday: 2624
- Thursday: 3239
- Tuesday: 2973
- Wednesday: 3024

### 7. Hourly Trend of Orders
```sql
SELECT HOUR(order_time) AS order_hours, COUNT(DISTINCT order_id) AS total_orders FROM pizza_sales GROUP BY order_hours ORDER BY order_hours;
```
**Results:**
- 9: 1
- 10: 8
- 11: 1231
- 12: 2520
- 13: 2455
- 14: 1472
- 15: 1468
- 16: 1920
- 17: 2336
- 18: 2399
- 19: 2009
- 20: 1642
- 21: 1198
- 22: 663
- 23: 28

### 8. Percentage of Orders by Pizza Category
```sql
SELECT DISTINCT(pizza_category), SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) FROM pizza_sales GROUP BY pizza_category;
```
**Results:**
- Classic: 26.9059602556699%
- Veggie: 23.682590927384783%
- Supreme: 25.45631126009884%
- Chicken: 23.955137556847493%

### 9. Percentage of Orders by Pizza Size
```sql
SELECT DISTINCT(pizza_size), SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) FROM pizza_sales GROUP BY pizza_size;
```
**Results:**
- M: 30.492044451859723%
- L: 45.8903329487743%
- S: 21.773468455880682%
- XL: 1.7210768517181052%
- XXL: 0.12307729176892906%

### 10. Sum of Quantity by Pizza Category
```sql
SELECT DISTINCT(pizza_category), SUM(quantity) FROM pizza_sales GROUP BY pizza_category;
```
**Results:**
- Classic: 14888
- Veggie: 11649
- Supreme: 11987
- Chicken: 11050

### 11. Top 5 Best-Selling Pizzas
```sql
SELECT pizza_name, SUM(quantity) FROM pizza_sales GROUP BY pizza_name ORDER BY SUM(quantity) DESC LIMIT 5;
```
**Results:**
- The Classic Deluxe Pizza: 2453
- The Barbecue Chicken Pizza: 2432
- The Hawaiian Pizza: 2422
- The Pepperoni Pizza: 2418
- The Thai Chicken Pizza: 2371

---

Each section in the document includes a clear title, the SQL code, and the corresponding results. This structure ensures that each activity is distinctively highlighted and easy to understand.
