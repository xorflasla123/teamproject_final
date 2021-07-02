create table notepad(
user_id varchar(30) not null,
memo_id number primary key,
title varchar(50) not null,
content varchar(4000),
write_date date default sysdate
);
create sequence memo_seq;