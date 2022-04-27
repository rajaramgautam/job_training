select first_name, last_name, email from customer;

select distinct rating from film;

select email from customer where first_name = 'Nancy' and last_name = 'Thomas';

select description from film where title = 'Outlaw Hanky';

select phone from address where address = '259 Ipoh Drive';

select customer_id from payment
order by payment_date
limit 10;

select title from film
order by length asc
limit 5;

select count(*) from film where length <= 50;

select * from payment
limit 2;

select count(*) from payment where amount > 5;
select count(amount) from payment where amount > 5;

select count(first_name) from actor where first_name like 'A%';

select count(distinct(district)) from address;

select distinct(district) from address;

select count(*) from film 
where rating = 'R' and replacement_cost between 5 and 15;

select count(*) from film where title like "%Truman%";

select staff_id, count(*) from payment
group by staff_id;

select * from film limit 1;

select rating, round(avg(replacement_cost), 2) from film 
group by rating;

select * from customer limit 1;

select * from payment limit 1;

select customer_id, sum(amount) as total_spent from payment
group by customer_id
order by total_spent desc
limit 5;

select customer_id, count(payment_id) from payment
group by customer_id
having count(payment_id) >= 40;

select customer_id, sum(amount)from payment
where staff_id = 2
group by customer_id
having sum(amount) > 100;

select customer_id, sum(amount)from payment
where staff_id = 2
group by customer_id
having sum(amount) >= 110;

select * from film limit 1;

select count(*) from film where title like 'J%';


-- 3. What customer has the highest customer ID number whose name starts 
-- with an 'E' and has an address ID lower than 500?

-- select * from customer limit 1;

select concat(first_name, ' ', last_name) from customer where first_name like 'E%' AND address_id < 500
order by customer_id desc
limit 1;


-- 04/26/2022

select * from customer limit 1;
select * from address limit 100;
select * from city limit 1;
select * from country limit 1;

select email, district from customer 
join address on customer.address_id = address.address_id
where district = 'California';

select * from film limit 1;
select * from actor limit 1;
select * from film_actor limit 1;

-- getting actor_id for Nick Wahlberg
select actor_id from actor 
where first_name = 'Nick' and last_name = 'Wahlberg';

-- getting film_id with actor_id = 2
select distinct film_id from film_actor where actor_id = (select actor_id from actor 
where first_name = 'Nick' and last_name = 'Wahlberg');

-- getting title of film with film_id received above.
select title from film 
where film_id in (select distinct film_id from film_actor where actor_id = (select actor_id from actor 
where first_name = 'Nick' and last_name = 'Wahlberg'));

-- Using Join Concepts
select title from film
join film_actor on film.film_id = film_actor.film_id
join actor on actor.actor_id = film_actor.actor_id
where first_name = 'Nick' and last_name = 'Wahlberg';

--Advanced SQL
SHOW TIMEZONE;

-- Selecting Time Zone
select now()

-- During which months payment occur
select * from payment;

select extract(month from payment_date) as pay_month from payment;
select distinct(to_char(payment_date, 'Month')) as pay_month from payment;

# number of transaction on monday
select count((to_char(payment_date, 'Day'))) from payment
where (to_char(payment_date, 'Day')) = 'Monday   ' ;
