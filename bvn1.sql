create database quanlysp;
use quanlysp;
create table khachhang(
	makh int not null primary key,
    tenkh nvarchar(50),
    diachi nvarchar(50),
    sdt int(10)
);
drop table khachhang;
drop table hoadon;
drop table sanphham;
create table sanpham(
	masp int not null primary key,
    tensp nvarchar(50),
    giasp double
);
create table hoadon(
	mahd int primary key,
    ngaylap date,
    tongtien double,
    makh int,
    foreign key (makh) references khachhang(makh) 
);
create table detailhoadon(
	id int primary key,
    mahd int,
    masp int,
    soluong int,
    giaban double,
    foreign key(mahd) references hoadon(mahd),
    foreign key(masp) references sanpham(masp)
);
-- cau 6
select * from hoadon where year(ngaylap)=2006;
-- cau 7
select mahd,tongtien from hoadon where year(ngaylap)=2006 and month(ngaylap)=06;
-- cau 8
select khachhang.makh,khachhang.tenkh from khachhang inner join hoadon on hoadon.makh=khachhang.makh where ngaylap='2006-06-02' ;
-- cau 9
select * from sanpham inner join detailhoadon on detailhoadon.masp=sanpham.masp join hoadon using(mahd) join khachhang using(makh) where year(ngaylap)="2006";
-- cau 10
select * from sanpham inner join detailhoadon on detailhoadon.masp=sanpham.masp join hoadon using(mahd) where detailhoadon.masp=3 or detailhoadon.masp=2 and detailhoadon.soluong=1;
-- cau 18,
select * from hoadon inner join detailhoadon on detailhoadon.mahd=hoadon.mahd where (giaban*soluong)>=5000;
-- cau 19
select * from hoadon inner join detailhoadon on detailhoadon.mahd=hoadon.mahd where year(hoadon.ngaylap)=2006 and tongtien<5000;
-- cau 28
select * from sanpham order by giasp desc limit 3;
-- cau 29
select * from sanpham
where tensp like "M%" and giasp between (select * from (select giasp from sanpham order by giasp asc limit 1) as min) 
and (select giasp from (select max(giasp) from sanpham) as max);
-- cau 39
select * from (select * from hoadon join detailhoadon using(mahd)) as b where (select count(mahd) as a from detailhoadon where mahd=2)>=2