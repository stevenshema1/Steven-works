
-- CREATE DATABASES

create database FoodWasteManagement;
-- SELECT DATABASE
USE FoodWasteManagement;
-- I created user called shema steven and grant him all permisions on database  FoodWasteManagement

create user 'shemasteven'@'localhost' identified by '2401000569';

--  grant him all permisions on database  FoodWasteManagement
grant all privileges on FoodWasteManagement.* to 'shemasteven'@'localhost';

FLUSH PRIVILEGES;
CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(50),
    Email VARCHAR(100),
    Role ENUM('Donor', 'Collector', 'Admin')
);

CREATE TABLE FoodItems (
    FoodItemID INT PRIMARY KEY AUTO_INCREMENT,
    FoodName VARCHAR(100),
    ExpirationDate DATE,
    Quantity INT,
    DonorUserID INT,
    FOREIGN KEY (DonorUserID) REFERENCES Users(UserID)
);

CREATE TABLE Donations (
    DonationID INT PRIMARY KEY AUTO_INCREMENT,
    FoodItemID INT,
    DonorUserID INT,
    DateDonated DATE,
    Status ENUM('Pending', 'Collected'),
    FOREIGN KEY (FoodItemID) REFERENCES FoodItems(FoodItemID),
    FOREIGN KEY (DonorUserID) REFERENCES Users(UserID)
);

CREATE TABLE Collectors (
    CollectorID INT PRIMARY KEY AUTO_INCREMENT,
    CollectorName VARCHAR(100),
    ContactInfo VARCHAR(100)
);

CREATE TABLE CollectEvents (
    CollectEventID INT PRIMARY KEY AUTO_INCREMENT,
    DonationID INT,
    CollectorID INT,
    DateCollected DATE,
    FOREIGN KEY (DonationID) REFERENCES Donations(DonationID),
    FOREIGN KEY (CollectorID) REFERENCES Collectors(CollectorID)
);


-- Insert Users
INSERT INTO Users (Username, Email, Role) VALUES ('shema', 'shema@gmail.com', 'Donor');
INSERT INTO Users (Username, Email, Role) VALUES ('steven', 'steven@ddg.com', 'Collector');
INSERT INTO Users (Username, Email, Role) VALUES ('Charlie', 'charlie@yahoo.com', 'Admin');

-- Insert Food Items
INSERT INTO FoodItems (FoodName, ExpirationDate, Quantity, DonorUserID) VALUES ('Apples', '2023-12-01', 100, 1);
INSERT INTO FoodItems (FoodName, ExpirationDate, Quantity, DonorUserID) VALUES ('Bread', '2023-11-15', 50, 1);
INSERT INTO FoodItems (FoodName, ExpirationDate, Quantity, DonorUserID) VALUES ('Milk', '2023-10-28', 20, 1);

-- Insert Donations
INSERT INTO Donations (FoodItemID, DonorUserID, DateDonated, Status) VALUES (1, 1, CURDATE(), 'Pending');
INSERT INTO Donations (FoodItemID, DonorUserID, DateDonated, Status) VALUES (2, 1, CURDATE(), 'Pending');
INSERT INTO Donations (FoodItemID, DonorUserID, DateDonated, Status) VALUES (3, 1, CURDATE(), 'Pending');

-- Insert Collectors
INSERT INTO Collectors (CollectorName, ContactInfo) VALUES ('Food Bank', '1234567890');
INSERT INTO Collectors (CollectorName, ContactInfo) VALUES ('Local Charity', '0987654321');

-- Insert Collect Events
INSERT INTO CollectEvents (DonationID, CollectorID, DateCollected) VALUES (1, 1, '2023-10-01');

-- Create Triggers

CREATE TRIGGER AfterCollect
AFTER INSERT ON CollectEvents
FOR EACH ROW
-- BEGIN
    UPDATE Donations SET Status = 'Collected' WHERE DonationID = NEW.DonationID;
-- END;

-- Create procedure

DELIMITER //

CREATE PROCEDURE GetDonationsByStatus(IN donationStatus ENUM('Pending', 'Collected'))
BEGIN
    SELECT * 
    FROM Donations
    WHERE Status = donationStatus;
END //

DELIMITER ;

-- call procedure

CALL GetDonationsByStatus('Pending');
SELECT * FROM DonationOverview;


-- Create View

CREATE VIEW DonationOverview AS
SELECT d.DonationID, f.FoodName, u.Username, d.DateDonated, d.Status
FROM Donations d
JOIN FoodItems f ON d.FoodItemID = f.FoodItemID
JOIN Users u ON d.DonorUserID = u.UserID;




