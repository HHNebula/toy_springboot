CREATE DATABASE toy_springboot DEFAULT CHARACTER SET UTF8 COLLATE UTF8_GENERAL_CI;

use toy_springboot;

SET sql_mode='';

CREATE TABLE ADMINS
(
ADMINUID VARCHAR(255) NOT NULL COMMENT '유니크 아이디',
ID       VARCHAR(255) NOT NULL COMMENT '아이디',
PW       VARCHAR(255) NOT NULL COMMENT '비밀번호',
PRIMARY KEY (ADMINUID)
) COMMENT '관리자들';

CREATE TABLE ANSWERS
(
AUID   VARCHAR(255) NOT NULL COMMENT '유니크 아이디',
ANSWER VARCHAR(255) NOT NULL COMMENT '응답 내용',
ORDERS VARCHAR(255) NOT NULL COMMENT '순서',
PRIMARY KEY (AUID)
) COMMENT '응답들';

CREATE TABLE CARS
(
CUID  VARCHAR(255) NOT NULL COMMENT '유니크 아이디',
BRAND VARCHAR(255) NOT NULL COMMENT '브랜드',
MODEL VARCHAR(255) NOT NULL COMMENT '모델',
PRIMARY KEY (CUID)
) COMMENT '자동차들';

CREATE TABLE CRITERION
(
QUID VARCHAR(255) NOT NULL COMMENT '유니크 아이디'
) COMMENT '차량 선택 기준';

CREATE TABLE MEMBERS
(
MUID        VARCHAR(255) NOT NULL COMMENT '유니크 아이디',
ID          VARCHAR(255) NOT NULL COMMENT '아이디',
PW          VARCHAR(255) NOT NULL COMMENT '비밀번호',
NICK_NAME   VARCHAR(255) NOT NULL COMMENT '닉네임',
ALLOW_LOGIN VARCHAR(255) NOT NULL COMMENT '로그인 허용',
CUID        VARCHAR(255) NOT NULL COMMENT '유니크 아이디',
PRIMARY KEY (MUID)
) COMMENT '멤버들';

CREATE TABLE QUESTIONS
(
QUID     VARCHAR(255) NOT NULL COMMENT '유니크 아이디',
QUESTION VARCHAR(255) NOT NULL COMMENT '질문 내용',
ORDERS   VARCHAR(255) NOT NULL COMMENT '순서',
PRIMARY KEY (QUID)
) COMMENT '질문들';

CREATE TABLE SURVEY_STATUS
(
QUID VARCHAR(255) NOT NULL COMMENT '유니크 아이디',
AUID VARCHAR(255) NOT NULL COMMENT '유니크 아이디',
CUID VARCHAR(255) NOT NULL COMMENT '유니크 아이디'
) COMMENT '설문 현황들';

ALTER TABLE SURVEY_STATUS
ADD CONSTRAINT FK_QUESTIONS_TO_SURVEY_STATUS
FOREIGN KEY (QUID)
REFERENCES QUESTIONS (QUID);

ALTER TABLE SURVEY_STATUS
ADD CONSTRAINT FK_ANSWERS_TO_SURVEY_STATUS
FOREIGN KEY (AUID)
REFERENCES ANSWERS (AUID);

ALTER TABLE SURVEY_STATUS
ADD CONSTRAINT FK_CARS_TO_SURVEY_STATUS
FOREIGN KEY (CUID)
REFERENCES CARS (CUID);

ALTER TABLE MEMBERS
ADD CONSTRAINT FK_CARS_TO_MEMBERS
FOREIGN KEY (CUID)
REFERENCES CARS (CUID);

ALTER TABLE CRITERION
ADD CONSTRAINT FK_QUESTIONS_TO_CRITERION
FOREIGN KEY (QUID)
REFERENCES QUESTIONS (QUID);
