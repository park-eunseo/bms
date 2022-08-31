CREATE TABLE MEMBER (
    id 			VARCHAR(20) PRIMARY KEY,
    password 	VARCHAR(1000) NOT NULL,
    name 		VARCHAR(10) NOT NULL,
    tel 		VARCHAR(20) NOT NULL,
    email 		VARCHAR(30) NOT NULL,
    birth 		DATE NOT NULL,
    gender 		CHAR(1) CHECK ('M' OR 'F'),
    profile_name VARCHAR(300),
    blog_name 	VARCHAR(20),
    nickname 	VARCHAR(10),
    intro 		VARCHAR(60),
    reg_date	DATETIME DEFAULT CURRENT_TIMESTAMP, -- 가입일
    recent_login DATETIME DEFAULT CURRENT_TIMESTAMP -- 최근 접속일
);

select * from member;
update member set email = '0917283@naver.com' where id = 'dlcnd';
delete from member where id in ('dlcnd111', 'dlcnd1111', 'dlcnd2', 'dlcnd3', 'qkswl11');

CREATE TABLE POST (
    post_id			INT AUTO_INCREMENT PRIMARY KEY,
    member_id 		VARCHAR(20) NOT NULL,
    category_title 	VARCHAR(10),
    thumbnail 		TEXT,
    title 			VARCHAR(50) NOT NULL,
    content 		TEXT NOT NULL,
    post_private 	CHAR(1) CHECK ('Y' OR 'N'),
    reg_date 	 	DATETIME DEFAULT CURRENT_TIMESTAMP,
    like_count		INT,
    reply_count		INT,
    FOREIGN KEY (member_id)
        REFERENCES member (id)
        ON DELETE CASCADE
);

select * from post;
update post set reply_count = 0 where post_id = 69;
update post set reply_count = 0 where post_id between 20 and 80;
                
CREATE TABLE CATEGORY (
    category_id 		INT AUTO_INCREMENT PRIMARY KEY,
    member_id 			varchar(20),
    category_title 		VARCHAR(10),
    foreign key(member_id) references member(id) on delete cascade
);

select * from category;
delete from category where category_id in (9, 11, 12, 13);

		SELECT
				R.POST_ID 	AS POST_ID,
				P.TITLE 	AS TITLE,
				R.CONTENT 	AS REPLY,
				R.REPLY_ID	AS REPLY_ID,
                R.REG_DATE
		FROM 
				REPLY R
					  JOIN POST P
					  ON R.POST_ID = P.POST_ID
		WHERE
				R.MEMBER_ID = 'dlcnd'
		ORDER BY
				R.REG_DATE DESC;
                
CREATE TABLE reply (
    reply_id 	 INT AUTO_INCREMENT PRIMARY KEY,
    member_id	 VARCHAR(20) NOT NULL,
    post_id	 	 INT NOT NULL,
    top_reply_id INT NULL,
    mention		 VARCHAR(45), -- 언급된 회원
    content 	 TEXT NOT NULL,
    reg_date 	 DATETIME DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (member_id)
        REFERENCES member (id)
        ON DELETE CASCADE,
	FOREIGN KEY (post_id)
        REFERENCES post (post_id)
        ON DELETE CASCADE
);

select * from reply;
DELETE FROM REPLY WHERE REPLY_ID = 9;
select * from post where post_id = (select post_id from reply where member_id = 'dlcnd11');

CREATE TABLE likePost (
    like_post_id INT AUTO_INCREMENT PRIMARY KEY,
	member_id 	 VARCHAR(20), -- 자기자신 ID
    post_id 	 VARCHAR(20), -- 좋아요 누른 게시글 ID
    FOREIGN KEY (member_id)
        REFERENCES member (id)
        ON DELETE CASCADE,
	FOREIGN KEY (post_id)
        REFERENCES post (post_id)
        ON DELETE CASCADE
);

select * from likePost;
delete from likePost where like_post_id = 7;


CREATE TABLE likeMember (
    like_member_id 		INT AUTO_INCREMENT PRIMARY KEY,
    member_id 		VARCHAR(20), 	-- 자기자신 ID
	favorite_id 	VARCHAR(20), -- 친구 추가한 상대방 ID
    FOREIGN KEY (member_id)
        REFERENCES member (id)
        ON DELETE CASCADE,
	FOREIGN KEY (favorite_id)
        REFERENCES member (id)
        ON DELETE CASCADE
);

select * from likeMember;
delete from likemember where member_id = 'dlcnd' and favorite_id = 'dlcnd11';

CREATE TABLE MANAGER(
	id varchar(20) primary key,
    password varchar(20) not null
);

select * from manager;
INSERT INTO MANAGER VALUES("admin", "admin11!");

CREATE TABLE NOTICE (
	NOTICE_ID INT AUTO_INCREMENT PRIMARY KEY,
    TO_ID 	  VARCHAR(20), -- 알림받은 아이디
    FROM_ID	  VARCHAR(20), -- 알림 보낸 아이디
    CONTENT	  VARCHAR(50),
	POST_ID	  INT, -- 해당 게시글 ID, 알림 클릭 시 그 게시글로 이동할 수 있도록
    CATEGORY  VARCHAR(20), -- 1) 좋아요 누름으로써 생긴 알림 2) 내 게시글에 누군가 단 댓글 알림 3) 내 댓글에 누군가 단 댓글 알림
    REG_DATE  DATETIME DEFAULT CURRENT_TIMESTAMP -- 알림 보낸 시간
);

select * from NOTICE;                    
insert notice(to_id, from_id, content)
values('qkswl', 'dlcnd', (select title from notice n join post p on n.post_id = p.post_id where n.post_id = 41));
DELETE FROM NOTICE WHERE NOTICE_ID = 5;