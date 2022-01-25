-- 1. Which actor has appeared in the most films?
use sakila;

select first_name, last_name, count(film_id) as film_count from film_actor
inner join actor 
on actor.actor_id = film_actor.actor_id
group by actor.actor_id
order by film_count desc
limit 1;

-- 2. Most active customer (the customer that has rented the most number of films)
select first_name, last_name, count(inventory_id) as inventory_count from rental
inner join customer 
on customer.customer_id = rental.customer_id
group by customer.customer_id
order by inventory_count desc
limit 1;

-- 3. List number of films per category.
select `name`, count(film_id) as film_count from film_category
inner join category 
on category.category_id = film_category.category_id -- using(category_id)
group by category.category_id
order by film_count desc;

-- 4. Display the first and last names, as well as the address, of each staff member.
select first_name, last_name, address from staff
inner join address 
using(address_id);

-- 5. Display the total amount rung up by each staff member in August of 2005.
select first_name, last_name, sum(amount) from payment
inner join staff
using(staff_id)
where payment_date between "2005-08-01" and "2005-08-31"
group by staff_id;

-- 6. List each film and the number of actors who are listed for that film.
select title, count(actor_id) as actor_count from film
inner join film_actor 
using(film_id)
group by title;

-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
select first_name, last_name, sum(amount) as total_paid from payment
inner join customer
using(customer_id)
group by customer_id;

-- List the customers alphabetically by last name. 
select first_name, last_name, sum(amount) as total_paid from payment
inner join customer
using(customer_id)
group by customer_id
order by last_name asc;

-- Bonus: Which is the most rented film? The answer is Bucket Brotherhood. This query might require using more than one join statement. 
select title from film
inner join inventory
using(film_id)
inner join rental
using(inventory_id)
group by title
order by count(rental_id) desc
limit 1;

