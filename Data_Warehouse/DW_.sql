CREATE DATABASE AML_DWH_

USE AML_DWH_
GO

CREATE TABLE DimCustomer (
    CustomerKey INT IDENTITY(1,1) PRIMARY KEY, 
    CustomerID INT,
    CustomerName NVARCHAR(100),
    DateOfBirth DATE,
    Gender NVARCHAR(10),
    Country NVARCHAR(50),
    Address NVARCHAR(255),
    JobTitle NVARCHAR(50),
	StartDate DATETIME DEFAULT GetDate() NOT NULL,
	EndDate DATETIME DEFAULT NULL
);


CREATE TABLE DimTransaction (
    TransactionKey INT IDENTITY(1,1) PRIMARY KEY,
    TransactionID INT,
    TransactionType NVARCHAR(50),
    TransactionLocation NVARCHAR(100),
	StartDate DATETIME DEFAULT GetDate() NOT NULL,
	EndDate DATETIME DEFAULT NULL
);


CREATE TABLE DimAccount (
    AccountKey INT IDENTITY(1,1) PRIMARY KEY,
    AccountID INT,
    AccountType NVARCHAR(50),
    OpenDate DATE,
    CloseDate DATE,
	StartDate DATETIME DEFAULT GetDate() NOT NULL,
	EndDate DATETIME DEFAULT NULL
);


CREATE TABLE DimBank (
    BankKey INT IDENTITY(1,1) PRIMARY KEY,
    BankID INT,
    BankName NVARCHAR(100),
    BranchName NVARCHAR(100),
    Country NVARCHAR(50),
	StartDate DATETIME DEFAULT GetDate() NOT NULL,
	EndDate DATETIME DEFAULT NULL
);


CREATE TABLE DimDate (
    DateKey INT IDENTITY(1,1) PRIMARY KEY,
    DateID INT,
    Date DATE,
    Day INT,
    Month INT,
    Quarter INT,
    Year INT
);


CREATE TABLE FactTransaction (
    FactTransactionID INT IDENTITY(1,1) PRIMARY KEY,
    TransactionKey INT FOREIGN KEY REFERENCES DimTransaction(TransactionKey),
    CustomerKey INT FOREIGN KEY REFERENCES DimCustomer(CustomerKey),
    AccountKey INT FOREIGN KEY REFERENCES DimAccount(AccountKey),
    BankKey INT FOREIGN KEY REFERENCES DimBank(BankKey),
    TransactionAmount DECIMAL(18, 2),
    DateKey INT FOREIGN KEY REFERENCES DimDate(DateKey),
    AccountBalance DECIMAL(18, 2),
    Salary DECIMAL(18, 2)
);




