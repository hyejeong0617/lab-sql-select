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
GROUP BY a.au_id;


## Challenge 3 - Best Selling Authors

Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.

SOLUTION3

select a.au_id as AUTHOR_ID, a.au_lname as LAST_NAME, a.au_fname as FIRST_NAME, SUM(s.qty) as TOTAL
from authors as a
join titleauthor as ta on a.au_id = ta.au_id
join sales as s on ta.title_id = s.title_id
GROUP BY a.au_id
ORDER BY TOTAL DESC LIMIT 3;

## Challenge 4 - Best Selling Authors Ranking

select a.au_id as AUTHOR_ID, a.au_lname as LAST_NAME, a.au_fname as FIRST_NAME, IFNULL(sum(s.qty), 0) as TOTAL
from authors as a
left join titleauthor as ta on a.au_id = ta.au_id
left join sales as s on ta.title_id=s.title_id
GROUP BY a.au_id
ORDER BY TOTAL desc;