#1.How many copies of the film Hunchback Impossible exist in the inventory system?
use sakila;
select count(film_id) as num_films
from inventory
where film_id in (select film_id from film where title="Hunchback Impossible")
group by film_id;

select count(film_id) as num_films
from inventory inner join film using (film_id)
where title ="Hunchback Impossible"
group by film_id;

#2.List all films whose length is longer than the average of all the films.
SELECT AVG(length) AS average FROM film;
SELECT title
FROM film
where length > (SELECT AVG(length) AS average FROM film);

#3.Use subqueries to display all actors who appear in the film Alone Trip.
select CONCAT(first_name,' ',last_name) as 'Actors in Alone Trip'
from actor
where actor_id in 
(select actor_id from film_actor where film_id = 
(select film_id from film where title = 'Alone Trip'));

select first_name, last_name from actor
where actor_id in (select actor_id from film
inner join film_Actor using(film_id)
where title = 'Alone Trip');


#4.Sales have been lagging among young families, 
#and you wish to target all family movies for a promotion.
#Identify all movies categorized as family films.
select title from film
where film_id in (select film_id from film_category
join category using(category_id)
where name = "Family");


#5.Get name and email from customers from Canada using subqueries. 
#Do the same with joins. Note that to create a join, 
#you will have to identify the correct tables with their primary keys and foreign keys, 
#that will help you get the relevant information.
select first_name, last_name, email from customer
where address_id in (
select address_id
from address
where city_id in 
(select city_id from city where country_id in 
(select country_id from country where country = "Canada"))
);