-- Write your SQL code here
DELIMITER $$

CREATE TRIGGER LogUnitPriceChange
BEFORE UPDATE ON PRODUCT
FOR EACH ROW
BEGIN
    INSERT INTO PriceChangeLog (productID, oldPrice, newPrice, changeDate)
    VALUES (OLD.productID, OLD.unitPrice, NEW.unitPrice, NOW());
END$$

DELIMITER ;