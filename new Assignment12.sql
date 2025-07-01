select customers.customer_id,customers.customer_first_name, customers.customer_last_name ,sum(pizza_price) as customer1_total from customers 
join  customers_pizza cp on customers.customer_id=cp.customer_id
join  pizza p on cp.pizza_id= p.pizza_id
where customers.customer_id=1;
-- I need to get them both in one table somehow. 
select customers.customer_id,customers.customer_first_name, customers.customer_last_name, sum(pizza_price) as customer2_total from customers 
join  customers_pizza cp on customers.customer_id=cp.customer_id
join  pizza p on cp.pizza_id= p.pizza_id
where customers.customer_id=2;


select o.order_id,c.customer_id, sum(pizza_price) over(partition by order_id) as order_price from orders o 
join pizza_orders po on o.order_id=po.order_id
join customers_orders co on o.order_id=co.order_id
join customers c on co.customer_id=c.customer_id
join  pizza p on po.pizza_id=p.pizza_id;





delete from customers_pizza  where pizza_id=3;




