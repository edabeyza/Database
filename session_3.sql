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

SELECT * FROM Album AS a LEFT JOIN Artist r ON a.ArtistId = r.ArtistId -- soldaki tabloya göre

SELECT * FROM Album AS a RIGHT JOIN Artist r ON a.ArtistId = r.ArtistId -- sağdaki tabloya göre 

SELECT a.AlbumId, a.Title, r.Name AS ArtistName 
    FROM Album AS a INNER JOIN Artist r ON a.ArtistId = r.ArtistId 
        ORDER BY r.Name ASC -- asc küçükten büyüğe sıralar
                            -- desc büyükten küçüğe sıralar

--- FUNCTIONS ---
--* COUNT: kayıt sayısı

SELECT COUNT(*) AS "Kayit Sayisi" FROM Album

SELECT COUNT(*) AS `Kayit Sayisi` FROM Album

SELECT COUNT(*) AS 'Kayit Sayisi' FROM Album

SELECT COUNT(AlbumId) FROM "Album" -- *'a göre daha performanslı çalışır

--* SUM: Toplam
SELECT SUM(Total) FROM Invoice

--aşağıdakiyle aynı işlemi daha kısa yoldan yapar
SELECT * FROM Invoice WHERE BillingCountry IN ('USA', 'Canada')

SELECT * FROM Invoice WHERE "BillingCountry" = "USA" OR "BillingCountry" = "Canada"

SELECT * FROM Invoice WHERE "BillingCountry" IN ("USA", "Canada")

--* AVG: Ortalama

SELECT AVG(Total) FROM "Invoice"

--* MIN: Minimum Değer

SELECT MIN(Total) FROM "Invoice"

--* MAX: Maksimum Değer

SELECT MAX(Total) FROM "Invoice"

--* ROUND: Yuvarlama

SELECT ROUND(AVG(Total), 2) FROM Invoice

--* LENGHT: Karakter sayısı(Kayıt sayısını tek satıra düşürmez. Her kaydın karakter sayısını aynı satıra yazar.)

SELECT Title, length("Title") FROM Album

-------------------------------------- Postgre SQL ---------------------------------------

SELECT * FROM Album

SELECT Title, length(Title) FROM Album;

SELECT * FROM Invoice;

SELECT * FROM Invoice WHERE BillingCountry = 'USA';

SELECT DISTINCT(BillingCountry) FROM Invoice

SELECT BillingCountry, COUNT(InvoiceId) FROM Invoice GROUP BY BillingCountry;

SELECT BillingCountry, 
    COUNT(InvoiceId) AS faturaSayisi,
    SUM(Total) AS toplam,
    MIN(Total) AS minimum,
    MAX(Total) AS maximum,
    ROUND(AVG(Total), 2) AS ortalama
FROM Invoice
GROUP BY BillingCountry

--------------------------- CRUD -----------------------------

INSERT -- Yeni Kayıt > C
SELECT -- Sorgu > R
UPDATE -- Güncelleme > U
DELETE -- Silme > D

SELECT * FROM Genre

INSERT INTO Genre (GenreId, Name) VALUES (26, 'Halk Müziği')

INSERT INTO Genre (GenreId, Name) VALUES (27, 'Turk Halk Müziği'),(28, 'Pop Müziği')

-- Tehlikeli Komutlar (DELETE, UPDATE)

UPDATE Genre SET Name = 'Türk Pop Müziği' WHERE GenreId = 30

DELETE FROM Genre WHERE GenreId = 28

