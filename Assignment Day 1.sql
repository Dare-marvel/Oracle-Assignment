-- Query 1
select * from BOOKS where AUTHOR_NAME='Paulo Coelho' and cost < 600;

-- Query 2 (Checked for null return date)
SELECT * 
FROM Issue 
WHERE Return_date IS NULL;

-- Query 3
UPDATE Issue 
SET Return_date = DATE '2006-12-31' 
WHERE Return_date IS NULL 
AND Member_Id NOT IN (7005, 7006);

-- Query 4
update issue 
set RETURN_DATE='24-AUG-2024' 
where BOOK_NO='100001' and MEMBER_ID='10009';
select * from issue;
select * from issue where RETURN_DATE-ISSUE_DATE > 30;

-- Query 5
select * from books;
UPDATE books
SET cost = (SELECT DBMS_RANDOM.VALUE(400, 750) FROM DUAL)
WHERE category = 'Computer';

-- Actual Query
select * from books where 
cost >= 500 and cost <= 750 and category='Computer';

-- Query 6
select * from books WHERE
category in ('Science','Database','Fiction','Management');

-- Query 7
select * from member;
order by fees_paid desc;

-- Query 8
select * from books
order by category asc,cost desc;

-- Query 9
select * from books
INSERT INTO Books VALUES (100006, 'The Complete SQL Mastery', 'Adwait Purao', 500.99, 'Database');
-- Actual Query
select * FROM books where
book_name like '%SQL%';

-- Query 10
select * from member
INSERT INTO Member VALUES (10017, 'Rahul Gandhi', '741 Mickey Street, Delhi', DATE '2024-10-25', 'Annual', 1300, 6, 0);
SELECT *
FROM member
WHERE REGEXP_LIKE(member_name, '^[rg].*i', 'i');

-- Query 11
SELECT INITCAP(Book_Name) AS Book_Name,
       UPPER(Author_name) AS Author_Name
FROM Books
ORDER BY Book_Name DESC;

-- Query 12
select LIB_ISSUE_ID,BOOK_NO,TO_CHAR(ISSUE_DATE, 'Day, Month, DD, YYYY'),TO_CHAR(RETURN_DATE, 'Day, Month, DD, YYYY') from issue where MEMBER_ID='10001'


-- Query 13
select book_no,book_name,AUTHOR_NAME,cost,substr(CATEGORY,1,1) as Category from Books

-- Query 14
select * from member where EXTRACT(YEAR FROM acc_open_date)=2023

-- Query 15
SELECT
  BOOK_NO,
  SUM(return_date - issue_date) AS no_of_days_book_issued
FROM issue
GROUP BY
  BOOK_NO;

-- Query 16
select * from member 
order by(acc_open_date);

-- Query 17
select * from issue
select count(book_no) from issue where 
MEMBER_ID='10001';

-- Query 18
select member_name,penalty_amount from member;

-- Query 19
select count(member_id) from member;

-- Query 20
select count(book_no) from books;

-- Query 21
select avg(fees_paid) from member;

-- Query 22
select LIB_ISSUE_ID,book_no,member_id,MONTHS_BETWEEN(return_date, issue_date) as month_difference from issue;

-- Query 23
select member_id,member_name,length(member_name) as length_of_name from member;

-- Query 24
select member_id,member_name,substr(MEMBERSHIP_TYPE,1,5)  as MEMBERSHIP_TYPE from member;

-- Query 25
select LIB_ISSUE_ID,member_id,book_no,last_day(issue_date) as last_day_of_month from issue; 

