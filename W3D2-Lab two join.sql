use sakila;
select * from actor;

#Which actor has appeared in the most films?
select count(actor.actor_id), first_name, last_name
from actor inner join film_actor on actor.actor_id = film_actor.actor_id
GROUP BY actor.actor_id
order by count(actor.actor_id) desc limit 1;

#Most active customer (the customer that has rented the most number of films)
select count(customer.customer_id), first_name, last_name
from customer inner join rental on customer.customer_id = rental.customer_id
GROUP BY customer.customer_id
order by count(customer.customer_id) desc limit 1;

#List number of films per category
SELECT category.name, count(*)
FROM film_category inner join category on film_category.category_id = category.category_id
GROUP BY category.category_id, category.name
ORDER BY name;


#Display the first and last names, as well as the address, of each staff member
SELECT a.first_name, a.last_name, b.address as staff_address
from staff a
join address b
using(address_id);

#Display the total amount rung up by each staff member in August of 2005
SELECT a.first_name, a.last_name, sum(b.amount) as total_sale
from staff a
join payment b
using(staff_id)
where year(payment_date) = 2005 and month(payment_date) = 08
group by staff_id;

#List each film and the number of actors who are listed for that film
SELECT title, count(l.actor_id) as number_of_actors
from sakila.film as a
left join sakila.film_actor as l on
a.film_id = l.film_id
group by l.film_id, title order by number_of_actors DESC;

#Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
#List the customers alphabetically by last name
select last_name, first_name, sum(amount) as total_paid from sakila.payment as a
inner join sakila.customer as l on
a.customer_id = l.customer_id
group by a.customer_id order by (last_name) ASC;


#Optional: Which is the most rented film? The answer is Bucket Brotherhood 
#This query might require using more than one join statement. Give it a try.
select title, film_id, store_id, count(inventory_id) as freq from film
inner join inventory using(film_id)
inner join rental using(inventory_id)
group by title
order by freq desc
limit 1;
