-- This is a comment line
/*
    MultiLine 
    Comment
*/

-- SELECT 1 AS one -- In single block statements, you don't need to add a ; at the end.
-- SELECT 1 AS one; -- You can use -- for comments after the command

-- SELECT 1 AS, /* you can write comments in between */ 2 AS two;

-- NOT CaseSensitive (Case-Insensitive)
-- There is no distinction between uppercase and lowercase.
-- SELECT 1 AS one;
-- select 1 AS one;

--* Market Standards:
--** SQL basic commands are written in UPPERCASE. SELECT * FROM ... WHERE
--** For string data, you can use either single or double quotes. Market standard is single quotes. SELECT 'STRING' AS one;
--** Each basic command is written on a separate line.
/*
SELECT*
FROM tableName
WHERE 1=1
ORDER BY ...
*/

----- SQL -----

--* SELECT - Select and retrieve
--* FROM - From which table?
-- SELECT * FROM Album; --* = All Columns
-- SELECT AlbumId, Title FROM Album; -- Retrieve the columns I want. -- Recommended method is to write them one by one.

--* AS - Used to temporarily name tables and columns. -- Nicknaming
-- SELECT 3 AS number;
-- SELECT 'string' AS title;
-- SELECT 1+2 AS total; -- Column Naming
-- SELECT AlbumId AS Number, Title AS Title FROM Album;
-- SELECT AlbumId+3 AS Number, Title AS Title FROM Album;
-- SELECT Album.AlbumId+3 AS Number, Album.Title AS Title FROM Album;
-- SELECT a.AlbumId+3 AS Number, a.Title AS Title FROM Album AS a; -- Table Names
-- SELECT a.AlbumId+3 Number, a.Title Title FROM Album a; -- Naming without AS (by leaving space)
