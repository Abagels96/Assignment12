create schema pizza_place;
create table pizza_place.pizza(
  pizza_id int not null primary key, 
  pizza_type varchar(100), 
  pizza_price decimal(5, 2)
);
create table pizza_place.orders(
  order_id int not null primary key, order_date date, 
  order_time time
);
create table pizza_place.customers(
  customer_id int not null primary key, 
  customer_first_name varchar(100), 
  customer_last_name varchar(100), 
  customer_phone_number varchar(15)
);
create table pizza_place.customers_orders(
  customer_id int, 
  order_id int, 
  foreign key(customer_id) references customers(customer_id), 
  foreign key(order_id) references orders(order_id)
);
create table pizza_place.customers_pizza(
  customer_id int, 
  pizza_id int, 
  quantity int, 
  foreign key (customer_id) references customers(customer_id), 
  foreign key (pizza_id) references pizza(pizza_id)
);
insert into customers_orders(customer_id, order_id) 
values 
  (1, 1), 
  (2, 2), 
  (2, 3);
insert into customers(
  customer_id, customer_first_name, 
  customer_last_name, customer_phone_number
) 
values 
  (1, 'Trevor', 'Page', 2265554982), 
  (2, 'John', 'Doe', 5555559498);
insert into customers_pizza(pizza_id, customer_id, quantity) 
values 
  (3, 1, 2), 
  (4, 1, 1), 
  (1, 1, 1), 
  (2, 2, 4), 
  (3, 2, 2), 
  (4, 2, 1);
create table pizza_place.pizza_orders (
  pizza_id int not null, 
  order_id int not null, 
  foreign key(pizza_id) references pizza(pizza_id), 
  foreign key(order_id) references orders(order_id)
);
insert into orders(order_id, order_date, order_time) 
values 
  (1, 20230910, 094700), 
  (2, 20230910, 132000), 
  (3, 20231010, 103700);
insert into pizza(
  pizza_id, pizza_type, pizza_price
) 
values 
  (1, 'Pepperoni and Cheese', 7.99), 
  (2, 'Vegetarian', 9.99), 
  (3, 'Meat Lovers', 14.99), 
  (4, 'Hawaian', 12.99);
-- sum of customer1's pizza purchases
select 
  c.customer_id, 
  customer_first_name, 
  customer_last_name, 
  sum(cp.quantity * p.pizza_price) as total_price 
from 
  customers c 
  join customers_pizza cp on c.customer_id = cp.customer_id 
  join pizza p on cp.pizza_id = p.pizza_id 
where 
  c.customer_id = 1;
-- sum of customer 2's pizza purchases
select 
  c.customer_id, 
  customer_first_name, 
  customer_last_name, 
  sum(cp.quantity * p.pizza_price) as total_price 
from 
  customers c 
  join customers_pizza cp on c.customer_id = cp.customer_id 
  join pizza p on cp.pizza_id = p.pizza_id 
where 
  c.customer_id = 2;
SELECT 
  o.order_id, 
  o.order_date, 
  o.order_time, 
  c.customer_id, 
  SUM(cp.quantity * p.pizza_price) AS total_price 
FROM 
  orders o 
  JOIN customers_orders co ON o.order_id = co.order_id 
  JOIN customers c ON co.customer_id = c.customer_id 
  JOIN customers_pizza cp ON cp.customer_id = co.customer_id 
  JOIN pizza p ON cp.pizza_id = p.pizza_id 
GROUP BY 
  o.order_id, 
  o.order_date, 
  o.order_time, 
  c.customer_id;
