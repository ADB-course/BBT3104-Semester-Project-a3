-- Write your SQL code here
INSERT INTO EMPLOYEE (employeeID, employeeName, position, salary, department)
VALUES 
    (1, 'Gibson', 'Manager', 75000.00, 'Sales'),
    (2, 'Yeshua', 'Salesperson', 50000.00, 'Sales'),
    (3, 'Faith', 'Technician', 40000.00, 'Production'),
    (4, 'Jack', 'Salesperson', 48000.00, 'Sales');

INSERT INTO PRODUCT (productID, productName, productType, alcoholContent, unitPrice, productionCost)
VALUES 
    (1, 'Beer', 'Alcoholic', 5.0, 2.5, 100.0),
    (2, 'Whiskey', 'Alcoholic', 40.0, 50.0, 300.0),
    (3, 'Wine', 'Alcoholic', 12.0, 10.0, 200.0),
    (4, 'Juice', 'Non-Alcoholic', 0.0, 1.5, 50.0);

INSERT INTO CUSTOMER_ORDER (orderID, orderDate, orderTotal, customerID)
VALUES 
    (1, '2024-11-21', 200.0, 1),
    (2, '2024-11-22', 300.0, 2),
    (3, '2024-11-23', 400.0, 3);

INSERT INTO ORDERITEM (orderItemID, orderID, productID, quantity, price)
VALUES 
    (1, 1, 1, 10, 25.0),
    (2, 2, 2, 5, 60.0),
    (3, 3, 3, 8, 20.0),
    (4, 3, 4, 10, 15.0);

INSERT INTO MANAGER (managerID, department, teamSize)
VALUES 
    (1, 'Sales', 10),
    (2, 'Production', 5),
    (3, 'Finance', 3);

INSERT INTO SALESPERSON (salespersonID, commissionRate, territory, managerID)
VALUES 
    (1, 0.05, 'North', 1),
    (2, 0.07, 'East', 1),
    (3, 0.06, 'West', 1),
    (4, 0.08, 'South', 1);

INSERT INTO ORDERITEM (orderItemID, orderID, productID, quantity, price)
VALUES (5, 1, 1, 5, 12.5); -- Should reduce productionCost for productID=1 by 5
SELECT * FROM PRODUCT; -- Verify changes in productionCost

-- Attempt to insert invalid data to test constraints (should fail)
INSERT INTO PRODUCT (productID, productName, productType, alcoholContent, unitPrice, productionCost)
VALUES (5, 'Vodka', 'Alcoholic', 30.0, -10.0, -50.0); -- Fails due to constraints

-- Insert valid data (should pass)
INSERT INTO PRODUCT (productID, productName, productType, alcoholContent, unitPrice, productionCost)
VALUES (5, 'Rum', 'Alcoholic', 25.0, 20.0, 150.0);
SELECT * FROM PRODUCT; -- Verify data

-- Update the unit price to trigger logging
UPDATE PRODUCT SET unitPrice = 3.0 WHERE productID = 1;
SELECT * FROM PriceChangeLog; -- Verify the price change logs

-- Verify engine
SHOW TABLE STATUS WHERE Name = 'CUSTOMER_ORDER'; -- Check if it uses InnoDB

-- Perform indexed query
EXPLAIN SELECT * FROM PRODUCT WHERE productName = 'Beer'; -- Check index usage

-- Test the stored procedure
CALL GetOrdersByCustomer(1); -- Should return orders for customerID = 1

-- Test the stored function
SELECT CalculateOrderTotal(1) AS TotalCost;

-- Test views
SELECT * FROM OrderSummary;
SELECT * FROM ProductSales;

-- Test transactions
SELECT * FROM CUSTOMER_ORDER;
SELECT * FROM ORDERITEM;
SELECT * FROM PRODUCT WHERE productID = 2;







