-- Creating a database called Crime Reporting System

CREATE DATABASE CrimeReportingSystem;
USE CrimeReportingSystem;

-- Creating a table called Victims
CREATE TABLE IF NOT EXISTS Victims (
    VictimID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    ContactInfo VARCHAR(100)
);

-- Creating a table called Suspects
CREATE TABLE Suspects
(
	SuspectID INT PRIMARY KEY, 
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    DateOfBirth DATE, 
    GENDER VARCHAR(50),
    ContactInfo BIGINT
);

--Creating a table called LawEnforcementAgencies
CREATE TABLE LawEnforcementAgencies 
(
	AgencyID INT PRIMARY KEY, 
    AgencyName VARCHAR(100),
    Jurisdiction VARCHAR(100),
    ContactInformation BIGINT,
    OfficerID INT,
    CONSTRAINT fk_Lea_Off FOREIGN KEY (OfficerID) REFERENCES Officers(OfficerID)    
);

--Creating a table called Incidents
CREATE TABLE IF NOT EXISTS Incidents (
    IncidentID INT PRIMARY KEY,
    IncidentType VARCHAR(100),
    IncidentDate DATE,
    Location VARCHAR(100),
    Description TEXT,
    Status VARCHAR(50),
    VictimID INT,
    SuspectID INT,
    FOREIGN KEY (VictimID) REFERENCES Victims(VictimID),
    FOREIGN KEY (SuspectID) REFERENCES Suspects(SuspectID)
);

-- Creating a table called Officers
create table Officers (
    officerid int auto_increment primary key,
    firstname varchar(50) not null,
    lastname varchar(50) not null,
    badgenumber varchar(20) unique not null,
    Rank_Details varchar(30),
    contactinformation varchar(100),
    agencyid int,
    foreign key (agencyid) references lawenforcementagencies(agencyid)
);

-- Creating a table called Evidence
create table Evidence (
    evidenceid int auto_increment primary key,
    description text not null,
    locationfound varchar(100),
    incidentid int,
    foreign key (incidentid) references incidents(incidentid)
);

-- Creating a table called Reports
create table Reports (
    reportid int auto_increment primary key,
    incidentid int,
    reportingofficer int,
    reportdate datetime,
    reportdetails text,
    status enum('draft', 'finalized') default 'draft',
    foreign key (incidentid) references incidents(incidentid),
    foreign key (reportingofficer) references officers(officerid)
);



