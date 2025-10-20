-- For each customer country, show top 3 products by revenue
WITH sales AS (
    SELECT  c.Country,
            p.ProductID,
            p.ProductName,
            SUM(od.Quantity * p.Price) AS Revenue
    FROM Orders o
    JOIN Customers c   ON c.CustomerID = o.CustomerID
    JOIN OrderDetails od ON od.OrderID = o.OrderID
    JOIN Products p     ON p.ProductID = od.ProductID
    GROUP BY c.Country, p.ProductID, p.ProductName
),
ranked AS (
    SELECT s.*,
           ROW_NUMBER() OVER (PARTITION BY s.Country ORDER BY s.Revenue DESC, s.ProductName) AS rn
    FROM sales s
)
SELECT Country, ProductID, ProductName, CAST(Revenue AS DECIMAL(18,2)) AS Revenue
FROM ranked
WHERE rn <= 3
ORDER BY Country, Revenue DESC;
