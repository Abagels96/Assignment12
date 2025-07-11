create table  pizza(pizza_id int not null, pizza_type varchar(100), pizza_price decimal(5,2));
alter table pizza 
add primary key (pizza_id);







create table orders(order_id int not null primary key, order_date date, order_time time);



create table customers(customer_id int not null primary key, customer_first_name varchar(100),customer_last_name varchar(100), customer_phone_number varchar(15));





create table customers_orders(customer_id int,order_id int);

insert into customers_orders(customer_id,order_id)
values(1,1),
(2,2),
(2,3);

insert into customers(customer_id,customer_first_name,customer_last_name, customer_phone_number)

 values (1,'Trevor','Page', 2265554982),
 (2,'John','Doe', 5555559498);
 


create table customers_pizza(pizza_id int not null, customer_id int not null);

alter table customers_pizza
add foreign key(pizza_id) references pizza(pizza_id),
add foreign key(customer_id) references customers(customer_id);

insert into customers_pizza(pizza_id,customer_id)
values(5,1),
(4,1)
,(1,1)
,(2,2)
,(5,1)
,(4,2)
,(5,2)
,(6,2);


create table pizza_orders (pizza_id int not null, order_id int not null,
foreign key(pizza_id) references pizza(pizza_id),
foreign key(order_id) references orders(order_id));

insert into pizza_orders(pizza_id,order_id)
values(1,1)
,(5,1)
,(4,1)
,(2,2)
,(5,2)
,(3,3)
,(4,3)
,(4,4)
,(6,4);


select * from pizza_orders;



insert into orders(order_id, order_date, order_time)
values(1, 20230910 , 094700),
(2, 20230910 , 132000),
(3, 20231010 , 103700);


insert into pizza(pizza_id, pizza_type,pizza_price)
values(1,'Pepperoni and Cheese' ,7.99)
,(2,'Vegetarian' ,9.99)
,(3,'Meat Lovers' ,14.99)
,(4,'Hawaian' ,12.99)
,(5,'2X Meat Lovers' ,29.98)
,(6,'3X Vegetarian' ,29.97);

-- sum of customer1's pizza purchases
select customers.customer_id,customers.customer_first_name, customers.customer_last_name ,sum(pizza_price) as customer1_total from customers 
join  customers_orders co on customers.customer_id=co.customer_id 
join  pizza_orders po on co.order_id= po.order_id
join pizza p on po.pizza_id= p.pizza_id
where customers.customer_id=1;
-- sum of customer2's pizza purchases
select customers.customer_id,customers.customer_first_name, customers.customer_last_name ,sum(pizza_price) as customer1_total from customers 
join  customers_orders co on customers.customer_id=co.customer_id 
join  pizza_orders po on co.order_id= po.order_id
join pizza p on po.pizza_id= p.pizza_id
where customers.customer_id=2;

-- price by customer
select o.order_id,c.customer_id, sum(pizza_price) over(partition by order_id) as order_price from orders o 
join pizza_orders po on o.order_id=po.order_id
join customers_orders co on o.order_id=co.order_id
join customers c on co.customer_id=c.customer_id
join  pizza p on po.pizza_id=p.pizza_id;










