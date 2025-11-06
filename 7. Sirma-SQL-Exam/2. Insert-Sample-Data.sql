INSERT INTO Authors (AuthorID, Name, Country) VALUES
(1, 'George Orwell', 'UK'),
(2, 'Jane Austen',   'UK'),
(3, 'Mark Twain',    'USA'),
(4, 'Alen',          'BG');

INSERT INTO Books (BookID, Title, Genre, AuthorID) VALUES
(101, '1984',                     'Dystopian', 1),
(102, 'Pride and Prejudice',      'Romance',   2),
(103, 'Adventures of Tom Sawyer', 'Adventure', 3);

INSERT INTO Borrowings (BorrowingID, BookID, BorrowerName, BorrowDate) VALUES
(1, 101, 'Alice',   '2025-03-01'),
-- (2, 104, 'Bob',     '2025-03-05'), -- would fail the FK
(3, 103, 'Charlie', '2025-03-07'),
(4, 101, 'Diana',   '2025-03-10');
