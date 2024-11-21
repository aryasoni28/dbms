-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 22, 2022 at 07:57 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

DELIMITER $$

CREATE PROCEDURE GetTicketDetails()
BEGIN
    SELECT 
        t.TICKET_NO AS TicketNumber,
        t.PRICE AS TicketPrice,
        t.SOURCE AS TicketSource,
        t.DESTINATION AS TicketDestination,
        t.DATE_OF_TRAVEL AS TravelDate,
        t.TYPE AS TicketType,
        p.FNAME AS FirstName,
        p.MNAME AS MiddleName,
        p.LNAME AS LastName,
        p.AGE AS Age,
        p.SEX AS Gender,
        p.PHONE AS PhoneNumber,
        p.ADDRESS AS Address,
        f.FLIGHT_CODE AS FlightCode,
        f.SOURCE AS FlightSource,
        f.DESTINATION AS FlightDestination,
        f.DEPARTURE AS DepartureTime,
        f.ARRIVAL AS ArrivalTime,
        f.DURATION AS Duration,
        f.PRICE_BUSINESS AS BusinessClassPrice,
        f.PRICE_ECONOMY AS EconomyClassPrice,
        f.PRICE_STUDENTS AS StudentClassPrice,
        f.PRICE_DIFFERENTLYABLED AS DifferentlyAbledPrice,
        al.AIRLINE_NAME AS AirlineName
    FROM 
        ticket t
    JOIN 
        passenger p ON t.PASSPORT_NO = p.PASSPORT_NO
    JOIN 
        flight f ON t.FLIGHT_CODE = f.FLIGHT_CODE
    JOIN 
        airline al ON f.AIRLINE_ID = al.AIRLINE_ID;
END$$

DELIMITER ;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbms`
--

-- --------------------------------------------------------

--
-- Table structure for table `airline`
--

CREATE TABLE `airline` (
  `AIRLINE_ID` varchar(10) NOT NULL,
  `AIRLINE_NAME` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `airport`
--

CREATE TABLE `airport` (
  `A_NAME` varchar(50) NOT NULL,
  `STATE` varchar(30) NOT NULL,
  `COUNTRY` varchar(30) NOT NULL,
  `C_NAME` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `C_NAME` varchar(30) NOT NULL,
  `STATE` varchar(30) NOT NULL,
  `COUNTRY` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `contains`
--

CREATE TABLE `contains` (
  `A_NAME` varchar(50) DEFAULT NULL,
  `AIRLINE_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `flight`
--

CREATE TABLE `flight` (
  `SOURCE` varchar(30) NOT NULL,
  `DESTINATION` varchar(30) NOT NULL,
  `DEPARTURE` varchar(5) DEFAULT NULL,
  `ARRIVAL` varchar(5) DEFAULT NULL,
  `DURATION` varchar(5) DEFAULT NULL,
  `FLIGHT_CODE` char(10) NOT NULL,
  `AIRLINE_ID` varchar(10) DEFAULT NULL,
  `PRICE_BUSINESS` int(15) DEFAULT NULL,
  `PRICE_ECONOMY` int(15) DEFAULT NULL,
  `PRICE_STUDENTS` int(15) DEFAULT NULL,
  `PRICE_DIFFERENTLYABLED` int(15) DEFAULT NULL,
  `DATE` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pass`
--

CREATE TABLE `pass` (
  `PASSPORT_NO` char(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `FNAME` varchar(50) NOT NULL,
  `MNAME` varchar(50) DEFAULT NULL,
  `LNAME` varchar(50) NOT NULL,
  `PASSPORT_NO` char(8) NOT NULL,
  `AGE` int(3) DEFAULT NULL,
  `SEX` char(1) DEFAULT NULL,
  `PHONE` char(10) DEFAULT NULL,
  `ADDRESS` varchar(50) DEFAULT NULL,
  `FLIGHT_CODE` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `price`
--

CREATE TABLE `price` (
  `PRICE` int(20) DEFAULT NULL,
  `TYPE` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `selected`
--

CREATE TABLE `selected` (
  `FLIGHT_CODE` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `TICKET_NO` int(11) NOT NULL,
  `PRICE` int(15) DEFAULT NULL,
  `SOURCE` varchar(30) DEFAULT NULL,
  `DESTINATION` varchar(30) DEFAULT NULL,
  `DATE_OF_TRAVEL` date DEFAULT NULL,
  `PASSPORT_NO` char(8) DEFAULT NULL,
  `FLIGHT_CODE` char(10) DEFAULT NULL,
  `TYPE` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `airline`
--
ALTER TABLE `airline`
  ADD PRIMARY KEY (`AIRLINE_ID`);

--
-- Indexes for table `airport`
--
ALTER TABLE `airport`
  ADD PRIMARY KEY (`A_NAME`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`C_NAME`);

--
-- Indexes for table `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`FLIGHT_CODE`);

--
-- Indexes for table `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`PASSPORT_NO`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`TICKET_NO`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `TICKET_NO` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;
-- Insert data into `airline`
INSERT INTO airline (AIRLINE_ID, AIRLINE_NAME) VALUES 
('AL001', 'Air India'),
('AL002', 'Indigo'),
('AL003', 'SpiceJet');

-- Insert data into `city`
INSERT INTO city (C_NAME, STATE, COUNTRY) VALUES 
('Mumbai', 'Maharashtra', 'India'),
('Delhi', 'Delhi', 'India'),
('Kolkata', 'West Bengal', 'India');

-- Insert data into `airport`
INSERT INTO airport (A_NAME, STATE, COUNTRY, C_NAME) VALUES 
('Chhatrapati Shivaji Airport', 'Maharashtra', 'India', 'Mumbai'),
('Indira Gandhi Airport', 'Delhi', 'India', 'Delhi'),
('Netaji Subhas Chandra Bose Airport', 'West Bengal', 'India', 'Kolkata');

-- Insert data into `contains`
INSERT INTO contains (A_NAME, AIRLINE_ID) VALUES 
('Chhatrapati Shivaji Airport', 'AL001'),
('Indira Gandhi Airport', 'AL002'),
('Netaji Subhas Chandra Bose Airport', 'AL003');

-- Insert data into `flight`
INSERT INTO flight (SOURCE, DESTINATION, DEPARTURE, ARRIVAL, DURATION, FLIGHT_CODE, AIRLINE_ID, PRICE_BUSINESS, PRICE_ECONOMY, PRICE_STUDENTS, PRICE_DIFFERENTLYABLED, DATE) VALUES 
('Mumbai', 'Delhi', '09:00', '11:00', '2:00', 'FL12345678', 'AL001', 5000, 3000, 2000, 1500, '2024-12-01'),
('Delhi', 'Kolkata', '14:00', '16:30', '2:30', 'FL87654321', 'AL002', 5500, 3200, 2200, 1600, '2024-12-02'),
('Kolkata', 'Mumbai', '18:00', '20:30', '2:30', 'FL11223344', 'AL003', 6000, 3500, 2500, 1800, '2024-12-03');

-- Insert data into `pass`
INSERT INTO pass (PASSPORT_NO) VALUES 
('P1234567'), 
('P7654321'), 
('P1122334');

-- Insert data into `passenger`
INSERT INTO passenger (FNAME, MNAME, LNAME, PASSPORT_NO, AGE, SEX, PHONE, ADDRESS, FLIGHT_CODE) VALUES 
('John', 'M', 'Doe', 'P1234567', 30, 'M', '9876543210', '123 Street, Mumbai', 'FL12345678'),
('Jane', NULL, 'Smith', 'P7654321', 28, 'F', '8765432109', '456 Avenue, Delhi', 'FL87654321'),
('Arya', 'Rakeshkumar', 'Soni', 'AB654321', 24, 'M', '9998308777', 'Block3', 'FL87654324'),
('Sri Vidya', NULL, 'M', 'AB765432', 24, 'F', '9998308788', 'Block3', 'FL87654327'),
('Nivedita', NULL, 'Kasturi', 'AB876543', 24, 'F', '9998308799', 'Block3', 'FL87654329'),
('Alice', 'K', 'Brown', 'P1122334', 35, 'F', '7654321098', '789 Boulevard, Kolkata', 'FL11223344');

-- Insert data into `price`
INSERT INTO price (PRICE, TYPE) VALUES 
(5000, 'Business'), 
(3000, 'Economy'), 
(2000, 'Students'), 
(1500, 'Differently Abled');

-- Insert data into `selected`
INSERT INTO selected (FLIGHT_CODE) VALUES 
('FL12345678'), 
('FL87654321'), 
('FL11223344');

-- Insert data into `ticket`
INSERT INTO ticket (TICKET_NO, PRICE, SOURCE, DESTINATION, DATE_OF_TRAVEL, PASSPORT_NO, FLIGHT_CODE, TYPE) VALUES 
(1, 5000, 'Mumbai', 'Delhi', '2024-12-01', 'P1234567', 'FL12345678', 'Business'),
(2, 3200, 'Delhi', 'Kolkata', '2024-12-02', 'P7654321', 'FL87654321', 'Economy'),
(3, 2500, 'Kolkata', 'Mumbai', '2024-12-03', 'P1122334', 'FL11223344', 'Students');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
