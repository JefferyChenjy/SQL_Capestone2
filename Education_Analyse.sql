-- Data Analysis

--Q1 How many children attend school at lowest rate, what are these countries?

-- Pre-primary

Select Top 10 Round((1 -  V.Total_Att / 100) * P.Population_Pre, 0) as 'Children_No_Preprimary', C.Country_Name from VAttendance_Pre V 
inner join Country C
on V.Country_Code = C.Country_Code
inner join VPopulation P
on C.Country_Code = P.Country_Code
order by 1 Desc


-- Primary
Select Top 10 Round((1 -  V.Total_Att / 100) * P.Population_Pri, 0) as 'Children_No_primary', C.Country_Name from VAttendance_Pri V 
inner join Country C
on V.Country_Code = C.Country_Code
inner join VPopulation P
on C.Country_Code = P.Country_Code
order by 1 Desc

-- Lower Secondary
Select Top 10 Round((1 -  V.Total_Att / 100) * P.Population_LSec, 0) as 'Teens_No_LowerSec', C.Country_Name from VAttendance_LSec V 
inner join Country C
on V.Country_Code = C.Country_Code
inner join VPopulation P
on C.Country_Code = P.Country_Code
order by 1 Desc

-- Upper Secondary
Select Top 10 Round((1 -  V.Total_Att / 100) * P.Population_USec, 0) as 'teens_No_UpperSec', C.Country_Name from VAttendance_USec V 
inner join Country C
on V.Country_Code = C.Country_Code
inner join VPopulation P
on C.Country_Code = P.Country_Code
order by 1 Desc

--total
select Top 10 C.Country_Name, Round(((1 - VPR.Total_Att/ 100) * P.Population_Pre ) +
						((1 - VP.Total_Att / 100) * P.Population_Pri )+
						((1 - VL.Total_Att / 100) * P.Population_LSec  )+
						((1 - VU.Total_Att / 100) * P.Population_USec),0)
						As 'Total Population',
						Round((1 -  VPR.Total_Att / 100) * P.Population_Pre, 0) as 'Children_No_Preprimary',
						Round((1 -  VP.Total_Att / 100) * P.Population_Pri, 0) as 'Children_No_Primary',
						Round((1 -  VL.Total_Att / 100) * P.Population_LSec, 0) as 'Children_No_Lower',
						Round((1 -  VU.Total_Att / 100) * P.Population_USec, 0) as 'Children_No_Upper'

from VAttendance_Pre VPR
inner join VAttendance_Pri VP
on VPR.Country_Code = VP.Country_Code
inner join VAttendance_LSec VL
on VL.Country_Code = VP.Country_Code
inner join VAttendance_USec VU
on VL.Country_Code = VU.Country_Code
inner join Country C
on VPR.Country_Code = C.Country_Code
inner join VPopulation P
on C.Country_Code = P.Country_Code
Order by 2 Desc











-- Qn2. What is the total Number of children do not attend school? 
-- Preschool
Select Format(Sum(Round((1 -  V.Total_Att / 100) * P.Population_Pre, 0)), '#,##') as 'Total_Children_No_Preschool'
from VAttendance_Pre V inner join Country C
on V.Country_Code = C.Country_Code
inner join VPopulation P
on C.Country_Code = P.Country_Code

-- Primary
Select Format(Sum(Round((1 -  V.Total_Att / 100) * P.Population_Pri, 0)), '#,##') as 'Total_Children_No_Primary'
from VAttendance_Pri V inner join Country C
on V.Country_Code = C.Country_Code
inner join VPopulation P
on C.Country_Code = P.Country_Code

-- Lower Secondary
Select Format(Sum(Round((1 -  V.Total_Att / 100) * P.Population_LSec, 0)), '#,##') as 'Total_Children_No_LowerSecondary'
from VAttendance_LSec V inner join Country C
on V.Country_Code = C.Country_Code
inner join VPopulation P
on C.Country_Code = P.Country_Code

-- Upper Secondary
Select Format(Sum(Round((1 -  V.Total_Att / 100) * P.Population_USec, 0)), '#,##') as 'Total_Children_No_UpperSecondary'
from VAttendance_USec V inner join Country C
on V.Country_Code = C.Country_Code
inner join VPopulation P
on C.Country_Code = P.Country_Code












--Qn3. how many children did not attend school in each region, which region has the highest number?

-- Preschool
Select sum(Round((1 -  V.Total_Att / 100) * P.Population_Pre, 0)) as 'Total_Children_No_Preprimary',  
r.Region_Name
from VAttendance_Pre V 
inner join Country C
on V.Country_Code = C.Country_Code
inner join Region R
on R.Region_Code = c.Region_Code
inner join VPopulation P
on C.Country_Code = P.Country_Code
Group by r.Region_Name
order by r.Region_Name Desc


-- Primary
Select sum(Round((1 -  V.Total_Att / 100) * P.Population_Pri, 0)) as 'Total_Children_No_primary',  r.Region_Name
from VAttendance_Pri V 
inner join Country C
on V.Country_Code = C.Country_Code
inner join Region R
on R.Region_Code = c.Region_Code
inner join VPopulation P
on C.Country_Code = P.Country_Code
Group by r.Region_Name
order by r.Region_Name Desc

-- LowerSec
Select sum(Round((1 -  V.Total_Att / 100) * P.Population_LSec, 0)) as 'Total_Children_No_LowerSec',  r.Region_Name
from VAttendance_LSec V 
inner join Country C
on V.Country_Code = C.Country_Code
inner join Region R
on R.Region_Code = c.Region_Code
inner join VPopulation P
on C.Country_Code = P.Country_Code
Group by r.Region_Name
order by r.Region_Name Desc


-- UpperSec
Select sum(Round((1 -  V.Total_Att / 100) * P.Population_USec, 0)) as 'Total_Children_No_UpperSec',  r.Region_Name
from VAttendance_USec V 
inner join Country C
on V.Country_Code = C.Country_Code
inner join Region R
on R.Region_Code = c.Region_Code
inner join VPopulation P
on C.Country_Code = P.Country_Code
Group by r.Region_Name
order by r.Region_Name Desc





--Q4. Which countries have the highest differences in male and female children education? how many are they?

select * from VAttendance_Pre
-- Pre-primary
Select 
Ceiling(P.Population_Pre * V.Male_Att /100) as 'Preschool_Boys',
Ceiling(P.Population_Pre * V.Female_Att /100) as 'Preschool_Girls',
C.Country_Name from VAttendance_Pre V 
inner join Country C
on V.Country_Code = C.Country_Code
inner join VPopulation P
on C.Country_Code = P.Country_Code
where P.Population_Pre * V.Male_Att /100 is not null
and P.Population_Pre * V.Female_Att /100 is not null
order by v.FeMale_Att / v.Male_Att  


-- Primary
Select Top 10 
Ceiling(P.Population_Pri * V.Male_Att /100) as 'Primary_Boys',
Ceiling(P.Population_Pri * V.Female_Att /100) as 'Primary_Girls',
C.Country_Name from VAttendance_Pri V 
inner join Country C
on V.Country_Code = C.Country_Code
inner join VPopulation P
on C.Country_Code = P.Country_Code
order by v.FeMale_Att / v.Male_Att 

-- Lower Secondary
Select Top 10
Ceiling(P.Population_LSec * V.Male_Att /100) as 'LowerSec_Boys',
Ceiling(P.Population_LSec * V.Female_Att /100) as 'LowerSec_Girls',
C.Country_Name from VAttendance_LSec V 
inner join Country C
on V.Country_Code = C.Country_Code
inner join VPopulation P
on C.Country_Code = P.Country_Code
order by v.FeMale_Att / v.Male_Att 

--Upper Secondary
Select Top 10
Ceiling(P.Population_USec * V.Male_Att /100) as 'UpperSec_Boys',
Ceiling(P.Population_USec * V.Female_Att /100) as 'UpperSec_Girls',
C.Country_Name from VAttendance_USec V 
inner join Country C
on V.Country_Code = C.Country_Code
inner join VPopulation P
on C.Country_Code = P.Country_Code
order by v.FeMale_Att / v.Male_Att 




Select
Ceiling(P.Population_Pre * V.Male_Att /100) as 'Preschool_Boys',
Ceiling(P.Population_Pre * V.Female_Att /100) as 'Preschool_Girls',
Ceiling(P.Population_Pri * VP.Male_Att /100) as 'Primary_Boys',
Ceiling(P.Population_Pri * VP.Female_Att /100) as 'Primary_Girls',
Ceiling(P.Population_LSec * VL.Male_Att /100) as 'LowerSec_Boys',
Ceiling(P.Population_LSec * VL.Female_Att /100) as 'LowerSec_Girls',
Ceiling(P.Population_USec * VU.Male_Att /100) as 'UpperSec_Boys',
Ceiling(P.Population_USec * VU.Female_Att /100) as 'UpperSec_Girls',
C.Country_Name from Attendance_Pre V 
inner join Country C
on V.Country_Code = C.Country_Code
inner join Attendance_Pri VP
on VP.Country_Code = C.Country_Code
inner join Attendance_LSec VL
on VL.Country_Code = c.Country_Code
inner join Attendance_USec VU
on VU.Country_Code = c.Country_Code
inner join Population P
on C.Country_Code = P.Country_Code

order by VU.Female_Att / VU.Male_Att


Select TOP 10
Ceiling(P.Population_Pre * V.Male_Att /100) +
Ceiling(P.Population_Pri * VP.Male_Att /100) +
Ceiling(P.Population_LSec * VL.Male_Att /100) +
Ceiling(P.Population_USec * VU.Male_Att /100) as 'Boys',

Ceiling(P.Population_Pre * V.Female_Att /100) +
Ceiling(P.Population_Pri * VP.Female_Att /100) +
Ceiling(P.Population_LSec * VL.Female_Att /100) +
Ceiling(P.Population_USec * VU.Female_Att /100) as 'Girls',
C.Country_Name from VAttendance_Pre V 
inner join Country C
on V.Country_Code = C.Country_Code
inner join VAttendance_Pri VP
on VP.Country_Code = C.Country_Code
inner join VAttendance_LSec VL
on VL.Country_Code = c.Country_Code
inner join VAttendance_USec VU
on VU.Country_Code = c.Country_Code
inner join VPopulation P
on C.Country_Code = P.Country_Code
where V.Male_Att is not null
and V.Female_Att is not null
and  VP.Male_Att is not null
and VP.Female_Att is not null
and  VL.Male_Att is not null
and VL.Female_Att is not null
and  VU.Male_Att is not null
and VU.Female_Att is not null
order by VU.Female_Att / VU.Male_Att




--Qn5 how many children  complete their education in Pri / Lower /Upper Sec in each region? what the top Region?
--Primary
/*Select sum(Round((V.Total_Comp / 100) * p.Population_Pri, 0)) as 'Complete_Primary',  r.Region_Name
from Completion_Pri V
inner join Country C
on V.Country_Code = C.Country_Code
inner join Region R
on R.Region_Code = c.Region_Code
inner join VPopulation P
on C.Country_Code = P.Country_Code
Group by r.Region_Name
order by 1  Desc

-- Lower Sec

Select sum(Round((V.Total_Comp / 100) * p.Population_LSec, 0)) as 'Complete_LowerSec',
r.Region_Name
from VCompletion_LSec V
inner join Country C
on V.Country_Code = C.Country_Code
inner join Region R
on R.Region_Code = c.Region_Code
inner join VPopulation P
on C.Country_Code = P.Country_Code
Group by r.Region_Name
order by 1  Desc


-- Upper Sec

Select sum(Round((V.Total_Comp / 100) * p.Population_USec, 0)) as 'Complete_UpperSec',  r.Region_Name
from VCompletion_USec V
inner join Country C
on V.Country_Code = C.Country_Code
inner join Region R
on R.Region_Code = c.Region_Code
inner join VPopulation P
on C.Country_Code = P.Country_Code
Group by r.Region_Name
order by 1 Desc
*/

Select 
sum(Round((VP.Total_Comp / 100) * p.Population_Pri, 0)) as 'Complete_Primary',
sum(Round((VL.Total_Comp / 100) * p.Population_LSec, 0)) as 'Complete_LowerSec',
sum(Round((VU.Total_Comp / 100) * p.Population_USec, 0)) as 'Complete_UpperSec',
r.Region_Name
from VCompletion_Pri VP inner join Country C
on C.Country_Code = VP.Country_Code
inner join VCompletion_LSec VL
on C.Country_Code = VL.Country_Code
inner join VCompletion_USec VU
on C.Country_Code = VU.Country_Code
inner join Region R
on R.Region_Code = c.Region_Code
inner join VPopulation P
on C.Country_Code = P.Country_Code
Group by r.Region_Name
order by 1 Desc

-- Qn6 How many children are out of school in each countries? what is the top 10 countries?

Select Top 10 Round((VP.Total_OOSC / 100) * P.Population_Pri, 0) as 'Out_Of_school_Primary', 
C.Country_Name 
from VOutOfSchool_Pri VP inner join Country C
on VP.Country_Code = C.Country_Code
inner join VPopulation P
on C.Country_Code = P.Country_Code
order by 1 Desc

Select Top 10 Round((VL.Total_OOSC / 100) * P.Population_LSec, 0) as 'teens_Out_Of_school_LowerSec', 
C.Country_Name 
from VOutOfSchool_LSec VL inner join Country C
on VL.Country_Code = C.Country_Code
inner join VPopulation P
on C.Country_Code = P.Country_Code
order by 1 Desc

Select Top 10 Round((VU.Total_OOSC / 100) * P.Population_USec, 0) as 'teens_Out_Of_school_UpperSec', 
C.Country_Name 
from VOutOfSchool_USec VU inner join Country C
on VU.Country_Code = C.Country_Code
inner join VPopulation P
on C.Country_Code = P.Country_Code
order by 1 Desc

--QN7 How many girls are out of school worldwide? how do this compare to boys? which are the highest inequality countries?

select P.Country_Code, VP.Female_OOSC / 100 * P.Population_Pri from VOutOfSchool_Pri VP
inner join Vpopulation P
on P.Country_Code = VP.Country_Code


-- Total population of Pri / Lsec / Usec (77 countries)
select sum( P.Population_Pri) as Primary_Population, sum( P.Population_LSec) as LowerSec_population,
sum( P.Population_USec) as UppSec_Population, sum( P.Population_Pri) + sum( P.Population_LSec) + sum( P.Population_USec) as Total_Population
from Vpopulation P 
inner join 
VOutOfSchool_Pri VP
on p.Country_Code = vp.Country_Code

select 
Sum(Round(VP.Female_OOSC * P.Population_Pri / 100, 0)) as Primary_Female_OutOFSchool,
Sum(Round(VP.Female_OOSC * P.Population_LSec / 100, 0)) as LowerSec_Female_OutOFSchool,
Sum(Round(VP.Female_OOSC * P.Population_USec / 100, 0)) as UppSec_Female_OutOFSchool
from VOutOfSchool_Pri VP
inner join VOutOfSchool_LSec VL
on VP.Country_Code = VL.Country_Code
inner join VOutOfSchool_USec VU
on vU.Country_Code= VL.Country_Code
inner join Vpopulation P
on P.Country_Code = VL.Country_Code








