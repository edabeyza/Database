-- Active: 1723840243090@@127.0.0.1@3306
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

--*SUM: Toplam
SELECT SUM(Total) FROM Invoice

--aşağıdakiyle aynı işlemi daha kısa yoldan yapar
SELECT * FROM Invoice WHERE BillingCountry IN ('USA', 'Canada')

SELECT * FROM Invoice WHERE "BillingCountry" = "USA" OR "BillingCountry" = "Canada"

SELECT * FROM Invoice WHERE "BillingCountry" IN ("USA", "Canada")




