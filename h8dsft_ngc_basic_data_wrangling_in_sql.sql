-- Membuat table Customers
CREATE TABLE Customers (
	customer_id SERIAL PRIMARY KEY,
	customer_name text NOT NULL,
	cit text NOT NULL
);

-- Memasukan data ke table Customers
INSERT INTO Customers (customer_name,cit)
VALUES 
	('Jhon Doe','New York'),
	('Jane Smith','Los Angeles'),
	('David Johnson','Chicago');
	
-- Update nama cit menjadi city
ALTER TABLE Orders
RENAME COLUMN customer_id TO customers_id;

-- Membuat table Orders
CREATE TABLE Orders (
	order_id SERIAL PRIMARY KEY,
	customer_id INT,
	FOREIGN KEY(customer_id)
		REFERENCES Customers(customer_id),
	order_date date,
	total_amount int	
);

-- Input data to table Orders
INSERT INTO Orders(customer_id,order_date,total_amount)
VALUES 
	(1,'2022-01-10',100),
	(1,'2022-02-15',150),
	(2,'2022-03-20',200),
	(3,'2022-04-25',50);
	
-- select dengan group by
SELECT 
	Customers.customer_name,
	COUNT(customers_id) as total_orders
FROM
	Customers
INNER JOIN Orders
	ON Orders.customers_id = Customers.customer_id
GROUP BY Customers.customer_name;

