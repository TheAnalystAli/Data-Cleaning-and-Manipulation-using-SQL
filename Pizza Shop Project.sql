--VIEWING THE DATA:

SELECT* 
FROM PizzaSales
ORDER BY pizza_id;

--EVALUATING TOTAL REVENUE:

SELECT total_price FROM PizzaSales;

SELECT SUM(total_price) AS Total_Revenue FROM PizzaSales; 

--EVALUATING AVERAGE ORDER VALUE:

SELECT* 
FROM PizzaSales
ORDER BY pizza_id;

SELECT SUM(total_price)/ COUNT(DISTINCT order_id) AS Avg_Order_Value
FROM PizzaSales;

--TOTAL PIZZAS SOLD:

SELECT* 
FROM  PizzaSales
ORDER BY pizza_id;

SELECT SUM(quantity) AS Total_Pizzas_Sold FROM PizzaSales;

--TOTAL ORDERS PLACED:

SELECT* 
FROM PizzaSales
ORDER BY pizza_id;

SELECT COUNT(DISTINCT order_id) AS Total_orders FROM PizzaSales;

--AVERAGE PIZZA PER ORDER:

SELECT* 
FROM PizzaSales
ORDER BY pizza_id;

SELECT SUM(quantity)/COUNT(DISTINCT order_id) AS Avg_Pizza_order
FROM PizzaSales;

--EVALUATING TOTAL SALES ON EACH DAY OF A WEEK:

SELECT DATENAME(DW, order_date) AS Order_Day, COUNT(DISTINCT order_id) AS Total_Order
FROM PizzaSales
GROUP BY DATENAME(DW, order_date);

--EVALUATING TOTAL ORDER FOR THE MONTH:

SELECT* 
FROM PizzaSales
ORDER BY pizza_id;

SELECT DATENAME(MONTH, order_date) AS Month_Name, COUNT(DISTINCT order_id) AS Monthly_Orders
FROM PizzaSales
GROUP BY DATENAME(MONTH, order_date)
ORDER BY Monthly_Orders DESC;

--PERCENTAGE OF SALES BY PIZZA CATEGORY:

SELECT* 
FROM PizzaSales
ORDER BY pizza_id;

SELECT pizza_category, SUM(total_price)*100/ 
(SELECT SUM(total_price) FROM PizzaSales) AS Percentage_sale FROM PizzaSales 
GROUP BY pizza_category;

--PERCENTAGE OF SALES BY PIZZA SIZE:

SELECT * 
FROM PizzaSales
ORDER BY pizza_id;

SELECT pizza_size, SUM(total_price) AS Total_Sales, SUM(total_price)*100/ 
(SELECT SUM(total_price) FROM PizzaSales) AS Percentage_sale FROM PizzaSales 
GROUP BY pizza_size; 

--TOP 5 BEST SELLERS BY REVENUE, TOTAL QUANTITY AND TOTAL ORDER:

SELECT * 
FROM PizzaSales
ORDER BY pizza_id;

SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM PizzaSales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC;

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Quantity
FROM PizzaSales
GROUP BY pizza_name
ORDER BY Total_Quantity DESC;

SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM PizzaSales
GROUP BY pizza_name
ORDER BY Total_Orders DESC;

--BOTTOM 5 BEST SELLERS BY REVENUE, TOTAL QUANTITY AND TOTAL ORDER:

SELECT * 
FROM PizzaSales
ORDER BY pizza_id;

SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM PizzaSales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC;

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Quantity
FROM PizzaSales
GROUP BY pizza_name
ORDER BY Total_Quantity ASC;

SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM PizzaSales
GROUP BY pizza_name
ORDER BY Total_Orders ASC;

