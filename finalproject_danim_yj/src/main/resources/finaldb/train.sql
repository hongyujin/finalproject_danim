create table train(
	train_no number primary key,
	operation_leadtime varchar2(100) not null,
	end_area varchar2(100) not null,
	station_no number not null,
	price number not null,
	leadtime varchar2(100) not null,
	traintype varchar2(100) not null,
	constraint fk_train foreign key(station_no) references station(station_no)
)

create sequence train_seq;

insert into train(train_no,operation_leadtime,end_area,station_no,price,leadtime,traintype)
values(train_seq.nextval,'15시40분','대구',1,40900,'3시간','ktx');
insert into train(train_no,operation_leadtime,end_area,station_no,price,leadtime,traintype)
values(train_seq.nextval,'15시55분','부산',1,50900,'3시간','무궁화호');
insert into train(train_no,operation_leadtime,end_area,station_no,price,leadtime,traintype)
values(train_seq.nextval,'16시55분','인천',1,20900,'3시간','새마을호');

drop table train