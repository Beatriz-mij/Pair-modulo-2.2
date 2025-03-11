USE northwind;

/* EJERCICIO 1:
Extraed los pedidos con el máximo "order_date" para cada empleado.
Nuestro jefe quiere saber la fecha de los pedidos más recientes (MAX(orderDate)) que ha gestionado cada empleado. Para eso nos pide que lo hagamos con una query correlacionada.*/

SELECT MAX(orderDate), o.employeeID
		FROM orders AS o
		GROUP BY o.employeeID; -- sin subconsulta, pero esto no se actualiza con cada pedido


SELECT employeeID, orderDate
FROM orders AS e
GROUP BY employeeID , orderDate
HAVING MAX(orderDate) >= (SELECT MAX(orderDate)
							FROM orders AS o
							GROUP BY e.employeeID);
                            
SELECT *
	FROM orders;
    
SELECT os.orderID
	FROM orders AS os
    WHERE orderDate = (SELECT MAX(o.orderDate)
								FROM orders AS o
								WHERE o.employeeID = os.employeeID
								GROUP BY o.employeeID);
            
            
SELECT *
	FROM orders AS o
    WHERE orderDate = (SELECT MAX(orderDate)
							FROM orders AS o1
                            WHERE employeID = 1); -- nos saca un MAX orderDate para el empleado 1, pero necesitamos que vaya cambiando para cada una de las filas. Podríamos ir poniendo datos uno a uno, pero sería interminable
                            
    
SELECT *
	FROM orders AS o
    WHERE orderDate = (SELECT MAX(orderDate)
							FROM orders AS o1
                            WHERE o1.employeeID = o.employeeID);
    
/*EJERICIO 2: 
Extraed información de los productos "Beverages"
En este caso nuestro jefe nos pide que le devolvamos toda la información necesaria para identificar un tipo de producto. En concreto, tienen especial interés por los productos con categoría "Beverages". Devuelve el ID del producto, el nombre del producto y su ID de categoría.*/
