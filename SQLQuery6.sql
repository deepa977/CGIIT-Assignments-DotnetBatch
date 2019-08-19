use TrainingExamples

create table Registration
(RegID int constraint pk_regid primary key identity,
Name varchar(50) not null,
Address varchar(100) not null,
DOB datetime,
Gender varchar(6),
Nationality varchar(20),
Qualification varchar(50),
SkillSets varchar(50),
Hobbies varchar(75),
DOJ datetime,
Salary money)
