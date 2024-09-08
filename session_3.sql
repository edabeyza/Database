-- Active: 1725647572612@@127.0.0.1@5432@test_db
SELECT * FROM Album

SELECT * FROM "Artist";

SELECT * FROM Album INNER JOIN Artist ON Album.ArtistId = Artist.ArtistId

SELECT * FROM Album as alb INNER JOIN Artist AS art ON alb.ArtistId = art.ArtistId

SELECT alb.AlbumId, alb.Title, art.Name AS Artist FROM Album AS alb INNER JOIN Artist as art ON alb.ArtistId = art.ArtistId

SELECT * FROM Customer;

SELECT * FROM Invoice

SELECT * FROM Customer AS "c" JOIN Invoice i ON "c".CustomerId = i.CustomerId

SELECT "c".Customer, "c".FirstName, "c".LastName, i.Total FROM Customer AS "c" JOIN Invoice i ON "c".CustomerId = i.CustomerId

SELECT * FROM Album AS a LEFT JOIN Artist r ON a.ArtistId = r.ArtistId -- Based on the left table

SELECT * FROM Album AS a RIGHT JOIN Artist r ON a.ArtistId = r.ArtistId -- Based on the right table

SELECT a.AlbumId, a.Title, r.Name AS ArtistName 
    FROM Album AS a INNER JOIN Artist r ON a.ArtistId = r.ArtistId 
        ORDER BY r.Name ASC -- ASC orders from smallest to largest
                            -- DESC orders from largest to smallest

--- FUNCTIONS ---
--* COUNT: Number of records

SELECT COUNT(*) AS "Record Count" FROM Album

SELECT COUNT(*) AS `Record Count` FROM Album

SELECT COUNT(*) AS 'Record Count' FROM Album

SELECT COUNT(AlbumId) FROM "Album" -- More efficient than using *

--* SUM: Total
SELECT SUM(Total) FROM Invoice

-- Achieves the same result more concisely
SELECT * FROM Invoice WHERE BillingCountry IN ('USA', 'Canada')

SELECT * FROM Invoice WHERE "BillingCountry" = "USA" OR "BillingCountry" = "Canada"

SELECT * FROM Invoice WHERE "BillingCountry" IN ("USA", "Canada")

--* AVG: Average

SELECT AVG(Total) FROM "Invoice"

--* MIN: Minimum Value

SELECT MIN(Total) FROM "Invoice"

--* MAX: Maximum Value

SELECT MAX(Total) FROM "Invoice"

--* ROUND: Rounding

SELECT ROUND(AVG(Total), 2) FROM Invoice

--* LENGTH: Number of characters (Does not reduce the record count to one line. Shows the number of characters for each record on the same line.)

SELECT Title, length("Title") FROM Album

-------------------------------------- Postgre SQL ---------------------------------------

SELECT * FROM Album

SELECT Title, length(Title) FROM Album;

SELECT * FROM Invoice;

SELECT * FROM Invoice WHERE BillingCountry = 'USA';

SELECT DISTINCT(BillingCountry) FROM Invoice

SELECT BillingCountry, COUNT(InvoiceId) FROM Invoice GROUP BY BillingCountry;

SELECT BillingCountry, 
    COUNT(InvoiceId) AS invoiceCount,
    SUM(Total) AS total,
    MIN(Total) AS minimum,
    MAX(Total) AS maximum,
    ROUND(AVG(Total), 2) AS average
FROM Invoice
GROUP BY BillingCountry

--------------------------- CRUD -----------------------------

INSERT -- New Record > C
SELECT -- Query > R
UPDATE -- Update > U
DELETE -- Delete > D

SELECT * FROM Genre

INSERT INTO Genre (GenreId, Name) VALUES (26, 'Folk Music')

INSERT INTO Genre (GenreId, Name) VALUES (27, 'Turkish Folk Music'),(28, 'Pop Music')

-- Dangerous Commands (DELETE, UPDATE)

UPDATE Genre SET Name = 'Turkish Pop Music' WHERE GenreId = 30

DELETE FROM Genre WHERE GenreId = 28

DELETE FROM Genre

UPDATE Track SET Milliseconds = 0

SELECT * FROM Track

---------------------------------------------------------