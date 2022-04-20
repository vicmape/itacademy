USE universidad;


-- Si us plau, descàrrega la base de dades del fitxer schema_universidad.sql, visualitza el diagrama E-R en un editor i efectua les següents consultes:


-- 1 - Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.
SELECT p.apellido1, p.apellido2, p.nombre FROM persona p WHERE p.tipo = 'alumno' ORDER BY p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;
 
-- 2 - Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades.
SELECT p.nombre, p.apellido1, p.apellido2 FROM persona p WHERE p.tipo = 'alumno' AND p.telefono IS NULL;

-- 3 - Retorna el llistat dels alumnes que van néixer en 1999.
SELECT p.nombre, p.apellido1, p.apellido2 FROM persona p WHERE p.tipo = 'alumno' AND p.fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31';
 
-- 4 - Retorna el llistat de professors que no han donat d'alta el seu número de telèfon en la base de dades i a més la seva nif acaba en K.
SELECT p.nombre, p.apellido1, p.apellido2 FROM persona p WHERE p.tipo = 'profesor' AND p.telefono IS NULL AND p.nif REGEXP 'K$';

-- 5 - Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.
SELECT a.nombre AS 'asignatura' FROM asignatura a WHERE a.cuatrimestre = 1 AND a.curso = 3 AND a.id_grado = 7;

-- 6 - Retorna un llistat dels professors juntament amb el nom del departament al qual estan vinculats. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.
SELECT p.apellido1, p.apellido2, p.nombre, d.nombre AS 'departamento' FROM profesor pr JOIN departamento d ON pr.id_departamento = d.id JOIN persona p ON pr.id_profesor = p.id ORDER BY p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;

-- 7 - Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne amb nif 26902806M.
SELECT a.nombre AS 'asignatura', ce.anyo_inicio AS 'any inici', ce.anyo_fin AS 'any fi', p.nif AS 'nif' FROM persona p JOIN alumno_se_matricula_asignatura asma ON p.id = asma.id_alumno JOIN curso_escolar ce ON ce.id = asma.id_curso_escolar JOIN asignatura a ON a.id = asma.id_asignatura WHERE p.nif = '26902806M';

-- 8 - Retorna un llistat amb el nom de tots els departaments que tenen professors que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).
SELECT DISTINCT d.nombre AS 'departamento' FROM grado g JOIN asignatura a ON g.id = a.id_grado JOIN profesor p ON p.id_profesor = a.id_profesor JOIN departamento d ON d.id = p.id_departamento WHERE g.nombre LIKE 'Grado en Ingeniería Informática (Plan 2015)';

-- 9 - Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.
SELECT DISTINCT p.apellido1, p.apellido2, p.nombre FROM persona p JOIN alumno_se_matricula_asignatura asma ON p.id = asma.id_alumno JOIN curso_escolar ce ON ce.id = asma.id_curso_escolar WHERE ce.anyo_inicio = 2018 AND ce.anyo_fin = 2019;


-- Resolgui les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.

-- 1 - Retorna un llistat amb els noms de tots els professors i els departaments que tenen vinculats. El llistat també ha de mostrar aquells professors que no tenen cap departament associat. El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor. El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.
SELECT d.nombre AS 'departamento', p.apellido1, p.apellido2, p.nombre AS 'profesor' FROM persona p LEFT JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN departamento d ON d.id = pr.id_departamento WHERE p.tipo = 'profesor' ORDER BY d.nombre ASC, p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;

-- 2 - Retorna un llistat amb els professors que no estan associats a un departament.
SELECT p.nombre AS 'profesor' FROM persona p WHERE p.tipo = 'profesor' AND p.id NOT IN (SELECT p.id FROM profesor pr JOIN departamento d ON pr.id_departamento = d.id JOIN persona p ON pr.id_profesor = p.id);
 
-- 3 - Retorna un llistat amb els departaments que no tenen professors associats.
SELECT * FROM departamento d WHERE d.id NOT IN ( SELECT pr.id_departamento FROM profesor pr); 

-- 4 - Retorna un llistat amb els professors que no imparteixen cap assignatura.
SELECT p.nombre FROM persona p WHERE p.tipo = 'profesor' AND p.id NOT IN (SELECT a.id_profesor FROM asignatura a);
 
-- 5 - Retorna un llistat amb les assignatures que no tenen un professor assignat.
SELECT a.nombre FROM asignatura a WHERE a.id_profesor IS NULL;

-- 6 - Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.
SELECT d.nombre FROM departamento d WHERE d.id NOT IN (SELECT pr.id_departamento FROM profesor pr JOIN asignatura a USING (id_profesor)); 


-- Consultes resum:


-- 1 - Retorna el nombre total d'alumnes que hi ha.
SELECT COUNT(p.id) FROM persona p WHERE p.tipo = 'alumno';

-- 2 - Calcula quants alumnes van néixer en 1999.
SELECT COUNT(p.id) FROM persona p WHERE p.tipo = 'alumno' AND p.fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31';
 
-- 3 - Calcula quants professors hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors que hi ha en aquest departament. El resultat només ha d'incloure els departaments que tenen professors associats i haurà d'estar ordenat de major a menor pel nombre de professors.
SELECT d.nombre AS 'departamento', COUNT(pr.id_departamento) AS 'profesores' FROM departamento d JOIN profesor pr ON pr.id_departamento = d.id GROUP BY d.nombre ORDER BY profesores DESC;
 
-- 4 - Retorna un llistat amb tots els departaments i el nombre de professors que hi ha en cadascun d'ells. Tingui en compte que poden existir departaments que no tenen professors associats. Aquests departaments també han d'aparèixer en el llistat.
SELECT d.nombre AS 'departamento', COUNT(pr.id_profesor) AS 'profesores' FROM departamento d LEFT JOIN profesor pr ON pr.id_departamento = d.id GROUP BY d.nombre ORDER BY profesores DESC;

-- 5 - Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. Tingui en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.
SELECT g.nombre AS 'grado', COUNT(a.id) AS 'asignaturas' FROM grado g LEFT JOIN asignatura a ON a.id_grado = g.id GROUP BY g.nombre ORDER BY asignaturas DESC;

-- 6 - Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades.
SELECT g.nombre AS 'grado', COUNT(a.id) AS asignaturas FROM grado g LEFT JOIN asignatura a ON a.id_grado = g.id GROUP BY g.nombre HAVING asignaturas > 40 ORDER BY asignaturas DESC;

-- 7 - Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus.
SELECT g.nombre AS 'grado', a.tipo, SUM(a.creditos) AS 'creditos' FROM grado g JOIN asignatura a ON a.id_grado = g.id GROUP BY g.nombre, a.tipo;

-- 8 - Retorna un llistat que mostri quants alumnes s'han matriculat d'alguna assignatura en cadascun dels cursos escolars. El resultat haurà de mostrar dues columnes, una columna amb l'any d'inici del curs escolar i una altra amb el nombre d'alumnes matriculats.
SELECT ce.anyo_inicio, COUNT(asma.id_alumno) AS 'alumnos matriculados' FROM curso_escolar ce LEFT JOIN alumno_se_matricula_asignatura asma ON asma.id_curso_escolar = ce.id GROUP BY ce.anyo_inicio;

-- 9 - Retorna un llistat amb el nombre d'assignatures que imparteix cada professor. El llistat ha de tenir en compte aquells professors que no imparteixen cap assignatura.m El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d'assignatures. El resultat estarà ordenat de major a menor pel nombre d'assignatures.
SELECT p.id, p.nombre, p.apellido1, p.apellido2, COUNT(a.id) AS 'nombre_asignaturas' FROM persona p LEFT JOIN asignatura a ON a.id_profesor = p.id WHERE p.tipo = 'profesor' GROUP BY p.id ORDER BY nombre_asignaturas DESC; 

-- 10 - Retorna totes les dades de l'alumne més jove.
SELECT * FROM persona p WHERE p.tipo = 'alumno' ORDER BY p.fecha_nacimiento DESC LIMIT 1; 

-- 11 - Retorna un llistat amb els professors que tenen un departament associat i que no imparteixen cap assignatura.
SELECT p.nombre, p.apellido1, p.apellido2 FROM persona p JOIN profesor pr ON pr.id_profesor = p.id WHERE pr.id_profesor NOT IN (SELECT DISTINCT a.id_profesor FROM asignatura a WHERE a.id_profesor IS NOT NULL);
