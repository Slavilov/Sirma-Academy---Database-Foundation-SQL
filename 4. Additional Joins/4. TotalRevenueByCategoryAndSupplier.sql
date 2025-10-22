SELECT  cat.CategoryName,
        sup.SupplierName,
        CAST(SUM(od.Quantity * p.Price) AS DECIMAL(18,2)) AS Revenue
FROM OrderDetails od
JOIN Products p    ON p.ProductID    = od.ProductID
JOIN Categories cat ON cat.CategoryID = p.CategoryID
JOIN Suppliers sup  ON sup.SupplierID = p.SupplierID
GROUP BY cat.CategoryName, sup.SupplierName
ORDER BY cat.CategoryName, Revenue DESC;
