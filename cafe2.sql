drop database if exists cafe
create database cafe

-- Create Categories Table
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) UNIQUE
);

-- Create Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
	passcode varchar(100)
);

-- Create Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    Name VARCHAR(100),
    CategoryID INT,
    Price DECIMAL(10, 2),
	StockCount INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- Create Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATETIME,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create OrderItems Table
CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Subtotal DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert Sample Categories
INSERT INTO Categories (CategoryID, CategoryName)
VALUES
    (1, 'Main Course'),
    (2, 'Beverage'),
    (3, 'Breakfast'),
	(4, 'Dessert'),
    (5, 'Snack'),
	(6, 'Appetizer'),
    (7, 'Vegetarian');

-- Insert Sample Customers
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone,passcode)
VALUES
    (1, 'Ali', 'Khan', 'ali.khan@example.com', '+923001234567',1234),
    (2, 'Sara', 'Ahmed', 'sara.ahmed@example.com', '+923451234567',1234),
	(3, 'Ahmed', 'Malik', 'ahmed.malik@example.com', '+923341234567',1234),
    (4, 'Fatima', 'Khan', 'fatima.khan@example.com', '+923112345678',1234),
    (5, 'Omar', 'Ali', 'omar.ali@example.com', '+923221234567',1234);

-- Insert Sample Products with Specific StockCounts
INSERT INTO Products (ProductID, Name, CategoryID, Price, StockCount)
VALUES
    (1, 'Biryani', 1, 300.00, 50),
    (2, 'Nihari', 1, 250.00, 30),
    (3, 'Karhai', 1, 280.00, 40),
    (4, 'Chai', 2, 80.00, 100),
    (5, 'Qeema Paratha', 3, 150.00, 20),
    (6, 'Gulab Jamun', 4, 120.00, 60),
    (7, 'Samosa', 5, 50.00, 80),
    (8, 'Kheer', 4, 180.00, 25),
    (9, 'Pakoras', 5, 70.00, 45),
    (10, 'Fruit Chaat', 3, 100.00, 35),
    (11, 'Hummus with Pita Bread', 6, 90.00, 55),
    (12, 'Mango Lassi', 2, 120.00, 75),
    (13, 'Vegetable Biryani', 7, 250.00, 15),
    (14, 'Chicken Tikka', 6, 180.00, 90),
    (15, 'Cold Coffee', 2, 80.00, 70);


-- Insert Sample Orders
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
    (1, 1, '2023-12-01 12:30:00', 580.00),
    (2, 2, '2023-12-02 18:45:00', 350.00),
	(3, 1, '2023-12-03 15:20:00', 320.00),
    (4, 2, '2023-12-04 20:00:00', 450.00);

-- Insert Sample OrderItems
INSERT INTO OrderItems (OrderItemID, OrderID, ProductID, Quantity, Subtotal)
VALUES
    (1, 1, 1, 2, 600.00),
    (2, 1, 4, 1, 80.00),
    (3, 2, 2, 1, 250.00),
    (4, 2, 5, 2, 300.00),
	(5, 3, 6, 3, 360.00),
    (6, 3, 8, 1, 180.00),
    (7, 4, 7, 2, 100.00),
    (8, 4, 10, 1, 100.00);


-- Create Staff Table
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20)
);


-- Create CafeManager Table
CREATE TABLE CafeManager (
    ManagerID INT PRIMARY KEY,
    StaffID INT,
    Responsibilities VARCHAR(255), -- Specific responsibilities of the cafe manager
    ExperienceYears INT, -- Number of years of experience
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

-- Create InventoryManager Table
CREATE TABLE InventoryManager (
    InventoryManagerID INT PRIMARY KEY,
    StaffID INT,
    Department VARCHAR(50), -- Inventory department details
    InventoryTrackingSystem VARCHAR(100), -- Name of the tracking system used
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

-- Create Cashier Table
CREATE TABLE Cashier (
    CashierID INT PRIMARY KEY,
    StaffID INT,
    CashRegisterID INT, -- Identifier for the cash register assigned
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

-- Insert Sample CafeManager
INSERT INTO CafeManager (ManagerID, StaffID, Responsibilities, ExperienceYears)
VALUES
    (1, 1, 'Menu Planning, Staff Management', 5),
    (2, 2, 'Financial Management, Customer Satisfaction', 7),
    (3, 3, 'Inventory Management, Vendor Relationships', 6);

-- Insert Sample InventoryManager
INSERT INTO InventoryManager (InventoryManagerID, StaffID, Department, InventoryTrackingSystem)
VALUES
    (1, 4, 'Kitchen Supplies', 'InventoryPro'),
    (2, 5, 'Beverages', 'StockMaster'),
    (3, 6, 'Dessert Ingredients', 'InventoryPlus');

-- Insert Sample Cashier
INSERT INTO Cashier (CashierID, StaffID, CashRegisterID)
VALUES
    (1, 7, 101),
    (2, 8, 102),
    (3, 9, 103);


-- Create Schedule Table
CREATE TABLE Schedule (
    ScheduleID INT PRIMARY KEY,
    StaffID INT,
    ShiftStart DATETIME,
    ShiftEnd DATETIME,
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

-- Create LoyaltyProgram Table
CREATE TABLE LoyaltyProgram (
    LoyaltyProgramID int,
	CustomerID INT,
    Points INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create Rewards Table
CREATE TABLE Rewards (
    RewardID INT PRIMARY KEY,
    PointsRequired INT,
    Description VARCHAR(255)
);

-- Create CustomerRewards Table
CREATE TABLE CustomerRewards (
    CustomerID INT,
    RewardID INT,
    RedeemDate DATETIME,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (RewardID) REFERENCES Rewards(RewardID)
);

-- Insert Sample Staff
INSERT INTO Staff (StaffID, FirstName, LastName,Email, Phone)
VALUES
    (1, 'John', 'Doe', 'john.doe@example.com', '+923001234567'),
    (2, 'Jane', 'Doe', 'jane.doe@example.com', '+923451234567'),
    (3, 'Jim', 'Doe', 'jim.doe@example.com', '+923341234567');

-- Insert Sample Schedules
INSERT INTO Schedule (ScheduleID, StaffID, ShiftStart, ShiftEnd)
VALUES
    (1, 1, '2023-12-01 09:00:00', '2023-12-01 17:00:00'),
    (2, 2, '2023-12-01 09:00:00', '2023-12-01 17:00:00'),
    (3, 3, '2023-12-01 13:00:00', '2023-12-01 21:00:00');

-- Insert Sample LoyaltyProgram
INSERT INTO LoyaltyProgram (LoyaltyProgramID, CustomerID, Points)
VALUES
    (1, 1, 100),
    (2,2, 200),
    (3,3, 150),
    (4,4, 250),
    (5,5, 300);

-- Insert Sample Rewards
INSERT INTO Rewards (RewardID, PointsRequired, Description)
VALUES
    (1, 100, 'Free Coffee'),
    (2, 200, 'Free Dessert'),
    (3, 300, 'Free Main Course');

-- Insert Sample CustomerRewards
INSERT INTO CustomerRewards (CustomerID, RewardID, RedeemDate)
VALUES
    (1, 1, '2023-12-01 12:30:00'),
    (2, 2, '2023-12-02 18:45:00'),
    (3, 1, '2023-12-03 15:20:00'),
    (4, 3, '2023-12-04 20:00:00');


-- Create Feedback Table
CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY,
    CustomerID INT,
    OrderID INT,
    Rating INT,
    Comment TEXT,
    FeedbackDate DATETIME,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert Sample Feedback
INSERT INTO Feedback (FeedbackID, CustomerID,OrderID, Rating, Comment, FeedbackDate)
VALUES
    (1, 1, 1, 1, 4, 'Great service and delicious food!', '2023-12-05 14:30:00'),
    (2, 2, 2, 2, 5, 'Quick and friendly service. Loved the atmosphere.', '2023-12-06 12:15:00'),
    (3, 3, 3, 3, 3, 'Food was good, but it took a bit longer than expected.', '2023-12-07 19:45:00');


