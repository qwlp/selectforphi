### 1. List all films with their language names.
```sql
SELECT * FROM film
INNER JOIN language
ON film.language_id = language.language_id;
```

### 2. Get all films along with their category names.
```sql
select * from film f
inner join film_category fc on fc.film_id = f.film_id
inner join category c
on c.category_id = fc.category_id;
```

### 3. List all films and their corresponding actors.
```sql
select * from film f
inner join film_actor fa on fa.film_id = f.film_id
inner join actor a
on a.actor_id = fa.actor_id;
```

### 4. Show all customers and their city names.
```sql
select customer.first_name, customer.last_name, city.city from customer
inner join address on address.address_id = customer.address_id
inner join city
on city.city_id = address.city_id;
```

### 5. Get all payments made along with customer names.

```sql
select c.first_name, c.last_name, p.payment_id, p.amount from payment p
inner join customer c
on c.customer_id = p.customer_id;
```

### 6. List all rentals along with customer and staff names.
```sql
select r.rental_id, c.first_name, c.last_name, s.first_name, s.last_name
from rental r
inner join customer c on c.customer_id = r.customer_id
inner join staff s on s.staff_id = r.staff_id;
```

### 7. Show each store with its manager’s name and address.
```sql
select sto.id, sta.first_name, sta.last_name, address.address from store sto
inner join staff sta on sta.store_id = sto.store_id
inner join address on sta.address_id = address.address_id
```

### 8. Find all customers and their rental film titles.
```sql
select c.first_name, c.last_name, f.title from customer c
inner join rental r on r.customer_id = c.customer_id
inner join inventory i on i.inventory_id = r.inventory_id
inner join film f on f.film_id = i.film_id;
```

### 9. List all actors who have acted in ‘ACADEMY DINOSAUR’.
```sql
select a.first_name, a.last_name from actor a
inner join film_actor fa on fa.actor_id = a.actor_id
inner join film f on f.film_id = fa.film_id
where f.title = 'ACADEMY DINOSAUR';
```

### 10. Get total payments made per customer.
```sql
select p.customer_id, sum(p.amount) from payment p
group by p.customer_id;
```

### 11. List all customers and their payments (include those with no payments).
```sql
select p.customer_id, p.amount from payment p
order by p.customer_id;
```

### 12. Show all films and their categories (include films without categories).
```sql
select f.title, c.name from film f
left join category c on c.film_id = f.film_id;
```

### 13. Find all categories and the films in them (include categories without films).
```sql
select c.name, f.title from category c
left join film f on f.film_id = c.film_id
group by c.name;
```

### 14. Show all addresses and their customers (include addresses not linked to any customer).
```sql
select a.address, c.first_name, c.last_name from customer c
left join address a on a.customer_id = c.customer_id;
```

### 15. List all staff and their processed payments (including staff with none).
```sql
select s.first_name, s.last_name, p.payment_id, p.amount from payment p
left join staff s on s.staff_id = p.staff_id;
```

### 16. Display all languages and their associated films (including languages with no films).
```sql
select l.name, f.title from film f
left join language l on l.film_id = f.film_id;
```

### 17. Find all stores and the customers they serve (include stores with no customers).
```sql
select s.store_id, c.first_name, c.last_name from store s
left join customer c on c.store_id = s.store_id;
```

### 18. Generate all possible pairs of staff and stores (CROSS JOIN).
```sql
select * from staff
cross join stores;
```

### 19. Show all combinations of languages and categories (CROSS JOIN).
```sql
select * from language
cross join category;
```

### 20. Generate all possible customer-film combinations (CROSS JOIN, limited).
```sql
select * from customer
cross join film;
```

### 21. List all pairs of actors who share the same last name (SELF JOIN).
```sql
select * from actor a1
inner join actor a2
on a1.last_name = a2.last_name;
```

### 22. Compare film lengths to find films longer than others (SELF JOIN).
```sql
select * from film f1
inner join film f2
on f1.length > f2.length;
```

### 23. Find customers who rented from a specific store (store 1).
```sql
select s.store_id, c.first_name, c.last_name from customer c
inner join store s on s.store_id = c.store_id
where s.store_id = 1;
```

### 24. Show number of films per category.
```sql
select c.name, count(f.film_id) from film_category fc
inner join category c on c.category_id = fc.category_id
group c.category_id;
```

### 25. Display staff names and the number of rentals they processed.
```sql
select s.first_name, s.last_name, count(r.rental_id) from rental r
inner join staff s on s.staff_id = r.staff_id
group by s.staff_id;
```
