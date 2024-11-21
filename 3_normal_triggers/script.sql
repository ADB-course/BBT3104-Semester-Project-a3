DELIMITER $$

CREATE TRIGGER UpdateStockAfterOrderItem
AFTER INSERT ON ORDERITEM
FOR EACH ROW
BEGIN
    UPDATE PRODUCT
    SET productionCost = productionCost - NEW.quantity
    WHERE productID = NEW.productID;
END$$

DELIMITER ;