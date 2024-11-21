-- Write your SQL code here
CREATE TABLE EMPLOYEE (
    employeeID INT PRIMARY KEY,
    employeeName VARCHAR(100),
    position VARCHAR(50),
    salary DECIMAL(10, 2),
    department VARCHAR(50)
);

CREATE TABLE PRODUCT (
    productID INT PRIMARY KEY,
    productName VARCHAR(100),
    productType VARCHAR(50),
    alcoholContent DECIMAL(5, 2),
    unitPrice DECIMAL(10, 2),
    productionCost DECIMAL(10, 2)
);

CREATE TABLE CUSTOMER_ORDER (
    orderID INT PRIMARY KEY,
    orderDate DATE,
    orderTotal DECIMAL(10, 2),
    customerID INT,
    FOREIGN KEY (customerID) REFERENCES EMPLOYEE(employeeID) -- Assuming customerID references EMPLOYEE
);

CREATE TABLE ORDERITEM (
    orderItemID INT PRIMARY KEY,
    orderID INT,
    productID INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (orderID) REFERENCES CUSTOMER_ORDER(orderID),
    FOREIGN KEY (productID) REFERENCES PRODUCT(productID)
);

CREATE TABLE MANAGER (
    managerID INT PRIMARY KEY,
    department VARCHAR(50),
    teamSize INT
);

CREATE TABLE SALESPERSON (
    salespersonID INT PRIMARY KEY,
    commissionRate DECIMAL(5, 2),
    territory VARCHAR(50),
    managerID INT,
    FOREIGN KEY (managerID) REFERENCES MANAGER(managerID)
);

CREATE TABLE PriceChangeLog (
    logID INT AUTO_INCREMENT PRIMARY KEY,
    productID INT,
    oldPrice DECIMAL(10, 2),
    newPrice DECIMAL(10, 2),
    changeDate TIMESTAMP
);