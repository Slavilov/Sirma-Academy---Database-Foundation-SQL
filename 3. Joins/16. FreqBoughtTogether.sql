-- Each pair appears once per order; aggregate quantity as co-occurrence weight
WITH pairs AS (
    SELECT  od1.ProductID AS ProductA,
            od2.ProductID AS ProductB,
            COUNT(DISTINCT od1.OrderID) AS TogetherOrders
    FROM OrderDetails od1
    JOIN OrderDetails od2
      ON od1.OrderID = od2.OrderID
     AND od1.ProductID < od2.ProductID
    GROUP BY od1.ProductID, od2.ProductID
)
SELECT  p1.ProductName AS ProductA,
        p2.ProductName AS ProductB,
        pr.TogetherOrders
FROM pairs pr
JOIN Products p1 ON p1.ProductID = pr.ProductA
JOIN Products p2 ON p2.ProductID = pr.ProductB
ORDER BY pr.TogetherOrders DESC, ProductA, ProductB;
