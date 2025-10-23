DECLARE @SupplierName NVARCHAR(255) = N'Exotic Liquid'; -- set
SELECT DISTINCT
       o.OrderID, o.OrderDate, c.CustomerName, p.ProductName
FROM Orders o
JOIN Customers c     ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON od.OrderID   = o.OrderID
JOIN Products p      ON p.ProductID  = od.ProductID
JOIN Suppliers sup   ON sup.SupplierID = p.SupplierID
WHERE sup.SupplierName = @SupplierName
ORDER BY o.OrderID, p.ProductName;
