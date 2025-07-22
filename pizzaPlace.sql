CREATE SCHEMA pizza_place;
CREATE TABLE pizza_place.pizzas (
    pizza_id INT NOT NULL PRIMARY KEY,
    pizza_type VARCHAR(100),
    pizza_price DECIMAL(5 , 2 )
);
CREATE TABLE pizza_place.orders (
    order_id INT NOT NULL PRIMARY KEY,
    order_date DATE,
    order_time TIME
);
CREATE TABLE pizza_place.customers (
    customer_id INT NOT NULL PRIMARY KEY,
    customer_first_name VARCHAR(100),
    customer_last_name VARCHAR(100),
    customer_phone_number VARCHAR(15)
);
CREATE TABLE pizza_place.customers_orders (
    customer_id INT,
    order_id INT,
    FOREIGN KEY (customer_id)
        REFERENCES customers (customer_id),
    FOREIGN KEY (order_id)
        REFERENCES orders (order_id)
);
CREATE TABLE pizza_place.customers_pizzas (
    customer_id INT,
    pizza_id INT,
    quantity INT,
    order_id INT,
    FOREIGN KEY (customer_id)
        REFERENCES customers (customer_id),
    FOREIGN KEY (pizza_id)
        REFERENCES pizza (pizza_id)
);
INSERT INTO customers_orders(customer_id, order_id) 
VALUES 
  (1, 1), 
  (2, 2), 
  (2, 3);
INSERT INTO customers(
  customer_id, customer_first_name, 
  customer_last_name, customer_phone_number
) 
VALUES
  (1, 'Trevor', 'Page', '2265554982'), 
  (2, 'John', 'Doe', '5555559498');
INSERT INTO customers_pizzas(pizza_id, customer_id, quantity,order_id) 
VALUES 
  (3, 1, 2,1), 
  (4, 1, 1,1), 
  (1, 1, 1,1), 
  (2, 2, 3,3), 
  (2, 2 , 1,2),
  (3, 2, 2,2), 
  (4, 2, 1,3);
  


INSERT INTO orders(order_id, order_date, order_time) 
VALUES
  (1, 20230910, 094700), 
  (2, 20230910, 132000), 
  (3, 20231010, 103700);
INSERT INTO pizzas(
  pizza_id, pizza_type, pizza_price
) 
VALUES 
  (1, 'Pepperoni and Cheese', 7.99), 
  (2, 'Vegetarian', 9.99), 
  (3, 'Meat Lovers', 14.99), 
  (4, 'Hawaiian', 12.99);
-- sum of customer1's pizza purchases
SELECT 
    c.customer_id,
    customer_first_name,
    customer_last_name,
    SUM(cp.quantity * p.pizza_price) AS total_price
FROM
    customers c
        JOIN
    customers_pizzas cp ON c.customer_id = cp.customer_id
        JOIN
    pizzas p ON cp.pizza_id = p.pizza_id 
    GROUP BY c.customer_id;

  -- orders by customers and date
SELECT 
    o.order_date,
    o.order_id,
    c.customer_id,
    SUM(p.pizza_price * cp.quantity) AS total_price
FROM
    orders o
        JOIN
    customers_orders co ON o.order_id = co.order_id
        JOIN
    customers c ON co.customer_id = c.customer_id
        JOIN
    customers_pizzas cp ON cp.customer_id = c.customer_id
        AND cp.order_id = o.order_id
        JOIN
    pizzas p ON cp.pizza_id = p.pizza_id
GROUP BY o.order_date , c.customer_id , o.order_id;

