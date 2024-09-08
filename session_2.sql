-- SQL 2
-- DML CRUD
-- DQL R (SAFE)

/*
SELECT *
FROM tableName -- BNF Form
*/
-- SELECT * FROM Invoice I;
-- SELECT I.BillingCity FROM Invoice I;

-- SELECT DISTINCT BillingCountry FROM Invoice;
-- SELECT DISTINCT BillingCountry, BillingCity FROM Invoice;

-- WHERE condition ( =, >, <, !=, <>, >=, <=, BETWEEN, AND, OR, NOT, NOT IN )
-- SELECT * FROM table WHERE condition/conditions

/*
SELECT *
FROM Invoice
WHERE BillingCountry = 'Germany'; -- Case sensitive if within data condition clause
*/

-- Invoices with total amount greater than 5
/*
SELECT *
FROM Invoice
WHERE Total >=5 ; 
*/

-- Invoices with total amount between 5 and 8
/*
SELECT *
FROM Invoice
WHERE Total >= 5 AND Total <=8; 

SELECT *
FROM Invoice
WHERE Total BETWEEN 5 AND 7.96;
*/

-- BETWEEN can cause issues with dates
/*
SELECT *
FROM Invoice
WHERE InvoiceDate BETWEEN '2009/1/1' AND '2009/3/1';
*/

/*
SELECT *
FROM Invoice
WHERE BillingCountry LIKE 'Germany';
*/

-- Countries starting with G
/*
SELECT *
FROM Invoice
WHERE BillingCountry LIKE 'G%';
*/

-- Invoices for countries ending with y
/*
SELECT *
FROM Invoice
WHERE BillingCountry LIKE '%y';
*/

-- Invoices for countries containing w
/*
SELECT *
FROM Invoice
WHERE BillingCountry LIKE '%w%';
*/

-- Countries where the second character is o (first character doesn't matter)
/*
SELECT *
FROM Invoice
WHERE BillingCountry LIKE '_o%';
*/

-- Countries where the third letter is r and the last letter is y
/*
SELECT *
FROM Invoice
WHERE BillingCountry LIKE '__r%y';
*/

-- Invoices for countries not Norway and Swede
/*
SELECT *
FROM Invoice
WHERE BillingCountry NOT IN ('Norway', 'Swede');
*/

-- LIMIT 
/* SELECT * FROM Invoice LIMIT 10 */


-- ORDER BY (ASC -> ascending, DESC -> descending) default ASC
/* SELECT * FROM Invoice ORDER BY BillingCountry ASC; */
/* SELECT * FROM Invoice ORDER BY BillingCountry ASC; */

-- Ascending by country name, descending by city
/* SELECT BillingCountry, BillingCity FROM Invoice ORDER BY BillingCountry, BillingCity DESC; */


-- Examples
-- Retrieve the first 5 tracks by AC DC from the Track table
/* SELECT * FROM Track WHERE composer = 'AC/DC' LIMIT 5 */
-- Last 3
-- SELECT * FROM Track WHERE composer = 'AC/DC' ORDER BY TrackId DESC LIMIT 3


-- FUNCTIONS SELECT min, max, avg, sum, round, length FROM
-- Functions return a single value

-- Total amount of all invoices
-- SELECT * FROM Invoice;
-- Total invoice amount
-- SELECT SUM(Total) totalInvoiceAmount FROM Invoice;

-- Find the lowest, highest, and average invoice amounts
-- SELECT MIN(Total) minInvoice, MAX(Total) maxInvoice, ROUND(AVG(Total), 2) avgInvoice FROM Invoice;

--  SELECT length(BillingAddress) FROM Invoice;

-- Find AC DC's shortest and longest tracks
-- SELECT * FROM Track WHERE Composer='AC/DC' ORDER BY Milliseconds ASC LIMIT 1;
-- SELECT * FROM Track WHERE Composer='AC/DC' ORDER BY Milliseconds DESC LIMIT 1;

-- Version 2
-- Retrieves the record with the highest value at the end. So, max works
-- SELECT MIN(Milliseconds), MAX(Milliseconds) FROM Track WHERE Composer='AC/DC';


-- GROUP BY

-- Group by the country where the invoice was issued
-- SELECT * FROM Invoice GROUP BY BillingCountry;

-- Average invoice amount for each country
-- SELECT BillingCountry, avg(total) FROM Invoice GROUP BY BillingCountry;


-- SUBQUERY

-- Average invoice amount 6.0
-- SELECT ROUND(AVG(Total)) from Invoice;

-- Invoices with amounts greater than the average invoice amount
-- SELECT * FROM Invoice WHERE Total>6.0;
-- SELECT * FROM Invoice WHERE Total>(SELECT ROUND(AVG(Total)) from Invoice);

-- Tracks from the "Big Ones" album?
-- First find information about the "Big Ones" album
-- Get the album id
-- List tracks with the album id obtained above
-- SELECT * FROM Album WHERE Title='Big Ones';
-- SELECT AlbumId FROM Album WHERE Title='Big Ones';
-- SELECT * FROM Track WHERE AlbumId=(SELECT AlbumId FROM Album WHERE Title='Big Ones');

-- Find invoices issued for Mark Philips?
-- First find Mark Philips's customer id
-- List invoices with the customer id obtained above
-- SELECT * FROM Invoice WHERE CustomerId=(SELECT CustomerId FROM Customer WHERE FirstName='Mark' AND LastName='Philips');

-- JOIN: Combine two tables (DEFAULT: Inner Join)
-- LEFT JOIN: Takes everything from the left (A) table and only matching rows from the right (B) table.
-- INNER JOIN: Takes matching rows from both tables, i.e., the intersection.
-- RIGHT JOIN: Takes everything from the right (B) table and only matching rows from the left (A) table.

-- Retrieve each album and the artist information associated with it
-- SELECT * FROM Album LEFT JOIN Artist on Album.ArtistId = Artist.ArtistId;
-- SELECT * FROM Artist LEFT JOIN Album on Album.ArtistId = Artist.ArtistId;
