SELECT  sup.SupplierName,
        p.ProductName,
        c.CustomerName,
        SUM(od.Quantity) AS TotalQty
FROM Orders o
JOIN Customers c     ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON od.OrderID   = o.OrderID
JOIN Products p      ON p.ProductID  = od.ProductID
JOIN Suppliers sup   ON sup.SupplierID = p.SupplierID
GROUP BY sup.SupplierName, p.ProductName, c.CustomerName
ORDER BY sup.SupplierName, p.ProductName, c.CustomerName;
