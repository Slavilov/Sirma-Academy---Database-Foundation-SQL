WITH product_sales AS (
    SELECT  p.ProductID,
            p.ProductName,
            p.CategoryID,
            SUM(od.Quantity * p.Price) AS Revenue
    FROM OrderDetails od
    JOIN Products p ON p.ProductID = od.ProductID
    GROUP BY p.ProductID, p.ProductName, p.CategoryID
),
ranked AS (
    SELECT ps.*,
           ROW_NUMBER() OVER (PARTITION BY ps.CategoryID ORDER BY ps.Revenue DESC, ps.ProductName) AS rn
    FROM product_sales ps
)
SELECT  r.CategoryID,
        c.CategoryName,
        r.ProductID,
        r.ProductName,
        CAST(r.Revenue AS DECIMAL(18,2)) AS Revenue
FROM ranked r
JOIN Categories c ON c.CategoryID = r.CategoryID
WHERE r.rn = 1
ORDER BY r.Revenue DESC;
