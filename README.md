
PROJECT TITLE : FOOD WASTAGE MANAGEMENT SYSTEM




Project Description
The Database Management component of the Food Wastage Reduction Management System (FWRMS) is designed to efficiently store, manage, and retrieve data related to food donations and distribution. This critical subsystem will handle the relational data needed for effective user management, food item tracking, donation histories, and reporting, ensuring the seamless operation of the entire platform.

Data Dictionary for Food Wastage Reduction Management System (FWRMS)

1. Users Table
Column Name	Data Type	Description
user_id	INT	Unique identifier for each user (Primary Key).
username	VARCHAR(50)	The unique username of the user.
email	VARCHAR(100)	User's email address (must be unique).
password_hash	VARCHAR(255)	Hashed password for user authentication.
role	ENUM('donor', 'collector', 'admin')	Role of the user in the system.
created_at	DATETIME	Timestamp when the user account was created.
updated_at	DATETIME	Timestamp of the last update to the user account.
2. Food Items Table
Column Name	Data Type	Description
food_item_id	INT	Unique identifier for each food item (Primary Key).
donor_id	INT	Foreign key referencing the user_id of the donor.
food_type	VARCHAR(100)	Type of food item (e.g., fruits, vegetables, baked goods).
quantity	INT	Quantity of the food item available for donation.
expiration_date	DATE	Expiration date of the food item.
created_at	DATETIME	Timestamp when the food item was listed.
updated_at	DATETIME	Timestamp of the last update to the food item listing.
3. Donations Table
Column Name	Data Type	Description
donation_id	INT	Unique identifier for each donation (Primary Key).
food_item_id	INT	Foreign key referencing the food_item_id of the donated food.
donor_id	INT	Foreign key referencing the user_id of the donor.
collector_id	INT	Foreign key referencing the user_id of the collector (if applicable).
donation_status	ENUM('pending', 'collected')	Status of the donation.
created_at	DATETIME	Timestamp when the donation was made.
updated_at	DATETIME	Timestamp of the last update to the donation record.
4. Collection Events Table
Column Name	Data Type	Description
event_id	INT	Unique identifier for each collection event (Primary Key).
collector_id	INT	Foreign key referencing the user_id of the collector.
food_item_id	INT	Foreign key referencing food_item_id denoting the food collected.
event_date	DATETIME	Date and time of the collection event.
details	TEXT	Additional details about the collection event.
created_at	DATETIME	Timestamp when the collection event was created.
updated_at	DATETIME	Timestamp of the last update to the collection event record.



 Entity Relationship Diagram (ERD) for the Food Wastage Reduction Management System:

sql
                           +-----------------------+
                           |  Users                |
                           +-----------------------+
                                      |
                                      |
                                      v
                           +-----------------------+
                           |  UserID (PK)          |
                           |  Username             |
                           |  Email                |
                           |  Role                 |
                           +-----------------------+
                                             |
                                             |
                                             v
                           +-----------------------+
                           |  FoodItems            |
                           +-----------------------+
                                      |
                                      |
                                      v
                           +-----------------------+
                           |  FoodItemID (PK)      |
                           |  FoodName             |
                           |  ExpirationDate       |
                           |  Quantity             |
                           |  DonorUserID (FK)     |
                           +-----------------------+
                                             |
                                             |
                                             v
                           +-----------------------+
                           |  Donations            |
                           +-----------------------+
                                      |
                                      |
                                      v
                           +-----------------------+
                           |  DonationID (PK)     |
                           |  FoodItemID (FK)     |
                           |  DonorUserID (FK)    |
                           |  DateDonated         |
                           |  Status              |
                           +-----------------------+
                                             |
                                             |
                                             v
                           +-----------------------+
                           |  Collectors          |
                           +-----------------------+
                                      |
                                      |
                                      v
                           +-----------------------+
                           |  CollectorID (PK)    |
                           |  CollectorName       |
                           |  ContactInfo         |
                           +-----------------------+
                                             |
                                             |
                                             v
                           +-----------------------+
                           |  CollectEvents       |
                           +-----------------------+
                                      |
                                      |
                                      v
                           +-----------------------+
                           |  CollectEventID (PK)|
                           |  DonationID (FK)   |
                           |  CollectorID (FK)   |
                           |  DateCollected     |
                           +-----------------------+


















Logical Data Model (LDM) for the Food Wastage Reduction Management System:
Entity 1: Users
•	Attribute 1.1: UserID (PK)
o	Description: A unique identifier for each user.
o	Data Type: Integer
•	Attribute 1.2: Username
o	Description: The username chosen by each user.
o	Data Type: Varchar (50)
•	Attribute 1.3: Email
o	Description: The email address of each user.
o	Data Type: Varchar (100)
•	Attribute 1.4: Role
o	Description: The role of each user (e.g., donor, collector, admin).
o	Data Type: Enum (Donor, Collector, Admin)
Entity 2: FoodItems
•	Attribute 2.1: FoodItemID (PK)
o	Description: A unique identifier for each food item.
o	Data Type: Integer
•	Attribute 2.2: FoodName
o	Description: The name of each food item.
o	Data Type: Varchar (100)
•	Attribute 2.3: ExpirationDate
o	Description: The expiration date of each food item.
o	Data Type: Date
•	Attribute 2.4: Quantity
o	Description: The quantity of each food item.
o	Data Type: Integer
•	Attribute 2.5: DonorUserID (FK)
o	Description: The user ID of the donor for each food item.
o	Data Type: Integer
Entity 3: Donations
•	Attribute 3.1: DonationID (PK)
o	Description: A unique identifier for each donation.
o	Data Type: Integer
•	Attribute 3.2: FoodItemID (FK)
o	Description: The food item ID of each donation.
o	Data Type: Integer
•	Attribute 3.3: DonorUserID (FK)
o	Description: The user ID of the donor for each donation.
o	Data Type: Integer
•	Attribute 3.4: DateDonated
o	Description: The date when each donation was made.
o	Data Type: Date
•	Attribute 3.5: Status
o	Description: The status of each donation (e.g., pending, collected).
o	Data Type: Enum (Pending, Collected)
Entity 4: Collectors
•	Attribute 4.1: CollectorID (PK)
o	Description: A unique identifier for each collector.
o	Data Type: Integer
•	Attribute 4.2: CollectorName
o	Description: The name of each collector.
o	Data Type: Varchar (100)
•	Attribute 4.3: ContactInfo
o	Description: The contact information of each collector.
o	Data Type: Varchar (100)
Entity 5: CollectEvents
•	Attribute 5.1: CollectEventID (PK)
o	Description: A unique identifier for each collection event.
o	Data Type: Integer
•	Attribute 5.2: DonationID (FK)
o	Description: The donation ID of each collection event.
o	Data Type: Integer
•	Attribute 5.3: CollectorID (FK)
o	Description: The collector ID of each collection event.
o	Data Type: Integer
•	Attribute 5.4: DateCollected
o	Description: The date when each collection event was made.
o	Data Type: Date
•	Not Null constraints on required attributes (e.g., Username, FoodName)

Physical Database Model (PDM) For the Food Wastage Reduction Management System:





SQL representations create the tables and define their structures:




CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(50) NOT NULL UNIQUE,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Role ENUM('Donor', 'Collector', 'Admin') NOT NULL
);

Table: FoodItems
CREATE TABLE FoodItems (
    FoodItemID INT PRIMARY KEY AUTO_INCREMENT,
    FoodName VARCHAR(100) NOT NULL,
    ExpirationDate DATE NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity >= 0),
    DonorUserID INT,
    FOREIGN KEY (DonorUserID) REFERENCES Users(UserID) ON DELETE SET NULL
);

 Table: Donations
CREATE TABLE Donations (
    DonationID INT PRIMARY KEY AUTO_INCREMENT,
    FoodItemID INT,
    DonorUserID INT,
    DateDonated DATE NOT NULL,
    Status ENUM('Pending', 'Collected') NOT NULL,
    FOREIGN KEY (FoodItemID) REFERENCES FoodItems(FoodItemID) ON DELETE CASCADE,
    FOREIGN KEY (DonorUserID) REFERENCES Users(UserID) ON DELETE SET NULL
);

Table: Collectors
CREATE TABLE Collectors (
    CollectorID INT PRIMARY KEY AUTO_INCREMENT,
    CollectorName VARCHAR(100) NOT NULL,
    ContactInfo VARCHAR(100) NOT NULL
);

 Table: CollectEvents
CREATE TABLE CollectEvents (
    CollectEventID INT PRIMARY KEY AUTO_INCREMENT,
    DonationID INT,
    CollectorID INT,
    DateCollected DATE NOT NULL,
    FOREIGN KEY (DonationID) REFERENCES Donations(DonationID) ON DELETE CASCADE,
    FOREIGN KEY (CollectorID) REFERENCES Collectors(CollectorID) ON DELETE SET NULL
);









