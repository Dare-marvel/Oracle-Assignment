-- Create Tables
CREATE TABLE Member (
    Member_Id NUMBER(5) PRIMARY KEY,
    Member_Name VARCHAR2(30) NOT NULL,
    Member_address VARCHAR2(50),
    Acc_Open_Date DATE,
    Membership_type VARCHAR2(20),
    Fees_paid NUMBER(4),
    Max_Books_Allowed NUMBER(2),
    Penalty_Amount NUMBER(7,2) DEFAULT 0
);

CREATE TABLE Books (
    Book_No NUMBER(6) PRIMARY KEY,
    Book_Name VARCHAR2(30) NOT NULL,
    Author_name VARCHAR2(30),
    Cost NUMBER(7,2),
    Category CHAR(10)
);

CREATE TABLE Issue (
    Lib_Issue_Id NUMBER(10) PRIMARY KEY,
    Book_No NUMBER(6),
    Member_Id NUMBER(5),
    Issue_Date DATE,
    Return_date DATE,
    FOREIGN KEY (Book_No) REFERENCES Books(Book_No),
    FOREIGN KEY (Member_Id) REFERENCES Member(Member_Id)
);

-- Insert sample data into Member table
INSERT INTO Member VALUES (10001, 'John Smith', '123 Oak Street, Mumbai', DATE '2023-01-15', 'Annual', 1200, 5, 0);
INSERT INTO Member VALUES (10002, 'Sarah Johnson', '456 Pine Avenue, Delhi', DATE '2023-02-20', 'Lifetime', 5000, 10, 25.50);
INSERT INTO Member VALUES (10003, 'Mike Wilson', '789 Elm Road, Bangalore', DATE '2023-03-10', 'Half Yearly', 600, 3, 0);
INSERT INTO Member VALUES (10004, 'Emma Brown', '321 Maple Lane, Chennai', DATE '2023-04-05', 'Quarterly', 300, 2, 15.00);
INSERT INTO Member VALUES (10005, 'David Lee', '654 Cedar Drive, Hyderabad', DATE '2023-05-12', 'Annual', 1200, 5, 0);
INSERT INTO Member VALUES (10006, 'Lisa Davis', '987 Birch Street, Pune', DATE '2023-06-18', 'Lifetime', 5000, 10, 0);
INSERT INTO Member VALUES (10007, 'Robert Taylor', '147 Spruce Road, Kolkata', DATE '2023-07-22', 'Half Yearly', 600, 3, 40.25);
INSERT INTO Member VALUES (10008, 'Jennifer Miller', '258 Willow Lane, Ahmedabad', DATE '2023-08-14', 'Annual', 1200, 5, 0);
INSERT INTO Member VALUES (10009, 'Michael Garcia', '369 Poplar Avenue, Jaipur', DATE '2023-09-30', 'Quarterly', 300, 2, 10.75);
INSERT INTO Member VALUES (10010, 'Ashley Martinez', '741 Hickory Street, Lucknow', DATE '2023-10-25', 'Annual', 1200, 5, 0);

-- Insert sample data into Books table
INSERT INTO Books VALUES (100001, 'The Alchemist', 'Paulo Coelho', 299.99, 'Fiction');
INSERT INTO Books VALUES (100002, 'To Kill a Mockingbird', 'Harper Lee', 450.00, 'Fiction');
INSERT INTO Books VALUES (100003, 'Physics Fundamentals', 'Dr. James Watson', 850.75, 'Science');
INSERT INTO Books VALUES (100004, 'Data Structures', 'Robert Sedgewick', 1200.00, 'Computer');
INSERT INTO Books VALUES (100005, 'Pride and Prejudice', 'Jane Austen', 350.50, 'Fiction');
INSERT INTO Books VALUES (100006, 'Calculus Made Easy', 'Silvanus Thompson', 675.25, 'Mathematics');
INSERT INTO Books VALUES (100007, 'The Great Gatsby', 'F. Scott Fitzgerald', 425.00, 'Fiction');
INSERT INTO Books VALUES (100008, 'Introduction to AI', 'Stuart Russell', 950.00, 'Computer');
INSERT INTO Books VALUES (100009, 'Organic Chemistry', 'Paula Bruice', 1150.75, 'Science');
INSERT INTO Books VALUES (100010, 'World History', 'William McNeill', 780.50, 'History');
INSERT INTO Books VALUES (100011, '1984', 'George Orwell', 320.00, 'Fiction');
INSERT INTO Books VALUES (100012, 'Database Systems', 'Ramez Elmasri', 1080.25, 'Computer');
INSERT INTO Books VALUES (100013, 'Molecular Biology', 'David Clark', 920.00, 'Science');
INSERT INTO Books VALUES (100014, 'Economics Principles', 'N. Gregory Mankiw', 1250.50, 'Economics');
INSERT INTO Books VALUES (100015, 'Shakespeare Complete', 'William Shakespeare', 600.75, 'Literature');

-- Insert sample data into Issue table
INSERT INTO Issue VALUES (1000000001, 100001, 10001, DATE '2024-01-15', DATE '2024-01-29');
INSERT INTO Issue VALUES (1000000002, 100003, 10002, DATE '2024-01-20', DATE '2024-02-10');
INSERT INTO Issue VALUES (1000000003, 100005, 10003, DATE '2024-02-05', DATE '2024-02-19');
INSERT INTO Issue VALUES (1000000004, 100007, 10004, DATE '2024-02-12', DATE '2024-03-05');
INSERT INTO Issue VALUES (1000000005, 100002, 10005, DATE '2024-02-18', DATE '2024-03-04');
INSERT INTO Issue VALUES (1000000006, 100009, 10006, DATE '2024-03-01', DATE '2024-03-15');
INSERT INTO Issue VALUES (1000000007, 100004, 10007, DATE '2024-03-10', DATE '2024-04-02');
INSERT INTO Issue VALUES (1000000008, 100011, 10008, DATE '2024-03-15', DATE '2024-03-29');
INSERT INTO Issue VALUES (1000000009, 100006, 10009, DATE '2024-03-22', DATE '2024-04-12');
INSERT INTO Issue VALUES (1000000010, 100013, 10010, DATE '2024-04-01', DATE '2024-04-15');
INSERT INTO Issue VALUES (1000000011, 100008, 10001, DATE '2024-04-08', DATE '2024-04-22');
INSERT INTO Issue VALUES (1000000012, 100012, 10002, DATE '2024-04-15', DATE '2024-05-06');
INSERT INTO Issue VALUES (1000000013, 100014, 10003, DATE '2024-04-20', DATE '2024-05-11');
INSERT INTO Issue VALUES (1000000014, 100010, 10005, DATE '2024-05-01', DATE '2024-05-15');
INSERT INTO Issue VALUES (1000000015, 100015, 10007, DATE '2024-05-10', NULL); -- Currently issued
INSERT INTO Issue VALUES (1000000016, 100001, 10009, DATE '2024-05-15', NULL); -- Currently issued
INSERT INTO Issue VALUES (1000000017, 100005, 10010, DATE '2024-05-20', NULL); -- Currently issued

-- Commit the changes
COMMIT;

-- Display data to verify
SELECT 'Member Table' as TABLE_NAME FROM DUAL;
SELECT * FROM Member;

SELECT 'Books Table' as TABLE_NAME FROM DUAL;
SELECT * FROM Books;

SELECT 'Issue Table' as TABLE_NAME FROM DUAL;
SELECT * FROM Issue;
