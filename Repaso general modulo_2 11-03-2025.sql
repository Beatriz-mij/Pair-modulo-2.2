USE sakila;

-- Obtener los clientes y las películas que han alquilado.
SELECT c.customer_id, f.film_id, f.title
FROM customer AS c
JOIN rental AS r ON c.customer_id = r.customer_id
JOIN  inventory AS i ON r.inventory_id = i.inventory_id
JOIN film AS f ON i.film_id = f.film_id;

-- Obtener los actores y las películas en las que han actuado.
SELECT a.actor_id, a.first_name, a.last_name, f.title
FROM actor AS a
JOIN film_actor AS fa ON a.actor_id = fa.actor_id
JOIN film AS f ON fa.film_id = f.film_id;

-- Obtener todas las películas y, si están disponibles en inventario, mostrar la cantidad disponible.
SELECT f.film_id, f.title, COUNT(i.inventory_id)
FROM film AS f
LEFT JOIN inventory AS i ON f.film_id = i.film_id
GROUP BY f.title, f.film_id;
HAVING 

