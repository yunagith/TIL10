/*
CSV 파일의 데이터를 읽어서 테이블 생성 : import
publisher
book
client
bookSale
데이터 타입 변경 : text -> VARCHAR()
모든 NO는 문자 타입
날짜는 DATE 타입
기본키 / 외래키 설정

*/
-- 스키마 새로 생성 : sql3
-- 데이터 타입 변경 : publisher
describe publisher;
alter table publisher modify pubNo varchar(30) not null,
						modify pubName varchar(30);
                        
-- 데이터 타입 변경 : book
describe book;
alter table book modify bookNo varchar(30) not null,
				modify bookName varchar(30),
                modify bookAuthor varchar(30),
                modify bookPrice int,
                modify bookDate date,
                modify bookStock int,
                modify pubNo varchar(30) not null;
                
-- 데이터 타입 변경 : client
describe client;
alter table client modify clientNo varchar(30) not null,
					modify clientName varchar(30),
                    modify clientphone varchar(30),
                    modify clientAddress varchar(30),
                    modify clientBirth date,
                    modify clientHobby varchar(30),
					modify clientGender varchar(10);
                    
-- 데이터 타입 변경 : bookSale
describe bookSale;
alter table bookSale modify bsNo varchar(30) not null,
					modify bsDate date,
					modify bsQty int,
                    modify clientNo varchar(30) not null,
                    modify bookNo varchar(30) not null;

-- 기본키/외래키 설정
-- 기본키 설정
-- publisher
alter table publisher
	add 
    primary key (pubNo);
    
-- book
alter table book
	add 
    primary key (bookNo);
    
-- client
alter table client
	add 
    primary key (clientNo);
    
-- bookSale
alter table bookSale
	add 
    primary key (bsNo);
    
-- 외래키 설정
alter table book
	add constraint FK_publisher_book
    foreign key (pubNo) references publisher (pubNo);
    
alter table bookSale
	add constraint FK_client_bookSale
    foreign key (clientNo) references client (clientNo);

alter table bookSale
	add constraint FK_book_bookSale
    foreign key (bookNo) references book (bookNo);

-- ------------------------
-- book 테이블에서 모든 행 검색하여 출력
-- 모든 (*) 열

-- 도서명과 가격만 검색하여 출력
select bookName, bookPrice from book;

-- 저자만 검색하여 출력
select bookAuthor from book;

-- 중복되는 행은 한번만 출력해서 저자만 검색
select distinct bookAuthor from book;

-- ---------------------------------
-- 비교 (==,<,>,<=,>=,!=)
-- 저자가 '홍길동'인 도서의 도서명, 저자 출력
select bookName, bookAuthor from book
where bookAuthor = '홍길동';

-- 가격이 30000 이상인 도서의 도서명, 가격, 재고 출력
select bookName, bookPrice, bookStock from book
where bookPrice>= 30000;

-- 재고가 3개에서 5개 사이인 도서의 도서명, 재고 출력
-- (1)
select bookName, bookStock from book
where bookStock >= 3 and bookStock <= 5;
-- (2) between 3 and 5 : 3과 5 포함 (범위)
select bookName, bookStock from book
where bookStock between 3 and 5;

-- 리스트에 포함 (in, not in)
-- 출판사명이 '서울 출판사'(pubNo='1')와 '도서출판 강남'(pubNo='2')인 도서의
-- 도서명, 출판사 번호 출력
select bookName, pubNo from book
where pubNo in('1','2');

-- 출판사명이 '도서출판 강남'이 아닌 도서의
-- 도서명, 출판사 출력
select bookName, pubNo from book
where pubNo not in ('2');

-- null ( is null, is not null)

-- 먼저 client 테이블 확인 : null 값 없음
select * from client;

-- null로 설정
-- 고객명 호날두와 샤라포바의 취미를 null로 설정
update client set clientHobby = null
where clientName = '호날두';

update client set clientHobby = null
where clientName = '샤라포바';

-- 또는
update client set clientHobby = null
where clientName in ('샤라포바','호날두');

--  모든 고객명, 취미 출력
select clientName, clientHobby from client;

-- 취미에 null 값이 들어 있는 행만 출력
select clientName, clientHobby from client
where clientHobby is null;

-- 취미에 null 값이 아닌 행만 출력
select clientName, clientHobby from client
where clientHobby is not null;

-- 취미에 공백이 들어 있는 행만 출력
select clientName, clientHobby from client
where clientHobby = ''; -- 스페이스 (개 수 상관 없음)

-- 논리 (and, or)
select bookName, bookStock from book;
-- 저자가 '홍길동' 이면서 재고 3권 이상인 모든 도서 출력
select * from book
where bookAuthor='홍길동' and bookStock >= 3 ;

-- 저자가 '홍길동' 이거나 '성춘향'인 모든 도서 출력
select * from book
where bookAuthor ='홍길동' or bookAuthor = '성춘향' ;

-- 패턴 매칭

-- 출판사 테이블에서 출판사명에 '출판사'가 포함된 모든 행 출력
select * from publisher
where pubName like '%출판사%';

-- 고객 테이블에서 출생년도가 1990년인 고객의 고객명, 생년월일 출력
select clientName, clientBirth from client
where clientBirth like '199%';

-- 고객 이름이 4글자인 모든 고객 출력
select * from client
where clientName like '____';

-- 도서 테이블에서 도서명에 '안드로이드'가 들어가있지 않는 도서의 도서명 출력
select * from book
where bookName not like '%안드로이드%'; 

