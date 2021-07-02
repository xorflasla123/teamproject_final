create table board_reco(
board_id number not null,
user_id VARCHAR2(30) not null,
board_good number not null,
constraint fk_reco foreign key(board_id) references board(board_id) on delete cascade
);