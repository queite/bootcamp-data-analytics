-- 1 - Faça um select que recupere o nome do cliente na tabela customer e o distrito na tabela address.
SELECT 
    customer.first_name, address.district
FROM
    customer
        JOIN
    address ON customer.customer_id = address.address_id;

-- 2 - Busca a quantidade de filmes agrupando pelo idioma do filme.
SELECT 
    language.name, COUNT(film.film_id)
FROM
    film
        JOIN
    language ON film.language_id = language.language_id
GROUP BY language.name;

-- 3 - Recupere o nome e sobrenome do cliente (customer) e a quantidade de locações (rental) que ele fez, com ordenação do maior para o menor.
SELECT 
    first_name, last_name, COUNT(r.rental_id) qtd_locacoes
FROM
    customer c
        JOIN
    rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY qtd_locacoes DESC;

-- Desafio: descobrir qual o filme mais lucrativo para a locadora até o momento. 
-- minha solução:
SELECT 
    f.film_id,
    f.title,
    COUNT(i.film_id) * f.rental_rate valor_total
FROM
    film f
        JOIN
    inventory i ON f.film_id = i.film_id
        JOIN
    rental r ON i.inventory_id = r.inventory_id
GROUP BY i.film_id
ORDER BY valor_total DESC
LIMIT 1;

-- solução aula:
SELECT film.title, SUM(payment.amount) total
FROM payment
JOIN rental ON payment.rental_id = rental.rental_id
JOIN inventory ON inventory.inventory_id = rental.inventory_id
JOIN film ON film.film_id = inventory.film_id
GROUP BY film.film_id
ORDER BY total DESC
LIMIT 1;
