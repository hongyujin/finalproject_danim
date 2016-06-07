drop sequence notice_seq;
create sequence notice_seq nocache;

drop table notice
create table notice(
	notice_no number primary key,
	timePosted date not null,
	title varchar2(100) not null,
	content clob not null,
	id varchar2(100) not null,
	constraint fk_notice_id foreign key(id) references member(id)
)
select * from notice