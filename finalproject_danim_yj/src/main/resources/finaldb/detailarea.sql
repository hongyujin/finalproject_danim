create table detailarea(
	area_name varchar2(100),
	detailarea_name varchar2(100),
	constraint pk_detailarea primary key(area_name,detailarea_name),
	constraint fk_detailarea foreign key(area_name) references area(area_name)
)

