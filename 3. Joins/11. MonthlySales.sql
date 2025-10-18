WITH order_totals AS (
    SELECT od.OrderID, SUM(od.Quantity * p.Price) AS order_total
    FROM OrderDetails od
    JOIN Products p ON p.ProductID = od.ProductID
    GROUP BY od.OrderID
)
SELECT  FORMAT(o.OrderDate, 'yyyy-MM') AS YearMonth,
        CAST(SUM(ot.order_total) AS DECIMAL(18,2)) AS MonthlyRevenue
FROM Orders o
JOIN order_totals ot ON ot.OrderID = o.OrderID
GROUP BY FORMAT(o.OrderDate, 'yyyy-MM')
ORDER BY YearMonth;
