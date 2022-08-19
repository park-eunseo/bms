CREATE TABLE MEMBER (
    id 			VARCHAR(20) PRIMARY KEY,
    password 	VARCHAR(1000) NOT NULL,
    name 		VARCHAR(10) NOT NULL,
    tel 		VARCHAR(20) NOT NULL,
    email 		VARCHAR(30) NOT NULL,
    birth 		DATE NOT NULL,
    gender 		CHAR(1) CHECK ('M' OR 'F'),
    profileName VARCHAR(300),
    blogName 	VARCHAR(20),
    nickname 	VARCHAR(10),
    intro 		VARCHAR(60)
);

select * from member;

CREATE TABLE POST (
    postId 			INT AUTO_INCREMENT PRIMARY KEY,
    authorId 	VARCHAR(20) NOT NULL,
    thumbnail 	TEXT,
    title 		VARCHAR(50) NOT NULL,
    content 	TEXT NOT NULL,
    postPrivate 	CHAR(1) CHECK ('Y' OR 'N'),
    regDate 	DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (authorId)
        REFERENCES member (id)
        ON DELETE CASCADE
);

select * from post;

CREATE TABLE COMMEND (
    commendId 	INT AUTO_INCREMENT PRIMARY KEY,
    authorId	VARCHAR(20) NOT NULL,
    postId	 	INT NOT NULL,
    topId 		INT NOT NULL,
    content 	TEXT NOT NULL,
    commedPrivate 	CHAR(1) CHECK ('Y' OR 'N'),
    regDate 	DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (commend_id)
        REFERENCES member (id),
    FOREIGN KEY (topId)
        REFERENCES member (id)
);

CREATE TABLE CATEGORY (
    id 			INT AUTO_INCREMENT PRIMARY KEY,
    member_id 	varchar(20),
    title 		VARCHAR(20),
    foreign key(member_id) references member(id) on delete cascade
);

CREATE TABLE POST_CATEGORY (
    id 			INT AUTO_INCREMENT PRIMARY KEY,
    member_id 	VARCHAR(20),
    category_id INT,
    post_id 	INT,
    foreign key(member_id) references member(id) on delete cascade
);

CREATE TABLE FAVORITE_MEMBER (
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

CREATE TABLE FAVORITE_POST (
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