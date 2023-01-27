# Sample MySQL Database

This repository contains the database used in
[W3Schools SQL tutorials](https://www.w3schools.com/sql/default.asp).

I cloned the repo https://github.com/AndrejPHP/w3schools-database and made
some changes:

- changed table names to match the ones on W3School's website
- added a text file containing some [query challenges](./queries.txt)
and [its solutions](./queries-answersheet.sql) 
- exported database to [csv files](./csv) 

About the last one, you can play with the `csv` files instead of creating a
`MySQL` database. There is a command-line software called `textql` that allows
you to execute SQL commands against structured text such as `csv`.

## Dataset

The dataset consists of the following tables with their respective columns:

- **Categories**: ID, Name, Description
- **Customers**: ID, Name, Contact, Address, City, PostalCode, Country
- **Employees**: EmployeeID, LastName, FirstName, Birthdate, Photo, Notes
- **OrderDetails**: ID, OrderID, ProductID, Quantity
- **Orders**: ID, CustomerID, EmployeeID, Date, Shipper ID
- **Products**: ID, Name, SupplierID, CategoryID, Unit, Price
- **Shippers**: ID, Name, Phone
- **Suppliers**: ID, Name, Contact, Address, City, PostalCode, Country, Phone

## Importing the SQL file

```shell
myqsl -u yourUserName -p
```

You'll be asked to type your password. Then type your password.

Alternatively, you can enter mysql as root. Type the following:

```shell
sudo mysql
```

Next, within mysql, type:

```shell
source /path/to/w3schools.sql;
```

Of course, you need to replace `/path/to/w3schools.sql` with the
absolute path of the file in your computer.
