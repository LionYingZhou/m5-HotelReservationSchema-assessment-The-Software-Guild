DROP DATABASE IF EXISTS YingZhouHotelData;
CREATE DATABASE YingZhouHotelData;
USE YingZhouHotelData;

CREATE TABLE RoomData(
RoomNumber INT(11) PRIMARY KEY,	
Type VARCHAR(11) NOT NULL,	
Amenities VARCHAR(50) NOT NULL,
ADAaccessible VARCHAR(11) NOT NULL,
StandardOccupancy INT(5) NOT NULL,
MaximumOccupancy  INT(5) NOT NULL,	
BasePrice DECIMAL(12,4) NOT NULL,	
ExtraPerson DECIMAL(12,4)
);

CREATE TABLE Guests(
`Name` VARCHAR(50) PRIMARY KEY,	
Address	 VARCHAR(50) NOT NULL,
City VARCHAR(50) NOT NULL,	
State VARCHAR(11) NOT NULL,	
Zip	INT(11) NOT NULL,
Phone VARCHAR(50) NOT NULL
);

CREATE TABLE Reservations(
RoomNumber INT(11) NOT NULL,
Name VARCHAR(50) NOT NULL,	
Adults INT(5) NOT NULL,	
Children INT(5) NOT NULL,	
StartDate DATE,	
EndDate DATE,
TotalRoomCost DECIMAL(12,4) NOT NULL,
PRIMARY KEY pk_Reservations(RoomNumber, `Name`),
FOREIGN KEY fk_Reservations_RoomData (RoomNumber) 
	REFERENCES RoomData(RoomNumber),
FOREIGN KEY fk_Reservations_Guests (`Name`) 
	REFERENCES Guests(`Name`)	
);

INSERT INTO RoomData(RoomNumber,Type,Amenities,ADAaccessible,StandardOccupancy,MaximumOccupancy,BasePrice,ExtraPerson) 
VALUES 
(201,'Double','Microwave, Jacuzzi','No',2,4,199.99,10),
(202,'Double','Refrigerator','Yes',2,4,174.99,10),
(203,'Double','Microwave, Jacuzzi','No',2,4,199.99,10),
(204,'Double','Refrigerator','Yes',2,4,174.99,10),
(205,'Single','Microwave, Refrigerator, Jacuzzi','No',2,2,174.99,NULL),
(206,'Single','Microwave, Refrigerator','Yes',2,2,149.99,NULL),
(207,'Single','Microwave, Refrigerator, Jacuzzi','No',2,2,174.99,NULL),
(208,'Single','Microwave, Refrigerator','Yes',2,2,149.99,NULL),
(301,'Double','Microwave, Jacuzzi','No',2,4,199.99,10),
(302,'Double','Refrigerator','Yes',2,4,174.99,10),
(303,'Double','Microwave, Jacuzzi','No',2,4,199.99,10),
(304,'Double','Refrigerator','Yes',2,4,174.99,10),
(305,'Single','Microwave, Refrigerator, Jacuzzi','No',2,2,174.99,NULL),
(306,'Single','Microwave, Refrigerator','Yes',2,2,149.99,NULL),
(307,'Single','Microwave, Refrigerator, Jacuzzi','No',2,2,174.99,NULL),
(308,'Single','Microwave, Refrigerator','Yes',2,2,149.99,NULL),
(401,'Suite','Microwave, Refrigerator, Oven','Yes',3,8,399.99,20),
(402,'Suite','Microwave, Refrigerator, Oven','Yes',3,8,399.99,20);

INSERT INTO Guests(Name,Address,City,State,Zip,Phone) VALUES 
('Ying Zhou', '178 bayview circle sw', 'Airdrie', 'AB', 748547, '(587)889-7580'),
('Mack Simmer', '379 Old Shore Street', 'Council Bluffs', 'IA', 51501, '(291) 553-0508'),
('Bettyann Seery', '750 Wintergreen Dr.', 'Wasilla', 'AK', 99654, '(478) 277-9632'),
('Duane Cullison', '9662 Foxrun Lane', 'Harlingen', 'TX', 78552, '(308) 494-0198'),
('Karie Yang', '9378 W. Augusta Ave.', 'West Deptford', 'NJ', 08096, '(214) 730-0298'),
('Aurore Lipton', '762 Wild Rose Street', 'Saginaw', 'MI', 48601, '(377) 507-0974'),
('Zachery Luechtefeld', '7 Poplar Dr.', 'Arvada', 'CO', 80003, '(814) 485-2615'),
('Jeremiah Pendergrass', '70 Oakwood St.', 'Zion', 'IL', 60099, '(279) 491-0960'),
('Walter Holaway', '7556 Arrowhead St.', 'Cumberland', 'RI', 02864, '(446) 396-6785'),
('Wilfred Vise', '77 West Surrey Street', 'Oswego', 'NY', 13126, '(834) 727-1001'),
('Maritza Tilton', '939 Linda Rd.', 'Burke', 'VA', 22015, '(446) 351-6860'),
('Joleen Tison', '87 Queen St.', 'Drexel Hill', 'PA', 19026, '(231) 893-2755');

INSERT INTO Reservations(RoomNumber,Name,Adults,Children,StartDate,EndDate,TotalRoomCost) VALUES
(308, 'Mack Simmer', 1, 0, '2023-02-02', '2023-02-04', 299.98),
(203, 'Bettyann Seery', 2, 1, '2023-02-05', '2023-02-10', 999.95),
(305, 'Duane Cullison', 2, 0, '2023-02-22', '2023-02-24', 349.98),
(201, 'Karie Yang', 2, 2, '2023-03-06', '2023-03-07', 199.99),
(307, 'Ying Zhou', 1, 1, '2023-03-17', '2023-03-20', 524.97),
(302, 'Aurore Lipton', 3, 0, '2023-03-18', '2023-03-23', 924.95),
(202, 'Zachery Luechtefeld', 2, 2, '2023-03-29', '2023-03-31', 349.98),
(304, 'Jeremiah Pendergrass', 2, 0, '2023-03-31', '2023-04-05', 874.95),
(301, 'Walter Holaway', 1, 0, '2023-04-09', '2023-04-13', 799.96),
(207, 'Wilfred Vise', 1, 1, '2023-04-23', '2023-04-24', 174.99),
(401, 'Maritza Tilton', 2, 4, '2023-05-30', '2023-06-02', 1199.97),
(206, 'Joleen Tison', 2, 0, '2023-06-10', '2023-06-14', 599.96),
(208, 'Joleen Tison', 1, 0, '2023-06-10', '2023-06-14', 599.96),
(304, 'Aurore Lipton', 3, 0, '2023-06-17', '2023-06-18', 184.99),
(205, 'Ying Zhou', 2, 0, '2023-06-28', '2023-07-02', 699.96),
(204, 'Walter Holaway', 3, 1, '2023-07-13', '2023-07-14', 184.99),
(401, 'Wilfred Vise', 4, 2, '2023-07-18', '2023-07-21', 1259.97),
(303, 'Bettyann Seery', 2, 1, '2023-7-28', '2023-7-29', 199.99),
(305, 'Bettyann Seery', 1, 0, '2023-8-30', '2023-9-1', 349.98),
(208, 'Mack Simmer', 2, 0, '2023-9-16', '2023-9-17', 149.99),
(203, 'Karie Yang', 2, 2, '2023-9-13', '2023-9-15', 399.98),
(401, 'Duane Cullison', 2, 2, '2023-11-22', '2023-11-25', 1199.97),
(206, 'Mack Simmer', 2, 0, '2023-11-22', '2023-11-25', 449.97),
(301, 'Mack Simmer', 2, 2, '2023-11-22', '2023-11-25', 599.97),
(302, 'Maritza Tilton', 2, 0, '2023-12-24', '2023-12-28', 699.96);

DELETE FROM Reservations
WHERE `Name` = 'Jeremiah Pendergrass';