-- Write your SQL code here
DELIMITER $$

CREATE PROCEDURE GetOrdersByCustomer(IN custID INT)
BEGIN
    SELECT * FROM CUSTOMER_ORDER WHERE customerID = custID;
END$$

DELIMITER ;