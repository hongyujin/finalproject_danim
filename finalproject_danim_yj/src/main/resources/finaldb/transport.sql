drop sequence transport_seq;
create sequenc transport_seq nocache;

drop table transport
create table transport(
	transport_no number primary key,
	train_no number,
	bus_no number,
	constraint fk_transport_train_no foreign key(train_no) references train(train_no),
	constraint fk_transport_bus_no foreign key(bus_no) references bus(bus_no)
)