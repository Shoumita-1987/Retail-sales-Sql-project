SELECT
    SUM(p.SellingPrice * od.Quantity) AS TotalRevenue
FROM Products p
JOIN OrderDetails od
ON p.ProductID = od.ProductID;
SELECT
    SUM(p.CostPrice * od.Quantity) AS TotalCost
FROM Products p
JOIN OrderDetails od
ON p.ProductID = od.ProductID;
SELECT
    SUM((p.SellingPrice - p.CostPrice) * od.Quantity) AS TotalProfit
FROM Products p
JOIN OrderDetails od
ON p.ProductID = od.ProductID;
SELECT TOP 10
    c.CustomerName,
    SUM(p.SellingPrice * od.Quantity) AS Revenue
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID
JOIN OrderDetails od
ON o.OrderID = od.OrderID
JOIN Products p
ON od.ProductID = p.ProductID
GROUP BY c.CustomerName
ORDER BY Revenue DESC;
SELECT TOP 10
    p.ProductName,
    SUM(od.Quantity) AS QuantitySold
FROM Products p
JOIN OrderDetails od
ON p.ProductID = od.ProductID
GROUP BY p.ProductName
ORDER BY QuantitySold DESC;
SELECT
    p.Category,
    SUM(p.SellingPrice * od.Quantity) AS Revenue
FROM Products p
JOIN OrderDetails od
ON p.ProductID = od.ProductID
GROUP BY p.Category
ORDER BY Revenue DESC;
SELECT
    c.State,
    SUM(p.SellingPrice * od.Quantity) AS Revenue
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID
JOIN OrderDetails od
ON o.OrderID = od.OrderID
JOIN Products p
ON od.ProductID = p.ProductID
GROUP BY c.State
ORDER BY Revenue DESC;
SELECT
    YEAR(o.OrderDate) AS SalesYear,
    MONTH(o.OrderDate) AS SalesMonth,
    SUM(p.SellingPrice * od.Quantity) AS Revenue
FROM Orders o
JOIN OrderDetails od
ON o.OrderID = od.OrderID
JOIN Products p
ON od.ProductID = p.ProductID
GROUP BY
    YEAR(o.OrderDate),
    MONTH(o.OrderDate)
ORDER BY
    SalesYear,
    SalesMonth;
    SELECT
    PaymentMethod,
    COUNT(*) AS TotalOrders
FROM Orders
GROUP BY PaymentMethod
ORDER BY TotalOrders DESC;
SELECT
    AVG(OrderValue) AS AverageOrderValue
FROM
(
    SELECT
        o.OrderID,
        SUM(p.SellingPrice * od.Quantity) AS OrderValue
    FROM Orders o
    JOIN OrderDetails od
    ON o.OrderID = od.OrderID
    JOIN Products p
    ON od.ProductID = p.ProductID
    GROUP BY o.OrderID
) AS OrderSummary;

