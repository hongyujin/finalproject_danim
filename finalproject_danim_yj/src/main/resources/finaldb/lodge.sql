create table lodge(
	lodge_no number primary key,
	shopname varchar2(100) not null,
	shop_add varchar2(100) not null,
	lodgetype varchar2(100) not null,
	price number not null,
	area_name varchar2(100) not null,
	detailarea_name varchar2(100) not null,
	constraint fk_lodge_detailarea foreign key(area_name,detailarea_name) references detailarea(area_name,detailarea_name)	
)
create sequence lodge_seq;
insert into lodge(lodge_no, shopname, shop_add, lodgetype, price, area_name, detailarea_name)
values(lodge_seq.nextval,'여행가자','잠실','게스트하우스',40000,'서울특별시','서울');