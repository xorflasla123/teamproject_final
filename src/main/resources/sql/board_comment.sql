create table board_comment(
board_id NUMBER PRIMARY KEY,
user_id VARCHAR2(30) not null,
comment_content VARCHAR2(100) not null,
comment_id NUMBER not null,
comment_layer NUMBER not null,
comment_date date default sysdate,
constraint fk_comment foreign key(board_id) references board(board_id) on delete cascade
);