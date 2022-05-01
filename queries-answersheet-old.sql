/* run line below if you are using mariadb instead of oracle */
/* SET SQL_MODE='Oracle'; */

/* show the total cost for the given order */
SELECT OrderDetails.OrderID, SUM(OrderDetails.Quantity * Products.Price) as "Total Order Cost" FROM OrderDetails INNER JOIN Products ON OrderDetails.ProductID = Products.ProductID GROUP BY OrderDetails.OrderID;

/* show the customer name for the given order */
SELECT Orders.OrderID, Customers.CustomerName FROM Orders INNER JOIN OrderDetails ON OrderDetails.OrderID = Orders.OrderID INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID GROUP BY Orders.OrderID;

/* show the total cost for the given order */
SELECT OrderDetails.OrderID, Orders.CustomerID, SUM(OrderDetails.Quantity * Products.Price) as Total FROM OrderDetails INNER JOIN Products ON OrderDetails.ProductID = Products.ProductID INNER JOIN Orders ON OrderDetails.OrderID = Orders.OrderId GROUP BY OrderDetails.OrderId;

/* show the total cost for the given order */
SELECT OrderDetails.OrderID, Orders.CustomerID, Customers.CustomerName, SUM(OrderDetails.Quantity * Products.Price) as "Total Order Cost" FROM OrderDetails INNER JOIN Products ON OrderDetails.ProductID = Products.ProductID INNER JOIN Orders ON OrderDetails.OrderID = Orders.OrderID INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID GROUP BY OrderDetails.OrderID ORDER BY Orders.CustomerID;

/* show the total amount spent by a customer */
SELECT CustomerID, CustomerName, SUM(TOTAL) AS "Total amount spent" FROM (SELECT Orders.CustomerID, Customers.CustomerName, SUM(OrderDetails.Quantity * Products.Price) as TOTAL FROM OrderDetails INNER JOIN Products ON OrderDetails.ProductID = Products.ProductID INNER JOIN Orders ON OrderDetails.OrderID = Orders.OrderID INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID GROUP BY OrderDetails.OrderID) GROUP BY CustomerID ORDER BY "Total amount spent" DESC;

/* show how many customers per country */
SELECT Country, COUNT(Country) AS "Total Costumers" FROM Customers GROUP BY Country ORDER BY Country DESC;

/* show the total sales by country */
SELECT Country, SUM(TOTAL) AS "Total sales" FROM (SELECT Orders.CustomerID, Customers.Country, SUM(OrderDetails.Quantity * Products.Price) as TOTAL FROM OrderDetails INNER JOIN Products ON OrderDetails.ProductID = Products.ProductID INNER JOIN Orders ON OrderDetails.OrderID = Orders.OrderID INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID GROUP BY OrderDetails.OrderID) AS CustomersOrdersPrice GROUP BY COUNTRY ORDER BY "Total sales" DESC;

/* show the total sales by employee */
SELECT Employee, SUM("ORDER PRICE") AS "Total Sales" FROM (SELECT Orders.OrderID, Employees.FirstName as Employee, SUM(OrderDetails.Quantity * Products.PRICE) AS "ORDER PRICE" FROM Orders INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID INNER JOIN OrderDetails ON OrderDetails.OrderID = Orders.OrderID INNER JOIN Products ON OrderDetails.ProductID = Products.ProductID GROUP BY Orders.OrderID) AS EmployeesSales GROUP BY Employee ORDER BY "Total Sales" DESC;

/* show the how many products were sold for each product */
SELECT OrderDetails.ProductID, Products.ProductName, SUM(Quantity) AS "Quantity sold" FROM OrderDetails INNER JOIN Products ON Products.ProductID = OrderDetails.ProductID GROUP BY OrderDetails.ProductID ORDER BY "Quantity sold" DESC;

/* show the total sales by product */
SELECT OrderDetails.ProductID, Products.ProductName, SUM(Quantity) AS "Quantity sold", SUM(Quantity * Price) AS "Sales in dollars" From OrderDetails INNER JOIN Products ON Products.ProductID = OrderDetails.ProductID GROUP BY OrderDetails.ProductID ORDER BY "Sales in dollars" DESC;

/* show how many products were sold for each category */
SELECT Categories.CategoryID, Categories.CategoryName, SUM("Product sales") AS "Total sales" FROM (SELECT OrderDetails.ProductID, Products.CategoryID, SUM(Quantity) AS "Product sales" From OrderDetails INNER JOIN Products ON Products.ProductID = OrderDetails.ProductID GROUP BY OrderDetails.ProductID) AS ProductsSales INNER JOIN Categories ON ProductsSales.CategoryID = Categories.CategoryID GROUP BY Categories.CategoryID;

/* show the total sales by category */
SELECT Categories.CategoryID, Categories.CategoryName, SUM(Sales) AS "Total sales" FROM (SELECT OrderDetails.ProductID, CategoryID, SUM(Quantity * Price) AS "Sales" From OrderDetails INNER JOIN Products ON Products.ProductID = OrderDetails.ProductID GROUP BY OrderDetails.ProductID) AS ProductsSales INNER JOIN Categories ON ProductsSales.CategoryID = Categories.CategoryID GROUP BY ProductsSales.CategoryID ORDER BY "Total sales" DESC;
