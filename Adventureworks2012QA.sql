Tasks to be Performed:

1.Download the AdventureWorks

File Name: AdventureWorks2012.bak

2.Restore Backup

3.Perform the following with the help of the above database:

a.Get all the details from the person table including email ID, phone number and phone number type

SELECT 
    p.FirstName, 
    p.LastName, 
    e.EmailAddress, 
    ph.PhoneNumber AS PhoneNumber, 
    pt.Name AS PhoneNumberType
FROM 
    Person.Person AS p
JOIN 
    Person.EmailAddress AS e ON p.BusinessEntityID = e.BusinessEntityID
JOIN 
    Person.PersonPhone AS ph ON p.BusinessEntityID = ph.BusinessEntityID
JOIN 
    Person.PhoneNumberType AS pt ON ph.PhoneNumberTypeID = pt.PhoneNumberTypeID;


b.Get the details of the sales header order made in May 2011

SELECT *
FROM 
    Sales.SalesOrderHeader
WHERE 
    OrderDate >= '2011-05-01' AND OrderDate < '2011-06-01';


c.Get the details of the sales details order made in the month of May 2011

SELECT *
FROM 
    Sales.SalesOrderDetail
WHERE 
    SalesOrderID IN (
        SELECT SalesOrderID
        FROM Sales.SalesOrderHeader
        WHERE OrderDate >= '2011-05-01' AND OrderDate < '2011-06-01'
    );


d.Get the total sales made in May 2011

SELECT 
    SUM(TotalDue) AS TotalSales
FROM 
    Sales.SalesOrderHeader
WHERE 
    OrderDate >= '2011-05-01' AND OrderDate < '2011-06-01';


e.Get the total sales made in the year 2011 by month order by increasing sales

SELECT 
    MONTH(OrderDate) AS OrderMonth, 
    SUM(TotalDue) AS TotalSales
FROM 
    Sales.SalesOrderHeader
WHERE 
    YEAR(OrderDate) = 2011
GROUP BY 
    MONTH(OrderDate)
ORDER BY 
    TotalSales ASC;


f.Get the total salesmade to the customer with FirstName='Gustavo' and LastName ='Achong' 

SELECT 
    SUM(soh.TotalDue) AS TotalSales
FROM 
    Sales.SalesOrderHeader AS soh
JOIN 
    Person.Person AS p ON soh.CustomerID = p.BusinessEntityID
WHERE 
    p.FirstName = 'Gustavo' AND p.LastName = 'Achong';
