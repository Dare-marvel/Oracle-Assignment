-- Query 1
CREATE TABLE Member (
    Member_Id NUMBER(5) ,
    Member_Name VARCHAR2(30),
    Member_address VARCHAR2(50),
    Acc_Open_Date DATE,
    Membership_type VARCHAR2(20),
    Fees_paid NUMBER(4),
    Max_Books_Allowed NUMBER(2),
    Penalty_Amount NUMBER(7,2) DEFAULT 0
);

CREATE TABLE Books (
    Book_No NUMBER(6) ,
    Book_Name VARCHAR2(30),
    Author_name VARCHAR2(30),
    Cost NUMBER(7,2),
    Category CHAR(10)
);

CREATE TABLE Issue (
    Lib_Issue_Id NUMBER(10),
    Book_No NUMBER(6),
    Member_Id NUMBER(5),
    Issue_Date DATE,
    Return_date DATE,
);

-- Query 2
select * from books;
select * from MEMBER;
select * from issue;

-- Query 3 ( table member can't be dropped as it is as it has foreign key referenced by issue so need to delete that first)
drop table issue;
drop table member;

-- Query 4
CREATE TABLE Member (
    Member_Id NUMBER(5) PRIMARY KEY,
    Member_Name VARCHAR2(30) NOT NULL,
    Member_address VARCHAR2(50),
    Acc_Open_Date DATE,
    Membership_type VARCHAR2(20) 
        CONSTRAINT chk_membership_type 
        CHECK (Membership_type IN ('Lifetime', 'Annual', 'Half Yearly', 'Quarterly')),
    Fees_paid NUMBER(4),
    Max_Books_Allowed NUMBER(2),
    Penalty_Amount NUMBER(7,2) DEFAULT 0
);

-- IF you already had this 
-- Add CHECK constraint to existing Member table
ALTER TABLE Member 
ADD CONSTRAINT chk_membership_type 
CHECK (Membership_type IN ('Lifetime', 'Annual', 'Half Yearly', 'Quarterly'));

-- Query 5
ALTER TABLE member
MODIFY member_name varchar2(30);

-- Query 6
CREATE TABLE Issue (
    Lib_Issue_Id NUMBER(10) PRIMARY KEY,
    Book_No NUMBER(6),
    Member_Id NUMBER(5),
    Issue_Date DATE,
    Return_date DATE,
    FOREIGN KEY (Book_No) REFERENCES Books(Book_No),
    FOREIGN KEY (Member_Id) REFERENCES Member(Member_Id)
);

ALTER TABLE issue
ADD Reference char(30);

-- Query 7
ALTER TABLE issue
DROP COLUMN Reference;

-- Query 8
RENAME issue TO lib_issue;

TRUNCATE TABLE member;
-- Query 9
INSERT INTO Member VALUES (1, 'Richa Sharma', 'Pune','10-Dec-05', 'Lifetime', 2500, 5, 50);
INSERT INTO Member VALUES (2, 'Garima Sen', 'Pune', CURRENT_DATE, 'Annual', 1000, 3, NULL);

-- QUERY 10
INSERT INTO Member VALUES (3, 'John Smith', '123 Oak Street, Mumbai', '11-Nov-05', 'Annual', 1200, 5, 0);
INSERT INTO Member VALUES (4, 'Sarah Johnson', '456 Pine Avenue, Delhi',  '12-Dec-05', 'Lifetime', 5000, 10, 25.50);
INSERT INTO Member VALUES (5, 'Mike Wilson', '789 Elm Road, Bangalore',  '13-Jan-05', 'Half Yearly', 600, 3, 0);
INSERT INTO Member VALUES (6, 'Emma Brown', '321 Maple Lane, Chennai',  '14-Feb-05', 'Quarterly', 300, 2, 15.00);
INSERT INTO Member VALUES (7, 'David Lee', '654 Cedar Drive, Hyderabad',  '15-Mar-05', 'Annual', 1200, 5, 0);
INSERT INTO Member VALUES (8, 'Lisa Davis', 'Pune',  '16-Apr-05', 'Lifetime', 5000, 10, 0);

-- Query 11
ALTER TABLE Member
MODIFY member_name varchar(2);

-- Reason why it's not working --> cannot decrease column length because some value is too big

-- Query 12
INSERT INTO Member VALUES (8, 'Lisa Davis', 'Pune',  '16-Apr-05', 'Lifetime', 5000, 110, 0);

-- Reason why it's not working --> value 110 greater than specified precision (2, 0) for column 

-- Query 13
CREATE TABLE member101 AS SELECT * FROM member;

-- Query 14
ALTER TABLE Member 
ADD CONSTRAINT chk_max_books_allowed
CHECK (max_books_allowed  < 100);

ALTER TABLE Member 
ADD CONSTRAINT penalty_amt_max
CHECK (penalty_amount < 100);

-- Query 15
drop table lib_issue;
drop table books;

-- Query 16
CREATE TABLE Books (
    Book_No NUMBER(6) constraint book_no_pk PRIMARY KEY,
    Book_Name VARCHAR2(30) constraint book_name_notnull NOT NULL,
    Author_name VARCHAR2(30),
    Cost NUMBER(7,2),
    Category VARCHAR2(20) 
        CONSTRAINT chk_category
        CHECK (Category IN ('Science', 'Fiction', 'Database', 'RDBMS','Others','System'))
);


-- Query 17
INSERT INTO Books VALUES (101, 'Let us C', 'Denis Ritchie', 450, 'System');
INSERT INTO Books VALUES (102, 'Oracle - Complete Ref', 'Loni', 550.00, 'Database');
INSERT INTO Books VALUES (103, 'Mastering SQL', 'Loni', 250, 'Database');
INSERT INTO Books VALUES (104, 'PL SQL-Ref', 'Scott Urman', 750, 'Database');

-- Query 18
INSERT INTO Books VALUES (&Book_No, '&Book_Name', '&Author_name', &Cost, '&Category');

-- Query 19
CREATE TABLE Book101 AS 
SELECT * FROM Books 
WHERE 1=0;

-- Query 20
INSERT INTO Book101 
SELECT * FROM Books;

-- Query 21
COMMIT;

-- Query 22
select * from tab;
select * from books;
select * from member;
select * from LIB_ISSUE;

-- Query 23
INSERT INTO Books VALUES (105, 'National Geographic', 'Adis Scott', 1000, 'Science');

-- Query 24
ROLLBACK;

-- Query 25
UPDATE books
SET cost = 300, category = 'RDBMS'
WHERE BOOK_NO=103;

-- Query 26
rename lib_issue to issue;

-- Query 27
drop table issue;

-- Query 28
CREATE TABLE Issue (
    Lib_Issue_Id NUMBER(10) CONSTRAINT lib_issue_pk PRIMARY KEY,
    Book_No      NUMBER(6),
    Member_Id    NUMBER(5),
    Issue_Date   DATE,
    Return_Date  DATE,
    CONSTRAINT issue_book_fk   FOREIGN KEY (Book_No)   REFERENCES Books(Book_No),
    CONSTRAINT issue_member_fk FOREIGN KEY (Member_Id) REFERENCES Member(Member_Id)
);

ALTER TABLE Issue
ADD CONSTRAINT CHECK_id_ld_rd CHECK (Issue_Date < Return_date);

-- Query 29
INSERT INTO Issue VALUES (7001, 101, 1, DATE '2006-12-10', NULL);
INSERT INTO Issue VALUES (7002, 102, 2, DATE '2006-12-25', NULL);
INSERT INTO Issue VALUES (7003, 104, 1, DATE '2006-01-15', NULL);
INSERT INTO Issue VALUES (7004, 101, 1, DATE '2006-07-04', NULL);
INSERT INTO Issue VALUES (7005, 104, 2, DATE '2006-11-15', NULL);
INSERT INTO Issue VALUES (7006, 101, 3, DATE '2006-02-18', NULL);

-- Query 30
COMMIT;

-- Query 31
ALTER TABLE issue DISABLE primary key ;
ALTER TABLE Issue DISABLE CONSTRAINT issue_book_fk;
ALTER TABLE Issue DISABLE CONSTRAINT issue_member_fk;

-- Query 32
INSERT INTO Issue VALUES (7007, 101, 9, DATE '2008-02-18', NULL);

-- Query 33
ALTER TABLE Issue ENABLE CONSTRAINT lib_issue_pk;
ALTER TABLE Issue ENABLE CONSTRAINT issue_book_fk;
ALTER TABLE Issue ENABLE CONSTRAINT issue_member_fk;

-- Error -> ORA-02298: cannot validate (SQL_VFBLMAI0BLALAIKREG9DIWKEBZ.ISSUE_MEMBER_FK) - parent keys not found

-- Query 34
DELETE FROM issue
WHERE MEMBER_ID=9;

ALTER TABLE Issue ENABLE CONSTRAINT lib_issue_pk;
ALTER TABLE Issue ENABLE CONSTRAINT issue_book_fk;
ALTER TABLE Issue ENABLE CONSTRAINT issue_member_fk;

-- Query 35
DELETE FROM MEMBER
WHERE MEMBER_ID=1;

-- Error -> ORA-02292: integrity constraint (SQL_VFBLMAI0BLALAIKREG9DIWKEBZ.ISSUE_MEMBER_FK) violated - child record found

-- Query 36
UPDATE Issue 
SET Return_date = Issue_Date + 15 
WHERE Lib_Issue_Id IN (7004, 7005);

-- Query 37
UPDATE Member 
SET Penalty_Amount = 100 
WHERE Member_Name = 'Garima Sen';

-- Query 38
SAVEPOINT X;

-- Query 39
DELETE FROM Issue 
WHERE Member_Id = 1 
AND Issue_Date < DATE '2006-12-10';

-- Query 40
DELETE FROM Books 
WHERE Category NOT IN ('RDBMS', 'Database');

-- Query 41
ROLLBACK TO SAVEPOINT X;

-- Query 42
COMMIT;

-- Query 43
DROP TABLE Member101;

-- Query 44
DROP TABLE Book101;

-- Query 45
-- Structure of Member table
DESC Member;
SELECT * FROM Member;

-- Structure of Issue table  
DESC Issue;
SELECT * FROM Issue;

-- Structure of Books table
DESC Books;
SELECT * FROM Books;

-- Query 46
CREATE SEQUENCE no_seq
START WITH 100
INCREMENT BY 2
MAXVALUE 200
NOCYCLE;

-- Query 47
DROP SEQUENCE no_seq;

-- Query 48
CREATE SEQUENCE book_seq
START WITH 101
INCREMENT BY 1
MAXVALUE 1000
NOCYCLE;

-- Query 49
CREATE SEQUENCE member_seq
START WITH 1
INCREMENT BY 1
MAXVALUE 100
NOCYCLE;

-- Query 50
DROP SEQUENCE book_seq;
DROP SEQUENCE member_seq;
