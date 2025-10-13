SELECT  od.OrderDetailID,
        od.OrderID,
        p.ProductName,
        cat.CategoryName,
        sup.SupplierName,
        od.Quantity,
        p.Price,
        CAST(od.Quantity * p.Price AS DECIMAL(18,2)) AS LineTotal
FROM OrderDetails od
JOIN Products p   ON p.ProductID   = od.ProductID
JOIN Categories cat ON cat.CategoryID = p.CategoryID
JOIN Suppliers sup  ON sup.SupplierID  = p.SupplierID
ORDER BY od.OrderID, od.OrderDetailID;
