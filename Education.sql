create database Education


select * from region;
Update  region set Region_Name =  'Central Africa'
where Region_Name = 'African sub-region - Central Africa';

Update  region set Region_Name =  'East Africa'
where Region_Name = 'African sub-region - East Africa';

Update  region set Region_Name =  'South Africa'
where Region_Name = 'African sub-region - South Africa';

Update  region set Region_Name =  'West Africa'
where Region_Name = 'African sub-region - West Africa';

Update  region set Region_Name =  'North Africa'
where Region_Name = 'African sub-region - North Africa';


--Truncate Table Country;
--Drop table Country;
Create Table Country(
Country_ID int Primary Key Not Null,
Country_Name Varchar(50),
Income_Group varchar(50),
Region varchar(50)


Select distinct(R.ID) from Region R
inner join Country c
on R.Region_Name = c.Region

select distinct Region from Country

Select * from Region;

Create Table Region2(
Region_Code Varchar(4),
Region_Name Varchar(4)
)
Alter Table Region2 Alter Column Region_Name Varchar(50);


Insert into Region2(Region_Code, Region_Name) values
('EAP', 'East Asia & Pacific'),
('ESA','Eastern and Southern Africa'),
('ECA','Eastern Europe and Central Asia'),
('LAC','Latin America and Caribbean'),
('MENA','Middle East and North Africa'),
('NA','North America'),
('SA','South Asia'),
('WCA','West and Central Africa')
Insert into Region2(Region_Code, Region_Name) values ('WE', 'Western Europe')

--Drop table Region;

Update Country set region_Code = 'EAP' where Region Like '%East Asia and Pacific%'
Update Country set region_Code = 'ESA' where Region Like '%Eastern and Southern Africa%'
Update Country set region_Code = 'ECA' where Region Like '%Eastern Europe and Central Asia%'
Update Country set region_Code = 'LAC' where Region Like '%Latin America and Caribbean%'
Update Country set region_Code = 'MENA' where Region Like '%Middle East and North Africa%'
Update Country set region_Code = 'NA' where Region Like '%North America%'
Update Country set region_Code = 'SA' where Region Like '%South Asia%'
Update Country set region_Code = 'WCA' where Region Like '%West and Central Africa%'
Update Country set region_Code = 'WE' where Region Like '%Western Europe%'


select * from Region;

select *  from Country;

Update Country set LDC = 'YES' where 
Country_Name = 'Afghanistan' or  
Country_Name = 'Bangladesh' or
Country_Name = 'Benin' or
Country_Name = 'Bhutan' or
Country_Name = 'Burkina Faso' or
Country_Name = 'Burundi' or
Country_Name = 'Cambodia' or
Country_Name = 'Central African Republic' or
Country_Name = 'Chad' or
Country_Name = 'Comoros' or
Country_Name = 'Democratic Republic of the Congo' or
Country_Name = 'Djibouti' or
Country_Name = 'Eritrea' or
Country_Name = 'Ethiopia' or
Country_Name = 'Gambia' or
Country_Name = 'Guinea-Bissau' or
Country_Name = 'Kiribati' or
Country_Name = 'Lesotho' or
Country_Name = 'Liberia' or
Country_Name = 'Madagascar' or
Country_Name = 'Malawi' or
Country_Name = 'Mali' or
Country_Name = 'Mozambique' or
Country_Name = 'Myanmar' or
Country_Name = 'Nepal' or
Country_Name = 'Niger' or
Country_Name = 'Rwanda' or
Country_Name = 'Sao Tome and Principe' or
Country_Name = 'Somalia' or
Country_Name = 'South Sudan' or
Country_Name = 'Sudan' or
Country_Name = 'Togo' or
Country_Name = 'Tuvalu' or
Country_Name = 'Uganda' or
Country_Name = 'United Republic of Tanzania' or
Country_Name = 'Vanuatu' or
Country_Name = 'Yemen' or
Country_Name = 'Zambia'


select * from Literacy_Youth
alter table literacy_Youth drop column Region 
alter table literacy_Youth drop column [Sub-region]
alter table literacy_Youth drop column [Least developed countries (LDC)]
alter table literacy_Youth drop column [Africa sub-regions]
alter table literacy_Youth drop column [Africa region]

select * from Literacy_Youth 
where Country is Null

delete from Literacy_Youth where Country is Null

select * from Literacy_Youth 
where [Total population] is null and Total is null

Delete  from Literacy_Youth 
where [Total population] is null and Total is null

--select  total, Male, Female, coalesce (total, Male, Female)  From Literacy_Youth

select count(*) from Literacy_Youth where total is null and male is null and Female is null;
select count(*) from Literacy_Adult where total is null and male is null and Female is null;

--truncate table literacy_youth;

Create table Literacy_Adult(
Country varchar(50),
Total Float,
Male float,
Female float
)
Select * from Country
select * from Literacy_Adult

Alter Table literacy_Adult add  Country_ID int;
Alter table country alter column Country_Name Varchar(50)  Not null;
Alter table country add Primary Key (Country_Name);
alter table literacy_adult drop column Country_ID;
select * from Literacy_Adult;
select * from Literacy_Youth;



Create Table countryID (
country_ID varchar(10),
country_Name varchar(50)
)

SELECT TOP (10) *
  FROM [Education].[dbo].[Country];

  SELECT TOP (10) *
  FROM [Education].[dbo].[CountryID]


Alter Table  Country add Country_ID Varchar(10) ;

Update Country set Country_ID = 'AFG' where country_name = 'Afghanistan';
Update Country set Country_ID = 'AIA' where country_name = 'Anguilla';
Update Country set Country_ID = 'ALB' where country_name = 'Albania';
Update Country set Country_ID = 'AND' where country_name = 'Andorra';
Update Country set Country_ID = 'ARE' where country_name = 'United Arab Emirates';
Update Country set Country_ID = 'ARG' where country_name = 'Argentina';
Update Country set Country_ID = 'ARM' where country_name = 'Armenia';
Update Country set Country_ID = 'AFG' where country_name = 'Antigua and Barbuda';
Update Country set Country_ID = 'AUS' where country_name = 'Australia';
Update Country set Country_ID = 'AUT' where country_name = 'Austria';
Update Country set Country_ID = 'AZE' where country_name = 'Azerbaijan';
Update Country set Country_ID = 'BDI' where country_name = 'Burundi';
Update Country set Country_ID = 'BEL' where country_name = 'Belgium';
Update Country set Country_ID = 'BEN' where country_name = 'Benin';
Update Country set Country_ID = 'BFA' where country_name = 'Burkina Faso';
Update Country set Country_ID = 'BGD' where country_name = 'Bangladesh';
Update Country set Country_ID = 'BGR' where country_name = 'Bulgaria';
Update Country set Country_ID = 'BHR' where country_name = 'Bahrain';
Update Country set Country_ID = 'BHS' where country_name = 'Bahamas';
Update Country set Country_ID = 'BIH' where country_name = 'Bosnia and Herzegovina';
Update Country set Country_ID = 'BLR' where country_name = 'Belarus';
Update Country set Country_ID = 'BLZ' where country_name = 'Belize';


-- update countryID using join
UPDATE country 
   SET country.country_ID = countryID.country_ID 
   FROM country  INNER JOIN  countryID ON country.country_Name = countryID.country_Name;

--alter table country alter column Country_ID varchar(10) Not null;

--alter table country add Primary Key(Country_ID);

select * from Literacy_Adult where Country_Code is Null;
select * from Literacy_Youth where Country_Code is Null;

Delete from Literacy_Adult where Country = 'Haiti';
Delete from Literacy_Adult where Country = 'Holy See';
Delete from Literacy_Adult where Country = 'The former Yugoslav Republic of Macedonia';
Delete from Literacy_Youth where Country = 'Haiti';
Delete from Literacy_Youth where Country = 'Holy See';
Delete from Literacy_Youth where Country = 'The former Yugoslav Republic of Macedonia';

select country_code, Country_Name from Country where Country_Name like '%Czech%';
Update Country set Country_Name = 'Czech Republic' where Country_Name ='Czechia';

select country_code, Country_Name from Country where Country_Name like '%Haiti%';
select country_code, Country_Name from Country where Country_Name like '%Holy See%';
select country_code, Country_Name from Country where Country_Name like '%Vatican %';

select country_code, Country_Name from Country where Country_Name like '%Eswatini%';
Update Country set Country_Name = 'swaziland' where Country_Name ='Eswatini';

select country_code, Country_Name from Country where Country_Name like '%The former Yugoslav Republic of Macedonia%';

alter table Literacy_Adult Add  Country_Code varchar(10);


UPDATE Literacy_Adult 
   SET Literacy_Adult.country_Code = country.country_Code 
   FROM Literacy_Adult  INNER JOIN  country ON Literacy_Adult.Country = country.country_Name;

alter table Literacy_Youth Add  Country_Code varchar(10);

UPDATE Literacy_Youth 
   SET Literacy_Youth.country_Code = country.country_Code 
   FROM Literacy_Youth  INNER JOIN  country ON Literacy_Youth.Country = country.country_Name;


create table Attendance_Pre (
	Country_Code varchar (10),
	Total_Att Float,
	Male_Att Float,
	Female_Att Float,
	Rural_Att Float,
	Urban_Att Float,
	Population_Att numeric
)
Drop table Attendance_Pre;
Drop table Attendance_Pri;
Drop table Attendance_LSec;
Drop table Attendance_USec;


create table Attendance_Pri (
	Country_Code varchar (10),
	Total_Att Float,
	Male_Att Float,
	Female_Att Float,
	Rural_Att Float,
	Urban_Att Float,
	Population_Att numeric
)

create table Attendance_LSec (
	Country_Code varchar (10),
	Total_Att Float,
	Male_Att Float,
	Female_Att Float,
	Rural_Att Float,
	Urban_Att Float,
	Population_Att numeric
)

create table Attendance_USec (
	Country_Code varchar (10),
	Total_Att Float,
	Male_Att Float,
	Female_Att Float,
	Rural_Att Float,
	Urban_Att Float,
	Population_Att numeric
)
*/


create table OutOfSchool_Pri(
	Country_Code varchar (10),
	Total_OOSC Float,
	Male_OOSC Float,
	Female_OOSC Float,
	Population_OOSC numeric
	)

create table OutOfSchool_LSec(
	Country_Code varchar (10),
	Total_OOSC Float,
	Male_OOSC Float,
	Female_OOSC Float,
	Population_OOSC numeric
	)
alter table OutOfSchool_LSec alter column country_code varchar(50);

create table OutOfSchool_USec(
	Country_Code varchar (10),
	Total_OOSC Float,
	Male_OOSC Float,
	Female_OOSC Float,
	Population_OOSC numeric
	)
alter table OutOfSchool_USec alter column country_code varchar(50);

--truncate table OutOfSchool_LSec;


UPDATE OutOfSchool_LSec 
   SET OutOfSchool_LSec.country_Code = country.country_Code 
   FROM OutOfSchool_LSec  INNER JOIN  country ON OutOfSchool_LSec.Country_Code = country.country_Name;

UPDATE OutOfSchool_USec 
   SET OutOfSchool_USec.country_Code = country.country_Code 
   FROM OutOfSchool_USec  INNER JOIN  country ON OutOfSchool_USec.Country_Code = country.country_Name;


Select * from OutOfSchool_LSec;
Select * from OutOfSchool_USec;
select * from Country;

create table Completion_Pri (
	Country_Code varchar (10),
	Total_Comp Float,
	Male_Comp Float,
	Female_Comp Float,
	Rural_Comp Float,
	Urban_Comp Float,
	Population_Comp numeric
)
create table Completion_LSec (
	Country_Code varchar (10),
	Total_Comp Float,
	Male_Comp Float,
	Female_Comp Float,
	Rural_Comp Float,
	Urban_Comp Float,
	Population_Comp numeric
)
create table Completion_USec (
	Country_Code varchar (10),
	Total_Comp Float,
	Male_Comp Float,
	Female_Comp Float,
	Rural_Comp Float,
	Urban_Comp Float,
	Population_Comp numeric
)

--Alter Table Literacy_Adult Drop Column Country_Name;
--Alter Table Literacy_Youth Drop Column Country_Name;

create table School_Close_Days (
	Country_Code varchar (10),
	Start_day Date,
	End_Day Date,
	Academic_Break int,
	Full_Close int,
	Full_Open int,
	Partial_Close int
)
drop table Internet;

create table Internet (
	Country_Code varchar (50),
	Year2005 float,
	Year2006 float,
	Year2007 float,
	Year2008 float,
	Year2009 float,
	Year2010 float,
	Year2011 float,
	Year2012 float,
	Year2013 float,
	Year2014 float,
	Year2015 float
)

select Top 5 * from Attendance_LSec;
select Top 5 * from Attendance_USec;
select Top 5 * from Attendance_Pre;
select Top 5 * from Attendance_Pri;
select Top 5 * from country;
select Top 5 * from Region;
select Top 5 * from Literacy_Adult;
select Top 5 * from Literacy_Youth;
select Top 5 * from Completion_Pri;
select Top 5 * from Completion_LSec;
select Top 5 * from Completion_USec;
select Top 5 * from OutOfSchool_Pri;
select Top 5 * from OutOfSchool_LSec;
select Top 5 * from OutOfSchool_USec;
select Top 5 * from School_Close_Days;

select * from OutOfSchool_LSec;
Alter table OutOfSchool_LSec Alter Column Country_Code Varchar (10);
Alter Table OutOfSchool_LSec Add  Country_Code2 Varchar (10);

Update OutOfSchool_LSec set Country_Code2 = Country_Code;
Alter Table OutOfSchool_LSec Drop  column Country_Code;


-- Data Cleanning!
Delete from Attendance_LSec where Country_Code = (
	select Top 1 Attendance_LSec.Country_Code from Attendance_LSec left join country
	on Attendance_LSec.Country_Code = Country.Country_Code
	where Country.Country_Code is null
)
Delete from Attendance_Pre where Country_Code = (
	select Top 1 Attendance_Pre.Country_Code from Attendance_Pre left join country
	on Attendance_Pre.Country_Code = Country.Country_Code
	where Country.Country_Code is null
)
Delete from Attendance_Pri where Country_Code = (
	select Top 1 Attendance_Pri.Country_Code from Attendance_Pri left join country
	on Attendance_Pri.Country_Code = Country.Country_Code
	where Country.Country_Code is null
)
Delete from Attendance_USec where Country_Code in (
	select  Attendance_USec.Country_Code from Attendance_USec left join country
	on Attendance_USec.Country_Code = Country.Country_Code
	where Country.Country_Code is null
)
Delete from Completion_LSec where Country_Code = (
	select Top 1 Completion_LSec.Country_Code from Completion_LSec left join country
	on Completion_LSec.Country_Code = Country.Country_Code
	where Country.Country_Code is null
)
Delete from Completion_Pri where Country_Code = (
	select Top 1 Completion_Pri.Country_Code from Completion_Pri left join country
	on Completion_Pri.Country_Code = Country.Country_Code
	where Country.Country_Code is null
)
Delete from Completion_USec where Country_Code = (
	select Top 1 Completion_USec.Country_Code from Completion_USec left join country
	on Completion_USec.Country_Code = Country.Country_Code
	where Country.Country_Code is null
)


Delete from OutOfSchool_USec where Country_Code = (
	select Top 1 OutOfSchool_USec.Country_Code from OutOfSchool_USec left join country
	on OutOfSchool_USec.Country_Code = Country.Country_Code
	where Country.Country_Code is null
)
Delete from OutOfSchool_LSec where Country_Code = (
	select  OutOfSchool_LSec.Country_Code from OutOfSchool_LSec left join country
	on OutOfSchool_LSec.Country_Code = Country.Country_Code
	where Country.Country_Code is null
)
Delete from School_Close_Days where Country_Code = (
	select  School_Close_Days.Country_Code from School_Close_Days Right join country
	on School_Close_Days.Country_Code = Country.Country_Code
	where School_Close_Days.Country_Code is null
)

Delete from Internet where Country_Code in (
	select internet.Country_Code from Internet Left join country
	on Internet.Country_Code = Country.Country_Name
	where Country.Country_Code is null
)
	
select Country_Code from Internet where Country_code like '%Moldova%';

update Internet set Country_Code = '' where Country_Code = 'Lao PDR';

select Country_Name from Country where Country_Name like '%Lao%';

select * from Internet
inner join Country
on Internet.Country_Code = Country.Country_Code


UPDATE Internet
   SET Internet.country_code = Country.Country_Code 
   FROM Internet  INNER JOIN  Country ON Internet.Country_Code = Country.Country_Name;


create procedure DeleteRows
as 
Begin
Delete from Internet where Country_Code in (
	select internet.Country_Code from Internet Left join country
	on Internet.Country_Code = Country.Country_Name
	where Country.Country_Code is null
)
end
execute DeleteRows;



-- Create Views for Attendance
Drop view VAttendance_Pre;
create view VAttendance_Pre as Select * from Attendance_Pre
where Total_Att is Not null 
or  Male_Att is not null
or Female_Att is not null
or rural_att is not null
or urban_att is not null;


Drop view VAttendance_Pri;
create view VAttendance_Pri as Select * from Attendance_Pri
where Total_Att is Not null 
or  Male_Att is not null
or Female_Att is not null
or rural_att is not null
or urban_att is not null;

Drop view VAttendance_LSec;
create view VAttendance_LSec as Select * from Attendance_LSec
where Total_Att is Not null 
or  Male_Att is not null
or Female_Att is not null
or rural_att is not null
or urban_att is not null;

drop view VAttendance_USec;
create view VAttendance_USec as Select * from Attendance_USec
where Total_Att is Not null 
or  Male_Att is not null
or Female_Att is not null
or rural_att is not null
or urban_att is not null;





-- create view for completion

Drop view VCompletion_Pri;
create view VCompletion_Pri as Select * from Completion_Pri
where Total_Comp is Not null 
or  Male_Comp is not null
or Female_Comp is not null
or Rural_Comp is not null
or Urban_Comp is not null;


Drop view VCompletion_LSec;
create view VCompletion_LSec as Select * from Completion_LSec
where Total_Comp is Not null 
or  Male_Comp is not null
or Female_Comp is not null
or Rural_Comp is not null
or Urban_Comp is not null;


Drop view VCompletion_USec;
create view VCompletion_USec as Select * from Completion_USec
where Total_Comp is Not null 
or  Male_Comp is not null
or Female_Comp is not null
or Rural_Comp is not null
or Urban_Comp is not null;


-- create view for Literacy
Drop view VLiteracy_Adult;

create view VLiteracy_Adult as Select * from Literacy_Adult
where Total_Literacy is Not null 
or  Male_Literacy is not null
or Female_Literacy is not null;


Drop view VLiteracy_Youth;
create view VLiteracy_Youth as Select * from Literacy_Youth
where Total_Literacy is Not null 
or  Male_Literacy is not null
or Female_Literacy is not null;


-- Create view for Out of school
drop view VOutOfSchool_Pri;
create view VOutOfSchool_Pri as Select * from OutOfSchool_Pri
where Total_OOSC is Not null 
or  Male_OOSC is not null
or Female_OOSC is not null;


Drop view VOutOfSchool_LSec;
create view VOutOfSchool_LSec as Select * from OutOfSchool_LSec
where Total_OOSC is Not null 
or  Male_OOSC is not null
or Female_OOSC is not null;

Drop view VOutOfSchool_USec;

create view VOutOfSchool_USec as Select * from OutOfSchool_USec
where Total_OOSC is Not null 
or  Male_OOSC is not null
or Female_OOSC is not null;


-- Create View School close days
drop view VSchool_Close_Days;
create view VSchool_Close_Days as Select * from School_Close_Days
where Academic_Break is Not null 
or  Full_Close is not null
or Full_Open is not null
or Partial_Close is not null;

-- create view Internet
drop view Vinternet;

create view Vinternet as Select * from Internet
where Year2005 is Not null 
or  Year2006 is not null
or Year2007 is not null
or Year2008 is not null
or Year2009 is not null
or Year2010 is not null
or Year2011 is not null
or Year2012 is not null
or Year2013 is not null
or Year2014 is not null
or Year2015 is not null;


-- create table population and view
create table Population(
Country_Code varchar (10),
Population_Pre numeric,
Population_Pri numeric,
Population_LSec numeric,
Population_USec numeric
)

Create View Vpopulation 
as select * from Population
	where Population_Pre is not null
	or Population_LSec is not null
	or Population_Pri is not null
	or Population_USec is not null;

Select * from Vpopulation;


-- alter tables add column LEVEL
alter table Attendance_Pre add  Level Varchar(50) Null;
Update Attendance_Pre set Level = 'Pre-Primary';


alter table Attendance_Pri add  Level Varchar(50) Null;
Update Attendance_Pri set Level = 'Primary';

alter table Attendance_LSec add  Level Varchar(50) Null;
Update Attendance_LSec set Level = 'Lower Secondary';


alter table Attendance_USec add  Level Varchar(50) Null;
Update Attendance_USec set Level = 'Upper Secondary';




alter table Completion_Pri add  Level Varchar(50) Null;
Update Completion_Pri set Level = 'Primary';

alter table Completion_LSec add  Level Varchar(50) Null;
Update Completion_LSec set Level = 'Lower Secondary';


alter table Completion_USec add  Level Varchar(50) Null;
Update Completion_USec set Level = 'Upper Secondary';




alter table OutOfSchool_Pri add  Level Varchar(50) Null;
Update OutOfSchool_Pri set Level = 'Primary';

alter table OutOfSchool_LSec add  Level Varchar(50) Null;
Update OutOfSchool_LSec set Level = 'Lower Secondary';


alter table OutOfSchool_USec add  Level Varchar(50) Null;
Update OutOfSchool_USec set Level = 'Upper Secondary';


Alter table OutOfSchool_USec alter column Country_Code varchar(10);