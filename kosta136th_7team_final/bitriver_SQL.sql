create database bitcoin;
USE bitcoin; 

SELECT * FROM tbl_member;

SELECT * FROM MARKET_PRICE ORDER BY MARKET_PRICE_NUM DESC;

-- 프리보드 관련 SQL
SELECT * FROM FREEBOARD;

-- 새로운 게시물 등록에 사용하는 SQL
INSERT INTO FREEBOARD (TITLE, CONTENT, WRITER) VALUES('비트코인 몸값 상승..3년만에 900달러대 돌파.', '가상화폐 비트코인 몸값이 껑충 뛰었다. 최근 3년만에 900달러벽을 넘었다. 글로벌 지정학적 리스크 확대로 자산가치가 가파르게 증가했다.

26일(현지시간) 블룸버그통신 등 외신에 따르면 비트코인은 23일 오후 홍콩에서 1비트코인 당 900.40달러에 거래, 3년만에 최고가를 기록했다.

2010년부터 가격을 형성한 비트코인은 2013년 12월 1100달러까지 치솟았다가 이후 계속 하락했다. 지난해 200달러선까지 떨어졌다 올해 다시 상승세로 돌아서 최근 900달러 벽을 넘었다. 900달러 돌파는 지난주만 15%, 올해 들어 107% 증가한 것이다.

블룸버그는 올해 주요 통화, 주가 지수, 원자재 계약 등과 맞물려 비트코인이 상승 랠리를 펼쳤다고 분석했다. 특히 지정학적 위험 요소 확대와 미국 대선 등이 영향을 미쳤다.

최근 러시아 외교관이 터키에서 총격으로 사망하고 독일 베를린에서 12명이 테러로 숨지면서 지정학적 불안감이 높아졌다. 여기에 위안화 가격까지 위축되면서 대체 수요 자산 수요가 높아지면서 비트코인이 다시 주목받았다. 또 도날드 트럼프 미국 대선 당선자 취임이후 내년부터 미국 긴축 재정이 예상, 비트코인 상승세는 지속될 전망이다.

중국 비트코인 거래소 훠비(Huobi)의 한 애널리스트는 “유럽에서 테러 공격이 발생한 후 대체 자본 시장 수요가 늘었고, 트럼프 당선 이후 금 가치까지 떨어지는 상황”이라면서 “글로벌 불안정서까지 맞물리면서 거대 자금이 비트코인 시장으로 몰렸다”고 분석했다.

비트코인은 사이버 공간에서 거래되는 특성상 정부 규제와 통화 정책 변경 영향을 덜 받는다. 이 때문에 일부 투자자들에게 안전한 피난처로 인기를 끌고 있다. 비트코인 거래소측은 “900달러를 넘어 1000달러대까지 가격이 형성될 것”으로 기대했다.

토마스 글룩스만 게이트코인 최고마케팅책임자는 “미국 연방준비이사회 금리 인상 발표로 신흥 시장 투자자들이 약세 통화 자산으로부터 벗어나 비트코인으로 몰리고 있다”면서 “비트코인이 800달러선을 넘어 1000달러대를 유지하는게 불가능해보이지 않는다”고 내다봤다.', 'user08');

-- 게시물의 조회에 사용하는 SQL
SELECT * FROM FREEBOARD WHERE FREEBOARD_NUM = 7;

-- 게시물의 전체 목록에 사용하는 SQL
SELECT * FROM FREEBOARD WHERE FREEBOARD_NUM > 0 ORDER BY FREEBOARD_NUM DESC;

-- 게시물의 수정에 사용하는 SQL
UPDATE FREEBOARD SET TITLE ='수정된 제목', CONTENT = '수정된 내용' WHERE FREEBOARD_NUM = 1;

-- 게시물의 삭제에 사용하는 SQL
DELETE FROM FREEBOARD WHERE FREEBOARD_NUM = 1;


DROP TABLE FREEBOARD_REPLY;
DROP TABLE FREEBOARD;
DROP TABLE DEALER_NEWS_FILE;
DROP TABLE REPLY;
DROP TABLE DEALER_NEWS;
DROP TABLE DEALER_PHOTO;
DROP TABLE DEALER_MAIN;
DROP TABLE DEALER_LIKE;
DROP TABLE DEALER_DISLIKE;
DROP TABLE DEALER_PAGE;
DROP TABLE DOMESTIC_SCRAP;
DROP TABLE ABROAD_SCRAP;
DROP TABLE LOGIN;
DROP TABLE REGISTER_TYPE;
DROP TABLE USER;
DROP TABLE MARKET_PRICE;

DROP TABLE ADMIN_LOGIN;
DROP TABLE ADMIN;
DROP TABLE AUTHORITY; 
DROP TABLE GUEST;
DROP TABLE tbl_member;

SHOW TABLES;




#관리자 권한 
CREATE TABLE AUTHORITY (

AUTHORITY_NUM INT AUTO_INCREMENT,
AUTHORITY_CODE INT NOT NULL,
PRIMARY KEY(AUTHORITY_NUM)

);

#관리자
CREATE TABLE ADMIN (

ADMIN_NUM INT AUTO_INCREMENT,
ADMIN_ID VARCHAR(50) NOT NULL,
ADMIN_PASSWORD VARCHAR(70) NOT NULL,
AUTHORITY_NUM INT NOT NULL,
ADMIN_NAME VARCHAR(20) CHARACTER SET UTF8 NOT NULL,
PRIMARY KEY(ADMIN_NUM),
FOREIGN KEY(AUTHORITY_NUM) REFERENCES AUTHORITY(AUTHORITY_NUM) ON UPDATE CASCADE


);

select * from ADMIN;

#관리자로그인
CREATE TABLE ADMIN_LOGIN (

LOGIN_NUM INT AUTO_INCREMENT,
ADMIN_NUM INT NOT NULL,
LOGIN_DATE TIMESTAMP DEFAULT NOW() NOT NULL,
LOGOUT_DATE TIMESTAMP DEFAULT NOW() NOT NULL,
PRIMARY KEY(LOGIN_NUM),
FOREIGN KEY(ADMIN_NUM) REFERENCES ADMIN(ADMIN_NUM) ON UPDATE CASCADE

);

#비회원
CREATE TABLE GUEST (

GUEST_NUM INT AUTO_INCREMENT,
GUEST_EMAIL VARCHAR(50) NOT NULL,
PRIMARY KEY(GUEST_NUM)

);

#시세 테이블
CREATE TABLE MARKET_PRICE (

MARKET_PRICE_NUM INT AUTO_INCREMENT ,
LABEL VARCHAR(20) NOT NULL,
NAME VARCHAR(50) NOT NULL,
PRICE_BTC DOUBLE NOT NULL,
PRICE_USD DOUBLE NOT NULL,
PRICE_CNY DOUBLE NOT NULL,
PRICE_EUR DOUBLE NOT NULL,
PRICE_GBP DOUBLE NOT NULL,
PRICE_RUR DOUBLE NOT NULL,
VOLUME_24H DOUBLE NOT NULL,
TIMESTAMP VARCHAR(20) NOT NULL,
REGIDATE TIMESTAMP DEFAULT NOW(),
PRIMARY KEY(MARKET_PRICE_NUM)

);

#회원
CREATE TABLE USER (

USER_NUM INT AUTO_INCREMENT,
USER_EMAIL VARCHAR(50) NOT NULL,
USER_PASSWORD VARCHAR(70) NOT NULL,
USER_NICKNAME VARCHAR(30) CHARACTER SET UTF8 NOT NULL,
USER_SUBSCRIBE_GB VARCHAR(1) DEFAULT 'Y' NOT NULL,
USER_REGI_DATE TIMESTAMP DEFAULT NOW() NOT NULL,
PRIMARY KEY(USER_NUM)

);

#가입유형
CREATE TABLE REGISTER_TYPE (

REGISTER_NUM INT AUTO_INCREMENT,
USER_NUM INT NOT NULL,
REGISTER_TYPE_CODE VARCHAR(1) NOT NULL,
PRIMARY KEY(REGISTER_NUM),
FOREIGN KEY(USER_NUM) REFERENCES USER(USER_NUM) ON UPDATE CASCADE

);

#로그인
CREATE TABLE LOGIN (

LOGIN_NUM INT AUTO_INCREMENT,
USER_NUM INT NOT NULL,
LOGIN_DATE TIMESTAMP DEFAULT NOW() NOT NULL,
LOGOUT_DATE TIMESTAMP DEFAULT NOW() NOT NULL,
PRIMARY KEY(LOGIN_NUM),
FOREIGN KEY(USER_NUM) REFERENCES USER(USER_NUM) ON UPDATE CASCADE

);

# 국내스크랩
CREATE TABLE DOMESTIC_SCRAP (

DOMESTIC_SCRAP_NUM INT AUTO_INCREMENT,
USER_NUM INT NOT NULL,
DOMESTIC_SCRAP_URL VARCHAR(500) NOT NULL,
DOMESTIC_SCRAP_TITLE VARCHAR(300) CHARACTER SET UTF8 NOT NULL,
DOMESTIC_SCRAP_DESCRIPTION VARCHAR(1000) CHARACTER SET UTF8 NOT NULL,
DOMESTIC_SCRAP_PUBDATE VARCHAR(50) CHARACTER SET UTF8 NOT NULL,
DOMESTIC_SCRAP_KEYWORD VARCHAR(50) CHARACTER SET UTF8 NOT NULL,
PRIMARY KEY(DOMESTIC_SCRAP_NUM),
FOREIGN KEY(USER_NUM) REFERENCES USER(USER_NUM) ON UPDATE CASCADE

);

#해외스크랩
CREATE TABLE ABROAD_SCRAP (

ABROAD_SCRAP_NUM INT AUTO_INCREMENT,
USER_NUM INT NOT NULL,
ABROAD_SCRAP_URL VARCHAR(500) NOT NULL,
ABROAD_SCRAP_TITLE VARCHAR(300) NOT NULL,
ABROAD_SCRAP_DESCRIPTION VARCHAR(1000) NOT NULL,
ABROAD_SCRAP_PUBDATE VARCHAR(50) NOT NULL,
ABROAD_SCRAP_IMG_URL VARCHAR(500) NOT NULL,
ABROAD_SCRAP_WRITER VARCHAR(50) NOT NULL,
PRIMARY KEY(ABROAD_SCRAP_NUM),
FOREIGN KEY(USER_NUM) REFERENCES USER(USER_NUM) ON UPDATE CASCADE

);

#딜러페이지
CREATE TABLE DEALER_PAGE (

DEALER_PAGE_NUM INT AUTO_INCREMENT,
USER_NUM INT NOT NULL,
CATEGORY VARCHAR(100) CHARACTER SET UTF8 NOT NULL,
LIKE_COUNT INT NOT NULL DEFAULT 0,
DISLIKE_COUNT INT NOT NULL DEFAULT 0,
PRIMARY KEY(DEALER_PAGE_NUM),
FOREIGN KEY(USER_NUM) REFERENCES USER(USER_NUM) ON UPDATE CASCADE

);

#딜러 추천
CREATE TABLE DEALER_LIKE (

DEALER_LIKE_NUM INT AUTO_INCREMENT,
DEALER_PAGE_NUM INT NOT NULL,
USER_NUM INT NOT NULL,
PRIMARY KEY(DEALER_LIKE_NUM),
FOREIGN KEY(DEALER_PAGE_NUM) REFERENCES DEALER_PAGE(DEALER_PAGE_NUM) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(USER_NUM) REFERENCES USER(USER_NUM) ON UPDATE CASCADE

);

#딜러 신고
CREATE TABLE DEALER_DISLIKE (

DEALER_DISLIKE_NUM INT AUTO_INCREMENT,
DEALER_PAGE_NUM INT NOT NULL,
USER_NUM INT NOT NULL,
PRIMARY KEY(DEALER_DISLIKE_NUM),
FOREIGN KEY(DEALER_PAGE_NUM) REFERENCES DEALER_PAGE(DEALER_PAGE_NUM) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(USER_NUM) REFERENCES USER(USER_NUM) ON UPDATE CASCADE

);

#딜러사진
CREATE TABLE DEALER_PHOTO (

DEALER_PHOTO_NUM INT AUTO_INCREMENT,
DEALER_PAGE_NUM INT NOT NULL,
USER_NUM INT NOT NULL,
ORIGINAL_FILE_NAME VARCHAR(50) CHARACTER SET UTF8 NOT NULL,
STORED_FILE_NAME VARCHAR(50) NOT NULL,
REGI_DATE TIMESTAMP DEFAULT NOW() NOT NULL,
PRIMARY KEY(DEALER_PHOTO_NUM),
FOREIGN KEY(DEALER_PAGE_NUM) REFERENCES DEALER_PAGE(DEALER_PAGE_NUM) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(USER_NUM) REFERENCES USER(USER_NUM) ON UPDATE CASCADE

);

#딜러메인
CREATE TABLE DEALER_MAIN (

DEALER_MAIN_NUM INT AUTO_INCREMENT,
DEALER_PAGE_NUM INT NOT NULL,
USER_NUM INT NOT NULL,
ORIGINAL_FILE_NAME VARCHAR(50) CHARACTER SET UTF8 NOT NULL,
STORED_FILE_NAME VARCHAR(50) NOT NULL,
REGI_DATE TIMESTAMP DEFAULT NOW() NOT NULL,
PRIMARY KEY(DEALER_MAIN_NUM),
FOREIGN KEY(DEALER_PAGE_NUM) REFERENCES DEALER_PAGE(DEALER_PAGE_NUM) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(USER_NUM) REFERENCES USER(USER_NUM) ON UPDATE CASCADE

);

#전문소식
CREATE TABLE DEALER_NEWS (

DEALER_NEWS_NUM INT AUTO_INCREMENT,
DEALER_PAGE_NUM INT NOT NULL,
USER_NUM INT NOT NULL,
TITLE VARCHAR(50) CHARACTER SET UTF8 NOT NULL,
CONTENT VARCHAR(3000) CHARACTER SET UTF8 NOT NULL,
REGI_DATE TIMESTAMP DEFAULT NOW() NOT NULL,
DEL_GB VARCHAR(1) DEFAULT 'N' NOT NULL,
PRIMARY KEY(DEALER_NEWS_NUM),
FOREIGN KEY(DEALER_PAGE_NUM) REFERENCES DEALER_PAGE(DEALER_PAGE_NUM) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(USER_NUM) REFERENCES USER(USER_NUM) ON UPDATE CASCADE

);

#댓글
CREATE TABLE REPLY (

REPLY_NUM INT AUTO_INCREMENT,
DEALER_NEWS_NUM INT NOT NULL,
USER_NUM INT NOT NULL,
CONTENT VARCHAR(1500) CHARACTER SET UTF8 NOT NULL,
REGI_DATE TIMESTAMP DEFAULT NOW() NOT NULL,
DEL_GB VARCHAR(1) DEFAULT 'N' NOT NULL,
RANK INT NOT NULL,
INDENT INT NOT NULL,
PARENT_REPLY_NUM INT NOT NULL,
PRIMARY KEY(REPLY_NUM),
FOREIGN KEY(DEALER_NEWS_NUM) REFERENCES DEALER_NEWS(DEALER_NEWS_NUM) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(USER_NUM) REFERENCES USER(USER_NUM) ON UPDATE CASCADE

);

#전문소식 첨부파일
CREATE TABLE DEALER_NEWS_FILE (

DEALER_NEWS_FILE_NUM INT AUTO_INCREMENT,
DEALER_NEWS_NUM INT NOT NULL,
ORIGINAL_FILE_NAME VARCHAR(50) CHARACTER SET UTF8 NOT NULL,
STORED_FILE_NAME VARCHAR(50) NOT NULL,
REGI_DATE TIMESTAMP DEFAULT NOW() NOT NULL,
PRIMARY KEY(DEALER_NEWS_FILE_NUM),
FOREIGN KEY(DEALER_NEWS_NUM) REFERENCES DEALER_NEWS(DEALER_NEWS_NUM) ON UPDATE CASCADE ON DELETE CASCADE

);

CREATE TABLE FREEBOARD (

FREEBOARD_NUM INT AUTO_INCREMENT,
TITLE VARCHAR(100) CHARACTER SET UTF8 NOT NULL,
CONTENT VARCHAR(2000) CHARACTER SET UTF8 NOT NULL,
WRITER VARCHAR (50) CHARACTER SET UTF8  DEFAULT 'ANONYMOUS' NOT NULL,
REGI_DATE TIMESTAMP DEFAULT NOW() NOT NULL,
VIEW_COUNT INT  DEFAULT 0 NOT NULL,
REPLY_COUNT INT DEFAULT 0 NOT NULL,
PRIMARY KEY (FREEBOARD_NUM)

);

CREATE TABLE FREEBOARD_REPLY (

REPLY_NUM INT AUTO_INCREMENT,
FREEBOARD_NUM INT NOT NULL,
CONTENT VARCHAR(1000) CHARACTER SET UTF8 NOT NULL,
WRITER VARCHAR(50) CHARACTER SET UTF8  DEFAULT 'ANONYMOUS' NOT NULL,
REGI_DATE TIMESTAMP DEFAULT NOW() NOT NULL,
PRIMARY KEY(REPLY_NUM),
FOREIGN KEY(FREEBOARD_NUM) REFERENCES FREEBOARD(FREEBOARD_NUM) ON UPDATE CASCADE ON DELETE CASCADE

);







#권한더미
INSERT INTO AUTHORITY(AUTHORITY_CODE) VALUES(1);
INSERT INTO AUTHORITY(AUTHORITY_CODE) VALUES(2);
INSERT INTO AUTHORITY(AUTHORITY_CODE) VALUES(3);

#SELECT * FROM AUTHORITY;

#관리자더미
INSERT INTO ADMIN(ADMIN_ID, ADMIN_PASSWORD, AUTHORITY_NUM, ADMIN_NAME) VALUES('ASDF', 1234, 1, 'TONY STARK');
INSERT INTO ADMIN(ADMIN_ID, ADMIN_PASSWORD, AUTHORITY_NUM, ADMIN_NAME) VALUES('QWER', 1234, 2, 'STEVE RODEGERS');
INSERT INTO ADMIN(ADMIN_ID, ADMIN_PASSWORD, AUTHORITY_NUM, ADMIN_NAME) VALUES('ZXCV', 1234, 3, 'BROOS WAYNE');
INSERT INTO ADMIN(ADMIN_ID, ADMIN_PASSWORD, AUTHORITY_NUM, ADMIN_NAME) VALUES('SDFG', 1234, 3, '조현우');
INSERT INTO ADMIN(ADMIN_ID, ADMIN_PASSWORD, AUTHORITY_NUM, ADMIN_NAME) VALUES('QAWS', 1234, 3, '비둘기');

#SELECT * FROM ADMIN;

#관리자로그인 더미
INSERT INTO ADMIN_LOGIN(ADMIN_NUM, LOGIN_DATE, LOGOUT_DATE) VALUES(1, NOW(), NOW());
INSERT INTO ADMIN_LOGIN(ADMIN_NUM, LOGIN_DATE, LOGOUT_DATE) VALUES(2, NOW(), NOW());
INSERT INTO ADMIN_LOGIN(ADMIN_NUM, LOGIN_DATE, LOGOUT_DATE) VALUES(3, NOW(), NOW());
INSERT INTO ADMIN_LOGIN(ADMIN_NUM, LOGIN_DATE, LOGOUT_DATE) VALUES(4, NOW(), NOW());
INSERT INTO ADMIN_LOGIN(ADMIN_NUM, LOGIN_DATE, LOGOUT_DATE) VALUES(5, NOW(), NOW());

#SELECT * FROM ADMIN_LOGIN;

#비회원 더미
INSERT INTO GUEST(GUEST_EMAIL) VALUES('ASDF@NAVER.COM');
INSERT INTO GUEST(GUEST_EMAIL) VALUES('ASDF@GMAIL.COM');
INSERT INTO GUEST(GUEST_EMAIL) VALUES('ASDF@HANMAIL.NET');
INSERT INTO GUEST(GUEST_EMAIL) VALUES('QWER@NAVER.COM');
INSERT INTO GUEST(GUEST_EMAIL) VALUES('QWER@GMAIL.COM');
INSERT INTO GUEST(GUEST_EMAIL) VALUES('QWER@NHANMAIL.NET');
INSERT INTO GUEST(GUEST_EMAIL) VALUES('ZXCV@NAVER.COM');

#SELECT * FROM GUEST;

# 시세 더미
INSERT INTO MARKET_PRICE(LABEL, NAME, PRICE_BTC, PRICE_USD, PRICE_CNY, PRICE_EUR, PRICE_GBP, PRICE_RUR, VOLUME_24H, TIMESTAMP) VALUES('GUGU', 'PSY', 1 , 0.1,  0.2, 0.3, 0.4, 0.5, 100, '141212');

#SELECT * FROM MARKET_PRICE;
#ALTER TABLE MARKET_PRICE MODIFY MARKET_PRICE_NUM INT AUTO_INCREMENT;

# 회원 더미
INSERT INTO USER(USER_EMAIL, USER_PASSWORD, USER_NICKNAME) VALUES('ABCD@NAVER.COM', 'QWER1234!', 'IRON_MAN');
INSERT INTO USER(USER_EMAIL, USER_PASSWORD, USER_NICKNAME) VALUES('QWER@NAVER.COM', 'QWER1234!', 'THOR');
INSERT INTO USER(USER_EMAIL, USER_PASSWORD, USER_NICKNAME) VALUES('1234@NAVER.COM', 'QWER1234!', 'BATMAN');
INSERT INTO USER(USER_EMAIL, USER_PASSWORD, USER_NICKNAME) VALUES('ZXCV@NAVER.COM', 'QWER1234!', 'SUPERMAN');
INSERT INTO USER(USER_EMAIL, USER_PASSWORD, USER_NICKNAME) VALUES('4321@NAVER.COM', 'QWER1234!', 'GUGU');
INSERT INTO USER(USER_EMAIL, USER_PASSWORD, USER_NICKNAME) VALUES('POIU@GMAIL.COM', 'QWER1234!', 'WHAT');
INSERT INTO USER(USER_EMAIL, USER_PASSWORD, USER_NICKNAME) VALUES('9999@GMAIL.COM', 'QWER1234!', 'OBAMA');
INSERT INTO USER(USER_EMAIL, USER_PASSWORD, USER_NICKNAME) VALUES('1111@GMAIL.COM', 'QWER1234!', 'GOOD');
INSERT INTO USER(USER_EMAIL, USER_PASSWORD, USER_NICKNAME) VALUES('2222@GMAIL.COM', 'QWER1234!', 'WIDOW');
INSERT INTO USER(USER_EMAIL, USER_PASSWORD, USER_NICKNAME) VALUES('3333@GMAIL.COM', 'QWER1234!', 'WINDOW');
#딜러더미
INSERT INTO USER(USER_EMAIL, USER_PASSWORD, USER_NICKNAME) VALUES('DEALER1@GMAIL.COM', 'QWER1234!', 'DEALER1');
INSERT INTO USER(USER_EMAIL, USER_PASSWORD, USER_NICKNAME) VALUES('DEALER2@GMAIL.COM', 'QWER1234!', 'DEALER2');
INSERT INTO USER(USER_EMAIL, USER_PASSWORD, USER_NICKNAME) VALUES('DEALER3@GMAIL.COM', 'QWER1234!', 'DEALER3');
INSERT INTO USER(USER_EMAIL, USER_PASSWORD, USER_NICKNAME) VALUES('DEALER4@GMAIL.COM', 'QWER1234!', 'DEALER4');
INSERT INTO USER(USER_EMAIL, USER_PASSWORD, USER_NICKNAME) VALUES('DEALER5@GMAIL.COM', 'QWER1234!', 'DEALER5');
INSERT INTO USER(USER_EMAIL, USER_PASSWORD, USER_NICKNAME) VALUES('DEALER6@GMAIL.COM', 'QWER1234!', 'DEALER6');
INSERT INTO USER(USER_EMAIL, USER_PASSWORD, USER_NICKNAME) VALUES('DEALER7@GMAIL.COM', 'QWER1234!', 'DEALER7');
INSERT INTO USER(USER_EMAIL, USER_PASSWORD, USER_NICKNAME) VALUES('DEALER8@GMAIL.COM', 'QWER1234!', 'DEALER8');
INSERT INTO USER(USER_EMAIL, USER_PASSWORD, USER_NICKNAME) VALUES('DEALER9@GMAIL.COM', 'QWER1234!', 'DEALER9');
INSERT INTO USER(USER_EMAIL, USER_PASSWORD, USER_NICKNAME) VALUES('DEALER10@GMAIL.COM', 'QWER1234!', 'DEALER10');
INSERT INTO USER(USER_EMAIL, USER_PASSWORD, USER_NICKNAME) VALUES('DEALER11@GMAIL.COM', 'QWER1234!', 'DEALER11');
INSERT INTO USER(USER_EMAIL, USER_PASSWORD, USER_NICKNAME) VALUES('DEALER12@GMAIL.COM', 'QWER1234!', 'DEALER12');
INSERT INTO USER(USER_EMAIL, USER_PASSWORD, USER_NICKNAME) VALUES('DEALER13@GMAIL.COM', 'QWER1234!', 'DEALER13');
INSERT INTO USER(USER_EMAIL, USER_PASSWORD, USER_NICKNAME) VALUES('DEALER14@GMAIL.COM', 'QWER1234!', 'DEALER14');
INSERT INTO USER(USER_EMAIL, USER_PASSWORD, USER_NICKNAME) VALUES('DEALER15@GMAIL.COM', 'QWER1234!', 'DEALER15');


#SELECT * FROM USER;

#가입유형 더미
INSERT INTO REGISTER_TYPE(USER_NUM, REGISTER_TYPE_CODE) VALUES(1, 'N');
INSERT INTO REGISTER_TYPE(USER_NUM, REGISTER_TYPE_CODE) VALUES(2, 'N');
INSERT INTO REGISTER_TYPE(USER_NUM, REGISTER_TYPE_CODE) VALUES(3, 'N');
INSERT INTO REGISTER_TYPE(USER_NUM, REGISTER_TYPE_CODE) VALUES(4, 'N');
INSERT INTO REGISTER_TYPE(USER_NUM, REGISTER_TYPE_CODE) VALUES(5, 'N');
INSERT INTO REGISTER_TYPE(USER_NUM, REGISTER_TYPE_CODE) VALUES(6, 'H');
INSERT INTO REGISTER_TYPE(USER_NUM, REGISTER_TYPE_CODE) VALUES(7, 'H');
INSERT INTO REGISTER_TYPE(USER_NUM, REGISTER_TYPE_CODE) VALUES(8, 'H');
INSERT INTO REGISTER_TYPE(USER_NUM, REGISTER_TYPE_CODE) VALUES(9, 'H');
INSERT INTO REGISTER_TYPE(USER_NUM, REGISTER_TYPE_CODE) VALUES(10, 'H');
INSERT INTO REGISTER_TYPE(USER_NUM, REGISTER_TYPE_CODE) VALUES(11, 'D');
INSERT INTO REGISTER_TYPE(USER_NUM, REGISTER_TYPE_CODE) VALUES(12, 'D');
INSERT INTO REGISTER_TYPE(USER_NUM, REGISTER_TYPE_CODE) VALUES(13, 'D');
INSERT INTO REGISTER_TYPE(USER_NUM, REGISTER_TYPE_CODE) VALUES(14, 'D');
INSERT INTO REGISTER_TYPE(USER_NUM, REGISTER_TYPE_CODE) VALUES(15, 'D');
INSERT INTO REGISTER_TYPE(USER_NUM, REGISTER_TYPE_CODE) VALUES(16, 'D');
INSERT INTO REGISTER_TYPE(USER_NUM, REGISTER_TYPE_CODE) VALUES(17, 'D');
INSERT INTO REGISTER_TYPE(USER_NUM, REGISTER_TYPE_CODE) VALUES(18, 'D');
INSERT INTO REGISTER_TYPE(USER_NUM, REGISTER_TYPE_CODE) VALUES(19, 'D');
INSERT INTO REGISTER_TYPE(USER_NUM, REGISTER_TYPE_CODE) VALUES(20, 'D');
INSERT INTO REGISTER_TYPE(USER_NUM, REGISTER_TYPE_CODE) VALUES(21, 'D');
INSERT INTO REGISTER_TYPE(USER_NUM, REGISTER_TYPE_CODE) VALUES(22, 'D');
INSERT INTO REGISTER_TYPE(USER_NUM, REGISTER_TYPE_CODE) VALUES(23, 'D');
INSERT INTO REGISTER_TYPE(USER_NUM, REGISTER_TYPE_CODE) VALUES(24, 'D');
INSERT INTO REGISTER_TYPE(USER_NUM, REGISTER_TYPE_CODE) VALUES(25, 'D');

#로그인 더미

INSERT INTO LOGIN(USER_NUM) VALUES(1);
INSERT INTO LOGIN(USER_NUM) VALUES(2);
INSERT INTO LOGIN(USER_NUM) VALUES(3);
INSERT INTO LOGIN(USER_NUM) VALUES(4);
INSERT INTO LOGIN(USER_NUM) VALUES(5);
INSERT INTO LOGIN(USER_NUM) VALUES(6);
INSERT INTO LOGIN(USER_NUM) VALUES(7);
INSERT INTO LOGIN(USER_NUM) VALUES(8);
INSERT INTO LOGIN(USER_NUM) VALUES(9);
INSERT INTO LOGIN(USER_NUM) VALUES(10);

#SELECT * FROM LOGIN;

#국내 스크랩 더미
INSERT INTO DOMESTIC_SCRAP(USER_NUM, DOMESTIC_SCRAP_URL, DOMESTIC_SCRAP_TITLE, DOMESTIC_SCRAP_DESCRIPTION, DOMESTIC_SCRAP_PUBDATE, DOMESTIC_SCRAP_KEYWORD)
VALUES(1,'http://factoll.com/page/news_view.php?Num=3754', '한번 감염되면 50만원 뜯긴다…악성코드 ‘랜섬웨어’에 당하지 않는 법', '④국내 피해액은?/ 올해 상반기 15만명 피해…100억원 해커그룹 손에 수사기관의 추적을 따돌리기 위해 가상화폐인 <b>비트코인</b>이나 온라인 간편결제 ‘페이팔’ 계정을 통해 돈을 받는다. ‘몸값’은 PC의 경우 50만원... ', 'Thu, 08 Dec 2016 18:27:00 +0900', '비트코인');
INSERT INTO DOMESTIC_SCRAP(USER_NUM, DOMESTIC_SCRAP_URL, DOMESTIC_SCRAP_TITLE, DOMESTIC_SCRAP_DESCRIPTION, DOMESTIC_SCRAP_PUBDATE, DOMESTIC_SCRAP_KEYWORD)
VALUES(1,'http://factoll.com/page/news_view.php?Num=3754', '한번 감염되면 50만원 뜯긴다…악성코드 ‘랜섬웨어’에 당하지 않는 법', '④국내 피해액은?/ 올해 상반기 15만명 피해…100억원 해커그룹 손에 수사기관의 추적을 따돌리기 위해 가상화폐인 <b>비트코인</b>이나 온라인 간편결제 ‘페이팔’ 계정을 통해 돈을 받는다. ‘몸값’은 PC의 경우 50만원... ', 'Thu, 08 Dec 2016 18:27:00 +0900', '비트코인');
INSERT INTO DOMESTIC_SCRAP(USER_NUM, DOMESTIC_SCRAP_URL, DOMESTIC_SCRAP_TITLE, DOMESTIC_SCRAP_DESCRIPTION, DOMESTIC_SCRAP_PUBDATE, DOMESTIC_SCRAP_KEYWORD)
VALUES(1,'http://factoll.com/page/news_view.php?Num=3754', '한번 감염되면 50만원 뜯긴다…악성코드 ‘랜섬웨어’에 당하지 않는 법', '④국내 피해액은?/ 올해 상반기 15만명 피해…100억원 해커그룹 손에 수사기관의 추적을 따돌리기 위해 가상화폐인 <b>비트코인</b>이나 온라인 간편결제 ‘페이팔’ 계정을 통해 돈을 받는다. ‘몸값’은 PC의 경우 50만원... ', 'Thu, 08 Dec 2016 18:27:00 +0900', '비트코인');
INSERT INTO DOMESTIC_SCRAP(USER_NUM, DOMESTIC_SCRAP_URL, DOMESTIC_SCRAP_TITLE, DOMESTIC_SCRAP_DESCRIPTION, DOMESTIC_SCRAP_PUBDATE, DOMESTIC_SCRAP_KEYWORD)
VALUES(1,'http://factoll.com/page/news_view.php?Num=3754', '한번 감염되면 50만원 뜯긴다…악성코드 ‘랜섬웨어’에 당하지 않는 법', '④국내 피해액은?/ 올해 상반기 15만명 피해…100억원 해커그룹 손에 수사기관의 추적을 따돌리기 위해 가상화폐인 <b>비트코인</b>이나 온라인 간편결제 ‘페이팔’ 계정을 통해 돈을 받는다. ‘몸값’은 PC의 경우 50만원... ', 'Thu, 08 Dec 2016 18:27:00 +0900', '비트코인');
INSERT INTO DOMESTIC_SCRAP(USER_NUM, DOMESTIC_SCRAP_URL, DOMESTIC_SCRAP_TITLE, DOMESTIC_SCRAP_DESCRIPTION, DOMESTIC_SCRAP_PUBDATE, DOMESTIC_SCRAP_KEYWORD)
VALUES(1,'http://factoll.com/page/news_view.php?Num=3754', '한번 감염되면 50만원 뜯긴다…악성코드 ‘랜섬웨어’에 당하지 않는 법', '④국내 피해액은?/ 올해 상반기 15만명 피해…100억원 해커그룹 손에 수사기관의 추적을 따돌리기 위해 가상화폐인 <b>비트코인</b>이나 온라인 간편결제 ‘페이팔’ 계정을 통해 돈을 받는다. ‘몸값’은 PC의 경우 50만원... ', 'Thu, 08 Dec 2016 18:27:00 +0900', '비트코인');

INSERT INTO DOMESTIC_SCRAP(USER_NUM, DOMESTIC_SCRAP_URL, DOMESTIC_SCRAP_TITLE, DOMESTIC_SCRAP_DESCRIPTION, DOMESTIC_SCRAP_PUBDATE, DOMESTIC_SCRAP_KEYWORD)
VALUES(1,'http://news.naver.com/main/read.nhn?mode=LSD&mid=sec&sid1=101&oid=009&aid=0003853681', '청교협, 내년 140회로 청소년 금융교육 뮤지컬 대폭 확대', '또 장 회장은 "해외 여행객이 급증하고 있는 만큼 환율 등 실질적인 금융지식을 제공하는 것은 물론 최신 트렌드인 <b>비트코인</b>과 같은 가상화폐 등 새롭게 부상하는 금융 환경에 대한 지식 전달도 필요하다"고 진단했다.... ', 'Sun, 11 Dec 2016 18:33:00 +0900', '비트코인');
INSERT INTO DOMESTIC_SCRAP(USER_NUM, DOMESTIC_SCRAP_URL, DOMESTIC_SCRAP_TITLE, DOMESTIC_SCRAP_DESCRIPTION, DOMESTIC_SCRAP_PUBDATE, DOMESTIC_SCRAP_KEYWORD)
VALUES(1,'http://news.naver.com/main/read.nhn?mode=LSD&mid=sec&sid1=101&oid=009&aid=0003853681', '청교협, 내년 140회로 청소년 금융교육 뮤지컬 대폭 확대', '또 장 회장은 "해외 여행객이 급증하고 있는 만큼 환율 등 실질적인 금융지식을 제공하는 것은 물론 최신 트렌드인 <b>비트코인</b>과 같은 가상화폐 등 새롭게 부상하는 금융 환경에 대한 지식 전달도 필요하다"고 진단했다.... ', 'Sun, 11 Dec 2016 18:33:00 +0900', '비트코인');
INSERT INTO DOMESTIC_SCRAP(USER_NUM, DOMESTIC_SCRAP_URL, DOMESTIC_SCRAP_TITLE, DOMESTIC_SCRAP_DESCRIPTION, DOMESTIC_SCRAP_PUBDATE, DOMESTIC_SCRAP_KEYWORD)
VALUES(1,'http://news.naver.com/main/read.nhn?mode=LSD&mid=sec&sid1=101&oid=009&aid=0003853681', '청교협, 내년 140회로 청소년 금융교육 뮤지컬 대폭 확대', '또 장 회장은 "해외 여행객이 급증하고 있는 만큼 환율 등 실질적인 금융지식을 제공하는 것은 물론 최신 트렌드인 <b>비트코인</b>과 같은 가상화폐 등 새롭게 부상하는 금융 환경에 대한 지식 전달도 필요하다"고 진단했다.... ', 'Sun, 11 Dec 2016 18:33:00 +0900', '비트코인');
INSERT INTO DOMESTIC_SCRAP(USER_NUM, DOMESTIC_SCRAP_URL, DOMESTIC_SCRAP_TITLE, DOMESTIC_SCRAP_DESCRIPTION, DOMESTIC_SCRAP_PUBDATE, DOMESTIC_SCRAP_KEYWORD)
VALUES(1,'http://news.naver.com/main/read.nhn?mode=LSD&mid=sec&sid1=101&oid=009&aid=0003853681', '청교협, 내년 140회로 청소년 금융교육 뮤지컬 대폭 확대', '또 장 회장은 "해외 여행객이 급증하고 있는 만큼 환율 등 실질적인 금융지식을 제공하는 것은 물론 최신 트렌드인 <b>비트코인</b>과 같은 가상화폐 등 새롭게 부상하는 금융 환경에 대한 지식 전달도 필요하다"고 진단했다.... ', 'Sun, 11 Dec 2016 18:33:00 +0900', '비트코인');

INSERT INTO DOMESTIC_SCRAP(USER_NUM, DOMESTIC_SCRAP_URL, DOMESTIC_SCRAP_TITLE, DOMESTIC_SCRAP_DESCRIPTION, DOMESTIC_SCRAP_PUBDATE, DOMESTIC_SCRAP_KEYWORD)
VALUES(1,'http://news.naver.com/main/read.nhn?mode=LSD&mid=sec&sid1=104&oid=022&aid=0003125144', '<b>비트코인</b> 2년10개월 만에 최고 수준… 트럼프 효과?', '가상통화 ‘<b>비트코인</b>’이 ‘트럼프 효과’로 2년10개월 만에 최고 수준으로 상승했다고 니혼게이자이신문이 11일 보도했다. 보도에 따르면 11월 초까지만 해도 1<b>비트코인</b>은 700달러 근처였다. 그러나 미국 대통령 선거... ', 'Sun, 11 Dec 2016 11:02:00 +0900', '비트코인');
INSERT INTO DOMESTIC_SCRAP(USER_NUM, DOMESTIC_SCRAP_URL, DOMESTIC_SCRAP_TITLE, DOMESTIC_SCRAP_DESCRIPTION, DOMESTIC_SCRAP_PUBDATE, DOMESTIC_SCRAP_KEYWORD)
VALUES(1,'http://news.naver.com/main/read.nhn?mode=LSD&mid=sec&sid1=104&oid=022&aid=0003125144', '<b>비트코인</b> 2년10개월 만에 최고 수준… 트럼프 효과?', '가상통화 ‘<b>비트코인</b>’이 ‘트럼프 효과’로 2년10개월 만에 최고 수준으로 상승했다고 니혼게이자이신문이 11일 보도했다. 보도에 따르면 11월 초까지만 해도 1<b>비트코인</b>은 700달러 근처였다. 그러나 미국 대통령 선거... ', 'Sun, 11 Dec 2016 11:02:00 +0900', '비트코인');
INSERT INTO DOMESTIC_SCRAP(USER_NUM, DOMESTIC_SCRAP_URL, DOMESTIC_SCRAP_TITLE, DOMESTIC_SCRAP_DESCRIPTION, DOMESTIC_SCRAP_PUBDATE, DOMESTIC_SCRAP_KEYWORD)
VALUES(1,'http://news.naver.com/main/read.nhn?mode=LSD&mid=sec&sid1=104&oid=022&aid=0003125144', '<b>비트코인</b> 2년10개월 만에 최고 수준… 트럼프 효과?', '가상통화 ‘<b>비트코인</b>’이 ‘트럼프 효과’로 2년10개월 만에 최고 수준으로 상승했다고 니혼게이자이신문이 11일 보도했다. 보도에 따르면 11월 초까지만 해도 1<b>비트코인</b>은 700달러 근처였다. 그러나 미국 대통령 선거... ', 'Sun, 11 Dec 2016 11:02:00 +0900', '비트코인');

INSERT INTO DOMESTIC_SCRAP(USER_NUM, DOMESTIC_SCRAP_URL, DOMESTIC_SCRAP_TITLE, DOMESTIC_SCRAP_DESCRIPTION, DOMESTIC_SCRAP_PUBDATE, DOMESTIC_SCRAP_KEYWORD)
VALUES(1,'http://news.naver.com/main/read.nhn?mode=LSD&mid=sec&sid1=105&oid=030&aid=0002560410', '[IP노믹스]블록체인 특허 확보 경쟁, 기술 독점 우려도 고조', '또 <b>비트코인</b>을 발명했다고 주장하는 크레이그 라이트라는 미지의 인물 역시 블록체인 관련 특허를 수십건 출원했다. 아직까지 미 특허청은 이들 특허 등록을 허용하지 않고 있다. 하지만 특허 등록 여부와 상관없이... ', 'Fri, 09 Dec 2016 18:00:00 +0900', '비트코인');
INSERT INTO DOMESTIC_SCRAP(USER_NUM, DOMESTIC_SCRAP_URL, DOMESTIC_SCRAP_TITLE, DOMESTIC_SCRAP_DESCRIPTION, DOMESTIC_SCRAP_PUBDATE, DOMESTIC_SCRAP_KEYWORD)
VALUES(1,'http://news.naver.com/main/read.nhn?mode=LSD&mid=sec&sid1=105&oid=030&aid=0002560410', '[IP노믹스]블록체인 특허 확보 경쟁, 기술 독점 우려도 고조', '또 <b>비트코인</b>을 발명했다고 주장하는 크레이그 라이트라는 미지의 인물 역시 블록체인 관련 특허를 수십건 출원했다. 아직까지 미 특허청은 이들 특허 등록을 허용하지 않고 있다. 하지만 특허 등록 여부와 상관없이... ', 'Fri, 09 Dec 2016 18:00:00 +0900', '비트코인');
INSERT INTO DOMESTIC_SCRAP(USER_NUM, DOMESTIC_SCRAP_URL, DOMESTIC_SCRAP_TITLE, DOMESTIC_SCRAP_DESCRIPTION, DOMESTIC_SCRAP_PUBDATE, DOMESTIC_SCRAP_KEYWORD)
VALUES(1,'http://news.naver.com/main/read.nhn?mode=LSD&mid=sec&sid1=105&oid=030&aid=0002560410', '[IP노믹스]블록체인 특허 확보 경쟁, 기술 독점 우려도 고조', '또 <b>비트코인</b>을 발명했다고 주장하는 크레이그 라이트라는 미지의 인물 역시 블록체인 관련 특허를 수십건 출원했다. 아직까지 미 특허청은 이들 특허 등록을 허용하지 않고 있다. 하지만 특허 등록 여부와 상관없이... ', 'Fri, 09 Dec 2016 18:00:00 +0900', '비트코인');

INSERT INTO DOMESTIC_SCRAP(USER_NUM, DOMESTIC_SCRAP_URL, DOMESTIC_SCRAP_TITLE, DOMESTIC_SCRAP_DESCRIPTION, DOMESTIC_SCRAP_PUBDATE, DOMESTIC_SCRAP_KEYWORD)
VALUES(1,'http://news.naver.com/main/read.nhn?mode=LSD&mid=sec&sid1=101&oid=009&aid=0003853681', '청교협, 내년 140회로 청소년 금융교육 뮤지컬 대폭 확대', '또 장 회장은 "해외 여행객이 급증하고 있는 만큼 환율 등 실질적인 금융지식을 제공하는 것은 물론 최신 트렌드인 <b>비트코인</b>과 같은 가상화폐 등 새롭게 부상하는 금융 환경에 대한 지식 전달도 필요하다"고 진단했다.... ', 'Sun, 11 Dec 2016 18:33:00 +0900', '비트코인');
INSERT INTO DOMESTIC_SCRAP(USER_NUM, DOMESTIC_SCRAP_URL, DOMESTIC_SCRAP_TITLE, DOMESTIC_SCRAP_DESCRIPTION, DOMESTIC_SCRAP_PUBDATE, DOMESTIC_SCRAP_KEYWORD)
VALUES(1,'http://news.naver.com/main/read.nhn?mode=LSD&mid=sec&sid1=101&oid=009&aid=0003853681', '청교협, 내년 140회로 청소년 금융교육 뮤지컬 대폭 확대', '또 장 회장은 "해외 여행객이 급증하고 있는 만큼 환율 등 실질적인 금융지식을 제공하는 것은 물론 최신 트렌드인 <b>비트코인</b>과 같은 가상화폐 등 새롭게 부상하는 금융 환경에 대한 지식 전달도 필요하다"고 진단했다.... ', 'Sun, 11 Dec 2016 18:33:00 +0900', '비트코인');

INSERT INTO DOMESTIC_SCRAP(USER_NUM, DOMESTIC_SCRAP_URL, DOMESTIC_SCRAP_TITLE, DOMESTIC_SCRAP_DESCRIPTION, DOMESTIC_SCRAP_PUBDATE, DOMESTIC_SCRAP_KEYWORD)
VALUES(1,'http://news.naver.com/main/read.nhn?mode=LSD&mid=sec&sid1=004&oid=243&aid=0000005459', '[다가오는 현금 없는 사회] 거스름돈 계좌로 받고 교통카드에 쏙쏙 충전', '실제 대표적인 전자화폐인 ‘<b>비트코인</b>’의 거래소가 해킹당해 수백억원어치가 도난당하는 사건이 수 차례 발생했다. 또 한국의 경우 경조사비나 세뱃돈 등은 현금으로 주고받는 게 ‘인간적’이라는 특유의 정서도... ', 'Mon, 05 Dec 2016 11:44:00 +0900', '비트코인');
INSERT INTO DOMESTIC_SCRAP(USER_NUM, DOMESTIC_SCRAP_URL, DOMESTIC_SCRAP_TITLE, DOMESTIC_SCRAP_DESCRIPTION, DOMESTIC_SCRAP_PUBDATE, DOMESTIC_SCRAP_KEYWORD)
VALUES(1,'http://news.naver.com/main/read.nhn?mode=LSD&mid=sec&sid1=004&oid=243&aid=0000005459', '[다가오는 현금 없는 사회] 거스름돈 계좌로 받고 교통카드에 쏙쏙 충전', '실제 대표적인 전자화폐인 ‘<b>비트코인</b>’의 거래소가 해킹당해 수백억원어치가 도난당하는 사건이 수 차례 발생했다. 또 한국의 경우 경조사비나 세뱃돈 등은 현금으로 주고받는 게 ‘인간적’이라는 특유의 정서도... ', 'Mon, 05 Dec 2016 11:44:00 +0900', '비트코인');
INSERT INTO DOMESTIC_SCRAP(USER_NUM, DOMESTIC_SCRAP_URL, DOMESTIC_SCRAP_TITLE, DOMESTIC_SCRAP_DESCRIPTION, DOMESTIC_SCRAP_PUBDATE, DOMESTIC_SCRAP_KEYWORD)
VALUES(1,'http://news.naver.com/main/read.nhn?mode=LSD&mid=sec&sid1=004&oid=243&aid=0000005459', '[다가오는 현금 없는 사회] 거스름돈 계좌로 받고 교통카드에 쏙쏙 충전', '실제 대표적인 전자화폐인 ‘<b>비트코인</b>’의 거래소가 해킹당해 수백억원어치가 도난당하는 사건이 수 차례 발생했다. 또 한국의 경우 경조사비나 세뱃돈 등은 현금으로 주고받는 게 ‘인간적’이라는 특유의 정서도... ', 'Mon, 05 Dec 2016 11:44:00 +0900', '비트코인');

#SELECT * FROM DOMESTIC_SCRAP;

#해외 스크랩 더미
INSERT INTO ABROAD_SCRAP(USER_NUM, ABROAD_SCRAP_URL, ABROAD_SCRAP_TITLE, ABROAD_SCRAP_DESCRIPTION, ABROAD_SCRAP_PUBDATE, ABROAD_SCRAP_IMG_URL, ABROAD_SCRAP_WRITER)
VALUES(1, 'https://news.bitcoin.com/federal-reserve-blockchain-report/', ' Reserve Report Says Private Ledgers Better Than Open', 'The U.S. Federal Reserve is showing strong interest in attributes of distributed ledger technology (DLT). The private central banking entity has just released a paper that explores the agencies research on blockchain based settlement. Also read:?Four Countries Priming Bitcoin Demand Worldwide Federal Reserve Research Team Paper Focuses on Blockchain Technology The report issued by the Federal Reserve Board called “Distributed ledger technology...', 'December 7, 2016', 'https://news.bitcoin.com/wp-content/uploads/2016/12/Federal-Reserve-Board-Releases-Blockchain-Report-640x480.jpg', 'Jamie Redman');
INSERT INTO ABROAD_SCRAP(USER_NUM, ABROAD_SCRAP_URL, ABROAD_SCRAP_TITLE, ABROAD_SCRAP_DESCRIPTION, ABROAD_SCRAP_PUBDATE, ABROAD_SCRAP_IMG_URL, ABROAD_SCRAP_WRITER)
VALUES(2, 'https://news.bitcoin.com/federal-reserve-blockchain-report/', ' Reserve Report Says Private Ledgers Better Than Open', 'The U.S. Federal Reserve is showing strong interest in attributes of distributed ledger technology (DLT). The private central banking entity has just released a paper that explores the agencies research on blockchain based settlement. Also read:?Four Countries Priming Bitcoin Demand Worldwide Federal Reserve Research Team Paper Focuses on Blockchain Technology The report issued by the Federal Reserve Board called “Distributed ledger technology...', 'December 7, 2016', 'https://news.bitcoin.com/wp-content/uploads/2016/12/Federal-Reserve-Board-Releases-Blockchain-Report-640x480.jpg', 'Jamie Redman');
INSERT INTO ABROAD_SCRAP(USER_NUM, ABROAD_SCRAP_URL, ABROAD_SCRAP_TITLE, ABROAD_SCRAP_DESCRIPTION, ABROAD_SCRAP_PUBDATE, ABROAD_SCRAP_IMG_URL, ABROAD_SCRAP_WRITER)
VALUES(3, 'https://news.bitcoin.com/federal-reserve-blockchain-report/', ' Reserve Report Says Private Ledgers Better Than Open', 'The U.S. Federal Reserve is showing strong interest in attributes of distributed ledger technology (DLT). The private central banking entity has just released a paper that explores the agencies research on blockchain based settlement. Also read:?Four Countries Priming Bitcoin Demand Worldwide Federal Reserve Research Team Paper Focuses on Blockchain Technology The report issued by the Federal Reserve Board called “Distributed ledger technology...', 'December 7, 2016', 'https://news.bitcoin.com/wp-content/uploads/2016/12/Federal-Reserve-Board-Releases-Blockchain-Report-640x480.jpg', 'Jamie Redman');
INSERT INTO ABROAD_SCRAP(USER_NUM, ABROAD_SCRAP_URL, ABROAD_SCRAP_TITLE, ABROAD_SCRAP_DESCRIPTION, ABROAD_SCRAP_PUBDATE, ABROAD_SCRAP_IMG_URL, ABROAD_SCRAP_WRITER)
VALUES(4, 'https://news.bitcoin.com/federal-reserve-blockchain-report/', ' Reserve Report Says Private Ledgers Better Than Open', 'The U.S. Federal Reserve is showing strong interest in attributes of distributed ledger technology (DLT). The private central banking entity has just released a paper that explores the agencies research on blockchain based settlement. Also read:?Four Countries Priming Bitcoin Demand Worldwide Federal Reserve Research Team Paper Focuses on Blockchain Technology The report issued by the Federal Reserve Board called “Distributed ledger technology...', 'December 7, 2016', 'https://news.bitcoin.com/wp-content/uploads/2016/12/Federal-Reserve-Board-Releases-Blockchain-Report-640x480.jpg', 'Jamie Redman');
INSERT INTO ABROAD_SCRAP(USER_NUM, ABROAD_SCRAP_URL, ABROAD_SCRAP_TITLE, ABROAD_SCRAP_DESCRIPTION, ABROAD_SCRAP_PUBDATE, ABROAD_SCRAP_IMG_URL, ABROAD_SCRAP_WRITER)
VALUES(5, 'https://news.bitcoin.com/federal-reserve-blockchain-report/', ' Reserve Report Says Private Ledgers Better Than Open', 'The U.S. Federal Reserve is showing strong interest in attributes of distributed ledger technology (DLT). The private central banking entity has just released a paper that explores the agencies research on blockchain based settlement. Also read:?Four Countries Priming Bitcoin Demand Worldwide Federal Reserve Research Team Paper Focuses on Blockchain Technology The report issued by the Federal Reserve Board called “Distributed ledger technology...', 'December 7, 2016', 'https://news.bitcoin.com/wp-content/uploads/2016/12/Federal-Reserve-Board-Releases-Blockchain-Report-640x480.jpg', 'Jamie Redman');
INSERT INTO ABROAD_SCRAP(USER_NUM, ABROAD_SCRAP_URL, ABROAD_SCRAP_TITLE, ABROAD_SCRAP_DESCRIPTION, ABROAD_SCRAP_PUBDATE, ABROAD_SCRAP_IMG_URL, ABROAD_SCRAP_WRITER)
VALUES(6, 'https://news.bitcoin.com/federal-reserve-blockchain-report/', ' Reserve Report Says Private Ledgers Better Than Open', 'The U.S. Federal Reserve is showing strong interest in attributes of distributed ledger technology (DLT). The private central banking entity has just released a paper that explores the agencies research on blockchain based settlement. Also read:?Four Countries Priming Bitcoin Demand Worldwide Federal Reserve Research Team Paper Focuses on Blockchain Technology The report issued by the Federal Reserve Board called “Distributed ledger technology...', 'December 7, 2016', 'https://news.bitcoin.com/wp-content/uploads/2016/12/Federal-Reserve-Board-Releases-Blockchain-Report-640x480.jpg', 'Jamie Redman');

INSERT INTO ABROAD_SCRAP(USER_NUM, ABROAD_SCRAP_URL, ABROAD_SCRAP_TITLE, ABROAD_SCRAP_DESCRIPTION, ABROAD_SCRAP_PUBDATE, ABROAD_SCRAP_IMG_URL, ABROAD_SCRAP_WRITER)
VALUES(1, 'https://news.bitcoin.com/bitspark-bitcoin-remittance-asia/', '  Workers Attract Remittance Startup Bitspark to Southeast Asia', 'Hong Kong-based Bitspark Limited, a bitcoin remittance company, has announced a new partnership with Malaysian Vitaxel Group. Vitaxel Group, which specializes in multi-level marketing, has more than 5000 distributors in 16 Asian countries. And together, they aim to expand the bitcoin remittance services throughout Southeast Asia (S.E.A). Remittance in Hong Kong Currently, Bitspark provides bitcoin remittance services to three countries ?...', 'December 6, 2016', 'https://news.bitcoin.com/wp-content/uploads/2016/12/Bitspark-Bitcoin-Remittance-Startup-Expands-to-Southeast-Asia-640x480.jpg', 'Kei K');
INSERT INTO ABROAD_SCRAP(USER_NUM, ABROAD_SCRAP_URL, ABROAD_SCRAP_TITLE, ABROAD_SCRAP_DESCRIPTION, ABROAD_SCRAP_PUBDATE, ABROAD_SCRAP_IMG_URL, ABROAD_SCRAP_WRITER)
VALUES(2, 'https://news.bitcoin.com/bitspark-bitcoin-remittance-asia/', '  Workers Attract Remittance Startup Bitspark to Southeast Asia', 'Hong Kong-based Bitspark Limited, a bitcoin remittance company, has announced a new partnership with Malaysian Vitaxel Group. Vitaxel Group, which specializes in multi-level marketing, has more than 5000 distributors in 16 Asian countries. And together, they aim to expand the bitcoin remittance services throughout Southeast Asia (S.E.A). Remittance in Hong Kong Currently, Bitspark provides bitcoin remittance services to three countries ?...', 'December 6, 2016', 'https://news.bitcoin.com/wp-content/uploads/2016/12/Bitspark-Bitcoin-Remittance-Startup-Expands-to-Southeast-Asia-640x480.jpg', 'Kei K');
INSERT INTO ABROAD_SCRAP(USER_NUM, ABROAD_SCRAP_URL, ABROAD_SCRAP_TITLE, ABROAD_SCRAP_DESCRIPTION, ABROAD_SCRAP_PUBDATE, ABROAD_SCRAP_IMG_URL, ABROAD_SCRAP_WRITER)
VALUES(3, 'https://news.bitcoin.com/bitspark-bitcoin-remittance-asia/', '  Workers Attract Remittance Startup Bitspark to Southeast Asia', 'Hong Kong-based Bitspark Limited, a bitcoin remittance company, has announced a new partnership with Malaysian Vitaxel Group. Vitaxel Group, which specializes in multi-level marketing, has more than 5000 distributors in 16 Asian countries. And together, they aim to expand the bitcoin remittance services throughout Southeast Asia (S.E.A). Remittance in Hong Kong Currently, Bitspark provides bitcoin remittance services to three countries ?...', 'December 6, 2016', 'https://news.bitcoin.com/wp-content/uploads/2016/12/Bitspark-Bitcoin-Remittance-Startup-Expands-to-Southeast-Asia-640x480.jpg', 'Kei K');
INSERT INTO ABROAD_SCRAP(USER_NUM, ABROAD_SCRAP_URL, ABROAD_SCRAP_TITLE, ABROAD_SCRAP_DESCRIPTION, ABROAD_SCRAP_PUBDATE, ABROAD_SCRAP_IMG_URL, ABROAD_SCRAP_WRITER)
VALUES(4, 'https://news.bitcoin.com/bitspark-bitcoin-remittance-asia/', '  Workers Attract Remittance Startup Bitspark to Southeast Asia', 'Hong Kong-based Bitspark Limited, a bitcoin remittance company, has announced a new partnership with Malaysian Vitaxel Group. Vitaxel Group, which specializes in multi-level marketing, has more than 5000 distributors in 16 Asian countries. And together, they aim to expand the bitcoin remittance services throughout Southeast Asia (S.E.A). Remittance in Hong Kong Currently, Bitspark provides bitcoin remittance services to three countries ?...', 'December 6, 2016', 'https://news.bitcoin.com/wp-content/uploads/2016/12/Bitspark-Bitcoin-Remittance-Startup-Expands-to-Southeast-Asia-640x480.jpg', 'Kei K');
INSERT INTO ABROAD_SCRAP(USER_NUM, ABROAD_SCRAP_URL, ABROAD_SCRAP_TITLE, ABROAD_SCRAP_DESCRIPTION, ABROAD_SCRAP_PUBDATE, ABROAD_SCRAP_IMG_URL, ABROAD_SCRAP_WRITER)
VALUES(5, 'https://news.bitcoin.com/bitspark-bitcoin-remittance-asia/', '  Workers Attract Remittance Startup Bitspark to Southeast Asia', 'Hong Kong-based Bitspark Limited, a bitcoin remittance company, has announced a new partnership with Malaysian Vitaxel Group. Vitaxel Group, which specializes in multi-level marketing, has more than 5000 distributors in 16 Asian countries. And together, they aim to expand the bitcoin remittance services throughout Southeast Asia (S.E.A). Remittance in Hong Kong Currently, Bitspark provides bitcoin remittance services to three countries ?...', 'December 6, 2016', 'https://news.bitcoin.com/wp-content/uploads/2016/12/Bitspark-Bitcoin-Remittance-Startup-Expands-to-Southeast-Asia-640x480.jpg', 'Kei K');

INSERT INTO ABROAD_SCRAP(USER_NUM, ABROAD_SCRAP_URL, ABROAD_SCRAP_TITLE, ABROAD_SCRAP_DESCRIPTION, ABROAD_SCRAP_PUBDATE, ABROAD_SCRAP_IMG_URL, ABROAD_SCRAP_WRITER)
VALUES(1, 'https://news.bitcoin.com/blockchain-foundry-platform-azure/', '/Blockchain Foundry Introduces E-commerce Platform to Azure', 'The Syscoin project recently announced the formation of?a company entity called Blockchain Foundry. The newly created Foundry will work with blockchain technologies including Bitcoin, Lisk, Ethereum, and Syscoin itself. The project team also revealed its first commercial product, an ecommerce platform called Blockmarket. Also read: ?Students at Berlin University Build Chess Game on Ethereum What?Blockchain Foundry Will Do The Syscoin team has...', 'September 8, 2016', 'https://news.bitcoin.com/wp-content/uploads/2016/09/Microsoft-BaaS-Member-Forms-The-Blockchain-Foundry-640x480.jpg', 'Jamie Redman');
INSERT INTO ABROAD_SCRAP(USER_NUM, ABROAD_SCRAP_URL, ABROAD_SCRAP_TITLE, ABROAD_SCRAP_DESCRIPTION, ABROAD_SCRAP_PUBDATE, ABROAD_SCRAP_IMG_URL, ABROAD_SCRAP_WRITER)
VALUES(2, 'https://news.bitcoin.com/blockchain-foundry-platform-azure/', '/Blockchain Foundry Introduces E-commerce Platform to Azure', 'The Syscoin project recently announced the formation of?a company entity called Blockchain Foundry. The newly created Foundry will work with blockchain technologies including Bitcoin, Lisk, Ethereum, and Syscoin itself. The project team also revealed its first commercial product, an ecommerce platform called Blockmarket. Also read: ?Students at Berlin University Build Chess Game on Ethereum What?Blockchain Foundry Will Do The Syscoin team has...', 'September 8, 2016', 'https://news.bitcoin.com/wp-content/uploads/2016/09/Microsoft-BaaS-Member-Forms-The-Blockchain-Foundry-640x480.jpg', 'Jamie Redman');
INSERT INTO ABROAD_SCRAP(USER_NUM, ABROAD_SCRAP_URL, ABROAD_SCRAP_TITLE, ABROAD_SCRAP_DESCRIPTION, ABROAD_SCRAP_PUBDATE, ABROAD_SCRAP_IMG_URL, ABROAD_SCRAP_WRITER)
VALUES(3, 'https://news.bitcoin.com/blockchain-foundry-platform-azure/', '/Blockchain Foundry Introduces E-commerce Platform to Azure', 'The Syscoin project recently announced the formation of?a company entity called Blockchain Foundry. The newly created Foundry will work with blockchain technologies including Bitcoin, Lisk, Ethereum, and Syscoin itself. The project team also revealed its first commercial product, an ecommerce platform called Blockmarket. Also read: ?Students at Berlin University Build Chess Game on Ethereum What?Blockchain Foundry Will Do The Syscoin team has...', 'September 8, 2016', 'https://news.bitcoin.com/wp-content/uploads/2016/09/Microsoft-BaaS-Member-Forms-The-Blockchain-Foundry-640x480.jpg', 'Jamie Redman');
INSERT INTO ABROAD_SCRAP(USER_NUM, ABROAD_SCRAP_URL, ABROAD_SCRAP_TITLE, ABROAD_SCRAP_DESCRIPTION, ABROAD_SCRAP_PUBDATE, ABROAD_SCRAP_IMG_URL, ABROAD_SCRAP_WRITER)
VALUES(4, 'https://news.bitcoin.com/blockchain-foundry-platform-azure/', '/Blockchain Foundry Introduces E-commerce Platform to Azure', 'The Syscoin project recently announced the formation of?a company entity called Blockchain Foundry. The newly created Foundry will work with blockchain technologies including Bitcoin, Lisk, Ethereum, and Syscoin itself. The project team also revealed its first commercial product, an ecommerce platform called Blockmarket. Also read: ?Students at Berlin University Build Chess Game on Ethereum What?Blockchain Foundry Will Do The Syscoin team has...', 'September 8, 2016', 'https://news.bitcoin.com/wp-content/uploads/2016/09/Microsoft-BaaS-Member-Forms-The-Blockchain-Foundry-640x480.jpg', 'Jamie Redman');

INSERT INTO ABROAD_SCRAP(USER_NUM, ABROAD_SCRAP_URL, ABROAD_SCRAP_TITLE, ABROAD_SCRAP_DESCRIPTION, ABROAD_SCRAP_PUBDATE, ABROAD_SCRAP_IMG_URL, ABROAD_SCRAP_WRITER)
VALUES(1,'https://news.bitcoin.com/bitcoin-ready-quantum-computing/','elopments in Quantum Computing Impact Bitcoin','Quantum computing might be closer than we thought, thanks to a series of newly developed scientific methods. Furthermore, a new implementation of Shor’s algorithm increases the urgency of getting Bitcoin ready for the advent of quantum computing.? Also read: NIST Starts Developing Quantum-Resistant Cryptography Standards Quantum Computing Breakthroughs At present, Bitcoin is obviously resistant to all known?types of cyberattacks. However, according to...','December 5, 2016','https://news.bitcoin.com/wp-content/uploads/2016/12/shutterstock_473066947-640x480.jpg','Julio Gil-Pulgar');
INSERT INTO ABROAD_SCRAP(USER_NUM, ABROAD_SCRAP_URL, ABROAD_SCRAP_TITLE, ABROAD_SCRAP_DESCRIPTION, ABROAD_SCRAP_PUBDATE, ABROAD_SCRAP_IMG_URL, ABROAD_SCRAP_WRITER)
VALUES(2,'https://news.bitcoin.com/bitcoin-ready-quantum-computing/','elopments in Quantum Computing Impact Bitcoin','Quantum computing might be closer than we thought, thanks to a series of newly developed scientific methods. Furthermore, a new implementation of Shor’s algorithm increases the urgency of getting Bitcoin ready for the advent of quantum computing.? Also read: NIST Starts Developing Quantum-Resistant Cryptography Standards Quantum Computing Breakthroughs At present, Bitcoin is obviously resistant to all known?types of cyberattacks. However, according to...','December 5, 2016','https://news.bitcoin.com/wp-content/uploads/2016/12/shutterstock_473066947-640x480.jpg','Julio Gil-Pulgar');
INSERT INTO ABROAD_SCRAP(USER_NUM, ABROAD_SCRAP_URL, ABROAD_SCRAP_TITLE, ABROAD_SCRAP_DESCRIPTION, ABROAD_SCRAP_PUBDATE, ABROAD_SCRAP_IMG_URL, ABROAD_SCRAP_WRITER)
VALUES(3,'https://news.bitcoin.com/bitcoin-ready-quantum-computing/','elopments in Quantum Computing Impact Bitcoin','Quantum computing might be closer than we thought, thanks to a series of newly developed scientific methods. Furthermore, a new implementation of Shor’s algorithm increases the urgency of getting Bitcoin ready for the advent of quantum computing.? Also read: NIST Starts Developing Quantum-Resistant Cryptography Standards Quantum Computing Breakthroughs At present, Bitcoin is obviously resistant to all known?types of cyberattacks. However, according to...','December 5, 2016','https://news.bitcoin.com/wp-content/uploads/2016/12/shutterstock_473066947-640x480.jpg','Julio Gil-Pulgar');

INSERT INTO ABROAD_SCRAP(USER_NUM, ABROAD_SCRAP_URL, ABROAD_SCRAP_TITLE, ABROAD_SCRAP_DESCRIPTION, ABROAD_SCRAP_PUBDATE, ABROAD_SCRAP_IMG_URL, ABROAD_SCRAP_WRITER)
VALUES(1,'https://news.bitcoin.com/blockchain-matters-interview-bobby-lee/','‘Only One Blockchain Matters’ an Interview With Bobby Lee','This week BTCC CEO, Bobby Lee, posted a compelling Tweet and was not afraid to voice his view in full support of the Bitcoin Blockchain. Also read:?Bitcoin Exchanges Reveal ‘Real’ USD/CNY Rates, Says Bobby Lee A Conversation with BTCC CEO, Bobby Lee I had the chance to interview Bobby Lee for an in-depth look at why this industry leader continues to stand...','December 10, 2016','https://news.bitcoin.com/wp-content/uploads/2016/12/Only-One-Blockchain-Matters-an-Interview-With-Bobby-Lee-640x480.jpg','Elizabeth McCauley');
INSERT INTO ABROAD_SCRAP(USER_NUM, ABROAD_SCRAP_URL, ABROAD_SCRAP_TITLE, ABROAD_SCRAP_DESCRIPTION, ABROAD_SCRAP_PUBDATE, ABROAD_SCRAP_IMG_URL, ABROAD_SCRAP_WRITER)
VALUES(2,'https://news.bitcoin.com/blockchain-matters-interview-bobby-lee/','‘Only One Blockchain Matters’ an Interview With Bobby Lee','This week BTCC CEO, Bobby Lee, posted a compelling Tweet and was not afraid to voice his view in full support of the Bitcoin Blockchain. Also read:?Bitcoin Exchanges Reveal ‘Real’ USD/CNY Rates, Says Bobby Lee A Conversation with BTCC CEO, Bobby Lee I had the chance to interview Bobby Lee for an in-depth look at why this industry leader continues to stand...','December 10, 2016','https://news.bitcoin.com/wp-content/uploads/2016/12/Only-One-Blockchain-Matters-an-Interview-With-Bobby-Lee-640x480.jpg','Elizabeth McCauley');


INSERT INTO ABROAD_SCRAP(USER_NUM, ABROAD_SCRAP_URL, ABROAD_SCRAP_TITLE, ABROAD_SCRAP_DESCRIPTION, ABROAD_SCRAP_PUBDATE, ABROAD_SCRAP_IMG_URL, ABROAD_SCRAP_WRITER)
VALUES(1,'https://news.bitcoin.com/countries-priming-bitcoin-demand/','Four Countries Priming Bitcoin Demand Worldwide','The global economy is currently facing an enormous shift as many countries are burdened with massive debt, resource shortages, and failing fiat currencies. A lot of banks worldwide are folding while the central banks try to fix markets by printing vast sums of money and lowering interest rates. However, more and more global citizens are finding a hedge from...','December 4, 2016','https://news.bitcoin.com/wp-content/uploads/2016/12/Four-Countries-Priming-Bitcoin-Demand-Worldwide-640x480.jpg','Jamie Redman');


#SELECT * FROM ABROAD_SCRAP;
#딜러페이지 더미
INSERT INTO DEALER_PAGE(USER_NUM, CATEGORY) VALUES(11, '이것이 비트코인이다');
INSERT INTO DEALER_PAGE(USER_NUM, CATEGORY) VALUES(12, '비트코인이 궁금하다');
INSERT INTO DEALER_PAGE(USER_NUM, CATEGORY) VALUES(13, '박근혜 누가 뽑았냐');
INSERT INTO DEALER_PAGE(USER_NUM, CATEGORY) VALUES(14, '이것이 진짜 비트코인이다');
INSERT INTO DEALER_PAGE(USER_NUM, CATEGORY) VALUES(15, '비트코인이 진짜 궁금하다');
INSERT INTO DEALER_PAGE(USER_NUM, CATEGORY) VALUES(16, '박근혜 왜 뽑았냐');
INSERT INTO DEALER_PAGE(USER_NUM, CATEGORY) VALUES(17, '이것이 정말 비트코인이다');
INSERT INTO DEALER_PAGE(USER_NUM, CATEGORY) VALUES(18, '비트코인이 정말 궁금하다');
INSERT INTO DEALER_PAGE(USER_NUM, CATEGORY) VALUES(19, '박근혜 털 뽑았냐');
INSERT INTO DEALER_PAGE(USER_NUM, CATEGORY) VALUES(20, '이것이 레알 비트코인이다');
INSERT INTO DEALER_PAGE(USER_NUM, CATEGORY) VALUES(21, '비트코인이 레알 궁금하다');
INSERT INTO DEALER_PAGE(USER_NUM, CATEGORY) VALUES(22, '박근혜 머리털 뽑았냐');
INSERT INTO DEALER_PAGE(USER_NUM, CATEGORY) VALUES(23, '박근혜 이빨 뽑았냐');
INSERT INTO DEALER_PAGE(USER_NUM, CATEGORY) VALUES(24, '박근혜 카드 뽑았냐');
INSERT INTO DEALER_PAGE(USER_NUM, CATEGORY) VALUES(25, '박근혜 경북이 뽑았냐');

#SELECT * FROM DEALER_PAGE;

#딜러 사진
INSERT INTO DEALER_PHOTO(DEALER_PAGE_NUM, USER_NUM, ORIGINAL_FILE_NAME, STORED_FILE_NAME) VALUES(1, 11, '내얼굴', 'ASDGASG');
INSERT INTO DEALER_PHOTO(DEALER_PAGE_NUM, USER_NUM, ORIGINAL_FILE_NAME, STORED_FILE_NAME) VALUES(2, 12, '내얼굴', 'ZCXBZCB');
INSERT INTO DEALER_PHOTO(DEALER_PAGE_NUM, USER_NUM, ORIGINAL_FILE_NAME, STORED_FILE_NAME) VALUES(3, 13, '내얼굴', 'ASDGF');
INSERT INTO DEALER_PHOTO(DEALER_PAGE_NUM, USER_NUM, ORIGINAL_FILE_NAME, STORED_FILE_NAME) VALUES(4, 14, '내얼굴', 'ERFDXAGFA');
INSERT INTO DEALER_PHOTO(DEALER_PAGE_NUM, USER_NUM, ORIGINAL_FILE_NAME, STORED_FILE_NAME) VALUES(5, 15, '내얼굴', 'XCVBX');
INSERT INTO DEALER_PHOTO(DEALER_PAGE_NUM, USER_NUM, ORIGINAL_FILE_NAME, STORED_FILE_NAME) VALUES(6, 16, '내얼굴', 'DFGSDFG');
INSERT INTO DEALER_PHOTO(DEALER_PAGE_NUM, USER_NUM, ORIGINAL_FILE_NAME, STORED_FILE_NAME) VALUES(7, 17, '내얼굴', 'XCVBSDF');
INSERT INTO DEALER_PHOTO(DEALER_PAGE_NUM, USER_NUM, ORIGINAL_FILE_NAME, STORED_FILE_NAME) VALUES(8, 18, '내얼굴', 'AS23RF');
INSERT INTO DEALER_PHOTO(DEALER_PAGE_NUM, USER_NUM, ORIGINAL_FILE_NAME, STORED_FILE_NAME) VALUES(9, 19, '내얼굴', 'VCXB34');
INSERT INTO DEALER_PHOTO(DEALER_PAGE_NUM, USER_NUM, ORIGINAL_FILE_NAME, STORED_FILE_NAME) VALUES(10, 20, '내얼굴', 'CVXBSDF');

#딜러 메인 
INSERT INTO DEALER_MAIN(DEALER_PAGE_NUM, USER_NUM, ORIGINAL_FILE_NAME, STORED_FILE_NAME) VALUES(1, 11, '내대문', 'ASDGASG');
INSERT INTO DEALER_MAIN(DEALER_PAGE_NUM, USER_NUM, ORIGINAL_FILE_NAME, STORED_FILE_NAME) VALUES(2, 12, '내대문', 'XVCBSRG');
INSERT INTO DEALER_MAIN(DEALER_PAGE_NUM, USER_NUM, ORIGINAL_FILE_NAME, STORED_FILE_NAME) VALUES(3, 13, '내대문', 'ERGT435T');
INSERT INTO DEALER_MAIN(DEALER_PAGE_NUM, USER_NUM, ORIGINAL_FILE_NAME, STORED_FILE_NAME) VALUES(4, 14, '내대문', 'VCXB354');
INSERT INTO DEALER_MAIN(DEALER_PAGE_NUM, USER_NUM, ORIGINAL_FILE_NAME, STORED_FILE_NAME) VALUES(5, 15, '내대문', '234GV ');
INSERT INTO DEALER_MAIN(DEALER_PAGE_NUM, USER_NUM, ORIGINAL_FILE_NAME, STORED_FILE_NAME) VALUES(6, 16, '내대문', 'VCXN5');
INSERT INTO DEALER_MAIN(DEALER_PAGE_NUM, USER_NUM, ORIGINAL_FILE_NAME, STORED_FILE_NAME) VALUES(7, 17, '내대문', 'ASDG46TFG43Q2ASG');
INSERT INTO DEALER_MAIN(DEALER_PAGE_NUM, USER_NUM, ORIGINAL_FILE_NAME, STORED_FILE_NAME) VALUES(8, 18, '내대문', 'ASDGDSFHSDASG');
INSERT INTO DEALER_MAIN(DEALER_PAGE_NUM, USER_NUM, ORIGINAL_FILE_NAME, STORED_FILE_NAME) VALUES(9, 19, '내대문', 'ASDGA235SG');
INSERT INTO DEALER_MAIN(DEALER_PAGE_NUM, USER_NUM, ORIGINAL_FILE_NAME, STORED_FILE_NAME) VALUES(10, 20, '내대문', 'ASDGCXVNBASG');

#SELECT * FROM DEALER_MAIN;

#전문소식 더미
INSERT INTO DEALER_NEWS(DEALER_PAGE_NUM, USER_NUM, TITLE, CONTENT) VALUES(1, 11, '비둘기에게 먹이를 주지마세요', '비둘기 박멸');
INSERT INTO DEALER_NEWS(DEALER_PAGE_NUM, USER_NUM, TITLE, CONTENT) VALUES(1, 11, '비둘기에게 제발 먹이를 주지마세요', '비둘기 박멸');
INSERT INTO DEALER_NEWS(DEALER_PAGE_NUM, USER_NUM, TITLE, CONTENT) VALUES(1, 11, '비둘기에게 정말 먹이를 주지마세요', '비둘기 박멸');
INSERT INTO DEALER_NEWS(DEALER_PAGE_NUM, USER_NUM, TITLE, CONTENT) VALUES(1, 11, '비둘기에게 레알 먹이를 주지마세요', '비둘기 박멸');
INSERT INTO DEALER_NEWS(DEALER_PAGE_NUM, USER_NUM, TITLE, CONTENT) VALUES(1, 11, '비둘기에게 진짜 먹이를 주지마세요', '비둘기 박멸');
INSERT INTO DEALER_NEWS(DEALER_PAGE_NUM, USER_NUM, TITLE, CONTENT) VALUES(1, 11, '비둘기에게 제발 좀먹이를 주지마세요', '비둘기 박멸');
INSERT INTO DEALER_NEWS(DEALER_PAGE_NUM, USER_NUM, TITLE, CONTENT) VALUES(1, 11, '비둘기에게 절대 먹이를 주지마세요', '비둘기 박멸');
INSERT INTO DEALER_NEWS(DEALER_PAGE_NUM, USER_NUM, TITLE, CONTENT) VALUES(1, 11, '비둘기에게 시밤 먹이를 주지마세요', '비둘기 박멸');
INSERT INTO DEALER_NEWS(DEALER_PAGE_NUM, USER_NUM, TITLE, CONTENT) VALUES(1, 11, '비둘기에게 확실히 먹이를 주지마세요', '비둘기 박멸');
INSERT INTO DEALER_NEWS(DEALER_PAGE_NUM, USER_NUM, TITLE, CONTENT) VALUES(1, 11, '비둘기에게 제발좀 먹이를 주지마세요', '비둘기 박멸');
INSERT INTO DEALER_NEWS(DEALER_PAGE_NUM, USER_NUM, TITLE, CONTENT) VALUES(1, 11, '비둘기에게 먹이를 주지마세요', '비둘기 박멸');
INSERT INTO DEALER_NEWS(DEALER_PAGE_NUM, USER_NUM, TITLE, CONTENT) VALUES(1, 11, '비둘기에게 먹이를 주지마세요', '비둘기 박멸');
INSERT INTO DEALER_NEWS(DEALER_PAGE_NUM, USER_NUM, TITLE, CONTENT) VALUES(1, 11, '비둘기에게 먹이를 주지마세요', '비둘기 박멸');

INSERT INTO DEALER_NEWS(DEALER_PAGE_NUM, USER_NUM, TITLE, CONTENT) VALUES(2, 12, '비둘기에게 먹이를 주지마세요', '비둘기 박멸');
INSERT INTO DEALER_NEWS(DEALER_PAGE_NUM, USER_NUM, TITLE, CONTENT) VALUES(2, 12, '비둘기에게 먹이를 주지마세요', '비둘기 박멸');
INSERT INTO DEALER_NEWS(DEALER_PAGE_NUM, USER_NUM, TITLE, CONTENT) VALUES(2, 12, '비둘기에게 먹이를 주지마세요', '비둘기 박멸');
INSERT INTO DEALER_NEWS(DEALER_PAGE_NUM, USER_NUM, TITLE, CONTENT) VALUES(2, 12, '비둘기에게 먹이를 주지마세요', '비둘기 박멸');
INSERT INTO DEALER_NEWS(DEALER_PAGE_NUM, USER_NUM, TITLE, CONTENT) VALUES(2, 12, '비둘기에게 먹이를 주지마세요', '비둘기 박멸');
INSERT INTO DEALER_NEWS(DEALER_PAGE_NUM, USER_NUM, TITLE, CONTENT) VALUES(2, 12, '비둘기에게 먹이를 주지마세요', '비둘기 박멸');
INSERT INTO DEALER_NEWS(DEALER_PAGE_NUM, USER_NUM, TITLE, CONTENT) VALUES(2, 12, '비둘기에게 먹이를 주지마세요', '비둘기 박멸');
INSERT INTO DEALER_NEWS(DEALER_PAGE_NUM, USER_NUM, TITLE, CONTENT) VALUES(2, 12, '비둘기에게 먹이를 주지마세요', '비둘기 박멸');
INSERT INTO DEALER_NEWS(DEALER_PAGE_NUM, USER_NUM, TITLE, CONTENT) VALUES(2, 12, '비둘기에게 먹이를 주지마세요', '비둘기 박멸');
INSERT INTO DEALER_NEWS(DEALER_PAGE_NUM, USER_NUM, TITLE, CONTENT) VALUES(2, 12, '비둘기에게 먹이를 주지마세요', '비둘기 박멸');
INSERT INTO DEALER_NEWS(DEALER_PAGE_NUM, USER_NUM, TITLE, CONTENT) VALUES(2, 12, '비둘기에게 먹이를 주지마세요', '비둘기 박멸');
INSERT INTO DEALER_NEWS(DEALER_PAGE_NUM, USER_NUM, TITLE, CONTENT) VALUES(2, 12, '비둘기에게 먹이를 주지마세요', '비둘기 박멸');

#SELECT * FROM DEALER_NEWS;

#댓글 더미

INSERT INTO REPLY(DEALER_NEWS_NUM, PARENT_REPLY_NUM, USER_NUM, CONTENT, RANK, INDENT) VALUES(1, 1, 1, '비둘기', 0, 0);
INSERT INTO REPLY(DEALER_NEWS_NUM, PARENT_REPLY_NUM, USER_NUM, CONTENT, RANK, INDENT) VALUES(1, 1, 2, '뮤탈리스크', 1, 1);
INSERT INTO REPLY(DEALER_NEWS_NUM, PARENT_REPLY_NUM, USER_NUM, CONTENT, RANK, INDENT) VALUES(1, 1, 1, '변이', 3, 1);
INSERT INTO REPLY(DEALER_NEWS_NUM, PARENT_REPLY_NUM, USER_NUM, CONTENT, RANK, INDENT) VALUES(1, 1, 2, '코쿤', 4, 2);
INSERT INTO REPLY(DEALER_NEWS_NUM, PARENT_REPLY_NUM, USER_NUM, CONTENT, RANK, INDENT) VALUES(1, 1, 1, '스컬지', 2, 2);

INSERT INTO REPLY(DEALER_NEWS_NUM, PARENT_REPLY_NUM, USER_NUM, CONTENT, RANK, INDENT) VALUES(1, 6, 1, '드랍쉽', 0, 0);
INSERT INTO REPLY(DEALER_NEWS_NUM, PARENT_REPLY_NUM, USER_NUM, CONTENT, RANK, INDENT) VALUES(1, 6, 2, '스컬지', 1, 1);
INSERT INTO REPLY(DEALER_NEWS_NUM, PARENT_REPLY_NUM, USER_NUM, CONTENT, RANK, INDENT) VALUES(1, 6, 3, '드랍', 3, 1);
INSERT INTO REPLY(DEALER_NEWS_NUM, PARENT_REPLY_NUM, USER_NUM, CONTENT, RANK, INDENT) VALUES(1, 6, 3, '마인밭', 2, 2);

#SELECT * FROM REPLY;

#전문소식 더미
INSERT INTO DEALER_NEWS_FILE(DEALER_NEWS_NUM, ORIGINAL_FILE_NAME, STORED_FILE_NAME) VALUES(1, 'GUGUGU', 'ZXG890723U');


COMMIT;




