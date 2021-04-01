# W3Schools MySQL Tutorials Database

This repository contains the database W3Schools uses for [their SQL tutorial](https://www.w3schools.com/sql/default.asp).

I cloned the repo https://github.com/AndrejPHP/w3schools-database and did some small changes: I changed the database table names to match the table names in W3Schools website, and I added a text file containing some useful SQL commands for practicing mysql.

I exported the database to csv files in the [csv direcotry](./csv). That way,i you can use them if you prefer to work with `csv` files instead of creating a `MySQL` database.

## About W3Schools

I'm not associated with W3Schools, but I have to give them a big thanks. They provide excellent tutorials on the topic of web development, like the [MySQL tutorials on their website](https://www.w3schools.com/sql/trysql.asp?filename=trysql_select_all).

## Importing the SQL file

### Via Terminal

First, enter mysql in the terminal:

```
myqsl -u yourUserName -p
```

You'll be asked to type your password. Then type your password.

Alternatively, you can enter mysql as root. Type the following:

```
sudo mysql
```

Next, within mysql, type:

```
source /absolute/path/to/w3schools.sql;
```

Of course, you need to replace '/absolute/path/to/w3schools.sql' with the absolute path of the file in your computer.

### Via phpmyadmin

Log in phpmyadmin. On the top navbar, click Import. In the section 'Files to Import' click in the browser button and select the SQL file.

## After importing the SQL file

When the SQL file is executed, it creates a database named __w3schools__ with the following tables:

- Categories
- Customers
- Employees
- Orders
- OrderDetails
- Products
- Shippers
- Suppliers
    
and inserts the respective data. 

You can change the database name if you want by modifying these 2 lines of code

```mysql
CREATE DATABASE IF NOT EXISTS `w3schools`;
USE `w3schools`;
```
