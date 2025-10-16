SELECT  p.ProductID,
        p.ProductName,
        cat.CategoryName,
        sup.SupplierName,
        p.Unit,
        p.Price
FROM Products p
JOIN Categories cat ON cat.CategoryID = p.CategoryID
JOIN Suppliers sup  ON sup.SupplierID  = p.SupplierID
ORDER BY cat.CategoryName, p.ProductName;
