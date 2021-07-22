create database `test2`;
use test2;
create table classes(
	ClassId int(4) primary key,
    ClassName nvarchar(50)
);
create table ClassStudent(
	Studentid int(4),
    classId int(4),
    foreign key (classId) references classes(classid),
    foreign key(studentid) references students(studentid)
);
create table students(
	StudentId int(4) primary key,
    Studentname nvarchar(50),
    age int(4),
    email nvarchar(100)
);
create table marks(
	mark int,
    Subjectid int(4),
    studentid int(4),
    foreign key (subjectid) references subjects(subjectid),
    foreign key (studentid) references students(studentid)
);
drop table masks;
create table subjects(
	subjectId int(4),
    subjectname nvarchar(50)
);
drop table classstudent;
alter table subjects add primary key (subjectid);
insert into classstudent(studentid,classid) values ('1','1'),('2','1'),('3','2'),('4','2'),('5','2');
insert into marks(mark,subjectid,studentid) values ('8','1','1'),('4','2','1'),('9','1','1'),('7','1','3'),('3','1','4'),('5','2','5'),('8','3','3'),('1','3','5'),('3','2','4');
select * from students;
select * from subjects;
select avg(mark) as diemtb from marks;
select max(mark) as diemcaonhat,subjectname from (select * from marks join subjects using(subjectid)) as a; 
select * from marks order by mark desc;
alter table subjects modify column subjectname nvarchar(4000);
alter table subjects change subjectname daylamonhoc nvarchar(4000);
alter table students drop CONSTRAINT age;
alter table students add CONSTRAINT check_age CHECK (age>15 and age<50) ;
delete from students where studentid=1;
alter table students drop constraint classstudent_ibfk_2;
alter table students add CONSTRAINT classstudent_ibfk_2 FOREIGN KEY (Studentid) REFERENCES students(StudentId);
alter table students add column Statuss bit default 1;
update students set statuss=0;
SET SQL_SAFE_UPDATES = 0;
 