
CREATE VIEW vw_CustomerOrders1 AS
SELECT
    c.CustomerID,
    c.CustomerName,
    c.City,
    c.State,
    o.OrderID,
    o.OrderDate,
    o.PaymentMethod
FROM Customers c
INNER JOIN Orders o
ON c.CustomerID = o.CustomerID;
GO
SELECT * FROM vw_CustomerOrders1;
CREATE VIEW vw_ProductSales1 AS
SELECT
    p.ProductID,
    p.ProductName,
    p.Category,
    SUM(od.Quantity) AS TotalQuantitySold,
    SUM(p.SellingPrice * od.Quantity) AS TotalRevenue
FROM Products p
INNER JOIN OrderDetails od
ON p.ProductID = od.ProductID
GROUP BY
    p.ProductID,
    p.ProductName,
    p.Category;
GO
SELECT * FROM vw_ProductSales1;
CREATE VIEW vw_CustomerRevenue1 AS
SELECT
    c.CustomerID,
    c.CustomerName,
    SUM(p.SellingPrice * od.Quantity) AS TotalRevenue
FROM Customers c
INNER JOIN Orders o
ON c.CustomerID = o.CustomerID
INNER JOIN OrderDetails od
ON o.OrderID = od.OrderID
INNER JOIN Products p
ON od.ProductID = p.ProductID
GROUP BY
    c.CustomerID,
    c.CustomerName;
GO
SELECT *
FROM vw_CustomerRevenue
ORDER BY TotalRevenue DESC;
CREATE VIEW vw_CategoryRevenue1 AS
SELECT
    p.Category,
    SUM(p.SellingPrice * od.Quantity) AS Revenue
FROM Products p
INNER JOIN OrderDetails od
ON p.ProductID = od.ProductID
GROUP BY p.Category;
GO
SELECT * FROM vw_CategoryRevenue;
CREATE VIEW vw_MonthlySales AS
SELECT
    YEAR(o.OrderDate) AS SalesYear,
    MONTH(o.OrderDate) AS SalesMonth,
    SUM(p.SellingPrice * od.Quantity) AS Revenue
FROM Orders o
INNER JOIN OrderDetails od
ON o.OrderID = od.OrderID
INNER JOIN Products p
ON od.ProductID = p.ProductID
GROUP BY
    YEAR(o.OrderDate),
    MONTH(o.OrderDate);
GO
SELECT *
FROM vw_MonthlySales
ORDER BY SalesYear, SalesMonth;