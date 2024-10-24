USE PORTFOLIO_PROJECT;

SELECT * FROM pizza_sales;
--TOTAL REVENUE--
SELECT SUM(TOTAL_PRICE) AS TOTAL_REVENUE FROM PIZZA_SALES;

--AVERAGE ORDER VALUE--
SELECT (SUM(TOTAL_PRICE) / COUNT(DISTINCT ORDER_ID))  
AS  AVG_ORDER_VALUE FROM PIZZA_SALES; 

--TOTAL PIZZA SOLD--
SELECT SUM(QUANTITY) AS TOTAL_PIZZAS_SOLD FROM pizza_sales;

--TOTAL ORDERS--
SELECT COUNT(DISTINCT ORDER_ID) AS TOTAL_ORDERS FROM PIZZA_SALES;

--AVERAGE PIZZAS PER ORDERS--
SELECT CAST(CAST(SUM(QUANTITY) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT ORDER_ID) AS DECIMAL(10,2)) AS DECIMAL(10,2))                                                   AS AVG_PIZZAS_PER_ORDER                                                                                   
FROM PIZZA_SALES;

--DAILY TREND FOR TOTAL ORDERS--
SELECT DATENAME(DW,ORDER_DATE) AS ORDER_DAY, COUNT(DISTINCT ORDER_ID) AS TOTAL_ORDERS                                                                               
FROM PIZZA_SALES                                                                                                
GROUP BY DATENAME(DW,ORDER_DATE); 

--HOURLY TREND FOR TOTAL ORDERS--
SELECT DATEPART(HOUR,ORDER_TIME) AS ORDER_HOUR,            
COUNT(DISTINCT ORDER_ID) AS TOTAL_ORDERS                                                
FROM PIZZA_SALES
GROUP BY DATEPART(HOUR,ORDER_TIME)
ORDER BY DATEPART(HOUR,ORDER_TIME);

--MONTHLY TREND FOR TOTAL ORDERS--
SELECT DATENAME(MONTH,ORDER_DATE) AS MONTH_NAME,COUNT(DISTINCT ORDER_ID) AS TOTAL_ORDERS   
FROM PIZZA_SALES                                                                                                   
GROUP BY DATENAME(MONTH,ORDER_DATE);


--PERCENTAGE OF SALES BY PIZZA CATEGORY--
SELECT PIZZA_CATEGORY,SUM(TOTAL_PRICE)*100 /
(SELECT SUM(TOTAL_PRICE) FROM PIZZA_SALES)     
FROM PIZZA_SALES                           
GROUP BY PIZZA_CATEGORY;

--PERCENTAGE OF SALES BY PIZZA SIZE--
SELECT PIZZA_SIZE,CAST(SUM(TOTAL_PRICE)*100 /  
(SELECT SUM(TOTAL_PRICE) FROM PIZZA_SALES) AS DECIMAL(10,2)) AS PCT   
FROM PIZZA_SALES  
GROUP BY PIZZA_SIZE;

--TOTAL PIZZA SOLD BY PIZZA CATEGORY--
SELECT PIZZA_CATEGORY,SUM(QUANTITY) AS TOTAL_PIZZA                           
FROM PIZZA_SALES                                                         
GROUP BY PIZZA_CATEGORY                                         
ORDER BY TOTAL_PIZZA DESC;

--TOP 5 BEST SELLERS BY REVENUE,TOTAL QUANTITY AND TOTAL ORDERS--
SELECT TOP 5 PIZZA_NAME,      
SUM(QUANTITY) AS TOTAL_QUANTITY,SUM(TOTAL_PRICE) AS TOTAL_REVENUE 
FROM PIZZA_SALES 
GROUP BY PIZZA_NAME       
ORDER BY TOTAL_REVENUE DESC;

--BUTTOM 5 BEST SELLERS BY REVENUE,TOTAL QUANTITY AND TOTAL ORDERS--
SELECT TOP 5 PIZZA_NAME,
SUM(QUANTITY) AS TOTAL_QUANTITY,SUM(TOTAL_PRICE) AS TOTAL_REVENUE FROM PIZZA_SALES   
GROUP BY PIZZA_NAME     
ORDER BY TOTAL_REVENUE ASC;

--TOP 5 BEST SELLERS BY TOTAL QUANTITY--
SELECT TOP 5 PIZZA_NAME,SUM(QUANTITY) AS TOTAL_QUANTITY             
FROM PIZZA_SALES           
GROUP BY PIZZA_NAME      
ORDER BY TOTAL_QUANTITY DESC;

--BUTTOM 5 BEST SELLERS BY TOTAL QUANTITY--
SELECT TOP 5 PIZZA_NAME,SUM(QUANTITY) AS TOTAL_QUANTITY               
FROM PIZZA_SALES                                                
GROUP BY PIZZA_NAME                                 
ORDER BY TOTAL_QUANTITY ASC;

--TOP 5 BEST SELLERS BY TOTAL ORDERS--
SELECT TOP 5 PIZZA_NAME,COUNT(DISTINCT ORDER_ID) AS TOTAL_ORDERS       
FROM PIZZA_SALES                                       
GROUP BY PIZZA_NAME                                    
ORDER BY TOTAL_ORDERS DESC;

--BUTTOM 5 BEST SELLERS BY TOTAL ORDERS--
SELECT TOP 5 PIZZA_NAME,COUNT(DISTINCT ORDER_ID) AS TOTAL_ORDERS
FROM PIZZA_SALES  
GROUP BY PIZZA_NAME           
ORDER BY TOTAL_ORDERS ASC;








