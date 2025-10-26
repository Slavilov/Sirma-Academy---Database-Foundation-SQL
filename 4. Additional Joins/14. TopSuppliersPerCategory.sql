WITH sup_cat AS (
    SELECT  cat.CategoryID, cat.CategoryName,
            sup.SupplierID, sup.SupplierName,
            SUM(od.Quantity * p.Price) AS Revenue
    FROM OrderDetails od
    JOIN Products p     ON p.ProductID    = od.ProductID
    JOIN Categories cat ON cat.CategoryID = p.CategoryID
    JOIN Suppliers sup  ON sup.SupplierID = p.SupplierID
    GROUP BY cat.CategoryID, cat.CategoryName, sup.SupplierID, sup.SupplierName
),
ranked AS (
    SELECT sc.*,
           ROW_NUMBER() OVER (PARTITION BY sc.CategoryID ORDER BY sc.Revenue DESC, sc.SupplierName) AS rn
    FROM sup_cat sc
)
SELECT CategoryName, SupplierName, CAST(Revenue AS DECIMAL(18,2)) AS Revenue
FROM ranked
WHERE rn = 1
ORDER BY Revenue DESC, CategoryName;
