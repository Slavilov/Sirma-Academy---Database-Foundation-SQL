SELECT p.ProductID, p.ProductName, p.Price
FROM Products p
LEFT JOIN OrderDetails od ON od.ProductID = p.ProductID
WHERE od.OrderID IS NULL
ORDER BY p.ProductName;
