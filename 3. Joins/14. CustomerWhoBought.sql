WITH cust_prod AS (
    SELECT  o.CustomerID,
            COUNT(DISTINCT od.ProductID) AS DistinctProducts
    FROM Orders o
    JOIN OrderDetails od ON od.OrderID = o.OrderID
    GROUP BY o.CustomerID
)
SELECT  c.CustomerID,
        c.CustomerName,
        cp.DistinctProducts
FROM cust_prod cp
JOIN Customers c ON c.CustomerID = cp.CustomerID
WHERE cp.DistinctProducts > 5
ORDER BY cp.DistinctProducts DESC, c.CustomerName;
