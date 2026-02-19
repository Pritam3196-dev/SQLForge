ALTER SESSION SET CURRENT_SCHEMA = cred_kart; -- cred_kart

-- Drop tables if they exist
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE CUSTOMERS CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE PRODUCTS CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE ORDERS CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE PAYMENTS  CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE ORDER_ITEMS CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE SHIPMENTS CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        NULL; -- Ignore errors if tables don't exist
END;
/
 

--?? CUSTOMERS
CREATE TABLE CUSTOMERS (
  CUSTOMER_ID NUMBER PRIMARY KEY,
  FIRST_NAME VARCHAR2(100),
  LAST_NAME VARCHAR2(50),
  EMAIL VARCHAR2(100),
  PHONE NUMBER,
  CITY VARCHAR2(50),
  STATE VARCHAR2(10),
  CREATED_DAT DATE
);


--?? PRODUCTS
CREATE TABLE PRODUCTS (
  PRODUCT_ID NUMBER PRIMARY KEY,
  PRODUCT_NAME VARCHAR2(100),
  CATEGORY VARCHAR2(50),
  PRICE NUMBER,
  STOCK_QTY NUMBER
);

--? ORDERS
CREATE TABLE ORDERS (
  ORDER_ID NUMBER PRIMARY KEY,
  CUSTOMER_ID NUMBER,
  ORDER_DAT DATE,
  ORDER_STATUS VARCHAR2(20),
  TOTAL_AMOUNT NUMBER
);

-- ORDER_ITEMS
CREATE TABLE ORDER_ITEMS (
  ORDER_ITEM_ID NUMBER PRIMARY KEY,
  ORDER_ID NUMBER,
  PRODUCT_ID NUMBER,
  QUANTITY NUMBER,
  PRICE NUMBER
);

--PAYMENTS

CREATE TABLE PAYMENTS (
  PAYMENT_ID NUMBER PRIMARY KEY,
  ORDER_ID NUMBER,
  PAYMENT_DATE DATE,
  PAYMENT_MODE VARCHAR2(200),
  PAYMENT_STATUS VARCHAR2(20),
  AMOUNT NUMBER
);

--? SHIPMENTS
CREATE TABLE SHIPMENTS (
  SHIPMENT_ID NUMBER PRIMARY KEY,
  ORDER_ID NUMBER,
  SHIPPED_DATE DATE,
  DELIVERY_DATE DATE,
  STATUS VARCHAR2(20)
);



--------------------------


ALTER TABLE orders
  ADD CONSTRAINT fk_orders_customer
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id);

ALTER TABLE order_items
  ADD CONSTRAINT fk_items_order
  FOREIGN KEY (order_id) REFERENCES orders(order_id);

ALTER TABLE order_items
  ADD CONSTRAINT fk_items_product
  FOREIGN KEY (product_id) REFERENCES products(product_id);

ALTER TABLE payments
  ADD CONSTRAINT fk_payments_order
  FOREIGN KEY (order_id) REFERENCES orders(order_id);

ALTER TABLE shipments
  ADD CONSTRAINT fk_shipments_order
  FOREIGN KEY (order_id) REFERENCES orders(order_id);
  
  
  
 
ALTER TABLE products
  ADD CONSTRAINT chk_products_stock_nonneg
  CHECK (stock_qty >= 0);

 

ALTER TABLE order_items
  ADD CONSTRAINT chk_items_price_nonneg
  CHECK (price >= 0);

ALTER TABLE orders
  ADD CONSTRAINT chk_orders_total_nonneg
  CHECK (total_amount >= 0);

ALTER TABLE payments
  ADD CONSTRAINT chk_payments_amount_nonneg
  CHECK (amount >= 0);




 
 
ALTER TABLE shipments
  ADD CONSTRAINT chk_shipments_status
  CHECK (status IN ('PACKED','SHIPPED','IN_TRANSIT','DELIVERED','RETURNED','CANCELLED'));



ALTER TABLE shipments
  ADD CONSTRAINT chk_ship_dates
  CHECK (
    shipped_date IS NULL
    OR delivery_date IS NULL
    OR delivery_date >= shipped_date
  );












--Questions 
-- =======================================================

-- Q01. Find customers having duplicate EMAIL. Show EMAIL, count.


select 
      customer_id,
      count(email) as No_of_emails 
from 
      customers 
group by 
      customer_id
having 
      count(customer_id) > 1;

-- Q02. Find customers where PHONE is missing (NULL). Show CUSTOMER_ID, FIRST_NAME, LAST_NAME, EMAIL, CITY, STATE.


select customer_id , 
       first_name , 
       last_name , 
       email , 
       phone , 
       city , 
       state 
from 
       customers 
where 
       phone is null;


-- Q03. Find Top 10 states by number of customers. Show STATE, CUSTOMER_COUNT.


-- CTE(Common Table Expression)

with CTE_Top_10_state AS(

select 
      state , 
      count(customer_id) as no_of_customers , 
      Dense_Rank() over(order by count(customer_id) desc) as Rank_state
from 
      customers 
group by 
      state

)

select * from CTE_Top_10_state where Rank_state <= 10;



-- Q04. Find out-of-stock products grouped by CATEGORY. Show CATEGORY, OUT_OF_STOCK_COUNT.


with CTE_out_of_stock AS(

select * from products where stock_qty = 0

)

select 
     category , 
     sum(stock_qty) as total_stock 
from 
     CTE_out_of_stock 
group by 
     category 
having 
     sum(stock_qty) = 0;





-- Q05. Show order status summary: ORDER_STATUS, TOTAL_ORDERS, TOTAL_SALES, AVG_ORDER_VALUE.


select 
      order_status , 
      count(order_id) as Total_orders , 
      sum(Total_Amount) as Total_Sales , 
      round(avg(order_ID) , 3) as avg_order_value
from 
     orders
group by 
     order_status;



-- Q06. Month-wise customer onboarding: show YYYY-MM and number of customers created.



select 
     To_char(created_date , 'Mon') as Month, 
     count(customer_id) as no_of_customers 
from 
     customers 
group by 
     To_Char(Created_date , 'Mon');



-- Q07. List customers created in last 90 days (SYSDATE). Show 50 rows latest first. 

select 
      created_date , 
      customer_id 
from 
      customers 
where 
      created_date >= sysdate - 90 
and 
      created_Date <= sysdate;



-- Q08. Find customers from CA, TX, NY created in 2024 only.


select state , 
       To_char(Created_Date ,'YYYY') 
from 
       customers 
where 
       To_char(Created_date  , 'YYYY') = '2024';



-- Q09. Find products priced above $2400 (premium list).  

select * from products where price > 2400;




-- Q10. CATEGORY-wise price stats: MIN, MAX, AVG price.

select 
      category , 
      min(price) as min_price , 
      max(price) as max_price , 
      round(avg(price) , 2) as avg_price 
from 
      products 
group by 
      category;


-- Q11. Find orders placed in 2025 with TOTAL_AMOUNT > 10000.


select 
       * 
from  
       orders 
where 
       To_char(order_date , 'YYYY') = '2025'
and 
       Total_Amount > 10000;

-- Q12. Top 20 customers by total purchase amount .


with CTE_Top_20_customers AS(

select 
      customer_id , 
      sum(Total_Amount) as Total_Amount , 
      Dense_Rank() over(order by sum(Total_Amount) desc) as Rank_customer_id
from 
      orders 
group by 
      customer_id 

) 

select * from CTE_Top_20_customers where Rank_customer_id <= 20;




-- Q13. Top 20 customers by total purchase amount only for DELIVERED orders.


with CTE_Top_20_customers_delivered AS(

select 
      o.customer_id , 
      first_name ,  
      last_name , 
      order_status , 
      sum(Total_Amount) as Total_Amount , 
      Dense_Rank() over(order by sum(Total_Amount) desc) as Rank_customer_id
from 
      orders  o 
inner join 
      customers  c 
on 
      o.customer_id = c.customer_id
where 
     order_status = 'DELIVERED'
group by 
     o.customer_id , 
     order_status , 
     first_name , 
     last_name

)

select * from CTE_Top_20_customers_delivered where Rank_customer_id <= 20;


--- or 


with CTE_delivered_orders AS(

select * from orders where order_status = 'DELIVERED'

)
,

CTE_total_amount_customers AS(

select cdo.customer_id , first_name , last_name , sum(Total_Amount) as Total_Amount , 
Dense_Rank() over(order by sum(Total_Amount) desc) as Rank_customer_id
from CTE_delivered_orders cdo inner join customers c on cdo.customer_id = c.customer_id
group by cdo.customer_id  , first_name , last_name

)

select * from CTE_total_amount_customers where Rank_customer_id <= 20;




-- Q14. Customers who have never placed any order.


select 
      * 
from 
      customers 
where 
      customer_id 
not in 
     (select customer_id from orders);



-- Q15. Orders that have more than 4 order-items lines. Show ORDER_ID and item_lines.

select 
      order_id , 
      count(order_item_id) as count_item_id 
from 
     order_items 
group by 
     order_id 
having 
    count(order_item_id) > 4 ;
 .
-- Q16. Top 20 orders by item revenue .


with CTE_Top_20_orders AS(


select 
      order_id , 
      sum(quantity * price) as Total_revenue  , 
      Dense_Rank() over(order by sum(quantity * price) desc) as Rank_total_revenue
from 
      order_items 
group by 
      order_id

) 


select * from CTE_Top_20_orders where Rank_total_revenue <= 20;




-- Q17. Top 15 products by units sold .

with Top_15_products AS(

select 
      oi.product_id , 
      product_name , 
      sum(quantity) as Total_units  , 
      Dense_Rank() over(order by sum(quantity) desc) as Rank_product_id
from 
      order_items oi
inner join 
      products p
on 
     oi.product_id = p.product_id
group by 
      oi.product_id , product_name

)

select * from Top_15_products where Rank_product_id <= 15;


-- Q18. Top 15 products by revenue .


with CTE_top_15_products_revenue AS(

select 
      product_id , 
      sum(quantity * price) as Total_revenue ,
      Dense_Rank() over(order by sum(quantity * price) desc)  as Rank_product_id
from 
      order_items 
group by 
      product_id

) 


select *  from CTE_top_15_products_revenue where Rank_product_id <= 15;


-- Q19. Top 10 categories by revenue.


-- Alter table products rename column category to categoryy;


with CTE_Top_10_category AS(

select p.categoryy  , sum(oi.quantity * oi.price) as Total_revenue , 
Dense_rank() over(order by sum(oi.quantity * oi.price) desc) as Rank_category 
from products p inner join order_items oi 
on p.product_id = oi.product_id 
group by p.categoryy
   
)

select * from CTE_Top_10_category where Rank_category <= 10



   


-- Q20. Products that were never ordered.



select * from products 
where product_id not in (select product_id from order_items);





