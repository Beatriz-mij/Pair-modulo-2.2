/* 1. Pedidos por empresa en UK:
Desde las oficinas en UK nos han pedido con urgencia que realicemos una consulta a la 
base de datos con la que podamos conocer cuántos pedidos ha realizado cada empresa cliente de UK. 
Nos piden el ID del cliente y el nombre de la empresa y el número de pedidos.
Deberéis obtener una tabla similar a esta:*/

USE Northwind;

SELECT CustomerID, COUNT(OrderId) AS numero_pedidos -- Antes de hacer ninguna unión, primero pedimos que nos agrupe por Idcliente y nos diga la cantidad de pedidos que ha hecho
	FROM Orders
    GROUP BY CustomerID;

SELECT c.CustomerID, c.CompanyName, COUNT(o.OrderId) AS numero_pedidos -- Lo mismo que arriba, pero le pedimos que nos una información de dos tablas
	FROM Customers AS c
    JOIN Orders AS o -- aunque no pongas INNER funciona igual!!
	ON o.CustomerID = c.CustomerID -- USING (CustomerID)
    GROUP BY o.CustomerID;

SELECT c.CustomerID, c.CompanyName, COUNT(o.OrderId) AS numero_pedidos 
	FROM Customers AS c
    INNER JOIN Orders AS o
	ON o.CustomerID = c.CustomerID -- USING (CustomerID)
    WHERE c.Country = 'UK' -- Añadimos la condición por país == UK
    GROUP BY o.CustomerID;

/* 2. Productos pedidos por empresa en UK por año:

Desde Reino Unido se quedaron muy contentas con nuestra rápida respuesta a su petición anterior y 
han decidido pedirnos una serie de consultas adicionales. La primera de ellas consiste en una query que nos 
sirva para conocer cuántos objetos ha pedido cada empresa cliente de UK durante cada año. 
Nos piden concretamente conocer el nombre de la empresa, el año, y la cantidad de objetos que han pedido. 
Para ello hará falta hacer 2 joins.*/
SELECT c.CompanyName, od.Quantity, o.OrderDate AS year
	FROM Orders AS o
    INNER JOIN Customers AS c
	ON o.CustomerID = c.CustomerID 
    
    INNER JOIN OrderDetails AS od
    ON od.OrderID = o.OrderID
    WHERE c.Country = 'UK';

SELECT c.CompanyName, SUM(od.Quantity) AS total_objetos, YEAR(o.OrderDate)
	FROM Orders AS o
    INNER JOIN Customers AS c
	ON o.CustomerID = c.CustomerID 
    
    INNER JOIN OrderDetails AS od
    ON od.OrderID = o.OrderID
    WHERE c.Country = 'UK'
    GROUP BY c.CompanyName, YEAR(o.OrderDate) ;
  
/* 3. 
Pedidos que han realizado cada compañía y su fecha:
Después de estas solicitudes desde UK y gracias a la utilidad de los resultados que se han obtenido, 
desde la central nos han pedido una consulta que indique el nombre de cada compañía cliente junto con cada pedido que han realizado y su fecha.
El resultado deberá ser:*/  
  

SELECT c.CompanyName, o.OrderID, YEAR(o.OrderDate)
	FROM Orders AS o
    INNER JOIN Customers AS c
    ON o.CustomerID = c.CustomerID;
  
/* 4. 
Tipos de producto vendidos:
Ahora nos piden una lista con cada tipo de producto que se han vendido, sus categorías, nombre de la categoría y el nombre del producto,
 y el total de dinero por el que se ha vendido cada tipo de producto (teniendo en cuenta los descuentos).*/
 
SELECT p.ProductID, p.CategoryID, c.CategoryName, p.ProductName, (od.UnitPrice * od.Quantity) AS TotalVentas
	FROM Products AS p
	INNER JOIN Categories AS c
	USING (CategoryID)
	INNER JOIN OrderDetails AS od
	USING (ProductID);

SELECT p.ProductID, p.CategoryID, c.CategoryName, p.ProductName, SUM(od.UnitPrice * od.Quantity) AS TotalVentas
	FROM Products AS p
	INNER JOIN Categories AS c
	USING (CategoryID)
	INNER JOIN OrderDetails AS od
	USING (ProductID)
    GROUP BY p.ProductID;



