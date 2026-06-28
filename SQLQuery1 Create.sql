CREATE DATABASE RetailSalesDB;

USE RetailSalesDB;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Gender VARCHAR(10),
    City VARCHAR(50),
    State VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    CostPrice DECIMAL(10,2),
    SellingPrice DECIMAL(10,2)
);
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    PaymentMethod VARCHAR(20),

    FOREIGN KEY (CustomerID)
    REFERENCES Customers(CustomerID)
);
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,

    FOREIGN KEY (OrderID)
    REFERENCES Orders(OrderID),

    FOREIGN KEY (ProductID)
    REFERENCES Products(ProductID)
);
CREATE TABLE Regions (
    RegionID INT PRIMARY KEY,
    State VARCHAR(50),
    Region VARCHAR(30)
);
SHOW TABLES;
SELECT name
FROM sys.tables;
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Customers';
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Product';
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Regions';
