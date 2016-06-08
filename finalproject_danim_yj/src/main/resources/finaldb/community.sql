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
---------picture table 추가---------
drop sequence comm_pic_seq;
create sequence comm_pic_seq nocache;

drop table commpicture
create table commpicture(
	picture_no number primary key,
	picture_name varchar2(100) not null,
	comm_no number not null,
	constraint fk_comm_no foreign key(comm_no) references community(comm_no)
)
select picture_no, picture_name, comm_no from commpicture
insert into commpicture(picture_no,picture_name,comm_no) values(comm_pic_seq.nextval, 'img/community/1.jpg', 3)






-- community sql 연습
select comm_no,timePosted, content, likePosted,id from(
	select comm_no,timePosted, content, likePosted,id,ceil(rownum/5) as page from (
		select comm_no,to_char(timePosted, 'mm-dd am hh:mi:ss') as timePosted, content, likePosted,id from community
		order by comm_no desc
	)
)where page=1;

insert into community(comm_no,timePosted,content,id) values(comm_seq.nextval,sysdate,'안녕ㅎㅋ','admin')
delete community where id='java'
update community set likePosted=likePosted+1 where comm_no=2
select likePosted from community where comm_no=10; 