//Author Momenul Haque
//Student, Dept. of CSE, BAUET

//Start

CREATE DATABASE Assignment;

//Answer Question 1

CREATE TABLE branch ( branch_name varchar(255), branch_city varchar(255),assets varchar(255),PRIMARY KEY(branch_name));

//Answer Question 2

CREATE TABLE account ( account_number varchar(255), branch_name varchar

(255),balance varchar(255),PRIMARY KEY(account_number),FOREIGN KEY (branch_name) REFERENCES branch (branch_name));

//Answer Question 3

CREATE TABLE loan ( loan_number varchar(255), branch_name

varchar

(255),amount varchar(255),PRIMARY KEY(loan_number),FOREIGN KEY 

(branch_name) REFERENCES branch (branch_name));

//Answer Question 4

CREATE TABLE customer ( customer_name varchar(255), customer_street varchar

(255),customer_city varchar(255),PRIMARY KEY(customer_name));

//Answer Question 5

CREATE TABLE borrower ( customer_name varchar(255),loan_number

varchar

(255),PRIMARY KEY(customer_name,loan_number),FOREIGN KEY 

(customer_name) REFERENCES customer (customer_name),FOREIGN KEY 

(loan_number) REFERENCES loan (loan_number));


//Answer Question 6

CREATE TABLE depositor ( customer_name varchar(255),account_number

varchar

(255),PRIMARY KEY(customer_name,account_number),FOREIGN KEY 

(customer_name) REFERENCES customer (customer_name),FOREIGN KEY 

(account_number) REFERENCES account (account_number));


//Answer Question 7

INSERT INTO branch (branch_name, branch_city,assets) VALUES ("downtown", "brooklyn","900000");
INSERT INTO branch (branch_name, branch_city,assets) VALUES ("redwood", "palo alto","210000");
INSERT INTO branch (branch_name, branch_city,assets) VALUES ("perryridge", "horseneck","170000");
INSERT INTO branch (branch_name, branch_city,assets) VALUES ("mianus", "horseneck","40000");
INSERT INTO branch (branch_name, branch_city,assets) VALUES ("roundhill", "horseneck","800000 ");
INSERT INTO branch (branch_name, branch_city,assets) VALUES ("pownal", "bennignton","30000");
INSERT INTO branch (branch_name, branch_city,assets) VALUES ("north town", "rye","370000");
INSERT INTO branch (branch_name, branch_city,assets) VALUES ("brighton", "brooklyn","710000");

//Answer Question 8

INSERT INTO account ( branch_name,account_number,balance) VALUES 

("downtown", "a-101","500");
INSERT INTO account ( branch_name,account_number,balance) VALUES 

("mianus", "a-215","700");
INSERT INTO account ( branch_name,account_number,balance) VALUES 

("perryridge", "a-102","400");
INSERT INTO account ( branch_name,account_number,balance) VALUES 

("roundhill", "a-305","350");
INSERT INTO account ( branch_name,account_number,balance) VALUES 

("brighton", "a-201","900");
INSERT INTO account ( branch_name,account_number,balance) VALUES 

("redwood", "a-222","700");
INSERT INTO account ( branch_name,account_number,balance) VALUES 

("brighton", "a-217","750");

//Answer Question 9

INSERT INTO loan ( branch_name,loan_number,amount) VALUES ("downtown", "L-17","1000");
INSERT INTO loan ( branch_name,loan_number,amount) VALUES ("redwood", "L-23","2000");
INSERT INTO loan ( branch_name,loan_number,amount) VALUES ("perryridge", "L-15","1500");
INSERT INTO loan ( branch_name,loan_number,amount) VALUES ("downtown", "L-14","1500");
INSERT INTO loan ( branch_name,loan_number,amount) VALUES ("mianus", "L-93","500");
INSERT INTO loan ( branch_name,loan_number,amount) VALUES ("roundhill", "L-11","900");
INSERT INTO loan ( branch_name,loan_number,amount) VALUES ("perryridge", "L-16","1300");

//Answer Question 10

INSERT INTO customer ( customer_name,customer_street,customer_city) VALUES ("jones", "main","harrison");
INSERT INTO customer ( customer_name,customer_street,customer_city) VALUES ("smith", "north","rye");
INSERT INTO customer ( customer_name,customer_street,customer_city) VALUES ("hayes", "main","harrison");
INSERT INTO customer ( customer_name,customer_street,customer_city) VALUES ("curry", "north","rye");
INSERT INTO customer ( customer_name,customer_street,customer_city) VALUES ("lindsay", "park","pittsfield");
INSERT INTO customer ( customer_name,customer_street,customer_city) VALUES ("turner", "putnam","stamford");
INSERT INTO customer ( customer_name,customer_street,customer_city) VALUES ("williams", "nassau","princeton");
INSERT INTO customer ( customer_name,customer_street,customer_city) VALUES ("adams", "spring","pittsfield");
INSERT INTO customer ( customer_name,customer_street,customer_city) VALUES ("johnson", "alma","palo alto");
INSERT INTO customer ( customer_name,customer_street,customer_city) VALUES ("glenn", "sand hill","wood side");
INSERT INTO customer ( customer_name,customer_street,customer_city) VALUES ("brooks", "senator","brooklyn");
INSERT INTO customer ( customer_name,customer_street,customer_city) VALUES ("green", "walnut","stamford");



//Answer Question 11

INSERT INTO borrower ( customer_name,loan_number) VALUES ("smith", 

"L-11");

INSERT INTO borrower ( customer_name,loan_number) VALUES ("johnson", 

"L-14");
INSERT INTO borrower ( customer_name,loan_number) VALUES ("hayes", 

"L-15");
INSERT INTO borrower ( customer_name,loan_number) VALUES ("williams", 

"L-16");

INSERT INTO borrower ( customer_name,loan_number) VALUES ("adams", 

"L-16");

INSERT INTO borrower ( customer_name,loan_number) VALUES ("jones", 

"L-17");
INSERT INTO borrower ( customer_name,loan_number) VALUES ("smith", 

"L-23");


INSERT INTO borrower ( customer_name,loan_number) VALUES ("curry", 

"L-93");


//Answer Question 12

INSERT INTO depositor ( customer_name,account_number) VALUES ("johnson", "a-101");
INSERT INTO depositor ( customer_name,account_number) VALUES ("smith", "a-215");
INSERT INTO depositor ( customer_name,account_number) VALUES ("hayes", "a-102");
INSERT INTO depositor ( customer_name,account_number) VALUES ("turner", "a-305");
INSERT INTO depositor ( customer_name,account_number) VALUES ("johnson", "a-201");
INSERT INTO depositor ( customer_name,account_number) VALUES ("jones", "a-217");
INSERT INTO depositor ( customer_name,account_number) VALUES ("lindsay", "a-222");


//Answer Question 13

SELECT branch_name FROM loan;

//Answer Question 14

SELECT DISTINCT branch_name FROM loan;


//Answer Question 15
ALTER TABLE loan
MODIFY amount integer;

SELECT loan_number FROM loan WHERE branch_name='perryridge' AND amount > 1200;

//Answer Question 16

CREATE table R1 AS 
SELECT *
FROM loan
NATURAL JOIN borrower;

SELECT customer_name, loan_number, amount FROM `r1` WHERE branch_name='perryridge';

//OR
SELECT customer_name, borrower.loan_number, amount FROM borrower, loan WHERE
borrower.loan_number = loan.loan_number and branch_name = 'Perryridge';


//Answer Question 17


CREATE table R1 AS 
SELECT *
FROM loan
NATURAL JOIN borrower;

CREATE TABLE r2 As SELECT customer_name, loan_number, amount FROM `r1` ;
ALTER TABLE r2 CHANGE `loan_number` ` loan_id` varchar(255);

//OR

SELECT customer_name, borrower.loan_number AS loan_id, amount FROM borrower, loan
WHERE borrower.loan_number = loan.loan_number;

//Answer Question 18

SELECT customer_name, loan_number, amount FROM r1 where customer_name IN (SELECT customer_name FROM r1 GROUP BY customer_name HAVING COUNT(*) >1);

//OR

SELECT customer_name, borrower.loan_number, amount FROM borrower, loan WHERE
borrower.loan_number = loan.loan_number;
//Or
SELECT customer_name, T.loan_number, S.amount FROM borrower AS T, loan AS S WHERE
T.loan_number = S.loan_number;


//Answer Question 19

ALTER TABLE branch
MODIFY assets integer;

SELECT branch_name from branch where assets > (SELECT max(assets) FROM branch GROUP BY branch_city HAVING 

branch_city='brooklyn');

//OR

SELECT DISTINCT T.branch_name from branch AS T, branch AS S WHERE T.assets > S.assets
and S.branch_city = 'Brooklyn';


//Answer Question 20

SELECT customer_name FROM customer WHERE customer_street=(SELECT customer_street FROM customer GROUP BY customer_street HAVING customer_street='main');

//OR

SELECT customer_name FROM customer WHERE customer_street LIKE '% Main%';

//Answer Question 21


SELECT customer_name FROM depositor
UNION
SELECT customer_name FROM borrower;

//Answer Question 22
SELECT DISTINCT borrower.customer_name FROM borrower,depositor WHERE
borrower.customer_name = depositor.customer_name;

//OR
(select customer_name from depositor) intersect (select customer_name from borrower);


//Answer Question 23
SELECT depositor.customer_name
       FROM depositor
EXCEPT SELECT  borrower.customer_name
       FROM borrower;
//OR
(select customer_name from depositor) except (select customer_name from borrower);


//Answer Question 24

SELECT AVG(balance) FROM 

account GROUP BY branch_name HAVING 

branch_name='perryridge';

//Answer Question 25
SELECT COUNT(*)
FROM customer;

//Answer Question 26

select count (distinct customer_name) from depositor;



//Answer Question 27

select branch_name, count (distinct customer_name) from depositor, account where
depositor.account_number = account.account_number group by branch_name;



//Answer Question 28

SELECT branch_name FROM account GROUP BY branch_name HAVING AVG

(balance) >1200;

//Answer Question 29
SELECT DISTINCT customer_name FROM borrower
NATURAL JOIN depositor;

//OR
select distinct customer_name from borrower where customer_name in (select customer_name
from depositor);

//Answer Question 30
SELECT borrower.customer_name
       FROM borrower
EXCEPT SELECT depositor.customer_name
       FROM depositor;
//OR
select distinct customer_name from borrower where customer_name not in (select
customer_name from depositor);


//Answer Question 31
SELECT branch_name from branch where assets > (SELECT max(assets) FROM branch GROUP BY branch_city HAVING 

branch_city='brooklyn');

//Answer Question 32
DELETE  from account
where branch_name in (select branch_name
from branch
where branch_city = 'Needham')


//Answer Question 33
ALTER TABLE depositor
ADD CONSTRAINT account_number
    FOREIGN KEY (account_number)
    REFERENCES account (account_number)
    ON DELETE CASCADE;

DELETE FROM account WHERE  balance < (SELECT AVG(balance) FROM account)

//Answer Question 34

UPDATE account
set balance = balance + 600
where balance > 10000;
UPDATE account
set balance = balance + 500
where balance <= 10000;

//Answer Question 35
SELECT * FROM loan inner join borrower on
loan.loan_number = borrower.loan_number;

//Answer Question 36
SELECT * FROM loan left outer JOIN borrower on
loan.loan_number = borrower.loan_number;

//Answer Question 37
SELECT * FROM loan RIGHT outer JOIN borrower on
loan.loan_number = borrower.loan_number;

//Answer Question 38

SELECT customer_name
FROM (depositor natural full outer join borrower)
where account_number is null or loan_number is null;

//Answer Question 39
SELECT loan_number FROM loan WHERE amount BETWEEN 90000 and 100000;

//Answer Question 40

SELECT loan_number FROM loan WHERE amount is null;