create table  pizza(pizza_id int NOT NULL, pizza_type varchar(100), pizza_price decimal(3,2));
alter table pizza 
add PRIMARY KEY (pizza_id);

select * from pizza;


drop table  pizza;


create table orders(order_id int NOT NULL, order_date Date, order_time Time);
alter table orders
add PRIMARY KEY(order_id);
select* from orders;


create table customers(customer_id int NOT NULL, customer_name varchar(100), customer_phone_number int);

alter table customers
add PRIMARY KEY (customer_id);



alter table customers 
add column (customer_first_name varchar(100),customer_last_name varchar(100));


alter table customers
change column customer_phone_number customer_phone_number varchar(15);

select * from customers;

create table customers_orders(customer_id int,order_id int);

insert into customers_orders(customer_id,order_id)
values(1,1);
insert into customers_orders(customer_id,order_id)
values(2,2);
insert into customers_orders(customer_id,order_id)
values(2,3);
select* from customers_orders;
insert into customers(customer_id,customer_first_name,customer_last_name, customer_phone_number)

 Values (1,'Trevor','Page', 2265554982);


insert into customers(customer_id,customer_first_name,customer_last_name, customer_phone_number)
 Values (2,'John','Doe', 5555559498);
 


create table customers_pizza(pizza_id int NOT NULL, customer_id int NOT NULL);

alter table customers_pizza
add FOREIGN KEY(pizza_id) REFERENCES pizza(pizza_id),
add FOREIGN KEY(customer_id) REFERENCES customers(customer_id);

insert into customers_pizza(pizza_id,customer_id)
values(5,1);
insert into customers_pizza(pizza_id,customer_id)
values(4,1);
insert into customers_pizza(pizza_id,customer_id)
values(1,1);
insert into customers_pizza(pizza_id,customer_id)
values(2,2);
insert into customers_pizza(pizza_id,customer_id)
values(5,1);
insert into customers_pizza(pizza_id,customer_id)
values(4,2);
insert into customers_pizza(pizza_id,customer_id)
values(5,2);
insert into customers_pizza(pizza_id,customer_id)
values(6,2);
select * from customers_pizza;

create table pizza_orders (pizza_id int NOT NULL, order_id int NOT NULL,
FOREIGN KEY(pizza_id) REFERENCES pizza(pizza_id),
FOREIGN KEY(order_id) REFERENCES orders(ordersorder_id));

insert into pizza_orders(pizza_id,order_id)
values(1,1);
insert into pizza_orders(pizza_id,order_id)
values(5,1);
insert into pizza_orders(pizza_id,order_id)
values(4,1);
insert into pizza_orders(pizza_id,order_id)
values(2,2);
insert into pizza_orders(pizza_id,order_id)
values(5,2);
insert into pizza_orders(pizza_id,order_id)
values(3,3);
insert into pizza_orders(pizza_id,order_id)
values(4,3);
insert into pizza_orders(pizza_id,order_id)
values(4,4);
insert into pizza_orders(pizza_id,order_id)
values(6,4);


select* from pizza_orders;
delete from pizza_orders
where pizza_id=3;


insert into orders(order_id, order_date, order_time)
Values(1, 20230910 , 094700);


insert into orders(order_id, order_date, order_time)
Values(2, 20230910 , 132000);


 delete from orders where order_id=3;
 delete from orders where order_id=4;

 
 alter table pizza
 change column pizza_price pizza_price decimal (5,2);
 
 
insert into orders(order_id, order_date, order_time)
Values(3, 20231010 , 103700);


insert into pizza(pizza_id, pizza_type,pizza_price)
values(1,'Pepperoni and Cheese' ,7.99);
insert into pizza(pizza_id, pizza_type,pizza_price)
values(2,'Vegetarian' ,9.99);
insert into pizza(pizza_id, pizza_type,pizza_price)
values(3,'Meat Lovers' ,14.99);
insert into pizza(pizza_id, pizza_type,pizza_price)
values(4,'Hawaian' ,12.99);
insert into pizza(pizza_id, pizza_type,pizza_price)
values(5,'2X Meat Lovers' ,29.98);



insert into pizza(pizza_id, pizza_type,pizza_price)
values(6,'3X Vegetarian' ,29.97);


select* from pizza;
 drop table pizza_place.customers_pizza;