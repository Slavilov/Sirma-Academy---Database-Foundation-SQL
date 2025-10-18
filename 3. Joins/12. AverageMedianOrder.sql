WITH order_totals AS (
    SELECT od.OrderID, SUM(od.Quantity * p.Price) AS order_total
    FROM OrderDetails od
    JOIN Products p ON p.ProductID = od.ProductID
    GROUP BY od.OrderID
)
SELECT  AVG(CAST(order_total AS DECIMAL(18,2))) AS AvgOrderValue,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY order_total) 
            OVER () AS MedianOrderValue
FROM order_totals;
