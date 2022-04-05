USE optica_machado;

-- NOTA: Es podria fer tot molt més maco amb JOINS i demés per no mostrar les dades en cru, però es el primer exercici i farè estrictament el que es demana

-- Llista el total de compres d'un client
SELECT *
FROM sale s
WHERE s.client_id = 11;


-- Llista les diferents ulleres que ha venut un empleat durant un any
SELECT *
FROM sale
WHERE employee_id = 1 AND sale_date >= '2022-01-01';


-- Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica

SELECT p.provider_name AS 'Provider' , b.brand_name AS 'Brand', s.sale_date AS 'Sales Date'
FROM provider p
JOIN brand b
JOIN glasses g
JOIN sale s
WHERE s.glasses_id = g.glasses_id AND g.brand_id = b.brand_id AND b.provider_id = p.provider_id
ORDER BY p.provider_name ASC;