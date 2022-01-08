-- Rank films by length (filter out the rows that have nulls or 0s in length column)
--  In your output, only select the columns title, length, and the rank

  select title,`length`,
  rank() over (order by `length` desc) as `ranks`
  from sakila.film
  where `length` is Not Null or `length`<> 0;
  
  
  
-- Rank films by length within the rating category (filter out the rows that have nulls or 0s in length column)In your
-- output only select the columns title, length, rating and the rank

  select title,`length`,rating,
  rank() over (partition by rating order by `length` desc) as `ranks`
  from sakila.film
  where `length` is Not Null or `length`<> 0;
  

-- How many films are there for each of the categories in the category table. Use appropriate join to write this query

select name as categories,count(*) as number_of_films
from sakila.category c  
join sakila.film_category fc on c.category_id = fc.category_id
group by name;

-- Which actor has appeared in the most films?

select first_name,last_name,count(*) as number_of_films
from sakila.film_actor fa
join sakila.actor a on a.actor_id = fa.actor_id
group by first_name,last_name
Order by number_of_films Desc
Limit 1;

-- Most active customer (the customer that has rented the most number of films)

 select first_name,last_name,count(*) as most_active_customers
 from sakila.customer c
 join sakila.rental r on r.customer_id = c.customer_id
 group by first_name,last_name
 Order by most_active_customers Desc
 Limit 1;
 

-- Bonus: Which is the most rented film? The answer is Bucket Brotherhood This query might require using more
#  than one join statement. Give it a try. We will talk about queries with multiple join statements later in the 
#  lessons

-- first step to find most rented inventory_id
-- second step to find most rented film_id
-- third step to find most rented film


select f.title,count(*) as number_of_rentals
from sakila.rental r
Join sakila.inventory i on r.inventory_id = i.inventory_id
Join sakila.film f on i.film_id = f.film_id
group by i.film_id
Order by number_of_rentals Desc
Limit 1;




	 



