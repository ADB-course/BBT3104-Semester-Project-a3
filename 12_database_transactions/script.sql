-- Write your SQL code here
START TRANSACTION;

INSERT INTO CUSTOMER_ORDER (orderID, orderDate, orderTotal, customerID)
VALUES (4, '2024-11-24', 250.0, 2); -- Unique orderID

INSERT INTO ORDERITEM (orderItemID, orderID, productID, quantity, price)
VALUES (6, 4, 2, 3, 50.0); -- Match the new orderID

UPDATE PRODUCT SET productionCost = productionCost - 3 WHERE productID = 2;

COMMIT;