create sequence seq_board_num;

-- t_review로 테이블 이름 변경함
create table t_board(
	b_num number(20),
	b_title varchar2(100) not null,
	b_content varchar2(2000) not null,
	b_writer varchar2(30) not null,
	b_regdate date default sysdate not null,
	b_editdate date not null
);

alter table t_board add constraint pk_board primary key (b_num);

alter table t_board add constraint board_fk_member foreign key (b_writer) references t_member (m_id);

select * from all_constraints where table_name = 'T_BOARD';

alter table t_board modify(b_editdate default sysdate);

select * from t_review ORDER BY b_num DESC;

alter table t_board rename to t_review;


insert into t_review(b_num, b_title, b_content, b_writer)
	 values (seq_board_num.nextval, '테스트제목', '테스트내용', 'id1');
	 
insert into t_review(b_num, b_title, b_content, b_writer)
	 values (seq_board_num.nextval, '테스트제목', '테스트내용', 'id2');