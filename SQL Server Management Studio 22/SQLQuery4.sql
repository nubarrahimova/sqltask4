CREATE DATABASE CUSTOMER
USE CUSTOMER
CREATE TABLE Categories
(
Id INT PRIMARY KEY IDENTITY, 
CategoryName NVARCHAR(30)
)
CREATE TABLE Products
(
 Id INT PRIMARY KEY IDENTITY, 
 ProductName NVARCHAR(30),
 Price INT CHECK(Price>0),
 CategoryId INT NOT NULL,
 FOREIGN KEY (CategoryId) REFERENCES Categories(Id)
)
CREATE TABLE Customers
(
Id INT PRIMARY KEY IDENTITY,
FullName NVARCHAR(70) NOT NULL, 
City NVARCHAR(30)
)
CREATE TABLE Orders
(
Id INT PRIMARY KEY IDENTITY, 
CustomerId INT NOT NULL,
FOREIGN KEY (CustomerId) REFERENCES Customers(ID),
OrderDate DATE
)
CREATE TABLE OrderItems
(
 Id  INT PRIMARY KEY IDENTITY, 
 OrderId INT NOT NULL,
 FOREIGN KEY ( OrderId) REFERENCES Orders(ID),
 ProductId INT NOT NULL, 
 FOREIGN KEY ( ProductId) REFERENCES Products(ID),
 Quantity INT
)
CREATE TABLE Employees
(
Id  INT PRIMARY KEY IDENTITY,
EmployeeName NVARCHAR(30),
ReportsTo NVARCHAR(30)
)
INSERT INTO Categories (CategoryName) VALUES
('Electronics'),
('Clothing'),
('Home Appliances'),
('Books')

INSERT INTO Products (ProductName, Price, CategoryId) VALUES
('Laptop', 1500, 1),
('İphone', 2900, 1),
('T-shirt', 25, 2),
('Microwave Oven', 220, 3),
('Refrigerator', 850, 3),
('Novel Book', 18, 4)

INSERT INTO Customers (FullName, City) VALUES
('Nubar Rahimova', 'Baku'),
('Emil Bagirov', 'Ganja'),
('Kamran Huseynov', 'Sumgayit'),
('Revane Asiman', 'Shaki')

INSERT INTO Orders (CustomerId, OrderDate) VALUES
(1, '2025-11-10'),
(2, '2025-11-11'),
(3, '2025-11-12'),
(4, '2025-11-13'),
(1, '2025-11-14')

INSERT INTO OrderItems (OrderId, ProductId, Quantity) VALUES
(1, 1, 1),   
(1, 3, 2),  
(2, 2, 1), 
(2, 4, 1),   
(3, 6, 3),  
(4, 5, 1),   
(4, 3, 1), 
(5, 1, 1),  
(5, 6, 2),   
(3, 3, 1)

INSERT INTO Employees (EmployeeName, ReportsTo) VALUES
('Amal Abbasov', 'Director'),
('Sevgi Memmedova', 'Manager'),
('Elvin Abdullayev', 'Manager'),
('Sevinc Aliyeva', 'Director'),
('Kanan Rasulov', 'Supervisor'),
('Amina Hajiyeva', 'Manager')

SELECT  ProductName, Price, CategoryName FROM Products JOIN  Categories ON Products.CategoryId=Categories.Id
SELECT FullName, City, OrderDate FROM Customers JOIN Orders ON Customers.Id=Orders.Id
SELECT OrderId, Quantity,ProductName FROM  OrderItems JOIN   Products ON OrderItems.Id=Products.Id
SELECT  Quantity ,Price ,(Quantity * Price) AS TotalAmount FROM OrderItems JOIN Products ON OrderItems.ProductId=Products.Id
SELECT TOP 3  Quantity AS TotalQuantity,ProductName FROM OrderItems JOIN Products ON  OrderItems.ProductId=Products.Id
SELECT   E.EmployeeName , M.EmployeeName FROM Employees E  JOIN Employees M  ON E.ReportsTo = M.ReportsTo
SELECT   Price AS ProductCount,CategoryName  FROM  Products JOIN Categories ON   Products.CategoryId=Categories.Id
SELECT TOP 1  ProductName, Price FROM Products
SELECT FullName, Price AS SpentAmount FROM Customers JOIN Products ON Customers.Id=Products.ID