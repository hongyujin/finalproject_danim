create table terminal(
	terminal_no number primary key,
	terminal_name varchar2(100),
	area_name varchar2(100),
	constraint fk_terminal foreign key(area_name) references area(area_name)
)

drop table terminal;
create sequence terminal_seq;
drop sequence terminal_seq;


insert into terminal(terminal_no,terminal_name,area_name)
values(terminal_seq.nextval,'용산터미널','서울특별시');
insert into terminal(terminal_no,terminal_name,area_name)
values(terminal_seq.nextval,'서울터미널','서울특별시');
insert into terminal(terminal_no,terminal_name,area_name)
values(terminal_seq.nextval,'강남터미널','서울특별시');


insert into terminal(terminal_no,terminal_name,area_name)
values(terminal_seq.nextval,'인천터미널','인천광역시');
insert into terminal(terminal_no,terminal_name,area_name)
values(terminal_seq.nextval,'인투터미널','인천광역시');
insert into terminal(terminal_no,terminal_name,area_name)
values(terminal_seq.nextval,'인삼터미널','인천광역시');


select t.terminal_no,t.terminal_name from terminal t,area a
where t.area_name = a.area_name and t.area_name = '서울특별시'



select * from TERMINAL