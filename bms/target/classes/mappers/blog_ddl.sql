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
    intro 		VARCHAR(60)
);

select * from member;

CREATE TABLE POST (
    post_id			INT AUTO_INCREMENT PRIMARY KEY,
    member_id 		VARCHAR(20) NOT NULL,
    category_title 	VARCHAR(10),
    thumbnail 		TEXT,
    title 			VARCHAR(50) NOT NULL,
    content 		TEXT NOT NULL,
    post_private 	CHAR(1) CHECK ('Y' OR 'N'),
    reg_date 	 	DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (member_id)
        REFERENCES member (id)
        ON DELETE CASCADE
);

select * from post;

		SELECT
				P.MEMBER_ID AS MEMBER_ID,
				P.TITLE	AS TITLE,
				P.CONTENT AS CONTENT
		FROM
				POST P LEFT JOIN LIKEPOST L
				ON P.POST_ID = L.POST_ID
		WHERE L.MEMBER_ID = 'dlcnd';
                
CREATE TABLE CATEGORY (
    category_id 		INT AUTO_INCREMENT PRIMARY KEY,
    member_id 			varchar(20),
    category_title 		VARCHAR(10),
    foreign key(member_id) references member(id) on delete cascade
);

select * from category;
delete from category where category_id in (9, 11, 12, 13);

CREATE TABLE reply (
    reply_id 	INT AUTO_INCREMENT PRIMARY KEY,
    member_id	VARCHAR(20) NOT NULL,
    post_id	 	INT NOT NULL,
    top_id		INT NULL,
    content 	TEXT NOT NULL,
    reg_date 	DATETIME DEFAULT CURRENT_TIMESTAMP
);

select * from reply;
update reply set content = "감사하빈다~~" where reply_id in (1, 4);


CREATE TABLE likePost (
    like_post_id INT AUTO_INCREMENT PRIMARY KEY,
	member_id 	 VARCHAR(20), -- 자기자신 ID
    post_id 	 VARCHAR(20), -- 좋아요 누른 게시글 ID
    FOREIGN KEY (member_id)
        REFERENCES member (id)
        ON DELETE CASCADE
);
select * from likePost;
delete from likePost where like_post_id between 20 and 30;


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


CREATE TABLE MANAGER(
	id varchar(20) primary key,
    password varchar(20) not null
);