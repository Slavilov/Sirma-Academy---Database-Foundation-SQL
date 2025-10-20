-- OrderDetails lookups
CREATE INDEX IX_OrderDetails_OrderID   ON OrderDetails(OrderID);
CREATE INDEX IX_OrderDetails_ProductID ON OrderDetails(ProductID);

-- Orders by Customer/Employee/Shipper + date
CREATE INDEX IX_Orders_CustomerID ON Orders(CustomerID);
CREATE INDEX IX_Orders_EmployeeID ON Orders(EmployeeID);
CREATE INDEX IX_Orders_ShipperID  ON Orders(ShipperID);
CREATE INDEX IX_Orders_OrderDate  ON Orders(OrderDate);

-- Products by Category/Supplier
CREATE INDEX IX_Products_CategoryID ON Products(CategoryID);
CREATE INDEX IX_Products_SupplierID ON Products(SupplierID);
