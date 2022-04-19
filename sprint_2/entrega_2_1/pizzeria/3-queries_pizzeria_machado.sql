USE `pizzeria_machado`;

-- Llista quants productes del tipus 'begudes' s'han venut en una determinada localitat
SELECT l.nom AS 'localitat' , p.nom AS 'tipus producte', c.id AS 'ID comanda'
FROM localitats l
JOIN botiga b
	ON b.localitats_id = l.id
JOIN comandes c
	ON c.botiga_id = b.id 
JOIN conte_productes cp
	ON cp.comandes_id = c.id
JOIN productes p
	ON p.id = cp.productes_id
WHERE l.nom = 'L15' AND p.nom = 'beguda';
    

-- Llista quantes comandes ha efectuat un determinat empleat
SELECT e.nom AS 'NOM EMPLEAT', c.id AS 'ID COMANDA'
FROM comandes c
JOIN empleats e
	ON c.empleats_id = e.id
JOIN feines f
	ON e.feines_id = f.id
WHERE f.feina = 'repartidor' and e.id = 1;
    
