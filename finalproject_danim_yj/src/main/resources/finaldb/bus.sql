create table bus(
	bus_no number primary key,
	operation_leadtime varchar2(100) not null,
	end_area varchar2(100) not null,
	terminal_no number not null,
	price number not null,
	leadtime varchar2(100) not null,
	kind varchar2(100) not null,
	constraint fk_bus foreign key(terminal_no) references terminal(terminal_no)
)
alter table bus rename column kind to buytype;
drop table bus

create sequence bus_seq;

drop sequence bus_seq;

insert into bus(bus_no,operation_leadtime,end_area,terminal_no,price,leadtime,kind)
values(bus_seq.nextval,'15시40분','광주',1,15900,'3시간','우등');
insert into bus(bus_no,operation_leadtime,end_area,terminal_no,price,leadtime,kind)
values(bus_seq.nextval,'15시55분','광주',1,12900,'3시간','일반');
insert into bus(bus_no,operation_leadtime,end_area,terminal_no,price,leadtime,kind)
values(bus_seq.nextval,'16시55분','인천',1,12900,'3시간','일반');

delete from bus

select b.operation_leadtime,b.end_area,b.price,b.leadtime,b.kind,t.terminal_name from
(select terminal_name,terminal_no from terminal) t,bus b
where b.terminal_no = t.terminal_no and b.terminal_no = '1' and b.end_area = '광주'


select b.bus_no,b.operation_leadtime,b.end_area,t.terminal_no,t.terminal_name,b.price,b.leadtime,b.kind
from bus b,terminal t
where b.terminal_no = t.terminal_no and b.terminal_no = 1
and b.end_area = '광주'