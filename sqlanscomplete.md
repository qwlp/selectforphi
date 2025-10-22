1.  **Get all customers’ first and last names.**
    ```sql
    SELECT first_name, last_name FROM customer;
    ```

2.  **Show all films released in 2006.**
    ```sql
    SELECT * FROM film WHERE release_year = '2006';
    ```

3.  **Find all distinct ratings in the film table.**
    ```sql
    SELECT DISTINCT rating FROM film;
    ```

4.  **List all active customers.**
    ```sql
    SELECT * FROM customer WHERE active = 1;
    ```

5.  **Show the first 10 films.**
    ```sql
    SELECT * FROM film LIMIT 10;
    ```

6.  **Find films with a rental rate between 2.00 and 4.00.**
    ```sql
    SELECT * FROM film WHERE rental_rate BETWEEN 2.00 AND 4.00;
    ```

7.  **List actors whose first name starts with 'A'.**
    ```sql
    SELECT * FROM actor WHERE first_name LIKE 'A%';
    ```

8.  **Find customers from ‘California’.**
    ```sql
    SELECT c.first_name, c.last_name
    FROM customer c
    INNER JOIN address a ON c.address_id = a.address_id
    WHERE a.district = 'California';
    ```

9.  **Get films longer than 120 minutes.**
    ```sql
    SELECT * FROM film WHERE length > 120;
    ```

10. **Find customers whose last name contains ‘son’.**
    ```sql
    SELECT * FROM customer WHERE last_name LIKE '%son%';
    ```

11. **Count the number of films.**
    ```sql
    SELECT COUNT(*) FROM film;
    ```

12. **Find the average rental rate of all films.**
    ```sql
    SELECT AVG(rental_rate) FROM film;
    ```

13. **Find the maximum film length.**
    ```sql
    SELECT MAX(length) FROM film;
    ```

14. **Get total payment amount from all customers.**
    ```sql
    SELECT SUM(amount) FROM payment;
    ```

15. **Count how many customers per store.**
    ```sql
    SELECT store_id, COUNT(customer_id)
    FROM customer
    GROUP BY store_id;
    ```

16. **List each customer with their address.**
    ```sql
    SELECT c.first_name, c.last_name, a.address
    FROM customer c
    INNER JOIN address a ON c.address_id = a.address_id;
    ```

17. **Find all films and their language name.**
    ```sql
    SELECT f.title, l.name AS language
    FROM film f
    INNER JOIN language l ON f.language_id = l.language_id;
    ```

18. **List rentals with customer names.**
    ```sql
    SELECT r.rental_id, c.first_name, c.last_name
    FROM rental r
    INNER JOIN customer c ON r.customer_id = c.customer_id;
    ```

19. **Show payments with staff names.**
    ```sql
    SELECT p.payment_id, s.first_name, s.last_name
    FROM payment p
    INNER JOIN staff s ON p.staff_id = s.staff_id;
    ```

20. **Find all films rented by a specific customer (e.g., “MARY SMITH”).**
    ```sql
    SELECT f.title
    FROM film f
    INNER JOIN inventory i ON f.film_id = i.film_id
    INNER JOIN rental r ON i.inventory_id = r.inventory_id
    INNER JOIN customer c ON r.customer_id = c.customer_id
    WHERE c.first_name = 'MARY' AND c.last_name = 'SMITH';
    ```

21. **Count number of films per rating.**
    ```sql
    SELECT rating, COUNT(film_id)
    FROM film
    GROUP BY rating;
    ```

22. **Find average rental rate per rating.**
    ```sql
    SELECT rating, AVG(rental_rate)
    FROM film
    GROUP BY rating;
    ```

23. **Show customers who made more than 20 rentals.**
    ```sql
    SELECT c.first_name, c.last_name, COUNT(r.rental_id) AS rental_count
    FROM customer c
    INNER JOIN rental r ON c.customer_id = r.customer_id
    GROUP BY c.customer_id
    HAVING COUNT(r.rental_id) > 20;
    ```

24. **Find stores with total payments greater than 3000.**
    ```sql
    SELECT s.store_id, SUM(p.amount)
    FROM store s
    INNER JOIN staff st ON s.manager_staff_id = st.staff_id
    INNER JOIN payment p ON st.staff_id = p.staff_id
    GROUP BY s.store_id
    HAVING SUM(p.amount) > 3000;
    ```

25. **List actors who appear in more than 15 films.**
    ```sql
    SELECT a.first_name, a.last_name, COUNT(fa.film_id) AS film_count
    FROM actor a
    INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
    GROUP BY a.actor_id
    HAVING COUNT(fa.film_id) > 15;
    ```

26. **Find films longer than the average film length.**
    ```sql
    SELECT * FROM film WHERE length > (SELECT AVG(length) FROM film);
    ```

27. **List customers who have made at least one payment.**
    ```sql
    SELECT DISTINCT c.first_name, c.last_name
    FROM customer c
    INNER JOIN payment p ON c.customer_id = p.customer_id;
    ```

28. **Get films that were never rented.**
    ```sql
    SELECT f.title
    FROM film f
    LEFT JOIN inventory i ON f.film_id = i.film_id
    LEFT JOIN rental r ON i.inventory_id = r.inventory_id
    WHERE r.rental_id IS NULL;
    ```

29. **Find customers who paid more than the average payment amount.**
    ```sql
    SELECT c.first_name, c.last_name, p.amount
    FROM customer c
    INNER JOIN payment p ON c.customer_id = p.customer_id
    WHERE p.amount > (SELECT AVG(amount) FROM payment);
    ```

30. **List all actors in the same films as “NICK WAHLBERG”.**
    ```sql
    SELECT a.first_name, a.last_name
    FROM actor a
    INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
    WHERE fa.film_id IN (
        SELECT fa.film_id
        FROM film_actor fa
        INNER JOIN actor a ON fa.actor_id = a.actor_id
        WHERE a.first_name = 'NICK' AND a.last_name = 'WAHLBERG'
    ) AND NOT (a.first_name = 'NICK' AND a.last_name = 'WAHLBERG');
    ```

31. **Find customers who have made at least one payment (EXISTS).**
    ```sql
    SELECT c.first_name, c.last_name
    FROM customer c
    WHERE EXISTS (
        SELECT 1 FROM payment p WHERE p.customer_id = c.customer_id
    );
    ```

32. **List customers with no rentals.**
    ```sql
    SELECT c.first_name, c.last_name
    FROM customer c
    LEFT JOIN rental r ON c.customer_id = r.customer_id
    WHERE r.rental_id IS NULL;
    ```

33. **Check if any customer has a NULL email.**
    ```sql
    SELECT * FROM customer WHERE email IS NULL;
    ```

34. **List staff with a non-null picture.**
    ```sql
    SELECT * FROM staff WHERE picture IS NOT NULL;
    ```

35. **Show stores that have at least one staff.**
    ```sql
    SELECT *
    FROM store s
    WHERE EXISTS (
        SELECT 1 FROM staff st WHERE st.store_id = s.store_id
    );
    ```

36. **List films with rental_rate = 4.99 AND replacement_cost > 20.**
    ```sql
    SELECT * FROM film WHERE rental_rate = 4.99 AND replacement_cost > 20;
    ```

37. **Get films with rating ‘PG’ OR ‘PG-13’.**
    ```sql
    SELECT * FROM film WHERE rating IN ('PG', 'PG-13');
    ```

38. **Find customers who are active AND from store 1.**
    ```sql
    SELECT * FROM customer WHERE active = 1 AND store_id = 1;
    ```

39. **List films not in English.**
    ```sql
    SELECT f.title, l.name
    FROM film f
    INNER JOIN language l ON f.language_id = l.language_id
    WHERE l.name != 'English';
    ```

40. **Display films where rental_rate > 3 AND length < 90.**
    ```sql
    SELECT * FROM film WHERE rental_rate > 3 AND length < 90;
    ```

41. **Find top 5 customers with the highest total payment.**
    ```sql
    SELECT c.first_name, c.last_name, SUM(p.amount) AS total_payment
    FROM customer c
    INNER JOIN payment p ON c.customer_id = p.customer_id
    GROUP BY c.customer_id
    ORDER BY total_payment DESC
    LIMIT 5;
    ```

42. **Show number of films per category.**
    ```sql
    SELECT c.name, COUNT(fc.film_id) AS number_of_films
    FROM category c
    INNER JOIN film_category fc ON c.category_id = fc.category_id
    GROUP BY c.name;
    ```

43. **List all films and their categories.**
    ```sql
    SELECT f.title, c.name AS category
    FROM film f
    INNER JOIN film_category fc ON f.film_id = fc.film_id
    INNER JOIN category c ON fc.category_id = c.category_id;
    ```

44. **Get all payments made on 2005-07-31.**
    ```sql
    SELECT * FROM payment WHERE DATE(payment_date) = '2005-07-31';
    ```

45. **Find customers with total payment over 100.**
    ```sql
    SELECT c.first_name, c.last_name, SUM(p.amount) AS total_payment
    FROM customer c
    INNER JOIN payment p ON c.customer_id = p.customer_id
    GROUP BY c.customer_id
    HAVING SUM(p.amount) > 100;
    ```

46. **Get the most rented film.**
    ```sql
    SELECT f.title, COUNT(r.rental_id) AS rental_count
    FROM film f
    INNER JOIN inventory i ON f.film_id = i.film_id
    INNER JOIN rental r ON i.inventory_id = r.inventory_id
    GROUP BY f.title
    ORDER BY rental_count DESC
    LIMIT 1;
    ```

47. **Find customers who rented the same film more than once.**
    ```sql
    SELECT c.first_name, c.last_name, f.title, COUNT(*) AS rental_count
    FROM customer c
    JOIN rental r ON c.customer_id = r.customer_id
    JOIN inventory i ON r.inventory_id = i.inventory_id
    JOIN film f ON i.film_id = f.film_id
    GROUP BY c.customer_id, f.film_id
    HAVING COUNT(*) > 1;
    ```

48. **Find languages with more than 100 films.**
    ```sql
    SELECT l.name, COUNT(f.film_id)
    FROM language l
    INNER JOIN film f ON l.language_id = f.language_id
    GROUP BY l.name
    HAVING COUNT(f.film_id) > 100;
    ```

49. **Display total revenue per month.**
    ```sql
    SELECT DATE_FORMAT(payment_date, '%Y-%m') AS payment_month, SUM(amount) AS total_revenue
    FROM payment
    GROUP BY payment_month
    ORDER BY payment_month;
    ```

50. **Get the actor who appeared in the most films.**
    ```sql
    SELECT a.first_name, a.last_name, COUNT(fa.film_id) AS film_count
    FROM actor a
    INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
    GROUP BY a.actor_id
    ORDER BY film_count DESC
    LIMIT 1;
    ```
