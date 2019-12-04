-- NAME: ALPEREN UGUS  CWID: 10864101 
-- Check if there is already a table named books1 and if yes, drop it.
DROP TABLE IF EXISTS books1;

-- Creating the books1 table with the following attributes.
CREATE TABLE books1(
    number INT PRIMARY KEY,
    title TEXT  NOT NULL,
    isbn TEXT NOT NULL UNIQUE,
    publication_date DATE NOT NULL,
    pages INT
);

-- Inserting values into the table
INSERT INTO books1 VALUES
(1, 'Harry Potter and the Philosopher''s Stone', '0-7475-3269-9', '1997-06-26', 223),
(2, 'Harry Potter and the Chamber of Secrets', '0-7475-3849-2', '1998-07-02', 251),
(3, 'Harry Potter and the Prisoner of Azkaban', '0-7475-4215-5', '1999-07-08', 317),
(4, 'Harry Potter and the Goblet of Fire', '0-7475-4624-X', '2000-07-08', 636),
(5, 'Harry Potter and the Order of the Phoenix', '0-7475-5100-6', '2003-06-21', 766),
(6, 'Harry Potter and the Half-Blood Prince', '0-7475-8108-8', '2005-07-16', 607),
(7, 'Harry Potter and the Deathly Hallows', '0-545-01022-5', '2007-07-21', 607),
(8, 'Harry Potter and the Bunnies of Doom', '1-234-56789-0', '2010-01-15', NULL);

-- Deleting the wrong book
DELETE FROM books1 WHERE title = 'Harry Potter and the Bunnies of Doom';


-- Check if there is already a table named books2 and if yes, drop it.
DROP TABLE IF EXISTS books2;

-- Create table books2 by filling it with the data from an existing table.
CREATE TABLE books2 AS
SELECT * FROM public.project3_us_books;

-- Check if there is already a table named books and if yes, drop it.
DROP TABLE IF EXISTS books;

-- Creating books table with the following attributes.
CREATE TABLE books(
    number INT PRIMARY KEY,
    title TEXT  NOT NULL,
    isbn TEXT NOT NULL UNIQUE,
    publication_date DATE NOT NULL,
    pages INT,
    ustitle TEXT,
    uspublicationdate DATE,
    uspages INT
);

-- Insertion of the data to table books from table book1 and table book2
INSERT INTO books(number, title, isbn, publication_date, pages, uspublicationdate, uspages)
SELECT books1.number, books1.title, books1.isbn, books1.publication_date, books1.pages, books2.publicationdate, books2.pages FROM books1, books2
WHERE books1.number = books2.number;

-- Updating ustitle.
UPDATE books
SET ustitle = title;

-- Correcting the title of Book1
Update books
SET ustitle = 'Harry Potter and the Sorcerer''s Stone'
WHERE ustitle = 'Harry Potter and the Philosopher''s Stone';
