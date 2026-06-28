SELECT *
FROM Customers;
SELECT *
FROM Products;
SELECT *
FROM Orders;
SELECT *
FROM OrderDetails;
SELECT
    c.CustomerName,
    o.OrderDate
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID;
SELECT
    p.ProductName,
    od.Quantity
FROM Products p
JOIN OrderDetails od
ON p.ProductID = od.ProductID;
SELECT *
FROM Customers
WHERE City = 'Delhi';
SELECT *
FROM Products
WHERE Category = 'Electronics';
SELECT *
FROM Orders
WHERE PaymentMethod = 'UPI';
SELECT *
FROM Customers
ORDER BY CustomerName;
SELECT *
FROM Products
ORDER BY SellingPrice DESC;
SELECT COUNT(*) AS TotalCustomers
FROM Customers;

SELECT COUNT(*) AS TotalProducts
FROM Products;
SELECT TOP 1 *
FROM Products
ORDER BY SellingPrice DESC;
SELECT TOP 1 *
FROM Products
ORDER BY SellingPrice ASC;
SELECT SUM(Quantity) AS TotalQuantitySold
FROM OrderDetails;
SELECT AVG(SellingPrice) AS AveragePrice
FROM Products;
SELECT MAX(CostPrice) AS HighestCostPrice
FROM Products;
SELECT MIN(CostPrice) AS HighestCostPrice
FROM Products;
SELECT *
FROM Customers
WHERE State = 'Uttar Pradesh';