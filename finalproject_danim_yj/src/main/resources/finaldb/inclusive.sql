drop sequence inclusive_seq;
create sequence inclusive_seq nocache;

drop table inclusive
create table inclusive(
	cart_no number primary key,
	food_no number,
	lodge_no number,
	id varchar2(100) not null,
	transport_no number,
	constraint fk_inclusive_food_no foreign key(food_no) references bestfood(food_no),
	constraint fk_inclusive_lodge_no foreign key(lodge_no) references lodge(lodge_no),
	constraint fk_inclusive_id foreign key(id) references member(id),
	constraint fk_inclusive_transport_no foreign key(transport_no) references transport(transport_no)
)