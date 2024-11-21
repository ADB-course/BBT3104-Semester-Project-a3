-- Write your SQL code here
DELIMITER $$

CREATE FUNCTION CalculateOrderTotal(orderID INT) RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10, 2);
    SELECT SUM(price * quantity) INTO total
    FROM ORDERITEM
    WHERE orderID = orderID;
    RETURN total;
END$$

DELIMITER ;