SELECT
    State,
    COUNT(CustomerID) AS TotalCustomers
FROM Customers
GROUP BY State;
SELECT
    Category,
    COUNT(ProductID) AS TotalProducts
FROM Products
GROUP BY Category;
SELECT
    ProductID,
    SUM(Quantity) AS TotalQuantitySold
FROM OrderDetails
GROUP BY ProductID;
SELECT
    ProductID,
    SUM(Quantity) AS TotalQuantitySold
FROM OrderDetails
GROUP BY ProductID
HAVING SUM(Quantity) > 2;
SELECT
    Category,
    AVG(SellingPrice) AS AveragePrice
FROM Products
GROUP BY Category;
SELECT
    Category,
    MAX(SellingPrice) AS HighestPrice
FROM Products
GROUP BY Category;
SELECT
    Category,
    MIN(SellingPrice) AS LowestPrice
FROM Products
GROUP BY Category;
SELECT
    PaymentMethod,
    COUNT(OrderID) AS TotalOrders
FROM Orders
GROUP BY PaymentMethod;
SELECT
    CustomerName,
    State
FROM Customers
ORDER BY State;
SELECT
    ProductName,
    SellingPrice,
    CostPrice,
    (SellingPrice - CostPrice) AS Profit
FROM Products;
SELECT
    ProductName,
    SellingPrice,

CASE

WHEN SellingPrice >= 30000 THEN 'Premium'

WHEN SellingPrice >=10000 THEN 'Medium'

ELSE 'Budget'

END AS ProductCategory
FROM Products;
SELECT
    ProductName,
    SellingPrice-CostPrice AS Profit
FROM Products
ORDER BY Profit DESC;
SELECT
SUM(p.SellingPrice*od.Quantity) AS TotalSales

FROM Products p

JOIN OrderDetails od

ON p.ProductID=od.ProductID;
SELECT

SUM(p.CostPrice*od.Quantity) AS TotalCost

FROM Products p

JOIN OrderDetails od

ON p.ProductID=od.ProductID;
SELECT

SUM((p.SellingPrice-p.CostPrice)*od.Quantity)

AS TotalProfit

FROM Products p

JOIN OrderDetails od

ON p.ProductID=od.ProductID;
SELECT

TOP 5

p.ProductName,

SUM(od.Quantity) AS QuantitySold

FROM Products p

JOIN OrderDetails od

ON p.ProductID=od.ProductID

GROUP BY p.ProductName

ORDER BY QuantitySold DESC;
SELECT

p.Category,

SUM(p.SellingPrice*od.Quantity) AS Revenue

FROM Products p

JOIN OrderDetails od

ON p.ProductID=od.ProductID

GROUP BY p.Category;
SELECT

MONTH(OrderDate) AS Month,

COUNT(OrderID) AS Orders

FROM Orders

GROUP BY MONTH(OrderDate)

ORDER BY Month;
SELECT *

FROM Customers

WHERE CustomerName LIKE 'A%';
SELECT *

FROM Customers

WHERE CustomerName LIKE '%a';