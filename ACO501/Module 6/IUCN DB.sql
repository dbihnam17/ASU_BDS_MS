CREATE TABLE family (
fName varchar(30) primary key
);

LOAD DATA LOCAL INFILE "C:/Users/Daniel/Desktop/Coding/ACO501/Module 6/family.csv"
INTO TABLE family
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES

CREATE TABLE genus (
gName varchar(30) primary key,
fName varchar(30) references family(fName)
);

CREATE TABLE species (
taxonID numeric primary key,
sName varchar(30),
friendlyName varchar(60),
category char(2),family
gName varchar(30) references genus(gName)
);

CREATE TABLE country (
taxonID numeric,
countryAbbr varchar(7),
countryName varchar(30),
primary key (taxonID, countryAbbr, countryName)
);