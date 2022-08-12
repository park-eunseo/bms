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
    id 			INT AUTO_INCREMENT PRIMARY KEY,
    author_id 	VARCHAR(20) NOT NULL,
    title 		VARCHAR(50) NOT NULL,
    content 	TEXT NOT NULL,
    private 	CHAR(1) CHECK ('Y' OR 'N'),
    views 		INT DEFAULT 0,
    reg_date 	DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (author_id)
        REFERENCES member (id)
        ON DELETE CASCADE
);

CREATE TABLE COMMEND (
    id 			INT AUTO_INCREMENT PRIMARY KEY,
    author_id	VARCHAR(20) NOT NULL,
    post_id	 	INT NOT NULL,
    top_id 		INT NOT NULL,
    content 	TEXT NOT NULL,
    private 	CHAR(1) CHECK ('Y' OR 'N'),
    reg_date 	DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (commend_id)
        REFERENCES member (id),
    FOREIGN KEY (top_id)
        REFERENCES member (id)
);

CREATE TABLE FILE (
    id 	 	INT AUTO_INCREMENT PRIMARY KEY,
    type 	VARCHAR(20) NOT NULL,
    name 	VARCHAR(100) NOT NULL,
    path 	VARCHAR(100) NOT NULL,
    size 	LONG NOT NULL
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