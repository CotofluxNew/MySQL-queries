1.- Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els/les alumnes. El llistat haurà d estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.

SELECT persona.apellido1, persona.apellido2, persona.nombre 
FROM persona
WHERE persona.tipo = "alumno"
ORDER BY persona.apellido1, persona.apellido2, persona.nombre DESC;

2.- Esbrina el nom i els dos cognoms dels/les alumnes que no han donat d alta el seu número de telèfon en la base de dades.

SELECT  persona.nombre, persona.apellido1, persona.apellido2, persona.telefono
FROM persona
WHERE telefono IS NULL and persona.tipo = "alumno";


3.- Retorna el llistat dels/les alumnes que van néixer en 1999.

SELECT persona.apellido1, persona.apellido2, persona.nombre, persona.fecha_nacimiento
FROM persona
WHERE persona.fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31' and persona.tipo ="alumno";

4.- Retorna el llistat de professors/es que no han donat d alta el seu número de telèfon en la base de dades i a més el seu NIF acaba en K.

SELECT persona.apellido1, persona.apellido2, persona.nombre, persona.nif, persona
.tipo
FROM persona
WHERE tipo = 'profesor' and nif LIKE '%K' ;

5.-Retorna el llistat de les assignatures que s imparteixen en el primer quadrimestre, en el tercer curs del grau que té l identificador 7.

SELECT nombre
FROM asignatura
WHERE cuatrimestre = 1 and curso = 3 AND id_grado = 7;

6.- Retorna un llistat dels professors/es juntament amb el nom del departament al qual estan vinculats/des. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.


SELECT per.apellido1, per.apellido2, per.nombre, de.nombre AS Departamento
FROM persona per
JOIN profesor pro
ON per.id = pro.id_profesor
JOIN departamento de 
ON pro.id_departamento = de.id
WHERE per.tipo = 'profesor'
ORDER BY per.apellido1, per.apellido2, per.nombre 

7.- Retorna un llistat amb el nom de les assignatures, any d inici i any de fi del curs escolar de l alumne/a amb NIF 26902806M.

SELECT a.nombre, ce.anyo_inicio, ce.anyo_fin
FROM persona p
JOIN alumno_se_matricula_asignatura m
ON m.id_alumno = p.id
JOIN  asignatura a
ON a.id = m.id_asignatura
JOIN curso_escolar ce
ON ce.id = m.id_curso_escolar
WHERE p.nif = '26902806M'

8.- Retorna un llistat amb el nom de tots els departaments que tenen professors/es que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).

SELECT d.nombre AS departamento_profe, a.nombre AS asignatura, p.id_profesor
FROM profesor p
JOIN asignatura a
ON p.id_profesor = a.id_profesor
JOIN departamento d
ON d.id = p.id_departamento
JOIN grado g
ON g.id = a.id_grado
WHERE g.id = 4;

9.- Retorna un llistat amb tots els/les alumnes que s han matriculat en alguna assignatura durant el curs escolar 2018/2019.

SELECT distinct p.nombre, p.apellido1, p.apellido2
FROM persona p
JOIN alumno_se_matricula_asignatura asm
ON p.id = asm.id_alumno
JOIN curso_escolar ce
ON asm.id_curso_escolar = ce.id
WHERE p.tipo = "alumno" and ce.id = 5;


Resol les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.

10.- Retorna un llistat amb els noms de tots els professors/es i els departaments que tenen vinculats/des. El llistat també ha de mostrar aquells professors/es que no tenen cap departament associat. El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor/a. El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.

SELECT persona.nombre, persona.apellido1, persona.apellido2, departamento.nombre
  FROM persona
  LEFT JOIN departamento
    ON persona.id = departamento.id
WHERE persona.tipo = 'profesor'
ORDER BY persona.apellido1 DESC, persona.apellido2 DESC, persona.nombre DESC;

11.- Retorna un llistat amb els professors/es que no estan associats a un departament.

SELECT p.nombre, p.apellido1, p.apellido2
FROM persona p
LEFT JOIN profesor pf
ON pf.id_profesor = p.id
LEFT JOIN asignatura a
ON a.id_profesor = pf.id_profesor
WHERE (p.tipo = 'profesor') AND (a.id_profesor IS NULL);

12.- Retorna un llistat amb els departaments que no tenen professors/es associats.

SELECT d.nombre
FROM departamento d
LEFT JOIN profesor pf
ON pf.id_departamento = d.id
WHERE pf.id_departamento IS NULL

13.- Retorna un llistat amb els professors/es que no imparteixen cap assignatura.

SELECT persona.nombre, persona.apellido1, persona.apellido2, asignatura.nombre
  FROM asignatura
 RIGht JOIN persona
    ON persona.id = asignatura.id_profesor
WHERE persona.tipo = 'profesor' and asignatura.nombre is null;

14.- Retorna un llistat amb les assignatures que no tenen un professor/a assignat.

SELECT persona.nombre, persona.apellido1, persona.apellido2, asignatura.nombre
  FROM persona
 RIGht JOIN asignatura
    ON persona.id = asignatura.id_profesor
WHERE asignatura.id_profesor is null

15.- Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.

SELECT d.nombre AS departamento, a.nombre AS asignatura, m.id_curso_escolar
FROM departamento d
LEFT JOIN profesor p
ON p.id_departamento = d.id
LEFT JOIN asignatura a 
ON a.id_profesor = p.id_profesor
LEFT JOIN alumno_se_matricula_asignatura m
ON m.id_asignatura = a.id
WHERE a.nombre IS NULL OR m.id_curso_escolar IS NULL

Consultes resum:

16.- Retorna el nombre total d alumnes que hi ha.

SELECT count(*) 
from alumno_se_matricula_asignatura

17.- Calcula quants/es alumnes van néixer en 1999.

SELECT count(*) 
from persona
WHERE persona.fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31'

18.- Calcula quants/es professors/es hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors/es que hi ha en aquest departament. El resultat només ha d incloure els departaments que tenen professors/es associats i haurà d estar ordenat de major a menor pel nombre de professors/es.

SELECT d.nombre AS departamento, COUNT(p.id) AS profesores
FROM persona p
JOIN profesor pf
ON p.id = pf.id_profesor
JOIN departamento d
ON d.id = pf.id_departamento
WHERE p.tipo = 'profesor' 
GROUP BY d.nombre
ORDER BY profesores DESC

19.- Retorna un llistat amb tots els departaments i el nombre de professors/es que hi ha en cadascun d ells. Té en compte que poden existir departaments que no tenen professors/es associats/des. Aquests departaments també han d aparèixer en el llistat.

SELECT d.nombre AS departamento, COUNT(pf.id_profesor) AS profesores
FROM departamento d
LEFT JOIN profesor pf
ON pf.id_departamento = d.id
WHERE (pf.id_profesor = @pf.id_profesor OR @pf.id_profesor IS NULL)
GROUP BY d.nombre

20.- Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d assignatures que té cadascun. Té en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d aparèixer en el llistat. El resultat haurà d estar ordenat de major a menor pel nombre d assignatures.

SELECT g.nombre AS grado, COUNT(a.id) AS asignaturas 
FROM grado g
LEFT JOIN asignatura a
ON a.id_grado = g.id
WHERE (g.id = @g.id OR @g.id IS NULL)
GROUP BY g.nombre
ORDER BY asignaturas DESC

21.- Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades.

SELECT  DISTINCT g.nombre, count(a.nombre)
FROM grado g
JOIN asignatura a
WHERE a.id_grado = g.id
group by g.nombre
HAVING count(a.nombre)>40;

22.- Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d assignatura. El resultat ha de tenir tres columnes: nom del grau, tipus d assignatura i la suma dels crèdits de totes les assignatures que hi ha d aquest tipus.

SELECT g.nombre as Nom_grau, a.tipo, sum(a.creditos) as Creditos_tipo
FROM grado g
LEFT JOIN asignatura a
ON g.id = a.id_grado
GROUP BY g.nombre, a.tipo;

23.- Retorna un llistat que mostri quants/es alumnes s han matriculat d alguna assignatura en cadascun dels cursos escolars. El resultat haurà de mostrar dues columnes, una columna amb l any d inici del curs escolar i una altra amb el nombre d alumnes matriculats/des.

24.- Retorna un llistat amb el nombre d assignatures que imparteix cada professor/a. El llistat ha de tenir en compte aquells professors/es que no imparteixen cap assignatura. El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d assignatures. El resultat estarà ordenat de major a menor pel nombre d assignatures.

25.- Retorna totes les dades de l alumne més jove.

SELECT * from persona WHERE persona.fecha_nacimiento  = (SELECT max(persona.fecha_nacimiento)
from persona);

26.- Retorna un llistat amb els professors/es que tenen un departament associat i que no imparteixen cap assignatura.


