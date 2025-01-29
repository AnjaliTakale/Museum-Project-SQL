create database sqlprj2;
use sqlprj2;


show tables;

-- 1. Retrieve the full name of artists along with the names of the museums where their works are displayed.

SELECT artist.full_name, museum.name,work.name
FROM artist
JOIN work ON artist.artist_id = work.artist_id
JOIN museum ON work.museum_id = museum.museum_id;

-- 2. How many works does each artist have in the database? Display the artist's full name along with the count of their works, ordered by the count in descending order.
select a.full_name,count(w.work_id) as work_count
from artist a
left join work w on
a.artist_id=w.artist_id
group by a.full_name
order by work_count desc;

-- 3. List the top 5 museums with the highest number of works displayed in the database, along with their respective counts
select m.name,count(w.work_id) as num_of_work
from museum m 
left join work w on
m.museum_id=w.museum_id
group by m.name
order by num_of_work desc
limit 5;

-- 4. Display the names and styles of the works along with the corresponding museum names, ordered by the museum name in ascending order. Limit the results to 10.
select m.name,w.name,count(w.style) as work_style
from museum m
left join work w on
m.museum_id=w.museum_id
group by m.name,w.name
order by m.name 
limit 10;

-- 5. Show the total sale price for each artist's works. Display the artist's full name along with the total sale price, ordered by the total sale price in descending order.
select w.name,a.full_name,sum(p.sale_price) as saleprice
from work w
left join product_size p on
p.work_id=w.work_id
right join artist a on
w.artist_id=a.artist_id
group by w.name,a.full_name
order by saleprice desc;

-- 6. List artists who have more than 3 works in the database, along with the count of their works.
select a.full_name,count(w.work_id) as work_count
from artist a
left join work w on 
a.artist_id=w.artist_id
group by a.full_name
having count(w.work_id)>3
order by work_count desc;

-- 7. Retrieve the names of works and their corresponding artists' full names for works that have a sale price smaller than their regular price. 
select w.name,a.full_name,sum(p.sale_price) as sale_price
from artist a
left join work w on
a.artist_id=w.artist_id
right join product_size p on
w.work_id=p.work_id
where sale_price <= regular_price
group by a.full_name,w.name
order by sale_price desc;
 
-- 8. Calculate the average height and width of the artworks in the database. Display the average height and width.
select avg(height) as avgheight,avg(width) as avgwidth
from canvas_size c
left join product_size p on
c.size_id=p.size_id;

-- 9 Find the maximum sale price among all the works in each museum. Display the museum name along with the maximum sale price.
 select w.name,m.name,max(p.sale_price) as maxprice
from work w 
left join product_size p on
p.work_id=w.work_id
right join museum  m on
w.museum_id=m.museum_id
group by w.name,m.name
order by maxprice desc;

-- 10. Concatenate the first name and last name of artists along with their nationality, separated by a comma. Display the concatenated string along with the count of works by each artist, ordered by the count in descending order.
select concat(a.first_name, '  ' ,a.last_name) as artist_info,a.nationality,count(w.work_id) as work_id
from artist a
left join work w on
a.artist_id=w.artist_id
group by a.first_name,a.last_name,a.nationality
order by work_id desc;










