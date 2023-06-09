create Database Ecommerce;


use Ecommerce;


-- create tables

create table if not exists `supplier`(
`SUPP_ID` int primary key,
`SUPP_NAME` varchar(50) not null,
`SUPP_CITY` varchar(50) not null,
`SUPP_PHONE` varchar(50) not null
);





CREATE TABLE IF NOT EXISTS `customer` (
  `CUS_ID` INT ,
  `CUS_NAME` VARCHAR(20) not null ,
  `CUS_PHONE` VARCHAR(10) not null,
  `CUS_CITY` varchar(30) not null,
  `CUS_GENDER` CHAR,
  PRIMARY KEY (`CUS_ID`));






CREATE TABLE IF NOT EXISTS `category` (
  `CAT_ID` INT primary key,
  `CAT_NAME` VARCHAR(20) NOT NULL)category
 
 
 


  CREATE TABLE IF NOT EXISTS `product` (
  `PRO_ID` INT ,
  `PRO_NAME` VARCHAR(20) NULL DEFAULT "Dummy",
  `PRO_DESC` VARCHAR(60) ,
  `CAT_ID` INT ,
  PRIMARY KEY (`PRO_ID`),
  FOREIGN KEY (`CAT_ID`) REFERENCES category (`CAT_ID`)
  
  );
  
  
  
  CREATE TABLE IF NOT EXISTS `supplier_pricing` (
  `PRICING_ID` INT ,
  `PRO_ID` INT ,
  `SUPP_ID` INT,
  `SUPP_PRICE` INT DEFAULT 0,
  PRIMARY KEY (`PRICING_ID`),
  FOREIGN KEY (`PRO_ID`) REFERENCES product (`PRO_ID`),
  FOREIGN KEY (`SUPP_ID`) REFERENCES supplier (`SUPP_ID`)
  
  );
  
  
  use Ecommerce;

 CREATE TABLE IF NOT EXISTS `orders` (
  `ORD_ID` INT ,
  `ORD_AMOUNT` INT NOT NULL,
  `ORD_DATE` DATE NOT NULL,
  `CUS_ID` INT ,
  `PRICING_ID` INT ,
  PRIMARY KEY (`ORD_ID`),
  FOREIGN KEY (`CUS_ID`) REFERENCES customer(`CUS_ID`),
  FOREIGN KEY (`PRICING_ID`) REFERENCES supplier_pricing(`PRICING_ID`)
  );
  


 CREATE TABLE IF NOT EXISTS `rating` (
  `RAT_ID` INT ,
  `ORD_ID` INT ,
  `RAT_RATSTARS` INT NOT NULL,
  PRIMARY KEY (`RAT_ID`),
  FOREIGN KEY (`ORD_ID`) REFERENCES orders(`ORD_ID`)

  );
  
  
  
--3)  Insert into tables 


insert into `supplier` values(1,"Rajesh Retails","Delhi",'1234567890');
insert into `supplier` values(2,"Appario Ltd.","Mumbai",'2589631470');
insert into `supplier` values(3,"Knome products","Banglore",'9785462315');
insert into `supplier` values(4,"Bansal Retails","Kochi",'8975463285');
insert into `supplier` values(5,"Mittal Ltd.","Lucknow",'7898456532');




INSERT INTO `CUSTOMER` VALUES(1,"AAKASH",'9999999999',"DELHI",'M');
INSERT INTO `CUSTOMER` VALUES(2,"AMAN",'9785463215',"NOIDA",'M');
INSERT INTO `CUSTOMER` VALUES(3,"NEHA",'9999999999',"MUMBAI",'F');
INSERT INTO `CUSTOMER` VALUES(4,"MEGHA",'9994562399',"KOLKATA",'F');
INSERT INTO `CUSTOMER` VALUES(5,"PULKIT",'7895999999',"LUCKNOW",'M');



INSERT INTO `CATEGORY` VALUES( 1,"BOOKS");
INSERT INTO `CATEGORY` VALUES(2,"GAMES");
INSERT INTO `CATEGORY` VALUES(3,"GROCERIES");
INSERT INTO `CATEGORY` VALUES (4,"ELECTRONICS");
INSERT INTO `CATEGORY` VALUES(5,"CLOTHES");




INSERT INTO Product(PRO_ID, PRO_NAME, PRO_DESC, CAT_ID)
VALUES
	(1, 'GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', 2),
	(2, 'TSHIRT', 'SIZE-L with Black, Blue and White variations', 5),
	(3, 'ROG LAPTOP', 'Windows 10 with 15inch screen, i7 processor, 1TB SSD', 4),
	(4, 'OATS', 'Highly Nutritious from Nestle', 3),
	(5, 'HARRY POTTER', 'Best Collection of all time by J.K Rowling', 1),
	(6, 'MILK', '1L Toned MIlk', 3),
	(7, 'Boat Earphones', '1.5Meter long Dolby Atmos', 4),
	(8, 'Jeans', 'Stretchable Denim Jeans with various sizes and color', 5),
	(9, 'Project IGI', 'compatible with windows 7 and above', 2),
	(10, 'Hoodie', 'Black GUCCI for 13 yrs and above', 5),
	(11, 'Rich Dad Poor Dad', 'Written by Robert Kiyosaki', 1),
	(12, 'Train Your Brain', 'By Shireen Stephen', 1);



INSERT INTO supplier_pricing (PRICING_ID, PRO_ID, SUPP_ID, SUPP_PRICE)
VALUES
	(1, 1, 2, 1500),
	(2, 3, 5, 30000),
	(3, 5, 1, 3000),
	(4, 2, 3, 2500),
	(5, 4, 1, 1000);



INSERT INTO `orders` VALUES(101,1500,'2021-10-06',2,1);
INSERT INTO `orders` VALUES(102,1000,'2021-10-12',3,5);
INSERT INTO `orders` VALUES(103,30000,'2021-09-16',5,2);
INSERT INTO `orders` VALUES(104,1500,'2021-10-05',1,1);
INSERT INTO `orders` VALUES(105,3000,'2021-08-16',4,3);
INSERT INTO `orders` VALUES(106,1450,'2021-08-18',1,9);
INSERT INTO `orders` VALUES(107,789,'2021-09-01',3,7);
INSERT INTO `orders` VALUES(108,780,'2021-09-07',5,6);
INSERT INTO `orders` VALUES(109,3000,'2021-01-10',5,3);
INSERT INTO `orders` VALUES(110,2500,'2021-09-10',2,4);
INSERT INTO `orders` VALUES(111,1000,'2021-09-15',4,5);
INSERT INTO `orders` VALUES(112,789,'2021-09-16',4,7);
INSERT INTO `orders` VALUES(113,31000,'2021-09-16',1,8);
INSERT INTO `orders` VALUES(114,1000,'2021-09-16',3,5);
INSERT INTO `orders` VALUES(115,3000,'2021-09-16',5,3);
INSERT INTO `orders` VALUES(116,99,'2021-09-17',2,14);




INSERT INTO RATINGS (RAT_ID, ORD_ID, RAT_RATSTARS) VALUES (1, 101, 4);
INSERT INTO RATINGS (RAT_ID, ORD_ID, RAT_RATSTARS) VALUES (2, 102, 3);
INSERT INTO RATINGS (RAT_ID, ORD_ID, RAT_RATSTARS) VALUES (3, 103, 1);
INSERT INTO RATINGS (RAT_ID, ORD_ID, RAT_RATSTARS) VALUES (4, 104, 2);
INSERT INTO RATINGS (RAT_ID, ORD_ID, RAT_RATSTARS) VALUES (5, 105, 4);
INSERT INTO RATINGS (RAT_ID, ORD_ID, RAT_RATSTARS) VALUES (6, 106, 3);
INSERT INTO RATINGS (RAT_ID, ORD_ID, RAT_RATSTARS) VALUES (7, 107, 4);
INSERT INTO RATINGS (RAT_ID, ORD_ID, RAT_RATSTARS) VALUES (8, 108, 4);
INSERT INTO RATINGS (RAT_ID, ORD_ID, RAT_RATSTARS) VALUES (9, 109, 3);
INSERT INTO RATINGS (RAT_ID, ORD_ID, RAT_RATSTARS) VALUES (10, 110, 5);
INSERT INTO RATINGS (RAT_ID, ORD_ID, RAT_RATSTARS) VALUES (11, 111, 3);
INSERT INTO RATINGS (RAT_ID, ORD_ID, RAT_RATSTARS) VALUES (12, 112, 4);
INSERT INTO RATINGS (RAT_ID, ORD_ID, RAT_RATSTARS) VALUES (13, 113, 2);
INSERT INTO RATINGS (RAT_ID, ORD_ID, RAT_RATSTARS) VALUES (14, 114, 1);
INSERT INTO RATINGS (RAT_ID, ORD_ID, RAT_RATSTARS) VALUES (15, 115, 1);
INSERT INTO RATINGS (RAT_ID, ORD_ID, RAT_RATSTARS) VALUES (16, 116, 0);



--3)	Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.


select cust.cus_gender , count(cust.cus_gender) as count

from customer cust inner join `orders` on cust.cus_id = `orders`.cus_id 

where `orders`.ord_amount >= 3000 group by cust.cus_gender;



--4)	Display all the orders along with product name ordered by a customer having Customer_Id=2

select p.ord_id , q.pro_name from orders as p inner join(
select PRICING_ID , PRO_NAME from supplier_pricing

inner join 

product on supplier_pricing.PRO_ID = product.PRO_ID) as q

on p.PRICING_ID=q.PRICING_ID

where cus_id=2



--5)	Display the Supplier details who can supply more than one product.

select supp_id , supp_name from supplier
where supp_id 
in
( select SUPP_ID from

(select supp_id,count(pro_id) as countproduct from supplier_pricing

group by SUPP_ID) as p

where p.countproduct > 1) 




--6)	Find the least expensive product from each category and print the table with category id, name, product name and price of the product

use ecommerce;
select c.cat_id,c.cat_name, m.* from category as c inner join
(select  x.cat_id, x.pro_name, q.minprice from product as x 
inner join
(
select r.pro_id , s.minprice from supplier_pricing as r 
inner join
( select o.pricing_id, min(ord_amount) as minprice
from orders as o
group by o.pricing_id) as s

on r.pricing_id = s.pricing_id
) as q on 

x.pro_id = q.PRO_ID) as m 
on 
m.cat_id = c.cat_id




--7)	Display the Id and Name of the Product ordered after “2021-10-05”.

select  p.pro_id, p.pro_name  from product as p inner join 

(select s.pro_id, o.* from supplier_pricing as s inner join 

(select ord_id , ord_date , pricing_id 
from 
orders 
where ord_date >= '2021-10-05') as o

on o.PRICING_ID = s.pricing_id) as t

on 

t.pro_id = p.pro_id



--8)	Display customer name and gender whose names start or end with character 'A'.

select cus_name , cus_gender from customer 
where CUS_NAME like 'A%' or '%A'




--9)Create a stored procedure to display supplier id, name, rating and Type_of_Service.
-- For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, 
--If rating >2 print “Average Service” else print “Poor Service”.

create procedure supplier_rating()

BEGIN

select y.* ,
case 

when y.rat_ratstars = 5 then 'Excellent'
when y.rat_ratstars > 4 then 'Good'
when y.rat_ratstars > 2 then 'Average'
else 'Poor'
end as ratingcategory

from 

(select   x.*, z.rat_ratstars ,z.pro_id  from supplier as x inner join 
(select  s.* , q.rat_ratstars from supplier_pricing as s inner join 
(select o.*, p.rat_ratstars from 
orders as o inner join
(select r.* from rating as r) as p

on o.ord_id = p.ord_id) as q 

on q.pricing_id = s.pricing_id) as z 

on z.supp_id = x.supp_id) as y 

END

