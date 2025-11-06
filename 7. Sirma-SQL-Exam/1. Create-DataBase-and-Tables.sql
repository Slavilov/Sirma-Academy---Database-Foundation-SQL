IF DB_ID('LibraryDB') IS NULL
    CREATE DATABASE LibraryDB;
GO
USE LibraryDB;
GO

-- Clean tables if they exist
IF OBJECT_ID('Borrowings','U') IS NOT NULL DROP TABLE Borrowings;
IF OBJECT_ID('Books','U')      IS NOT NULL DROP TABLE Books;
IF OBJECT_ID('Authors','U')    IS NOT NULL DROP TABLE Authors;

CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    Name     VARCHAR(100) NOT NULL,
    Country  VARCHAR(50)  NOT NULL
);

CREATE TABLE Books (
    BookID   INT PRIMARY KEY,
    Title    VARCHAR(150) NOT NULL,
    Genre    VARCHAR(50)  NOT NULL,
    AuthorID INT NOT NULL FOREIGN KEY REFERENCES Authors(AuthorID)
);

CREATE TABLE Borrowings (
    BorrowingID  INT PRIMARY KEY,
    BookID       INT NOT NULL FOREIGN KEY REFERENCES Books(BookID),
    BorrowerName VARCHAR(100) NOT NULL,
    BorrowDate   DATE NOT NULL
);
