1.- Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els/les alumnes. El llistat haurà d estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.

SELECT persona.apellido1, persona.apellido2, persona.nombre 
FROM persona
ORDER BY persona.apellido1, persona.apellido2, persona.nombre DESC

2.- Esbrina el nom i els dos cognoms dels/les alumnes que no han donat d alta el seu número de telèfon en la base de dades.

SELECT  persona.nombre, persona.apellido1, persona.apellido2, persona.telefono
FROM persona
WHERE telefono IS NULL


3.- Retorna el llistat dels/les alumnes que van néixer en 1999.

SELECT persona.apellido1, persona.apellido2, persona.nombre, persona.fecha_nacimiento
FROM persona
WHERE persona.fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31';


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

SELECT persona.nombre, persona.apellido1, persona.apellido2, departamento.nombre
FROM persona, departamento
WHERE persona.tipo = 'profesor'
ORDER BY persona.apellido1 DESC,  persona.apellido2 DESC, persona.nombre DESC;

7.- Retorna un llistat amb el nom de les assignatures, any d inici i any de fi del curs escolar de l alumne/a amb NIF 26902806M.

SELECT persona.nombre, persona.apellido1, persona.apellido2, persona.nif, 
curso_escolar.anyo_inicio, curso_escolar.anyo_fin, asignatura.nombre
FROM asignatura, alumno_se_matricula_asignatura, persona, curso_escolar
WHERE persona.nif ='26902806M'

8.- Retorna un llistat amb el nom de tots els departaments que tenen professors/es que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).

SELECT grado.nombre, persona.tipo, departamento.nombre
from grado, departamento, persona
WHERE persona.tipo = 'profesor' and grado.nombre ='Grado en IngenierÃ­a InformÃ¡tica (Plan 2015)';

9.- Retorna un llistat amb tots els/les alumnes que s han matriculat en alguna assignatura durant el curs escolar 2018/2019.

select *
from curso_escolar, alumno_se_matricula_asignatura
where curso_escolar.anyo_inicio = 2018 
	and curso_escolar.anyo_fin = 2019 
	and curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar;

Resol les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.

10.- Retorna un llistat amb els noms de tots els professors/es i els departaments que tenen vinculats/des. El llistat també ha de mostrar aquells professors/es que no tenen cap departament associat. El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor/a. El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.

SELECT persona.nombre, persona.apellido1, persona.apellido2, departamento.nombre
  FROM persona
  LEFT JOIN departamento
    ON persona.id = departamento.id
WHERE persona.tipo = 'profesor'
ORDER BY persona.apellido1 DESC, persona.apellido2 DESC, persona.nombre DESC;

11.- Retorna un llistat amb els professors/es que no estan associats a un departament.

SELECT persona.nombre, persona.apellido1, persona.apellido2, departamento.nombre
  FROM persona
  LEFT JOIN departamento
    ON persona.id = departamento.id
WHERE persona.tipo = 'profesor' and departamento.nombre IS NULL
ORDER BY persona.apellido1 DESC, persona.apellido2 DESC, persona.nombre DESC;

12.- Retorna un llistat amb els departaments que no tenen professors/es associats.

SELECT persona.nombre, persona.apellido1, persona.apellido2, departamento.nombre
  FROM departamento
 RIGht JOIN PERSONA
    ON persona.id = departamento.id
WHERE persona.nombre is null and persona.apellido1 is null and persona.apellido2 is null

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

SELECT *
  FROM asignatura
 RIGht JOIN departamento 
    ON departamento.id = asignatura.id_grado 
Where asignatura.nombre is null

Consultes resum:

16.- Retorna el nombre total d alumnes que hi ha.

SELECT count(*) 
from alumno_se_matricula_asignatura

17.- Calcula quants/es alumnes van néixer en 1999.

SELECT count(*) 
from persona
WHERE persona.fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31'

18.- Calcula quants/es professors/es hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors/es que hi ha en aquest departament. El resultat només ha d incloure els departaments que tenen professors/es associats i haurà d estar ordenat de major a menor pel nombre de professors/es.

SELECT universidad.profesor.id_departamento, count(*) 
FROM universidad.profesor
GROUP BY universidad.profesor.id_departamento

19.- Retorna un llistat amb tots els departaments i el nombre de professors/es que hi ha en cadascun d ells. Té en compte que poden existir departaments que no tenen professors/es associats/des. Aquests departaments també han d aparèixer en el llistat.

SELECT * 
FROM universidad.departamento, universidad.persona;

20.- Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d assignatures que té cadascun. Té en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d aparèixer en el llistat. El resultat haurà d estar ordenat de major a menor pel nombre d assignatures.

SELECT universidad.grado.nombre, universidad.asignatura.nombre
FROM universidad.grado,universidad.asignatura
WHERE universidad.grado.id = universidad.asignatura.id_grado
order by universidad.asignatura.nombre DESC;

21.- Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades.


22.- Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d assignatura. El resultat ha de tenir tres columnes: nom del grau, tipus d assignatura i la suma dels crèdits de totes les assignatures que hi ha d aquest tipus.

23.- Retorna un llistat que mostri quants/es alumnes s han matriculat d alguna assignatura en cadascun dels cursos escolars. El resultat haurà de mostrar dues columnes, una columna amb l any d inici del curs escolar i una altra amb el nombre d alumnes matriculats/des.

24.- Retorna un llistat amb el nombre d assignatures que imparteix cada professor/a. El llistat ha de tenir en compte aquells professors/es que no imparteixen cap assignatura. El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d assignatures. El resultat estarà ordenat de major a menor pel nombre d assignatures.

25.- Retorna totes les dades de l alumne més jove.

SELECT * from persona WHERE persona.fecha_nacimiento  = (SELECT max(persona.fecha_nacimiento)
from persona);

26.- Retorna un llistat amb els professors/es que tenen un departament associat i que no imparteixen cap assignatura.