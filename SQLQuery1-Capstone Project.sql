-----------Total Sales for each Product Category------------

SELECT Product,SUM(Quantity*UnitPrice) AS TotalSales
FROM SalesData
GROUP BY Product
ORDER BY TotalSales DESC;

---------Find Number of Sales Transactions in each Region----------- 

SELECT Region, COUNT(OrderDate) AS NumTransactions
FROM SalesData
GROUP BY Region;

---------Find Highest Selling Product by Total Sales Value------

SELECT TOP 1 Product, SUM(Quantity*UnitPrice) AS TotalSalesValue
FROM SalesData
GROUP BY Product
ORDER BY TotalSalesValue DESC;

-----------Calculate Total Revenue Per Product--------

SELECT Product, SUM(Quantity*UnitPrice) AS TotalRevenue
FROM SalesData
GROUP BY Product;

----------Calculate Monthly Sales Total for Current Year

SELECT MONTH(OrderDate) AS Month, SUM(Quantity*UnitPrice) AS MonthlyTotalSales
FROM SalesData
WHERE YEAR(OrderDate) =YEAR(GETDATE()) 
GROUP BY MONTH(Orderdate);

---------Find the Top 5 Customers by Total Purchase Amount

SELECT TOP 5 CustomerName, SUM(Quantity*UnitPrice) AS TotalPurchaseAmount
FROM CustomerData
JOIN
SalesData ON CustomerData.CustomerID = CustomerData.CustomerID
GROUP BY
CustomerName
ORDER BY
TotalPurchaseAmount DESC; 

-------------Calculate Percentage of Total Sales Contributed by each Region

SELECT Region, SUM(Quantity*UnitPrice) AS TotalSales, (SUM(Quantity*UnitPrice)/(SELECT SUM(Quantity*UnitPrice) FROM SalesData))*100 AS SalesPercentage
FROM SalesData
GROUP BY Region
ORDER BY TotalSales DESC;

-------------Identify Products with No Sales in the last Quarter

SELECT Product
FROM SalesData
WHERE Product NOT IN (
SELECT Product FROM SalesData
WHERE OrderDate>=DATEADD(quarter,-1, GETDATE ())
)
GROUP BY Product;

 