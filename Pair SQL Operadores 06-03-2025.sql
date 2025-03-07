USE northwind;
/* EJERCICIO 1: 
Ciudades que empiezan con "A" o "B". Por un extraño motivo, nuestro jefe quiere que le devolvamos una tabla con aquellas compañías que están afincadas en ciudades que empiezan por "A" o "B". Necesita que le devolvamos la ciudad, el nombre de la compañía y el nombre de contacto.*/

SELECT City, CompanyName, ContactName
FROM customers
WHERE City LIKE 'A%' OR City LIKE 'B%';

/* EJERCICIO 2: 
Número de pedidos que han hecho en las ciudades que empiezan con L.
En este caso, nuestro objetivo es devolver los mismos campos que en la query anterior el número de total de pedidos que han hecho todas las ciudades que empiezan por "L".*/

SELECT c.City, c.CompanyName, c.ContactName, COUNT(o.OrderID) AS numero_pedidos
FROM orders AS o
INNER JOIN customers AS c
USING (customerID)
WHERE City LIKE 'L%'
GROUP BY c.City, c.CompanyName, c.contactName;

/* EJERCICIO 3: Todos los clientes cuyo "country" no incluya "Sales".
Nuestro objetivo es extraer los clientes que no tengan el titulo de "Sales" en "ContactTitle" . Extraer el nombre de contacto, su titulo de contacto y el nombre de la compañía.*/

SELECT contactName, ContactTitle, CompanyName 
FROM customers 
WHERE ContactTitle NOT LIKE '%Sales%';

/*EJERCICIO 4:
Todos los clientes que no tengan una "A" en segunda posición en su nombre.
Devolved unicamente el nombre de contacto.*/

SELECT ContactName
FROM customers
WHERE ContactName NOT LIKE '_A%';

/* EJERCICIO 5: 
Extraer toda la información sobre las compañías que tengamos en la bases de datos
Nuestros jefes nos han pedido que creemos una query que nos devuelva todos los clientes y proveedores que tenemos en la bases de datos. Mostrad la ciudad a la que pertenecen, el nombre de la empresa y el nombre del contacto, además de la relación (Proveedor o Cliente). Pero importante! No debe haber duplicados en nuestra respuesta. La columna Relationship no existe y debe ser creada como columna temporal. Para ello añade el valor que le quieras dar al campo y utilizada como alias Relationship.
Nota: Deberás crear esta columna temporal en cada instrucción SELECT.*/

SELECT City, CompanyName, ContactName, 'Cliente' AS Relationship
FROM customers

UNION 

SELECT City, CompanyName, ContactName, 'Proveedores' AS Relationship
FROM suppliers
ORDER BY City ASC;

/*EJERCICIO 6: Extraer todas las categorías de la tabla categories que contengan en la descripción "sweet" o "Sweet".*/
SELECT *
FROM categories
WHERE 'description' LIKE "sweet" OR 'description' LIKE "Sweet";

/* EJERCICIO 7: 
Extraed todos los nombres y apellidos de los clientes y empleados que tenemos en la bases de datos:
💡 Pista 💡 ¿Ambas tablas tienen las mismas columnas para nombre y apellido? Tendremos que combinar dos columnas usando concat para unir dos columnas.*/

SELECT c.ContactName
FROM customers AS c
 UNION
 SELECT CONCAT(e.FirstName, e.LastName) AS ContactName
 FROM employees as e


