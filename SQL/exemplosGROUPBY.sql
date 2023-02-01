-- 1 - Na tabela actor, agrupe os registros pelo last_name para saber quantos atores têm o mesmo sobrenome.
SELECT last_name, COUNT(actor_id) total
FROM actor
GROUP BY last_name;

-- 2 - Na tabela customer, conte a quantidade de clientes ativos e inativos (bonus: colocar as palavras ativo e inativo, em vez de 0 e 1)
SELECT active, COUNT(customer_id),
    (CASE
        WHEN active = 1 THEN 'ativo'
        ELSE 'inativo'
    END) status
FROM customer
GROUP BY active;

-- Gambiarra
SELECT REPLACE(REPLACE(active, '1', 'ativo'), '0', 'inativo'), COUNT(customer_id)
FROM customer
GROUP BY active;