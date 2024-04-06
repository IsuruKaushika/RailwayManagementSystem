CREATE DATABASE huu;
USE huu;

CREATE TABLE USER(
User_ID varchar(45) NOT NULL,
First_name varchar(45) NOT NULL,
Last_name varchar(45) NOT NULL,
Gender varchar(10) ,
Mobile_No varchar(20) DEFAULT NULL,
Address varchar(50),
PRIMARY KEY (User_ID)
);

CREATE TABLE EMPLOYEE(
Empl_ID varchar(20) NOT NULL,
First_name varchar(45) NOT NULL,
Last_name varchar(45) NOT NULL,
Position varchar(20),
PRIMARY KEY (Empl_ID)
);

CREATE TABLE EMPLOYEE_DETAILS(
Empl_ID varchar(20) not null,
Mobile_No varchar(20) ,
Age int,
Date_Of_Appointment date,
PRIMARY KEY (Empl_ID, Mobile_No),
CONSTRAINT fk_EmplID foreign key(Empl_ID) references EMPLOYEE(Empl_ID)  on update cascade on delete cascade
);


CREATE TABLE TICKET(
Ticket_ID varchar(20) NOT NULL,
User_ID varchar(45) Not null,
Train_ID varchar(20),
Route_ID varchar(20),
Seat_No int,
Price decimal(9,2) NOT NULL,
PRIMARY KEY (Ticket_ID),
CONSTRAINT fk_UserID foreign key(User_ID) REFERENCES USER(User_ID) on delete cascade on update cascade 
);


CREATE TABLE TRAIN(
Train_ID varchar(20) NOT NULL,
Ticket_ID varchar(20),
Seating_capacity int,
Train_Name varchar(30),
Dep_Time time NOT NULL,
Arr_Time time NOT NULL,
Time_duration time as (Dep_Time-Arr_time),
PRIMARY KEY (Train_ID),
CONSTRAINT fk_TicketID FOREIGN KEY(Ticket_ID) REFERENCES TICKET(Ticket_ID) on delete set null on update cascade
);


CREATE TABLE ROUTE(
Route_ID varchar(20) NOT NULL,
Train_ID varchar(20),
Arrival varchar(20),
Departure varchar(20),
Distance int,
PRIMARY KEY (Route_ID),
CONSTRAINT fk_TrainID FOREIGN KEY(Train_ID) REFERENCES TRAIN(Train_ID) on delete set null on update cascade
);

CREATE TABLE PASSENGER(
Passenger_ID varchar(20) NOT NULL,
Ticket_ID varchar(20),
Mobile_No varchar(20) DEFAULT NULL,
Gender varchar(10),
Seat_No int DEFAULT NULL,
PRIMARY KEY (Passenger_ID),
CONSTRAINT fk_TicketID2 FOREIGN KEY(Ticket_ID) REFERENCES TICKET(Ticket_ID) on delete cascade on update cascade
);

CREATE TABLE STATION(
Station_ID varchar(20) NOT NULL,
Station_Name varchar(20),
District varchar(20),
PRIMARY KEY (Station_ID)
);

CREATE TABLE CANTEEN(
Station_ID varchar(20) not null,
Canteen_name varchar(20),
Open_Time time,
Close_Time time,
CONSTRAINT fk_StationID FOREIGN KEY (Station_ID) REFERENCES STATION(Station_ID)  ON UPDATE CASCADE on delete cascade
);

CREATE TABLE COMPARTMENTS(
Train_ID varchar(20) NOT NULL,
Compartment_No int,
No_of_Seats int,
CONSTRAINT fk_TrainID3 FOREIGN KEY(Train_ID) REFERENCES TRAIN(Train_ID)  on update cascade on delete cascade
);

-- Insert sample data into USER table
INSERT INTO USER (User_ID, First_name, Last_name, Gender, Mobile_No, Address) 
VALUES 
('USR001', 'Saman', 'Silva', 'Male', '0712345678', '10/A, Colombo Road, Colombo 05'),
('USR002', 'Nimali', 'Perera', 'Female', '0776543210', '25, Galle Road, Kandy'),
('USR003', 'Kamal', 'Fernando', 'Male', '0754321098', '35, Negombo Road, Negombo'),
('USR004', 'Sudesh', 'Jayawardena', 'Male', '0789012345', '15, Ananda Mawatha, Galle'),
('USR005', 'Ayesha', 'Rajapaksa', 'Female', '0723456789', '48, Panadura Road, Moratuwa'),
('USR006', 'Dinesh', 'Perera', 'Male', '0765432109', '75, Nawala Road, Rajagiriya');


-- Insert sample data into EMPLOYEE table

INSERT INTO EMPLOYEE (Empl_ID, First_name, Last_name, Position)
VALUES 
('EMP001', 'Saman', 'Silva', 'Manager'),
('EMP002', 'Dilruk', 'Silva','Ticket Clerk'),
('EMP003', 'Lakshmi', 'Perera','Driver'),
('EMP004', 'Pradeepa', 'De Silva','Driver'),
('EMP005', 'Chaminda', 'Rajapaksa','Canteen Staff'),
('EMP006', 'Suresh', 'Gunaratne','Driver'),
('EMP007', 'Ashan', 'Gunaratne','Driver');

-- Insert sample data into EMPLOYEE_DETAILS table

INSERT INTO EMPLOYEE_DETAILS (Empl_ID, Mobile_No, Date_Of_Appointment,Age)
VALUES 
('EMP001', '0712345678', '1985-05-15',35),
('EMP002', '0776543210', '1998-09-22',40),
('EMP003', '0754321098', '1990-03-10',30),
('EMP004', '0789012345', '2005-11-18',50),
('EMP005', '0723456789', '1988-07-30',28),
('EMP006', '0765432109', '1995-12-05',35),
('EMP007', '0768432109', '2000-04-20',32);



-- Insert sample data into TICKET table
INSERT INTO TICKET (Ticket_ID, User_ID, Train_ID, Route_ID, Seat_No, Price)
VALUES 
('TC001', 'USR001', 'TRN001', 'RT001', 15, 500.00),
('TC002', 'USR002', 'TRN002', 'RT002', 22, 750.00),
('TC003', 'USR003', 'TRN003', 'RT003', 8, 600.00),
('TC004', 'USR004', 'TRN004', 'RT004', 10, 800.00),
('TC005', 'USR005', 'TRN005', 'RT005', 5, 350.00),
('TC006', 'USR006', 'TRN006', 'RT006', 12, 900.00);

-- Insert sample data into TRAIN table
INSERT INTO TRAIN (Train_ID, Ticket_ID, Seating_capacity, Train_Name, Dep_Time, Arr_Time)
VALUES 
('TRN001', 'TC001', 200, 'Udarata Manike', '06:00:00', '09:00:00'),
('TRN002', 'TC002', 150, 'Rajarata Rajina', '08:30:00', '11:45:00'),
('TRN003', 'TC003', 180, 'Samudra Devi', '12:00:00', '15:30:00'),
('TRN004', 'TC004', 200, 'Yal Devi', '14:00:00', '17:30:00'),
('TRN005', 'TC005', 250, 'Podi Manike', '14:00:00', '16:30:00'),
('TRN006', 'TC006', 240, 'samudra Devi', '12:00:00', '17:30:00')
;



-- Insert sample data into ROUTE table
INSERT INTO ROUTE (Route_ID, Train_ID, Arrival, Departure, Distance)
VALUES 
('RT001', 'TRN001', 'Colombo Fort', 'Kandy', 100),
('RT002', 'TRN002', 'Kandy', 'Anuradhapura', 150),
('RT003', 'TRN003', 'Anuradhapura', 'Jaffna', 120),
('RT004', 'TRN004', 'Jaffna', 'Matara', 200),
('RT005', 'TRN005', 'Wadduewa', 'Matara', 200),
('RT006', 'TRN006', 'Ambalangoda', 'Galle', 300);


-- Insert sample data into PASSENGER table
INSERT INTO PASSENGER (Passenger_ID, Ticket_ID, Mobile_No, Gender, Seat_No)
VALUES 
('USR001', 'TC001', '0712345678', 'Male', 15),
('USR002', 'TC002', '0776543210', 'Female', 22),
('USR003', 'TC003', NULL, 'Female', 8),
('USR004', 'TC004', '0789012345', 'Male', 10),
('USR005', 'TC005', '0723456789', 'Female', 5),
('USR006', 'TC006', '0765432109', 'Male', 12);

-- Insert sample data into STATION table
INSERT INTO STATION (Station_ID, Station_Name, District)
VALUES 
('ST001', 'Colombo Fort', 'Colombo'),
('ST002', 'Kandy', 'Kandy'),
('ST003', 'Anuradhapura', 'Anuradhapura'),
('ST004', 'Jaffna', 'Jaffna'),
('ST005', 'Matara', 'Matara'),
('ST006', 'Badulla', 'Badulla');


-- Insert sample data into CANTEEN table
INSERT INTO CANTEEN (Station_ID, Canteen_name, Open_Time, Close_Time)
VALUES 
('ST001', 'Ceylon Canteen', '07:00:00', '20:00:00'),
('ST002', 'Kandy Kiosk', '08:00:00', '18:00:00'),
('ST003', 'Anuradhapura Cafe', '09:00:00', '17:00:00'),
('ST004', 'Jaffna Junction', '07:30:00', '19:30:00'),
('ST005', 'Matara Munchies', '08:30:00', '18:30:00'),
('ST006', 'Badulla Bites', '06:30:00', '21:00:00'),
('ST004', 'Hella Bojun', '06:30:00', '21:00:00');


-- Insert sample data into COMPARTMENTS table
INSERT INTO COMPARTMENTS (Train_ID, Compartment_No, No_of_Seats)
VALUES 
('TRN001', 1, 50),
('TRN002', 2, 40),
('TRN003', 2, 60),
('TRN004', 4, 70),
('TRN005', 6, 80),
('TRN006', 6, 70);


-- Update and delete commands for all tables

-- Update commands for USER table
UPDATE USER SET First_name = 'Rohan' WHERE User_ID = 'USR006';
UPDATE USER SET Address = '20, Colombo Road, Colombo 06' WHERE User_ID = 'USR004';

-- Delete commands for USER table
DELETE FROM USER WHERE User_ID = 'USR005';

-- Update commands for EMPLOYEE table
UPDATE EMPLOYEE SET Position = 'Senior Ticket Clerk' WHERE Empl_ID = 'EMP002';
UPDATE EMPLOYEE SET Last_name = 'Fernandez' WHERE Empl_ID = 'EMP001';

-- Delete commands for EMPLOYEE table
DELETE FROM EMPLOYEE WHERE Empl_ID = 'EMP004';
DELETE FROM EMPLOYEE WHERE Empl_ID = 'EMP005';

-- Update commands for EMPLOYEE_DETAILS table
UPDATE EMPLOYEE_DETAILS SET Mobile_No = '0711111111' WHERE Empl_ID = 'EMP002' AND Mobile_No = '0776543210';
UPDATE EMPLOYEE_DETAILS SET Empl_ID = 'EMP001' WHERE Empl_ID = 'EMP005';

-- Delete commands for EMPLOYEE_DETAILS table
DELETE FROM EMPLOYEE_DETAILS WHERE Empl_ID = 'EMP001' AND Mobile_No = '0712345678';

-- Update commands for TICKET table
UPDATE TICKET SET Price = 550.00 WHERE Ticket_ID = 'TC002';
UPDATE TICKET SET Seat_No = 20 WHERE Ticket_ID = 'TC005';

-- Delete commands for TICKET table
DELETE FROM TICKET WHERE Ticket_ID = 'TC004';

-- Update commands for TRAIN table
UPDATE TRAIN SET Seating_capacity = 210 WHERE Train_ID = 'TRN003';
UPDATE TRAIN SET Arr_Time = '17:45:00' WHERE Train_ID = 'TRN001';

-- Delete commands for TRAIN table
DELETE FROM TRAIN WHERE Train_ID = 'TRN002';

-- Update commands for ROUTE table
UPDATE ROUTE SET Arrival = 'Kandy Junction' WHERE Route_ID = 'RT003';
UPDATE ROUTE SET Departure = 'Negombo' WHERE Route_ID = 'RT001';

-- Delete commands for ROUTE table
DELETE FROM ROUTE WHERE Route_ID = 'RT002';

-- Update commands for PASSENGER table
UPDATE PASSENGER SET Mobile_No = '0777777777' WHERE Passenger_ID = 'PS001';
UPDATE PASSENGER SET Seat_No = 25 WHERE Passenger_ID = 'PS005';

-- Delete commands for PASSENGER table
DELETE FROM PASSENGER WHERE Passenger_ID = 'PS006';

-- Update commands for STATION table
UPDATE STATION SET Station_Name = 'Colombo Central' WHERE Station_ID = 'ST001';
UPDATE STATION SET District = 'Galle' WHERE Station_ID = 'ST004';

-- Delete commands for STATION table
DELETE FROM STATION WHERE Station_ID = 'ST005';

-- Update commands for CANTEEN table
UPDATE CANTEEN SET Close_Time = '21:30:00' WHERE Station_ID = 'ST003';
UPDATE CANTEEN SET Canteen_name = 'Kandy Delights' WHERE Station_ID = 'ST002';

-- Delete commands for CANTEEN table
DELETE FROM CANTEEN WHERE Station_ID = 'ST006';

-- Update commands for COMPARTMENTS table
UPDATE COMPARTMENTS SET No_of_Seats = 60 WHERE Train_ID = 'TRN001' AND Compartment_No = 1;
UPDATE COMPARTMENTS SET Compartment_No = 3 WHERE Train_ID = 'TRN003' AND No_of_Seats = 60;

-- Delete commands for COMPARTMENTS table
DELETE FROM COMPARTMENTS WHERE Train_ID = 'TRN002';

-- simple queries
-- 1)select Operation
select Train_Name, Seating_capacity, Dep_Time, Arr_Time from Train where Seating_capacity=200;

-- 2)Project Operation

select First_Name, Last_Name, position from employee;

-- 3)Cartesian Product Operation
select * from employee cross join employee_details;

-- 4)Creating a User View
create view Boys as 
select User_ID, First_Name,Last_Name from user where Gender='Male';
select* from Boys;

-- 5)Renaming Operation
ALTER TABLE route RENAME COLUMN Distance TO DistanceInKm;
select* from route;
-- It is renamed

ALTER TABLE canteen RENAME TO Cafetarias;
SHOW TABLES;
-- Table has been changed as cafeteria

-- 6)Aggregation Function
select count(Empl_ID) as No_of_Employees, avg(Age) as Average_Age from employee_details;

-- 7)Use of LIKE keyword
SELECT Date_Of_Appointment, DATE_FORMAT(Date_Of_Appointment, '%Y:%m:%d') AS Date
FROM EMPLOYEE_DETAILS
WHERE DATE_FORMAT(Date_Of_Appointment, '%Y:%m:%d') LIKE '____:__:__';


-- Complex Queries
-- Selecting Empl_ID, First_name, and Last_name from the 'employee' table

-- 1)union
(SELECT Empl_ID, First_name, Last_name 
FROM employee)
UNION
(SELECT Empl_ID, Mobile_No, Date_Of_Appointment 
FROM employee_details);

-- 2)intersection
SELECT User_ID,First_Name,Last_Name FROM USER
WHERE Mobile_No IN (
    SELECT Mobile_No FROM EMPLOYEE_Details
);

-- 3)difference
SELECT User_ID,First_Name,Last_Name FROM USER
WHERE Mobile_No NOT IN (
    SELECT Mobile_No FROM EMPLOYEE_Details
);

-- 4)division
SELECT DISTINCT u.User_ID, u.First_name, u.Last_name
FROM USER u
WHERE NOT EXISTS (
    SELECT t.Train_ID
    FROM TRAIN t
    WHERE NOT EXISTS (
        SELECT *
        FROM TICKET ti
        WHERE ti.User_ID = u.User_ID
        AND ti.Train_ID = t.Train_ID
    )
);

-- 5)inner join
SELECT u.First_name, u.Last_name, t.Train_Name
FROM USER u
INNER JOIN TICKET ti ON u.User_ID = ti.User_ID
INNER JOIN TRAIN t ON ti.Train_ID = t.Train_ID;

-- 6)natural join 
SELECT u.User_ID, u.First_name, u.Last_name, ti.Ticket_ID, ti.Train_ID
FROM USER u
NATURAL JOIN TICKET ti;

-- 7)left outer join 
SELECT u.User_ID, u.First_name, u.Last_name, ti.Ticket_ID, ti.Train_ID
FROM USER u
LEFT OUTER JOIN TICKET ti ON u.User_ID = ti.User_ID;

-- 8)right outer join
SELECT u.User_ID, u.First_name, u.Last_name, ti.Ticket_ID, ti.Train_ID
FROM USER u
RIGHT OUTER JOIN TICKET ti ON u.User_ID = ti.User_ID;

-- 9)full outer join
SELECT u.User_ID, u.First_name, u.Last_name, ti.Ticket_ID, ti.Train_ID
FROM USER u
LEFT OUTER JOIN TICKET ti ON u.User_ID = ti.User_ID
UNION
SELECT u.User_ID, u.First_name, u.Last_name, ti.Ticket_ID, ti.Train_ID
FROM USER u
RIGHT OUTER JOIN TICKET ti ON u.User_ID = ti.User_ID;

-- 10)Aggregation
SELECT Mobile_No AS Senior_Ticket_Clerk_Number
FROM employee_details
WHERE Empl_ID = (
    SELECT Empl_ID
    FROM employee
    WHERE position = 'Senior Ticket Clerk'
);

-- 11)Correlation
SELECT Empl_ID
FROM employee_details e
WHERE 50 > (
    SELECT Age
    FROM employee_details
    WHERE e.Empl_ID = Empl_ID
);

-- 12)exits
SELECT First_name, Last_name
FROM EMPLOYEE e
WHERE EXISTS (
    SELECT 1
    FROM EMPLOYEE_DETAILS ed
    WHERE e.Empl_ID = ed.Empl_ID
    AND ed.Age < 40
);

-- 13)union all
SELECT First_name, Last_name
FROM USER
UNION ALL
SELECT First_name, Last_name
FROM EMPLOYEE;








