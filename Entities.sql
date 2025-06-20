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
create table if not exists Officers (
    OfficerID int primary key,
    FirstName varchar(50) not null,
    LastName varchar(50) not null,
    BadgeNumber varchar(20) unique not null,
    Rank_Details varchar(30),
    ContactInformation varchar(100),
    AgencyID int,
    foreign key (agencyid) references lawEnforcementAgencies(agencyid)
);


-- Creating a table called Evidence
create table Evidence (
    EvidenceID int primary key,
    Description text not null,
    LocationFound varchar(100),
    IncidentID int,
    foreign key (IncidentID) references incidents(IncidentID)
);

-- Creating a table called Reports
create table Reports (
    ReportID int primary key,
    IncidentID int,
    ReportingOfficer int,
    ReportDate datetime,
    ReportDetails text,
    status enum('draft', 'finalized') default 'draft',
    foreign key (Incidentid) references Incidents(IncidentID),
    foreign key (ReportingOfficer) references Officers(OfficerID)
);




