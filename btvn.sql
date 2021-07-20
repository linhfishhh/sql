create database `qlsv`;
create table khoa(
	id int primary key,
    ten nvarchar(50)
);
create table class(
	id int primary key,
    tenlop nvarchar(50),
    khoa int,
    foreign key (khoa) references khoa(id)
);
create table sinhvien(
	id int primary key,
	hodem varchar(50),
    ten varchar(50),
    ngaysinh date,
    lop int,
    diemtb double,
    foreign key (lop) references class(id)
);
select * from sinhvien;
select concat(hodem,0x20,ten) from sinhvien;
select id,hodem,ten,timestampdiff(year,ngaysinh,CURDATE()) as tuoi  from sinhVien;
select * from class;
select * from khoa;
select * from sinhvien inner join class using(id) inner join khoa on khoa.id=class.khoa where khoa.ten="CNTT";
select * from (select ten,diemtb,count(diemtb) as gioi from sinhvien where diemtb>=8.0 limit 1) as gioi,
(select ten,diemtb,count(diemtb) as kha from sinhvien where diemtb<8.0) as kha ;