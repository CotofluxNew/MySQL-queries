1.-Llista el nom de tots els productes que hi ha en la taula "producto".
SELECT nombre 
from producto;
2.-Llista els noms i els preus de tots els productes de la taula "producto".

SELECT nombre, precio
from producto;

3.-Llista totes les columnes de la taula "producto".

SELECT *
from producto;

OK, pero podries haver utilitzat SHOW_COLUMNS()
Així?? SHOW COLUMNS FROM producto FROM tienda;

4.-Llista el nom dels "productos", el preu en euros i el preu en dòlars nord-americans (USD).

SELECT nombre, precio AS 'Precio en Euros', round(precio*0.92) AS 'Precio en Dolares'
from producto;

5.-Llista el nom dels "productos", el preu en euros i el preu en dòlars nord-americans. Utilitza els següents àlies per a les columnes: nom de "producto", euros, dòlars nord-americans.

SELECT nombre, precio AS 'Producto en Euros', CAST(precio * 1.08 AS DECIMAL(5, 2)) AS 'Producto en Dolares'
from producto;

6.-Llista els noms i els preus de tots els productes de la taula "producto", convertint els noms a majúscula.

SELECT upper(nombre), precio
from producto;

7.-Llista els noms i els preus de tots els productes de la taula "producto", convertint els noms a minúscula.

SELECT lower(nombre), precio
from producto;

8.-Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant.

SELECT nombre, SUBSTRING(nombre, 1, 2) AS ExtractString
from fabricante;

9.-Llista els noms i els preus de tots els productes de la taula "producto", arrodonint el valor del preu.

SELECT nombre, round(precio)
from producto

10.-Llista els noms i els preus de tots els productes de la taula "producto", truncant el valor del preu per a mostrar-lo sense cap xifra decimal.

SELECT nombre, TRUNCATE(precio, 0) AS precio
FROM producto

11.-Llista el codi dels fabricants que tenen productes en la taula "producto".

SELECT producto.nombre, fabricante.nombre
from producto, fabricante
WHERE fabricante.codigo = producto.codigo_fabricante

12.-Llista el codi dels fabricants que tenen productes en la taula "producto", eliminant els codis que apareixen repetits.

SELECT DISTINCT fabricante.nombre
from fabricante

13.-Llista els noms dels fabricants ordenats de manera ascendent.

SELECT DISTINCT fabricante.nombre
from fabricante
ORDER BY fabricante.nombre ASC;

14.-Llista els noms dels fabricants ordenats de manera descendent.

SELECT DISTINCT fabricante.nombre
from fabricante
ORDER BY fabricante.nombre DESC;

15.-Llista els noms dels productes ordenats, en primer lloc, pel nom de manera ascendent i, en segon lloc, pel preu de manera descendent.

SELECT producto.nombre, producto.precio
from producto
ORDER BY producto.nombre ASC, producto.precio DESC;

16.-Retorna una llista amb les 5 primeres files de la taula "fabricante".

SELECT *
from fabricane
LIMIT 5;

17.-Retorna una llista amb 2 files a partir de la quarta fila de la taula "fabricante". La quarta fila també s'ha d'incloure en la resposta.

18.-Llista el nom i el preu del producte més barat. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podries usar MIN(preu), necessitaries GROUP BY
19.-Llista el nom i el preu del producte més car. (Fes servir solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podries usar MAX(preu), necessitaries GROUP BY.
20.-Llista el nom de tots els productes del fabricant el codi de fabricant del qual és igual a 2.
21.-Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.
22.- Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. Ordena el resultat pel nom del fabricant, per ordre alfabètic.
23.-Retorna una llista amb el codi del producte, nom del producte, codi del fabricant i nom del fabricant, de tots els productes de la base de dades.
24.-Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat.
25.-Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.
26.-Retorna una llista de tots els productes del fabricant Lenovo.
27.-Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200 €.
28.-Retorna una llista amb tots els productes dels fabricants Asus, Hewlett-Packard i Seagate. Sense utilitzar l operador IN.
29.-Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard i Seagate. Usant l operador IN.
30.-Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e.
31.-Retorna un llistat amb el nom i el preu de tots els productes dels fabricants dels quals contingui el caràcter w en el seu nom.
32.-Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180 €. Ordena el resultat, en primer lloc, pel preu (en ordre descendent) i, en segon lloc, pel nom (en ordre ascendent).
33.-Retorna un llistat amb el codi i el nom de fabricant, solament d aquells fabricants que tenen productes associats en la base de dades.
34.-Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d ells. El llistat haurà de mostrar també aquells fabricants que no tenen productes associats.
35.-Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat.
36.-Retorna tots els productes del fabricant Lenovo. (Sense utilitzar INNER JOIN).
37.-Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricant Lenovo. (Sense fer servir INNER JOIN).
38.-Llista el nom del producte més car del fabricant Lenovo.
39.-Llista el nom del producte més barat del fabricant Hewlett-Packard.
40.-Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricant Lenovo.
41.-Llesta tots els productes del fabricant Asus que tenen un preu superior al preu mitjà de tots els seus productes.