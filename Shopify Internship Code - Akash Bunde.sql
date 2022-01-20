SELECT count(distinct(OrderID)) as Total_Orders FROM Orders
WHERE ShipperID=(
SELECT ShipperID from Shippers WHERE ShipperName='Speedy Express'
);


SELECT LastName from
(
SELECT max(num_orders), em.LastName from
  (
  	SELECT count(distinct(OrderID)) num_orders, EmployeeID from Orders 
  	group by EmployeeID
    ) od
LEFT JOIN Employees em
on od.EmployeeID=em.EmployeeID
);


select max(quant_prod), ProductName
from (SELECT sum(Quantity) quant_prod, ProductName
		from OrderDetails od
        LEFT JOIN Products p
        on od.ProductID=p.ProductID
        LEFT JOIN Orders o
        on od.OrderID=o.OrderID
        LEFT JOIN Customers c
        on o.CustomerID=c.CustomerID
        where c.Country='Germany'
        group by p.ProductName) tmp;