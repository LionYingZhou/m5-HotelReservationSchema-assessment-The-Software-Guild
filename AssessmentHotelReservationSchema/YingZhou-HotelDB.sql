DROP DATABASE IF EXISTS YingZhouHotelDB;
CREATE DATABASE YingZhouHotelDB;
USE YingZhouHotelDB;

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