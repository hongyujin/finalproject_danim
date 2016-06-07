drop sequence comm_seq;
create sequence comm_seq nocache;

drop table community
create table community(
	comm_no number primary key, 
	timePosted date not null,
	content clob not null,
	likePosted number default 0,
	id varchar2(100) not null,
	constraint fk_comm_id foreign key(id) references member(id)
)
select comm_no,timePosted, content, likePosted,id from(
	select comm_no,timePosted, content, likePosted,id,ceil(rownum/5) as page from (
		select comm_no,to_char(timePosted, 'mm-dd am hh:mi:ss') as timePosted, content, likePosted,id from community
		order by comm_no desc
	)
)where page=1;

insert into community(comm_no,timePosted,content,id) values(comm_seq.nextval,sysdate,'안녕ㅎㅋ','admin')
delete community where id='java'
update community set likePosted=likePosted+1 where id='java' and comm_no=2

select * from spring_board;