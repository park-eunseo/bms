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

CREATE TABLE CATEGORY (
    category_id 		INT AUTO_INCREMENT PRIMARY KEY,
    member_id 			varchar(20),
    category_title 		VARCHAR(10),
    foreign key(member_id) references member(id) on delete cascade
);

select * from category;

CREATE TABLE COMMEND (
    commend_id 	INT AUTO_INCREMENT PRIMARY KEY,
    member_id	VARCHAR(20) NOT NULL,
    post_id	 	INT NOT NULL,
    top_id		INT NOT NULL,
    content 	TEXT NOT NULL,
    reg_date 	DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (commend_id)
        REFERENCES member (id),
    FOREIGN KEY (top_id)
        REFERENCES member (id)
);

CREATE TABLE favoriteMember (
    id 					INT AUTO_INCREMENT PRIMARY KEY,
    member_id 			VARCHAR(20), -- 자기자신 ID
	favorite_member_id 	VARCHAR(20), -- 친구 추가한 상대방 ID
    FOREIGN KEY (member_id)
        REFERENCES member (id)
        ON DELETE CASCADE,
	FOREIGN KEY (favorite_member_id)
        REFERENCES member (id)
        ON DELETE CASCADE
);

CREATE TABLE favoritePost (
    id 				 INT AUTO_INCREMENT PRIMARY KEY,
	member_id 		 VARCHAR(20), -- 자기자신 ID
    favorite_post_id INT,		  -- 좋아요 누른 게시글 ID
    FOREIGN KEY (member_id)
        REFERENCES member (id)
        ON DELETE CASCADE
);

CREATE TABLE MANAGER(
	id varchar(20) primary key,
    password varchar(20) not null
);