-- Creating a database called Crime Reporting System

CREATE DATABASE CrimeReportingSystem;
USE CrimeReportingSystem;
CREATE TABLE Suspects
(
	SuspectID INT PRIMARY KEY, 
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    DateOfBirth DATE, 
    GENDER VARCHAR(50),
    ContactInfo BIGINT
);

CREATE TABLE LawEnforcementAgencies 
(
	AgencyID INT PRIMARY KEY, 
    AgencyName VARCHAR(100),
    Jurisdiction VARCHAR(100),
    ContactInformation BIGINT,
    OfficerID INT,
    CONSTRAINT fk_Lea_Off FOREIGN KEY (OfficerID) REFERENCES Officers(OfficerID)    
);
