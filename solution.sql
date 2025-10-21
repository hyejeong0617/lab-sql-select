## Challenge 1 - Who Have Published What At Where?

SOLUTION1

select a.au_id as AUTHOR_ID, a.au_lname as LAST_NAME, a.au_fname as FIRST_NAME, t.title as TITLE, p.pub_name as PUBLISHER
from authors as a 
join titleauthor as ta on a.au_id = ta.au_id
join titles as t on ta.title_id = t.title_id
join publishers as p on t.pub_id = p.pub_id
ORDER BY a.au_id;


## Challenge 2 - Who Have Published How Many At Where?

SOLUTION2

select a.au_id as AUTHOR_ID, a.au_lname as LAST_NAME, a.au_fname as FIRST_NAME, p.pub_name as PUBLISHER, COUNT(t.title) as TITLE_COUNT
from authors as a 
join titleauthor as ta on a.au_id = ta.au_id
join titles as t on ta.title_id = t.title_id
join publishers as p on t.pub_id = p.pub_id
GROUP BY a.au_id, a.au_lname, a.au_fname, p.pub_name;


## Challenge 3 - Best Selling Authors

Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.

SOLUTION3

SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, SUM(t.ytd_sales) AS TOTAL
FROM authors a
JOIN titleauthor ta ON a.au_id = ta.au_id
JOIN titles t ON ta.title_id = t.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY TOTAL DESC
LIMIT 3;

## Challenge 4 - Best Selling Authors Ranking

SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, IFNULL(SUM(t.ytd_sales), 0) AS TOTAL
FROM authors a
LEFT JOIN titleauthor ta ON a.au_id = ta.au_id
LEFT JOIN titles t ON ta.title_id = t.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY TOTAL DESC;