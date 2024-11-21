-- Write your SQL code here
CREATE VIEW OrderSummary AS
SELECT o.orderID, e.employeeName AS customerName, o.orderDate, o.orderTotal
FROM CUSTOMER_ORDER o
JOIN EMPLOYEE e ON o.customerID = e.employeeID;

CREATE VIEW ProductSales AS
SELECT p.productName, SUM(oi.quantity) AS totalQuantity, SUM(oi.price * oi.quantity) AS totalRevenue
FROM PRODUCT p
JOIN ORDERITEM oi ON p.productID = oi.productID
GROUP BY p.productID;