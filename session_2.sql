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


-- WHERE şart ( =, >, <, !=, <>, >=, <=, BETWEEN, AND, OR, NOT, NOT IN )
-- SELECT * FROM table WHERE koşul/koşullar

/*
SELECT *
FROM Invoice
WHERE BillingCountry = 'Germany'; -- Veri şart cümleciği içerisindeyse case sensitive
*/

-- Fatura miktarı 5 ten büyük olanlar
/*
SELECT *
FROM Invoice
WHERE Total >=5 ; 
*/

-- Fatura miktarı 5 ile 8 arasında olanlar
/*
SELECT *
FROM Invoice
WHERE Total >= 5 AND Total <=8; 

SELECT *
FROM Invoice
WHERE Total BETWEEN 5 AND 7.96;
*/

-- BETWEEN sadece tarihlerle ilgili sıkıntı oluşturabiliyor
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

-- Ülkesi G ile başlayan
/*
SELECT *
FROM Invoice
WHERE BillingCountry LIKE 'G%';
*/

-- Sonu y ile biten ülkelere kesilen faturalar
/*
SELECT *
FROM Invoice
WHERE BillingCountry LIKE '%y';
*/

-- İçinde w olan ülkelere kesilen faturalar
/*
SELECT *
FROM Invoice
WHERE BillingCountry LIKE '%w%';
*/

-- İlk karakter önemli değil ikinci karakteri o olan ülkeler
/*
SELECT *
FROM Invoice
WHERE BillingCountry LIKE '_o%';
*/

-- Üçüncü harfi r son harfi y olan ülkeler
/*
SELECT *
FROM Invoice
WHERE BillingCountry LIKE '__r%y';
*/

-- Ülkesi norway ve swede olmayan ülkelere kesilen faturalar
/*
SELECT *
FROM Invoice
WHERE BillingCountry NOT IN ('Norway', 'Swede');
*/


-- LIMIT 
/* SELECT * FROM Invoice LIMIT 10 */


-- ORDER BY (ASC -> artan, DESC -> azalan) default ASC
/* SELECT * FROM Invoice ORDER BY BillingCountry ASC; */
/* SELECT * FROM Invoice ORDER BY BillingCountry ASC; */

-- Ülke ismine göre artan şehire göre azalan
/* SELECT BillingCountry, BillingCity FROM Invoice ORDER BY BillingCountry, BillingCity DESC; */


--Examples
-- Track tablosundan AC DC grubunun ilk 5 parçasını getir
/* SELECT * FROM Track WHERE composer = 'AC/DC' LIMIT 5 */
-- Son 3
-- SELECT * FROM Track WHERE composer = 'AC/DC' ORDER BY TrackId DESC LIMIT 3


-- FUNCTIONS SELECT min, max, avg, sum, round, length FROM
-- Fonksiyonlar tek değer döndürüyor

-- Tüm faturalarda
-- SELECT * FROM Invoice;
-- Toplam fatura miktarı
-- SELECT SUM(Total) toplamFaturaMiktari FROM Invoice;

-- En düşük, en yüksek ve ortalama fatura miktarını getiriniz
-- SELECT MIN(Total) minFatura, MAX(Total) maxFatura, ROUND(AVG(Total), 2) avgFatura FROM Invoice;

--  SELECT length(BillingAdress) FROM Invoice;

-- AC DC en kısa süreli parçası ile en uzun süreli parçasını bulunuz
-- SELECT * FROM Track WHERE Composer='AC/DC' ORDER BY Milliseconds ASC LIMIT 1;
-- SELECT * FROM Track WHERE Composer='AC/DC' ORDER BY Milliseconds DESC LIMIT 1;

-- Version 2
-- En sonda ne varsa onun kaydını getirir. yani max çalışır
-- SELECT MIN(Milliseconds), MAX(Milliseconds), FROM Track WHERE Composer='AC/DC';


-- GROUP BY

-- Fatura kesilen ülkeye göre grupla
-- SELECT * FROM Invoice GROUP BY BillingCountry;

-- Her bir ülke için kesilen ort fatura miktarı
-- SELECT BillingCountry, avg(total) FROM Invoice GROUP BY BillingCountry;


-- SUBQUERY

-- Ortalama fatura miktarı 6.0
-- SELECT ROUND(AVG(Total)) from Invoice;

-- Ortalama fatura miktarı miktarından yüksek kesilen faturalar
-- SELECT * FROM Invoice WHERE Total>6.0;
-- SELECT * FROM Invoice WHERE Total>(SELECT ROUND(AVG(Total)) from Invoice);

-- Big Ones albümünün parçaları?
-- İlk önce "big ones" albümünün bilgilerini bul
-- içinden album id sini al
-- track tablosunda album id si yukarıda elde ettiğimiz id olanları listele
-- SELECT * FROM Album WHERE Title='Big Ones';
-- SELECT AlbumId FROM Album WHERE Title='Big Ones';
-- SELECT * FROM Track WHERE AlbumId=(SELECT AlbumId FROM Album WHERE Title='Big Ones');

-- Mark Philips için kesilen faturaları bulunuz?
-- İlk önce "mark philips" in customer id sini bul
-- faturalar tablosundan customer id si yukarıda elde ettiğimiz id olan faturaları listele
-- SELECT * FROM Invoice WHERE CustomerId=(SELECT CustomerId FROM Customer WHERE FirstName='Mark' AND LastName='Philips');

-- JOIN: İki tabloyu birleştirme (DEFAULT: Inner Join)
-- LEFT JOIN: A(sol) Tablosundai her şeyi alır B(sağ) tablosunda sadece eşleşenleri alır.
-- INNER JOIN: Her iki tabloda da eşleşenleri alır yani kesişim kümesini alır.
-- RIGHT JOIN: Sağdaki tablonun hepsini alır, solda ise eşleşenleri alır.

-- Her bir albüm ve albümün ait olduğu artist bilgilerini getir
-- SELECT * FROM Album LEFT JOIN Artist on Album.ArtistId = Artist.Artist.Id;
-- SELECT * FROM Artist LEFT JOIN Album on Album.ArtistId = Artist.Artist.Id;