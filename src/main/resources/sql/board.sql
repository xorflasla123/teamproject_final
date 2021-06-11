create table board(
board_local VARCHAR2(20) primary key, 
user_id VARCHAR2(20) not null,
board_title VARCHAR2(20) not null,
board_content VARCHAR2(100),
board_day date default sysdate,
board_id NUMBER not null,
board_picture VARCHAR2(100)
);
create sequence board_seq;