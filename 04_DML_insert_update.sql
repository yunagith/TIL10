CREATE TABLE book (
	bookNO CHAR(10) NOT NULL PRIMARY KEY,
    bookName VARCHAR(30) NOT NULL,
    bookPrice INT DEFAULT 10000 CHECK(bookPrice>1000),
    bookDate DATE,
    pubNo CHAR(10) NOT NULL,
    CONSTRAINT FK_book_publiser FOREIGN KEY (pubNo) REFERENCES publiser (pubNo)
    
);

create table publiser(
	pubNo CHAR(10) NOT NULL PRIMARY KEY,
    pubName VARCHAR(30) NOT NULL
);

-- publiser 테이블에 데이터 입력
insert into publiser (pubNo, pubName) values ('1','서울 출판사');
insert into publiser (pubNo, pubName) values ('2','강남 출판사');
insert into publiser (pubNo, pubName) values ('3','종로 출판사');

-- publiser 테이블 내용 조회
select * from publiser;
select * from book;

-- book 테이블에 데이터 입력
insert into book (bookNo, bookName, bookPrice, bookDate, pubNo)
	values ('1','자바','20000','2022-01-03','1');
    
-- 모든 열에 데이터 입력 시 열 이름 생략 가능
insert into book 
	values ('2','자바스크립트','23000','2022-01-03','3');
    
-- 여러 개의 데이터를 한 번에 insert
insert into book (bookNo, bookName, bookPrice, bookDate, pubNo)
	values ('3','자바','20000','2022-01-03','2'),
			('4','알고리즘','15000','2022-01-15','3'),
            ('5','웹프로그래밍','10000','2022-01-03','2');
            
-- 모든 열에 데이터 입력 시 데이터 생략 : 여러 개 한 번에 insert
insert into book 
	values ('6','자바','20000','2022-01-03','2'),
			('7','알고리즘','15000','2022-01-15','3'),
            ('8','웹프로그래밍','10000','2022-01-03','2');

-- insert문 연습문제
create table student (
	stuNo char(10) NOT NULL PRIMARY KEY,
    stuName varchar(30),
    stuGrade INT DEFAULT 4 CHECK(stuGrade>=1 and stuGrade<=4),
    stuBd date,
    departmentCode CHAR(10) NOT NULL,
    CONSTRAINT dk_departmentCode_department FOREIGN KEY (departmentCode) REFERENCES department (departmentCode)
);

create table department(
	departmentCode CHAR(10) NOT NULL PRIMARY KEY,
    departmentName VARCHAR(30) NOT NULL,
    departmentCall CHAR(10) 
);

-- department 테이블에 데이터 입력
insert into department (departmentCode, departmentName) values ('1','물리');
insert into department (departmentCode, departmentName) values ('2','사회');
insert into department (departmentCode, departmentName) values ('3','예술');

-- insert 
insert into student (stuNo, stuName, stuGrade, stuBd, departmentCode)
	values ('1','김학생','1','2000-12-03','1'),
			('2','박학생','2','1999-01-15','3'),
            ('3','이학생','3','1998-03-03','2');
            
-- 테이블 내용 조회
select * from department;
select * from student;

describe product;

alter table product modify prdNo varchar(10) not null;

alter table product 
	add constraint pk_product_prdNo
    primary key (prdNo);
    
-- 모든 텍스트 타입을  varchar 타입으로 변경
alter table product modify prdName varchar(20),
					modify prdMaker varchar(30),
                    modify prdColo varchar(20),
                    modify ctgNo varchar(10);
                    
-- 상품번호가 5인 행의 상품명을 ‘UHD TV’로 수정
UPDATE product SET prdName='UHD TV' WHERE prdNo='5';



-- 상품명이 '그늘막 텐트'인 행 삭제
delete from product where prdName='그늘막 텐트';

-- 연습문제
-- 테이블 조회
select * from book;
select * from publiser;

-- 1. book 테이블에 다음과 같이 행 삽입
insert into book (bookNo, bookName, bookPrice, bookDate, pubNo)
	values ('9','JAVA 프로그래밍','30000','2022-03-10','1'),
			('10','파이썬 데이터 과학','24000','2021-02-05','2');
            
-- 2. book 테이블에서 도서명이 ‘자바’인 행의 가격을 22000으로 변경
UPDATE book SET bookPrice='22000' WHERE bookNo='1';

-- 3. book 테이블에서 발행일이 2021년도인 행 삭제
delete from book where bookDate>='2021-01-01' and bookDate<='2021-12-31';

-- 종합 연습문제
-- 테이블 조회
select * from customer;

-- 1. 고객 테이블 생성
create table customer (
	customerNo char(10) NOT NULL PRIMARY KEY,
    customerName varchar(30),
    customerCall varchar(30),
    customerDate date
);

-- 2. 고객 테이블의 전화번호 열을 not null로 변경
alter table customer modify customerCall varchar(30) not null;

-- 3. 고객 테이블에 '성별','나이' 추가
alter table customer 
	add customerAge varchar(10),
	add customerGender varchar(10);
    
-- 4. 고객 테이블에 데이터 삽입 3개
insert into customer (customerNo, customerName, customerCall, customerDate, customerAge, customerGender)
	values ('1','홍길동','010-1234-5678','2000-03-10','23','여'),
			('2','이손님','010-1234-5678','2008-04-15','15','여'),
			('3','박손님','010-4567-8945','1999-02-05','24','남');
            
-- 5. 고객명이 '홍길동'인 고객의 전화번호 값 수정
UPDATE customer SET customerCall='010-7878-5656' WHERE customerName='홍길동';

-- 6. 나이가 20살 미만인 고객 삭제
delete from customer where customerAge < '20';
-- ----------------------------------------------







