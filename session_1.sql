-- Bu bir yorum satırı
/*
	MultiLine 
	Comment
*/

-- SELECT 1 AS one -- Tek block işlemlerde sonuna ; koyma zorunda değiliz.
-- SELECT 1 AS one;-- Komuttan sonra yorum için -- kullanabiliriz

-- SELECT 1 AS, /* araya yorum yazabiliriz */ 2 AS two;

-- NOT CaseSensitive (Case-Insensitive)
-- Büyük harf, küçük harf ayrımı yapmaz.
-- SELECT 1 AS one;
-- select 1 AS one;

--* Piyasa Standartları:
--** SQL Temel komutları BÜYÜK harfle yazılır. SELECT * FROM ... WHERE
--** String verilerde tek veya çift tırnak kullanabilirz. Piyasa standartı tek tırnaktır. SELECT 'STRİNG'AS one;
--** Her bir temel komut ayrı satıra yazılır.
/*
SELECT*
FROM tableName
WHERE 1=1
ORDER BY ...
*/

----- SQL -----

--* SELECT - Seç ve getir
--* FROM - Hangi tablodan?
-- SELECT * FROM Album; --* = Tüm Sütunlar
-- SELECT AlbumId, Title FROM Album; -- İstediğim sütunları getir. -- Tavsiye edilen yöntem tek-tek yazmaktır.

--*AS - Tablo ve sütunları (geçici olarak) adlandırmak için kullanılır. -- Lakap takma
-- SELECT 3 AS number;
-- SELECT 'string' AS baslik;
-- SELECT 1+2 AS toplam; -- Sütun İsimlendirme
-- SELECT AlbumId AS Numara, Title AS Baslik FROM Album;
-- SELECT AlbumId+3 AS Numara, Title AS Baslik FROM Album;
-- SELECT Album.AlbumId+3 AS Numara, Album.Title AS Baslik FROM Album;
-- SELECT a.AlbumId+3 AS Numara, a.Title AS Baslik FROM Album AS a; -- Tablo İsimleri
-- SELECT a.AlbumId+3 Numara, a.Title Baslik FROM Album a; -- AS yazmadan (boşluk bırakarak) isimlendirme yapabiliriz.