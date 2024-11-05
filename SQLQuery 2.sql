---------Retrieve Total Number of Customers from each Region

SELECT Region, COUNT (CustomerID) AS TotalCustomers
FROM CustomerData
GROUP BY Region 
ORDER BY TotalCustomers DESC;

-----------Find the most popular Subscription Type by the Number of Customers-------

SELECT TOP 1 SubscriptionType, COUNT(CustomerID) AS NumberofCustomers
FROM CustomerData
GROUP BY SubscriptionType
ORDER BY NumberofCustomers DESC;

--------Find Customomers who cancelled their Subscription within 6 Months----------

SELECT CustomerID, CustomerName
FROM CustomerData
WHERE Canceled = 1 AND DATEDIFF(MONTH, SubscriptionStart, GETDATE())<= 180;

-----------Calculate Average Subscription duration for all Customers---------

SELECT AVG(DATEDIFF(Day, SubscriptionStart, SubscriptionEnd)) AS AverageDuration
FROM CustomerData
WHERE SubscriptionEnd is NOT NULl;

-----------Find Customers with Subscritions longer than 12 months-----------

SELECT CustomerID, CustomerName
FROM CustomerData
WHERE DATEDIFF(day, SubscriptionStart, SubscriptionEnd)> 365;

-------------Total Revenue by Sunscription Type----------

SELECT SubscriptionType, SUM (Revenue) AS TotalRevenue
FROM CustomerData
GROUP BY SubscriptionType
ORDER BY TotalRevenue DESC;

----------Top 3 Regions By Subscription Cancellations------------

SELECT TOP 3 Region, COUNT (CustomerID) AS TotalCancellations
FROM CustomerData
WHERE Canceled =1
GROUP BY Region 
ORDER BY TotalCancellations DESC;

---------------Find the Total number of Active and Cancelled Subscriptions--------------

SELECT Canceled, COUNT (CustomerID) AS TotalSubscriptions 
FROM CustomerData
GROUP BY Canceled;