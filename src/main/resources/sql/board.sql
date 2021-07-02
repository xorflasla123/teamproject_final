create table board(
	board_id NUMBER primary key, 
	board_local VARCHAR2(20) not null,
	user_id VARCHAR2(20) not null,
	board_title VARCHAR2(4000) not null,
	board_content VARCHAR2(4000),
	board_day date default sysdate,
	board_picture VARCHAR2(4000),
	board_hit NUMBER default 0
);

create sequence board_seq;