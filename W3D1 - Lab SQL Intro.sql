use sakila;
select actor_id, first_name, last_name, last_update from actor;

#Select one column from a table. Get film titles.
select * from film;
select title from film;

#Select one column from a table and alias it. 
#Get unique list of film languages under the alias language. 
#Note that we are not asking you to obtain the language per each film, 
#but this is a good time to think about how you might get that information in the future.
select title from film as title_of_film;
select distinct name from language;


#5.1 Find out how many stores does the company have?
select * from store;

#5.2 Find out how many employees staff does the company have?
select * from staff;

#5.3 Return a list of employee first names only?
select first_name from staff;
