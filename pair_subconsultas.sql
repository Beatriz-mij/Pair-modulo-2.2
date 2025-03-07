USE northwind;

/* Extraed los pedidos con el máximo "order_date" para cada empleado.
Nuestro jefe quiere saber la fecha de los pedidos más recientes que ha gestionado cada empleado. Para eso nos pide que lo hagamos con una query correlacionada.*/                                
SELECT MAX(OrderDate), o.employeeID
		FROM orders AS o
		GROUP BY o.employeeID; -- sin subconsulta, pero esto no se actualiza con cada nuevo pedido

SELECT e.employeeID, e.orderDate
	FROM orders AS e
    GROUP BY e.employeeID, e.orderDate
	HAVING MAX(e.OrderDate) >= ALL (SELECT MAX(o.OrderDate)
								FROM orders AS o
                                GROUP BY o.employeeID);
                                
SELECT os.orderID
	FROM orders AS os
	WHERE orderDate = (SELECT MAX(o.OrderDate)
								FROM orders AS o
                                WHERE o.employeeID = os.employeeID
                                GROUP BY o.employeeID);
                                
SELECT *
	FROM orders AS o
    WHERE orderDate = (SELECT MAX(orderDate)
						FROM orders AS o1
                        WHERE o1.employeeID = o.employeeID);
							
                                
/* Extraed información de los productos "Beverages"

En este caso nuestro jefe nos pide que le devolvamos toda la información necesaria para identificar un tipo de producto. 
En concreto, tienen especial interés por los productos con categoría "Beverages". Devuelve el ID del producto, el nombre del producto y su ID de categoría.*/