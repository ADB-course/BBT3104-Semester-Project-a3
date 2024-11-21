-- Write your SQL code here
CREATE INDEX idx_ProductName ON PRODUCT (productName);
CREATE INDEX idx_OrderDate ON CUSTOMER_ORDER (orderDate);
CREATE INDEX idx_Territory ON SALESPERSON (territory);