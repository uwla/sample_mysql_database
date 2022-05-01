/* 1. Show the total cost for each order */
select OrderID, sum(Quantity*Price) as "total cost" from Products as P, OrderDetails as O where O.ProductID = P.ProductID group by OrderID;

/* 2. Show the customer name for the orders */
select CustomerName, OrderID from Customers as C, Orders as O where  C.CustomerID = O.CustomerID;

/* 3. Show the total amount spent by each customer */
select CustomerName, sum(Price*Quantity) as "total spent" from Customers as C, OrderDetails as OD, Orders as O, Products as P where C.CustomerID = O.CustomerID and OD.ProductID = P.ProductID and OD.OrderID = O.OrderID  group by C.CustomerID order by "total spent" desc;

/* 4. Show how many customers per country */
select Country, count(*) as "number of customers" from Customers group by Country order by "number of customers" desc;

/* 5. Show the total sales by country */
select Country, sum(Price*Quantity) as "total sales" from Customers as C, OrderDetails as OD, Orders as O, Products as P where C.CustomerID = O.CustomerID and OD.ProductID = P.ProductID and OD.OrderID = O.OrderID group by Country order by "total sales" desc;

/* 6. Show the total sales by employee */
select E.FirstName, E.LastName, sum(Price*Quantity) as "total sold" from OrderDetails as OD, Orders as O, Products as P, Employees as E where OD.ProductID = P.ProductID and OD.OrderID = O.OrderID and E.EmployeeID = O.EmployeeID  group by O.EmployeeID order by "total sold" desc;

/* 7. Show how many products were sold for each product */
select P.ProductName, sum(Quantity) as "total amount" from OrderDetails as OD, Orders as O, Products as P where OD.ProductID = P.ProductID and OD.OrderID = O.OrderID group by P.ProductID order by "total amount" desc;

/* 8. Show the total sales by product */
select P.ProductName, sum(Price*Quantity) as "total sold" from OrderDetails as OD, Orders as O, Products as P where OD.ProductID = P.ProductID and OD.OrderID = O.OrderID group by P.ProductID order by "total sold" desc;

/* 9. Show how many products were sold for each category */
select C.CategoryName, sum(Quantity) as "total quantity sold" from Categories as C, OrderDetails as OD, Orders as O, Products as P where OD.ProductID = P.ProductID and OD.OrderID = O.OrderID and P.CategoryID = C.CategoryID group by C.CategoryID order by "total quantity sold" desc;

/* 10. Show the total sales by category */
select C.CategoryName, sum(Price*Quantity) as "total sold" from Categories as C, OrderDetails as OD, Orders as O, Products as P where OD.ProductID = P.ProductID and OD.OrderID = O.OrderID and P.CategoryID = C.CategoryID group by C.CategoryID order by "total sold" desc;

