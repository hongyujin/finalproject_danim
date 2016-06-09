drop sequence comm_seq;
create sequence comm_seq nocache;

drop table community
create table community(
	comm_no number primary key, 
	timePosted date not null,
	content clob not null,
	id varchar2(100) not null,
	constraint fk_comm_id foreign key(id) references member(id)
)
alter table community drop(likePosted)
---------like table 추가(1차)---------
drop table commLike
create table commLike(
	comm_no number,
	id varchar2(100),
	likePosted number default 0,
	constraint pk_commLike primary key(comm_no, id),
	constraint fk_commLike_id foreign key(id) references member(id),
	constraint fk_commLike_community foreign key(comm_no) references community(comm_no)
)
---------picture table 추가(2차)---------
drop sequence comm_pic_seq;
create sequence comm_pic_seq nocache;

drop table commpicture
create table commpicture(
	picture_no number primary key,
	picture_name varchar2(100) not null,
	comm_no number not null,
	constraint fk_comm_no foreign key(comm_no) references community(comm_no)
)






-- community sql 연습
select c.comm_no,c.timePosted, c.content, l.likePosted,c.id from(
	select comm_no,timePosted, content, id,ceil(rownum/5) as page from (
		select comm_no,to_char(timePosted, 'mm-dd am hh:mi:ss') as timePosted, content, id from community
		order by comm_no desc
	)
)c, (select comm_no, count(likePosted) as likePosted from commLike GROUP BY comm_no) l where l.comm_no(+)=c.comm_no and c.page=2;

insert into community(comm_no,timePosted,content,id) values(comm_seq.nextval,sysdate,'안녕ㅎㅋ','admin')
delete community where id='java'
update community set likePosted=likePosted+1 where comm_no=2
select likePosted from community where comm_no=10; 

--commpicture 연습
select picture_no, picture_name, comm_no from commpicture
insert into commpicture(picture_no,picture_name,comm_no) values(comm_pic_seq.nextval, 'img/community/1.jpg', 3)


--commLike 연습
select comm_no, id,likePosted from commLike c where comm_no=12 and id='java'
select count(*) from commLike c where comm_no=12 and id='java'
select comm_no,count(likePosted) as likePosted from commLike GROUP BY comm_no;
select count(likePosted) as likePosted from commLike where comm_no=12 GROUP BY comm_no

insert into commLike(comm_no,id,likePosted) values(13,'java',1)
insert into commLike(comm_no,id,likePosted) values(13,'admin',1)
delete commLike where id='java' and comm_no=10