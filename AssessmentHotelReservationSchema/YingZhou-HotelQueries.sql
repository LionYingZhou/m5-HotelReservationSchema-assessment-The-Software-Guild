-- Part 4: Query the Database
-- Create a third SQL script that includes queries to retrieve the following data from the database.
-- 1. Write a query that returns a list of reservations that end in July 2023, including the name of the guest, the room number(s), and the reservation dates.
USE YingZhouHotelData;
SELECT `Name` ReservationsName,
RoomNumber,
StartDate,
EndDate
FROM Reservations
WHERE EndDate>='2023-07-01' AND EndDate<='2023-07-31';
-- 2. Write a query that returns a list of all reservations for rooms with a jacuzzi, displaying the guest's name, the room number, and the dates of the reservation.
USE YingZhouHotelData;
SELECT r.`Name` ReservationsName,
r.RoomNumber,
r.StartDate,
r.EndDate,
d.Amenities
FROM Reservations r
INNER JOIN RoomData d ON r.RoomNumber = d.RoomNumber
WHERE d.Amenities LIKE'%Jacuzzi%';
-- 3. Write a query that returns all the rooms reserved for a specific guest, including the guest's name, the room(s) reserved, the starting date of the reservation, and how many people were included in the reservation. (Choose a guest's name from the existing data.)
-- Here I want choose a guest(Your name) is me:Ying Zhou
USE YingZhouHotelData;
SELECT r.`Name` ReservationsName,
r.RoomNumber,
r.StartDate,
CONCAT(r.Adults + r.Children, ' people') AS peopleNum
FROM Reservations r
WHERE r.`Name` = 'Ying Zhou';
-- 4. Write a query that returns a list of rooms, reservation ID, and per-room cost for each reservation. The results should include all rooms, whether or not there is a reservation associated with the room.
USE YingZhouHotelData;
SELECT CONCAT(r.`Name`,'-',r.StartDate) AS ReservationsID,
r.TotalRoomCost,
r.RoomNumber
FROM Reservations r;
-- 5. Write a query that returns all the rooms accommodating at least three guests and that are reserved on any date in April 2023.
USE YingZhouHotelData;
SELECT d.RoomNumber,
d.MaximumOccupancy,
r.StartDate,
r.EndDate
FROM RoomData d
INNER JOIN Reservations r ON d.RoomNumber = r.RoomNumber
WHERE d.MaximumOccupancy >= 3
AND (r.StartDate <='2023-04-30' AND r.StartDate >='2023-04-01')
AND(r.EndDate <='2023-04-30' AND r.EndDate >='2023-04-01');
-- 6. Write a query that returns a list of all guest names and the number of reservations per guest, sorted starting with the guest with the most reservations and then by the guest's last name.
USE YingZhouHotelData;
SELECT SUBSTRING_INDEX(r.`Name`, ' ', -1) AS LastName,
COUNT(*) AS ReservationCount
FROM Reservations r
GROUP BY LastName
ORDER BY ReservationCount DESC, LastName ASC;
-- 7. Write a query that displays the name, address, and phone number of a guest based on their phone number. (Choose a phone number from the existing data.)
-- Here I want choose a guest number is mine:(587)889-7580
USE YingZhouHotelData;
SELECT `Name` GuestsName,
Address,
Phone
FROM Guests
WHERE Phone = '(587)889-7580';