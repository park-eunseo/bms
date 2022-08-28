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
    reg_date	DATETIME DEFAULT CURRENT_TIMESTAMP
);

select * from member;

SELECT 				-- 즐겨찾는 회원들의 최근 3일 간의 글
		TITLE
FROM
		POST
WHERE
	MEMBER_ID = (SELECT FAVORITE_ID FROM LIKEMEMBER WHERE MEMBER_ID = 'qkswl') AND
	REG_DATE BETWEEN DATE_ADD(NOW(), INTERVAL - 3 DAY) AND NOW();

SELECT * FROM POST WHERE REG_DATE BETWEEN DATE_ADD(NOW(), INTERVAL - 3 DAY) AND NOW();

		SELECT 				
				M.ID			AS id,
				M.NICKNAME		AS nickname,
				M.BLOG_NAME		AS blogName,
				M.PROFILE_NAME	AS profile,
				P.POST_ID		AS postId,
				P.TITLE 		AS title,
				P.CONTENT		AS content,
				P.THUMBNAIL		AS thumbnail,
				date_format(P.REG_DATE, '%Y-%m-%d %H:%i') AS regDate,
				P.LIKE_COUNT	AS likeCount,
				P.REPLY_COUNT	AS replyCount					
		FROM
				POST P JOIN MEMBER M ON  P.MEMBER_ID = M.ID
		WHERE
				P.MEMBER_ID IN (SELECT FAVORITE_ID FROM LIKEMEMBER WHERE MEMBER_ID = 'qkswl') AND
				P.REG_DATE BETWEEN DATE_ADD(NOW(), INTERVAL - 5 DAY) AND NOW() AND
				P.POST_PRIVATE = 'N';
                
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
		SELECT 
				M.ID			AS id,
				M.NICKNAME		AS nickname,
				M.BLOG_NAME		AS blogName,
				M.PROFILE_NAME	AS profile,
				P.POST_ID		AS postId,
				P.TITLE 		AS title,
				P.CONTENT		AS content,
				P.THUMBNAIL		AS thumbnail,
				date_format(P.REG_DATE, '%Y-%m-%d %H:%i') AS regDate,
				P.LIKE_COUNT	AS likeCount,
				P.REPLY_COUNT	AS replyCount		
		FROM
				POST P 
					 JOIN MEMBER M 
					 ON P.MEMBER_ID = M.ID
			WHERE
				P.MEMBER_ID not in ('dlcnd')	
		ORDER BY
				 RAND() 
		LIMIT 3;
select * from post order by rand() LIMIT 3;
alter table post auto_increment = 39;
update post set reply_count = 0 where post_id between 20 and 80;

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
    reg_date 	 DATETIME DEFAULT CURRENT_TIMESTAMP
);

select * from reply;
DELETE FROM REPLY WHERE REPLY_ID between 1 and 40;

CREATE TABLE likePost (
    like_post_id INT AUTO_INCREMENT PRIMARY KEY,
	member_id 	 VARCHAR(20), -- 자기자신 ID
    post_id 	 VARCHAR(20), -- 좋아요 누른 게시글 ID
    FOREIGN KEY (member_id)
        REFERENCES member (id)
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