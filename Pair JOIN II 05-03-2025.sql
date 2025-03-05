USE northwind;
/* EJERCICIO 1: Empleadas que sean de la misma ciudad: 
Desde recursos humanos nos piden realizar una consulta que muestre por pantalla los datos de todas las empleadas y sus supervisoras. 
Concretamente nos piden: la ubicación, nombre, y apellido tanto de las empleadas como de las jefas. 
Investiga el resultado, ¿sabes decir quién es el director? */


SELECT e.City AS CiudadJefa, e.FirstName AS NombreJefa, e.LastName AS ApellidoJefa, t.City, t.FirstName, t.LastName
FROM employees AS e, employees AS t
WHERE t.ReportsTo = e.EmployeeID;

SELECT e.City AS CiudadJefa, e.FirstName AS NombreJefa, e.LastName AS ApellidoJefa, t.City, t.FirstName, t.LastName
FROM employees AS e
LEFT JOIN employees AS t
ON t.ReportsTo = e.EmployeeID; 


/* EJERCICIO 2: El equipo de marketing necesita una lista con todas las categorías de productos, incluso si no tienen productos asociados. Queremos obtener el nombre de la categoría y el nombre de los productos dentro de cada categoría. Podriamos usar un RIGTH JOIN con 'categories'?, usemos tambien la tabla 'products'.*/

SELECT c.CategoryName, p.ProductName
FROM categories AS c
LEFT JOIN products AS p 
ON c.CategoryID = p.CategoryID;

SELECT c.CategoryName, p.ProductName
FROM products AS p 
RIGHT JOIN categories AS c
ON c.CategoryID = p.CategoryID;

/* EJERCICIO 3: Desde el equipo de ventas nos piden obtener una lista de todos los pedidos junto con los datos de las empresas clientes. Sin embargo, hay algunos pedidos que pueden no tener un cliente asignado. Necesitamos asegurarnos de incluir todos los pedidos, incluso si no tienen cliente registrado.*/

SELECT o.OrderID, c.CustomerID, o.OrderDate
FROM orders AS o
LEFT JOIN customers AS c
ON o.CustomerID = c.CustomerID;

/* EJERCICIO 4: El equipo de Recursos Humanos quiere saber qué empleadas han gestionado pedidos y cuáles no. Queremos obtener una lista con todas las empleadas y, si han gestionado pedidos, mostrar los detalles del pedido.*/
SELECT e.FirstName, e.LastName, o.OrderID, o.OrderDate
FROM employees AS e
LEFT JOIN orders AS o
ON e.EmployeeID = o.EmployeeID;

/* EJERCICIO 5: Desde el área de logística nos piden una lista de todos los transportistas (shippers) y los pedidos que han enviado. Queremos asegurarnos de incluir todos los transportistas, incluso si no han enviado pedidos.*/

SELECT s.shipperID, o.orderID
FROM shippers AS s
LEFT JOIN orders AS o
ON s.shipperID = o.shipVia;
