SELECT
    ProductName,
    SellingPrice,
    RANK() OVER (ORDER BY SellingPrice DESC) AS ProductRank
FROM Products;
SELECT
    ProductName,
    SellingPrice,
    ROW_NUMBER() OVER (ORDER BY SellingPrice DESC) AS RowNum
FROM Products;
SELECT
    ProductName,
    SellingPrice,
    DENSE_RANK() OVER (ORDER BY SellingPrice DESC) AS DenseRank
FROM Products;
SELECT
    ProductName,
    SellingPrice
FROM Products
WHERE SellingPrice >
(
    SELECT AVG(SellingPrice)
    FROM Products
);
SELECT DISTINCT
    CustomerName
FROM Customers
WHERE CustomerID IN
(
    SELECT CustomerID
    FROM Orders
);
SELECT
    c.CustomerName,
    SUM(p.SellingPrice * od.Quantity) AS TotalSales
FROM Customers c
JOIN Orders o
    ON c.CustomerID = o.CustomerID
JOIN OrderDetails od
    ON o.OrderID = od.OrderID
JOIN Products p
    ON od.ProductID = p.ProductID
GROUP BY c.CustomerName
ORDER BY TotalSales DESC;
SELECT TOP 3
    c.CustomerName,
    SUM(p.SellingPrice * od.Quantity) AS TotalSales
FROM Customers c
JOIN Orders o
    ON c.CustomerID = o.CustomerID
JOIN OrderDetails od
    ON o.OrderID = od.OrderID
JOIN Products p
    ON od.ProductID = p.ProductID
GROUP BY c.CustomerName
ORDER BY TotalSales DESC;
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
WITH SalesSummary AS
(
    SELECT
        p.Category,
        SUM(p.SellingPrice * od.Quantity) AS Revenue
    FROM Products p
    JOIN OrderDetails od
        ON p.ProductID = od.ProductID
    GROUP BY p.Category
)

SELECT *
FROM SalesSummary;
WITH SalesSummary AS
(
    SELECT
        p.Category,
        SUM(p.SellingPrice * od.Quantity) AS Revenue
    FROM Products p
    JOIN OrderDetails od
        ON p.ProductID = od.ProductID
    GROUP BY p.Category
)

SELECT TOP 1 *
FROM SalesSummary
ORDER BY Revenue DESC;
SELECT
    o.OrderDate,
    SUM(p.SellingPrice * od.Quantity) AS DailySales,
    SUM(SUM(p.SellingPrice * od.Quantity))
        OVER (ORDER BY o.OrderDate) AS RunningTotal
FROM Orders o
JOIN OrderDetails od
    ON o.OrderID = od.OrderID
JOIN Products p
    ON od.ProductID = p.ProductID
GROUP BY o.OrderDate
ORDER BY o.OrderDate;
SELECT
    Category,
    AVG(SellingPrice) AS AvgSellingPrice
FROM Products
GROUP BY Category;
SELECT
    ProductName
FROM Products
WHERE ProductID NOT IN
(
    SELECT ProductID
    FROM OrderDetails
);
SELECT
    CustomerName
FROM Customers
WHERE CustomerID NOT IN
(
    SELECT CustomerID
    FROM Orders
);
SELECT
    p.ProductName,
    SUM(p.SellingPrice * od.Quantity) AS Revenue
FROM Products p
JOIN OrderDetails od
    ON p.ProductID = od.ProductID
GROUP BY p.ProductName
ORDER BY Revenue DESC;