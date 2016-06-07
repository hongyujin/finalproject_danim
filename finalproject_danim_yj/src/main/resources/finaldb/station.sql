create table station(
	station_no number primary key,
	station_name varchar2(100),
	area_name varchar2(100),
	constraint fk_station foreign key(area_name) references area(area_name)
)

drop table station;
create sequence station_seq;
drop sequence station_seq;

insert into station(station_no,station_name,area_name)
values(station_seq.nextval,'용산역','서울특별시');
insert into station(station_no,station_name,area_name)
values(station_seq.nextval,'서울역','서울특별시');
insert into station(station_no,station_name,area_name)
values(station_seq.nextval,'강남역','서울특별시');