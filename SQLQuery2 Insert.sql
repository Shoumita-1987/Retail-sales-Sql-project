INSERT INTO Customers
(CustomerID, CustomerName, Gender, City, State, Email, Phone)

VALUES
(101,'Amit Sharma','Male','Delhi','Delhi','amit@gmail.com','9876543210'),
(102,'Priya Singh','Female','Lucknow','Uttar Pradesh','priya@gmail.com','9876543211'),
(103,'Rahul Verma','Male','Mumbai','Maharashtra','rahul@gmail.com','9876543212'),
(104,'Sneha Roy','Female','Kolkata','West Bengal','sneha@gmail.com','9876543213'),
(105,'Rohit Kumar','Male','Patna','Bihar','rohit@gmail.com','9876543214');
INSERT INTO Products
(ProductID, ProductName, Category, CostPrice, SellingPrice)

VALUES
(201,'Laptop','Electronics',45000,52000),
(202,'Mobile','Electronics',18000,22000),
(203,'Office Chair','Furniture',2500,3500),
(204,'Study Table','Furniture',4500,6500),
(205,'Headphones','Electronics',1200,1800);
INSERT INTO Orders
(OrderID, CustomerID, OrderDate, PaymentMethod)

VALUES
(301,101,'2025-01-05','UPI'),
(302,102,'2025-01-06','Credit Card'),
(303,103,'2025-01-07','Cash'),
(304,104,'2025-01-08','Debit Card'),
(305,105,'2025-01-09','UPI');
INSERT INTO OrderDetails
(OrderDetailID, OrderID, ProductID, Quantity)

VALUES
(401,301,201,1),
(402,302,202,2),
(403,303,205,3),
(404,304,203,2),
(405,305,204,1);
INSERT INTO Regions
(RegionID, State, Region)

VALUES
(1,'Delhi','North'),
(2,'Uttar Pradesh','North'),
(3,'Maharashtra','West'),
(4,'West Bengal','East'),
(5,'Bihar','East');
SELECT *
FROM Customers;
SELECT *
FROM Products;
SELECT *
FROM OrderDetails;
SELECT *
SELECT *
FROM Regions;
FROM Orders;