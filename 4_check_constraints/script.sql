-- Write your SQL code here
ALTER TABLE PRODUCT
ADD CONSTRAINT chk_UnitPrice CHECK (unitPrice > 0),
ADD CONSTRAINT chk_ProductionCost CHECK (productionCost >= 0);