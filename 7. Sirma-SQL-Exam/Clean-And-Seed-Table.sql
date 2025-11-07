
IF DB_ID('MembershipDB') IS NULL
    CREATE DATABASE MembershipDB;
GO
USE MembershipDB;
GO

-- Clean tables if they exist
IF OBJECT_ID('MemberSubscriptions','U') IS NOT NULL DROP TABLE MemberSubscriptions;
IF OBJECT_ID('Subscriptions','U')       IS NOT NULL DROP TABLE Subscriptions;
IF OBJECT_ID('Members','U')             IS NOT NULL DROP TABLE Members;

CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    Name VARCHAR(100),
    MembershipType VARCHAR(50),
    JoinDate DATE
);

CREATE TABLE Subscriptions (
    SubscriptionID INT PRIMARY KEY,
    TypeName VARCHAR(50),
    MonthlyFee DECIMAL(10,2)
);

CREATE TABLE MemberSubscriptions (
    MemberID INT,
    SubscriptionID INT,
    StartDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (SubscriptionID) REFERENCES Subscriptions(SubscriptionID),
    PRIMARY KEY (MemberID, SubscriptionID)
);

-- Seed data
INSERT INTO Members (MemberID, Name, MembershipType, JoinDate) VALUES
(1, 'Peter Parker', 'Gold',   '2024-01-15'),
(2, 'May Ray',      'Silver', '2024-05-20'),
(3, 'David Goldenberg', 'Gold', '2025-02-10'),
(4, 'Sophie Bronzer', 'Bronze','2025-01-05');

INSERT INTO Subscriptions (SubscriptionID, TypeName, MonthlyFee) VALUES
(201, 'Gym Access',    50.00),
(202, 'Swimming Pool', 35.00),
(203, 'Yoga Classes',  40.00);

INSERT INTO MemberSubscriptions (MemberID, SubscriptionID, StartDate) VALUES
(1, 201, '2024-01-16'),
(1, 203, '2024-01-18'),
(2, 202, '2024-05-21'),
(3, 201, '2025-02-11'),
(4, 203, '2025-01-06');
