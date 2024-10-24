--Amount_Transaction >40000
SELECT AccountKey, SUM(TransactionAmount) AS TotalAmount, COUNT(*) AS TransactionCount
FROM FactTransaction
WHERE TransactionAmount > 40000.00
GROUP BY AccountKey
HAVING COUNT(*) > 3;

--Transactions Between 2 days
SELECT f.AccountKey, d.Date, f.TransactionAmount
FROM FactTransaction f
Join DimDate d
ON d.DateKey = f.DateKey
WHERE d.Date BETWEEN '2024-03-11 21:54:13.000' AND '2024-03-12 21:54:13.000'
ORDER BY f.AccountKey, d.Date;

--Transactions in week
SELECT f.AccountKey, d.Date, f.TransactionAmount
FROM FactTransaction f
Join DimDate d
on d.DateKey = f.DateKey
WHERE TransactionAmount > 30000.00
AND DATEDIFF(day, d.Date, GETDATE()) <= 7 
ORDER BY f.TransactionAmount DESC;

--Suspecious_Transactions
SELECT AccountKey, SUM(TransactionAmount) AS SuspiciousAmount, COUNT(TransactionKey) AS NumberOfTransactions
FROM FactTransaction
WHERE TransactionAmount > 40000.00
GROUP BY AccountKey
HAVING SUM(TransactionAmount) > 500000.00;

--Transaction Type
SELECT f.AccountKey, 
    SUM(CASE WHEN t.TransactionType = 'Deposit' THEN f.TransactionAmount ELSE 0 END) AS TotalDeposits,
    SUM(CASE WHEN t.TransactionType = 'Withdrawal' THEN f.TransactionAmount ELSE 0 END) AS TotalWithdrawals
FROM FactTransaction f
Join DimTransaction t
on f.TransactionKey = t.TransactionKey
GROUP BY f.AccountKey
HAVING SUM(CASE WHEN t.TransactionType = 'Withdrawal' THEN f.TransactionAmount ELSE 0 END) > 40000.00;

--Transactions among 24 hours
WITH RepeatedTransactions AS (
    SELECT f.AccountKey, d.Date, f.TransactionAmount,
           LEAD(d.Date) OVER (PARTITION BY f.AccountKey ORDER BY d.Date) AS NextTransactionDate
    FROM FactTransaction f
	Join DimDate d
	on d.DateKey = f.DateKey
)
SELECT AccountKey, Date, NextTransactionDate, DATEDIFF(hour, Date, NextTransactionDate) AS HoursBetweenTransactions
FROM RepeatedTransactions
WHERE DATEDIFF(hour, Date, NextTransactionDate) < 24;

--Suspecious Countries
SELECT 
    f.AccountKey, 
	t.TransactionLocation,
    COUNT(f.TransactionKey) AS TransactionCount,  
    SUM(f.TransactionAmount) AS TotalAmount 
FROM
    FactTransaction f
JOIN DimTransaction t
ON t.TransactionKey = f.TransactionKey
WHERE 
    t.TransactionLocation in ('Russia', 'North Korea', 'China')  
GROUP BY 
    f.AccountKey, t.TransactionLocation
having 
    COUNT(f.TransactionKey) > 1

