create table users(
user_id varchar2(30) primary key,
user_pwd varchar2(30) not null,
user_name varchar2(30) not null,
user_email varchar2(30) not null,
user_num varchar2(30) not null,
user_addr varchar2(30) not null,
email_chk number default 0
);

alter table users add 
   session_id varchar2(100) default 'nono' not null;
alter table users add limit_time date;
