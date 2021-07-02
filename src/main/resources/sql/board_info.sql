create table board_info(
	board_id NUMBER not null,
	user_id VARCHAR2(30) not null,
	board_like NUMBER default 1,
	constraint fk_test foreign key(board_id) references board(board_id) on delete cascade
);