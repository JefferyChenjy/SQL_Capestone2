--Q2 what are Lowest 10 countries with lowest Upper Secendary attendance rate of school attendance?

--Upper Secondary
select  Top 10
	C.Country_Name, 
	R.Region_Name,  
	C.Income_Group, 
	VATT.Total_Att, 
	VATT.Total_Att/100 * P.Population_USec as Population,
	VATT.LEVEL
from VAttendance_USec VATT
	inner join Country C
	on c.Country_Code = VATT.Country_Code
	inner join Region R
	on C.Region_Code = R.Region_Code
	Inner Join Vpopulation P 
	on P.Country_Code = c.Country_Code
where VATT.Total_Att <= 50
order by VATT.Total_Att 

-- Pre
select 
	C.Country_Name, 
	R.Region_Name,  
	C.Income_Group, 
	VATT.Total_Att, 
	VATT.Total_Att/100 * P.Population_Pre as Population,
	VATT.LEVEL
from VAttendance_Pre VATT
	inner join Country C
	on c.Country_Code = VATT.Country_Code
	inner join Region R
	on C.Region_Code = R.Region_Code
	Inner Join Vpopulation P 
	on P.Country_Code = c.Country_Code
where c.Country_Name in (
select  Top 10
	C.Country_Name
from VAttendance_USec VATT
	inner join Country C
	on c.Country_Code = VATT.Country_Code
	inner join Region R
	on C.Region_Code = R.Region_Code
	Inner Join Vpopulation P 
	on P.Country_Code = c.Country_Code
where VATT.Total_Att <= 50
order by VATT.Total_Att )


--Pri
select 
	C.Country_Name, 
	R.Region_Name,  
	C.Income_Group, 
	VATT.Total_Att, 
	VATT.Total_Att/100 * P.Population_Pri as Population,
	VATT.LEVEL
from VAttendance_Pri VATT
	inner join Country C
	on c.Country_Code = VATT.Country_Code
	inner join Region R
	on C.Region_Code = R.Region_Code
	Inner Join Vpopulation P 
	on P.Country_Code = c.Country_Code
where c.Country_Name in (
select  Top 10
	C.Country_Name
from VAttendance_USec VATT
	inner join Country C
	on c.Country_Code = VATT.Country_Code
	inner join Region R
	on C.Region_Code = R.Region_Code
	Inner Join Vpopulation P 
	on P.Country_Code = c.Country_Code
where VATT.Total_Att <= 50
order by VATT.Total_Att )

--LowerSecondary
select 
	C.Country_Name, 
	R.Region_Name,  
	C.Income_Group, 
	VATT.Total_Att, 
	VATT.Total_Att/100 * P.Population_LSec as Population,
	VATT.LEVEL
from VAttendance_LSec VATT
	inner join Country C
	on c.Country_Code = VATT.Country_Code
	inner join Region R
	on C.Region_Code = R.Region_Code
	Inner Join Vpopulation P 
	on P.Country_Code = c.Country_Code
where c.Country_Name in (
select  Top 10
	C.Country_Name
from VAttendance_USec VATT
	inner join Country C
	on c.Country_Code = VATT.Country_Code
	inner join Region R
	on C.Region_Code = R.Region_Code
	Inner Join Vpopulation P 
	on P.Country_Code = c.Country_Code
where VATT.Total_Att <= 50
order by VATT.Total_Att )







-- Qn2 How many children are out of school in each countries? what is the top 10 countries?
Select Top 10 C.Country_Name, R.Region_Name, c.Income_Group,VU.Total_OOSC,
Round((VU.Total_OOSC / 100) * P.Population_USec, 0) as 'Population', VU.Level
from VOutOfSchool_USec VU inner join Country C
on VU.Country_Code = C.Country_Code
inner join VPopulation P
on C.Country_Code = P.Country_Code
inner join Region R
on R.Region_Code = C.Region_Code
order by VU.Total_OOSC Desc


Select C.Country_Name, R.Region_Name, C.Income_Group, VL.Total_OOSC,
Round((VL.Total_OOSC / 100) * P.Population_LSec, 0) as 'Population', 
VL.Level
from VOutOfSchool_LSec VL inner join Country C
on VL.Country_Code = C.Country_Code
inner join VPopulation P
on C.Country_Code = P.Country_Code
inner join Region R
on R.Region_Code = C.Region_Code
where c.Country_Name in 
(
Select Top 10 C.Country_Name
from VOutOfSchool_USec VU inner join Country C
on VU.Country_Code = C.Country_Code
inner join VPopulation P
on C.Country_Code = P.Country_Code
inner join Region R
on R.Region_Code = C.Region_Code
order by VU.Total_OOSC Desc
);


Select Top 10 C.Country_Name, R.Region_Name, C.Income_Group, VP.Total_OOSC,
Round((VP.Total_OOSC / 100) * P.Population_Pri, 0) as 'Population', 
VP.Level
from VOutOfSchool_Pri VP inner join Country C
on VP.Country_Code = C.Country_Code
inner join VPopulation P
on C.Country_Code = P.Country_Code
inner join Region R
on R.Region_Code = C.Region_Code
where c.Country_Name in 
(
Select Top 10 C.Country_Name
from VOutOfSchool_USec VU inner join Country C
on VU.Country_Code = C.Country_Code
inner join VPopulation P
on C.Country_Code = P.Country_Code
inner join Region R
on R.Region_Code = C.Region_Code
order by VU.Total_OOSC Desc
)




-- Qn3 how many children are out of school?
Select Ceiling(Sum(pr.Total_OOSC / 100 * p.Population_Pri))
as 'Primary_Out_Of_School'
from OutOfSchool_Pri PR
inner join Country C
on c.Country_Code = PR.Country_Code
inner join Population p
on p.Country_Code = c.Country_Code

Select Ceiling(Sum(LS.Total_OOSC / 100 * p.Population_LSec))
as 'LowerSecondary_Out_Of_School'
from OutOfSchool_LSec LS
inner join Country C
on c.Country_Code = LS.Country_Code
inner join Population p
on p.Country_Code = c.Country_Code

Select Ceiling(Sum(US.Total_OOSC / 100 * p.Population_USec))
as 'UpperSecondary_Out_Of_School'
from OutOfSchool_USec US
inner join Country C
on c.Country_Code = US.Country_Code
inner join Population p
on p.Country_Code = c.Country_Code





--Qn4 how many children completed education worldwide? and how many attending school?
Select Ceiling(Sum(pr.Total_Comp / 100 * p.Population_Pri))
as 'Primary_Completion'
from Completion_Pri PR
inner join Country C
on c.Country_Code = PR.Country_Code
inner join Population p
on p.Country_Code = c.Country_Code

Select Ceiling(Sum(LS.Total_Comp / 100 * p.Population_LSec))
as 'LowerSecondary_Completion'
from Completion_LSec LS
inner join Country C
on c.Country_Code = LS.Country_Code
inner join Population p
on p.Country_Code = c.Country_Code

Select Ceiling(Sum(US.Total_Comp / 100 * p.Population_USec))
as 'UpperSecondary_Completion'
from Completion_USec US
inner join Country C
on c.Country_Code = US.Country_Code
inner join Population p
on p.Country_Code = c.Country_Code



---------------------------------- attendance
Select Ceiling(Sum(pri.Total_Att / 100 * p.Population_Pri))
as 'Primary_Attending'
from Attendance_Pri PRI
inner join Country C
on c.Country_Code = PRi.Country_Code
inner join Population p
on p.Country_Code = c.Country_Code

Select Ceiling(Sum(prE.Total_Att / 100 * p.Population_Pre))
as 'PrePrimary_Attending'
from Attendance_Pre PRE
inner join Country C
on c.Country_Code = PRE.Country_Code
inner join Population p
on p.Country_Code = c.Country_Code

Select Ceiling(Sum(LS.Total_Att / 100 * p.Population_LSec))
as 'LowerSec_Attending'
from Attendance_LSec LS
inner join Country C
on c.Country_Code = LS.Country_Code
inner join Population p
on p.Country_Code = c.Country_Code

Select Ceiling(Sum(US.Total_Att / 100 * p.Population_USec))
as 'UpperSec_Attending'
from Attendance_USec US
inner join Country C
on c.Country_Code = US.Country_Code
inner join Population p
on p.Country_Code = c.Country_Code






--Qn5 How many days affected due to Covid-19?

select Top 10 c.Country_Name, 
VS.Start_day, VS.End_Day, VS.Full_Close, VS.Academic_Break, VS.Full_Open, VS.Partial_Close, 
Datediff(DAY, End_Day, Start_day) As 'Total Days Measured'
from VSchool_Close_Days VS
inner join Country c
on c.Country_Code = VS.Country_Code
Order by Full_Close Desc

--Qn 6 Internet 

select * from internet;
select c.Country_Name, 
VI.Year2005, 
VI.Year2006, 
VI.Year2007, 
VI.Year2008, 
VI.Year2009, 
VI.Year2010, 
VI.Year2011, 
VI.Year2012, 
VI.Year2013, 
VI.Year2014,
Vi.Year2015
from internet VI
	inner join Country c
	on c.Country_Code = VI.Country_Code
	--where c.Country_Name = 'Brazil'
	where c.Country_Name in (

	select Top 10 c.Country_Name
	from VSchool_Close_Days VS
	inner join Country c
	on c.Country_Code = VS.Country_Code
	Order by Full_Close Desc
)


select Top 10 c.Country_Name, 
VI.Year2005, 
VI.Year2006, 
VI.Year2007, 
VI.Year2008, 
VI.Year2009, 
VI.Year2010, 
VI.Year2011, 
VI.Year2012, 
VI.Year2013, 
VI.Year2014,
Vi.Year2015
from Vinternet VI
	inner join Country c
	on c.Country_Code = VI.Country_Code
Where VI.Year2015 is not null
Order by VI.Year2015 

-- Qn7 Region internet avg coverage of 2015

select r.Region_Name,
/*Avg(Year2008) as [2008],
Avg(Year2009) as [2009],
Avg(Year2010) as [2010], 
Avg(Year2011) as [2011],
Avg(Year2012) as [2012],
Avg(Year2013) as [2013],
Avg(Year2014) as [2014],*/
Avg(Year2015) AS [2015] 
from Vinternet VI
inner join Country c 
on c.Country_Code = VI.Country_Code
inner join Region R
on R.Region_Code = c.Region_Code
Group by R.Region_Name


-- Qn8 School closures days
select r.Region_Name, Avg(Full_Close) + Avg(VS.Partial_Close) As [Covid School Close Days], AVG(Datediff(DAY, End_Day, Start_day)) [Total days]
from VSchool_Close_Days VS
inner join Country c 
on c.Country_Code = VS.Country_Code
inner join Region R
on R.Region_Code = c.Region_Code
Group by R.Region_Name



--Qn9 what are the total population for different income group countries?
-- Attendance rate

select distinct Income_Group from Country;

select Round(AVG(VA.Total_Att),2) as 'Average Preprimary Attendance Rate', c.Income_Group 
from VAttendance_Pre VA
inner join Country C
on C.Country_Code = VA.Country_Code
group by c.Income_Group
order by 1

select Round(AVG(VA.Total_Att),2) as 'Average Pimary Attendance Rate', c.Income_Group 
from VAttendance_Pri VA
inner join Country C
on C.Country_Code = VA.Country_Code
group by c.Income_Group
order by 1

select Round(AVG(VA.Total_Att),2) as 'Average LowerSec Attendance Rate', c.Income_Group 
from VAttendance_LSec VA
inner join Country C
on C.Country_Code = VA.Country_Code
group by c.Income_Group
order by 1

select Round(AVG(VA.Total_Att),2) as 'Average UpperSec Attendance Rate', c.Income_Group 
from VAttendance_USec VA
inner join Country C
on C.Country_Code = VA.Country_Code
group by c.Income_Group
order by 1


select  c.Income_Group , Round(AVG(VA.Total_Comp),2) as 'Average Pimary Completion Rate'
from VCompletion_Pri VA
inner join Country C
on C.Country_Code = VA.Country_Code
group by c.Income_Group
order by 2

select Round(AVG(VA.Total_Comp),2) as 'Average LowerSec Completion Rate', c.Income_Group 
from VCompletion_LSec VA
inner join Country C
on C.Country_Code = VA.Country_Code
group by c.Income_Group
order by 1

select Round(AVG(VA.Total_Comp),2) as 'Average UpperSec Completion Rate', c.Income_Group 
from VCompletion_USec VA
inner join Country C
on C.Country_Code = VA.Country_Code
group by c.Income_Group
order by 1


select  c.Income_Group , Round(AVG(VA.Total_OOSC),2) as 'Average Pimary Out Of School Rate'
from VOutOfSchool_Pri VA
inner join Country C
on C.Country_Code = VA.Country_Code
group by c.Income_Group
order by 2 Desc

select  c.Income_Group , Round(AVG(VA.Total_OOSC),2) as 'Average LowerSec Out Of School Rate'
from VOutOfSchool_LSec VA
inner join Country C
on C.Country_Code = VA.Country_Code
group by c.Income_Group
order by 2 Desc

select  c.Income_Group , Round(AVG(VA.Total_OOSC),2) as 'Average UpperSec Out Of School Rate'
from VOutOfSchool_USec VA
inner join Country C
on C.Country_Code = VA.Country_Code
group by c.Income_Group
order by 2 Desc




-- Qn10 Literacy Rate

select 
	AVG(Male_Literacy) as Male_Literacy,
	AVG(FeMale_Literacy) as Female_Literacy
from VLiteracy_Adult 
Union
select 
	AVG(Male_Literacy) as Male_Literacy,
	AVG(FeMale_Literacy) as Female_Literacy
from VLiteracy_Youth 

select r.Region_Name,
	AVG(Male_Literacy) as Male_Literacy,
	AVG(FeMale_Literacy) as Female_Literacy
from VLiteracy_Adult VA
inner join Country c
on c.Country_Code = VA.Country_Code
inner join Region R
on c.Region_Code = r.Region_Code
group by r.Region_Name
order by Female_Literacy

select r.Region_Name,
	AVG(Total_Literacy) as [Youth(15-24) Literacy],
	AVG(Male_Literacy) as [Youth Male Literacy],
	AVG(FeMale_Literacy) as [Female Literacy]
from VLiteracy_Youth VA
inner join Country c
on c.Country_Code = VA.Country_Code
inner join Region R
on c.Region_Code = r.Region_Code
group by r.Region_Name
order by R.Region_Name

select r.Region_Name,
	AVG(Total_Literacy) as [Adult Literacy],
	AVG(Male_Literacy) as [Adult Male Literacy],
	AVG(FeMale_Literacy) as [Adult Female Literacy]
from VLiteracy_Adult VA
inner join Country c
on c.Country_Code = VA.Country_Code
inner join Region R
on c.Region_Code = r.Region_Code
group by r.Region_Name
order by R.Region_Name


-- Qn11 Total number of Male and female population completed education 
select Ceiling(Sum(VC.Total_Comp/100 * VP.Population_Pri * VC.Male_Comp/(vc.Male_Comp+VC.Female_Comp)))
as 'Male Population',
Ceiling(Sum(VC.Total_Comp/100 * VP.Population_Pri * VC.Female_Comp/(vc.Male_Comp+VC.Female_Comp)))  as 'Female Population'
from VCompletion_Pri VC
inner join Vpopulation VP
on VC.Country_Code = VP.Country_Code

select Ceiling(Sum(VC.Total_Comp/100 * VP.Population_LSec * VC.Male_Comp/(vc.Male_Comp+VC.Female_Comp)))
as 'Male Population',
Ceiling(Sum(VC.Total_Comp/100 * VP.Population_LSec * VC.Female_Comp/(vc.Male_Comp+VC.Female_Comp)))  as 'Female Population'
from VCompletion_LSec VC
inner join Vpopulation VP
on VC.Country_Code = VP.Country_Code


select Ceiling(Sum(VC.Total_Comp/100 * VP.Population_USec * VC.Male_Comp/(vc.Male_Comp+VC.Female_Comp)))
as 'Male Population',
Ceiling(Sum(VC.Total_Comp/100 * VP.Population_USec * VC.Female_Comp/(vc.Male_Comp+VC.Female_Comp)))  as 'Female Population'
from VCompletion_USec VC
inner join Vpopulation VP
on VC.Country_Code = VP.Country_Code
