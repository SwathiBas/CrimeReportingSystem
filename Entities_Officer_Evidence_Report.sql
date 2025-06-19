create database CrimeReportingSystem;
use CrimeReportingSystem;

create table officers (
    officerid int auto_increment primary key,
    firstname varchar(50) not null,
    lastname varchar(50) not null,
    badgenumber varchar(20) unique not null,
    Rank_Details varchar(30),
    contactinformation varchar(100),
    agencyid int,
    foreign key (agencyid) references lawenforcementagencies(agencyid)
);

create table evidence (
    evidenceid int auto_increment primary key,
    description text not null,
    locationfound varchar(100),
    incidentid int,
    foreign key (incidentid) references incidents(incidentid)
);
create table evidence (
    evidenceid int auto_increment primary key,
    description text not null,
    locationfound varchar(100),
    incidentid int,
    foreign key (incidentid) references incidents(incidentid)
);

create table reports (
    reportid int auto_increment primary key,
    incidentid int,
    reportingofficer int,
    reportdate datetime,
    reportdetails text,
    status enum('draft', 'finalized') default 'draft',
    foreign key (incidentid) references incidents(incidentid),
    foreign key (reportingofficer) references officers(officerid)
);


