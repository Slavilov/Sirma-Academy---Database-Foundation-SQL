-- Only if they don't already exist
ALTER TABLE Orders
    WITH CHECK ADD CONSTRAINT FK_Orders_Customers
        FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID);
ALTER TABLE Orders
    WITH CHECK ADD CONSTRAINT FK_Orders_Employees
        FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID);
ALTER TABLE Orders
    WITH CHECK ADD CONSTRAINT FK_Orders_Shippers
        FOREIGN KEY (ShipperID) REFERENCES Shippers(ShipperID);
