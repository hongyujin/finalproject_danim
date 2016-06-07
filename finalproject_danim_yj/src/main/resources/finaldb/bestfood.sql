create table bestfood(
	food_no number primary key,
	shopname varchar2(100) not null,
	shop_add varchar2(100) not null,
	foodtype varchar2(100) not null,
	price number default 0,
	area_name varchar2(100) not null,
	detailarea_name varchar2(100) not null,
	constraint fk_bestfood_detailarea foreign key(area_name,detailarea_name) references detailarea(area_name,detailarea_name)
)