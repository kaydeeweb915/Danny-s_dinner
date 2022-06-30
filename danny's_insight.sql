-- WHAT IS THE TOTAL AMOUNT EACH CUSTOMER SPENT AT THE RESTAURANT

SELECT 
       sales.customer_id,
       menu.product_id,
       menu.product_name,
       SUM(price) AS Total_amount
FROM sales
JOIN menu
ON sales.product_id = menu.product_id
GROUP BY sales.customer_id
ORDER BY SUM(price) DESC;

-- HOW MANY DAYS HAS EACH CUSTOMER VISITED THE RESTAURANT

SELECT customer_id, product_id,
       COUNT(order_date)
FROM sales
GROUP BY customer_id
ORDER BY customer_id ;

-- WHAT ARE THE THE FIRST ITEM FROM THE MENU PURCHASE BY EACH CUSTOMERS

SELECT sales.customer_id,
       sales.order_date,
       menu.product_id,
       menu.product_name AS first_item,
       MIN(order_date) AS first_day
FROM sales
JOIN MENU
ON sales.product_id = menu.product_id
GROUP BY sales.customer_id
ORDER BY menu.product_id ;  

-- WHAT IS THE MOST PURCHASE ITEM ON THE MENU
-- AND NUMBER OF TIMES IT WAS PURCHASE 

SELECT menu.product_name,
       COUNT(sales.product_id) AS Number_of_purchase
FROM sales
JOIN menu
ON sales.product_id = menu.product_id
GROUP BY 1
ORDER BY 2 DESC ;

-- Which item was the most popular for each customer?

SELECT COUNT(sales.product_id) AS most_purchase,
       menu.product_name,
       CASE WHEN COUNT(sales.product_id) >=8
            THEN 'Most Popular'
            WHEN COUNT(sales.product_id) <8 AND  COUNT(sales.product_id) >=4
            THEN 'Not Too Popular'
            WHEN COUNT(sales.product_id) <4 AND  COUNT(sales.product_id) >=3
            THEN 'Least Popular'
            END AS level_of_popular_menu
FROM sales
JOIN menu
ON sales.product_id = menu.product_id
GROUP BY 2 
ORDER BY COUNT(sales.product_id) DESC ;
       
