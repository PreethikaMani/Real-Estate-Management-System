create schema project
USE project

CREATE TABLE Property(
	address VARCHAR(50) NOT NULL,
	ownerName VARCHAR(30),
	price INT,
	PRIMARY KEY(address)
);

CREATE TABLE House(
	address VARCHAR(50) NOT NULL,
	ownerName VARCHAR(30),
	price INT,
	bedrooms INT,
	bathrooms INT,
	size INT,
	FOREIGN KEY(address) REFERENCES Property(address)
);

CREATE TABLE BusinessProperty(
	address VARCHAR(50) NOT NULL,
	ownerName VARCHAR(30),
	price INT,
	type CHAR(20),
	size INT,
	FOREIGN KEY(address) REFERENCES Property(address)
);

CREATE TABLE Firm(
	id INT NOT NULL,
	name VARCHAR(30),
	address VARCHAR(50),
	PRIMARY KEY(id)
);

CREATE TABLE Agent(
	agentId INT NOT NULL,
	name VARCHAR(30),
	phone CHAR(12),
	firmId INT NOT NULL,
	dateStarted DATE,
	PRIMARY KEY(agentId),
	FOREIGN KEY(firmId) REFERENCES Firm(id)
);

CREATE TABLE Listing(
	address VARCHAR(50),
	agentId INT,
	mlsNumber INT PRIMARY KEY,
	dataListed DATE,
	FOREIGN KEY(agentId) REFERENCES Agent(agentId),
	FOREIGN KEY(address) REFERENCES Property(address)
);

CREATE TABLE Buyer(
	id INT NOT NULL,
	name VARCHAR(30),
	phone CHAR(12),
	propertyType CHAR(20),
	bedrooms INT,
	bathrooms INT,
	businessPropertyType CHAR(20),
	minimumPreferredPrice INT,
	maximumPreferredPrice INT,
	PRIMARY KEY(id)
);

CREATE TABLE Work_With(
	buyerId INT,
	agentId INT,
	FOREIGN KEY(buyerId) REFERENCES Buyer(id),
	FOREIGN KEY(agentId) REFERENCES Agent(agentId)
);


INSERT INTO Property VALUES
('2350 Gibson Road', 'John Smith', 235000),
('197 Watson Street', 'Raymond Chou', 789000),
('2525 Pottsdamer Street', 'Jim Lee', 100500),
('193 Love BLVD', 'Kim Abudal', 930000),
('647 Maston Road', 'Robert Clue', 135000),
('1350 Navada Street', 'Jack Green', 674090),
('256 Florida Street', 'Michael Kohen', 179280),
('1717 Kansas Street', 'Leah Mars', 345000),
('2613 Academic Way', 'Marry Song', 997050),
('179 Tinker Road', 'Leon Kant', 90000),
('181 floaral street','John',80000),
('121 Broadway','vinay',58700),
('167 guindy', 'simbu',100000);


INSERT INTO House VALUES
('2350 Gibson Road', 'John Smith', 235000, 3, 2, 196),
('197 Watson Street', 'Raymond Chou', 789000, 2, 4, 203),
('2525 Pottsdamer Street', 'Jim Lee', 100500, 2, 3, 180),
('193 Love BLVD', 'Kim Abudal', 930000, 3, 2, 401),
('647 Maston Road', 'Robert Clue', 135000, 3, 2, 102),
('1350 Navada Street', 'Jack Green', 674090, 2,2, 112),
('256 Florida Street', 'Michael Kohen', 179280, 3, 3, 234),
('1717 Kansas Street', 'Leah Mars', 345000, 3, 2, 654),
('2613 Academic Way', 'Marry Song', 997050, 2, 1, 876),
('179 Tinker Road', 'Leon Kant', 90000, 4, 3, 776),
('181 floaral street','John',80000, 1, 1, 996),
('121 Broadway','vinay',58700, 3, 2, 621);



INSERT INTO BusinessProperty VALUES
('1350 Navada Street', 'Jack Green', 674090, 'office space', 467),
('256 Florida Street', 'Michael Kohen', 179280, 'gas station', 245),
('1717 Kansas Street', 'Leah Mars', 345000, 'office space', 356),
('2613 Academic Way', 'Marry Song', 997050, 'office space', 670),
('179 Tinker Road', 'Leon Kant', 90000, 'store front', 128),
('181 floaral street','John',80000, 'home',996),
('121 Broadway','vinay',58700, 'stores', 621),
('167 guindy', 'simbu',100000, 'complex', 143),
('2350 Gibson Road', 'John Smith', 235000, 'office', 196),
('197 Watson Street', 'Raymond Chou', 789000, 'home', 203),
('2525 Pottsdamer Street', 'Jim Lee', 100500, 'shopping complex', 180),
('193 Love BLVD', 'Kim Abudal', 930000, 'office place', 401),
('647 Maston Road', 'Robert Clue', 135000, 'home', 102);


INSERT INTO Firm VALUES
(135210, 'Goldman Sash', '799 Georgia Way'),
(146277, 'Holloway', '124 Texas Street'),
(165034, 'Good Target', '135 California Street'),
(230754, 'Cozy Home', '277 Beach Road'),
(210211, 'Fast Searcher', '1010 Alas Road'),
(350321, 'Prince highlands', '2020 Broadway'),
(765290, 'shaw homes',  '231 mumbai'),
(423789, 'vishal developers', '6723 ECR'),
(712097, 'Beach house', '8921 mejestic'),
(809060, 'maruti lands', '878 guindy');


INSERT INTO Agent VALUES
(100, 'Leet Kim', '135145636', 210211, '2012-01-23'),
(112, 'Jim Alpha', '171135636', 210211, '2012-03-26'),
(123, 'George Grey', '176321636', 135210, '2015-02-23'),
(145, 'Sarah Core', '135145909', 135210, '2016-07-03'),
(168, 'Livia Watson', '137145638', 146277, '2014-01-17'),
(189, 'Nik Ray', '135873630', 146277, '2014-01-28'),
(201, 'Cris Paul', '136141236', 165034, '2016-05-23'),
(223, 'Lena Clay', '137145123', 165034, '2014-08-19'),
(267, 'Kevin Nil', '190145636', 230754, '2011-07-20'),
(310, 'Hugh Grant', '132145639', 230754, '2012-12-31');


INSERT INTO Listing VALUES
('2350 Gibson Road', 100, 1212, '2013-02-04'),
('197 Watson Street', 112, 1500, '2013-05-06'),
('2525 Pottsdamer Street', 123, 1617, '2016-12-04'),
('193 Love BLVD', 145, 1718, '2016-02-09'),
('647 Maston Road', 168, 1900, '2014-12-19'),
('1350 Navada Street', 189, 2101, '2015-06-06'),
('256 Florida Street', 201, 2305, '2017-05-25'),
('1717 Kansas Street', 223, 2500, '2014-12-04'),
('2613 Academic Way', 267, 2790, '2013-10-01'),
('179 Tinker Road', 310, 3001, '2015-09-05');


INSERT INTO Buyer VALUES
(799, 'John Nay', '125345790', 'house', 3, 2, 'not applied', 100000, 635000),
(801, 'Retina Grey', '146345790', 'house', 3, 2, 'not applied', 100000, 400000),
(813, 'Reg Neal', '189345791', 'house', 2, 3, 'not applied', 300000, 635000),
(845, 'Gena Sarah', '789345790', 'house', 3, 2, 'not applied', 200000, 960000),
(875, 'Bill Clay', '888345798', 'not applied', 0, 0, 'office space', 100000, 900000),
(999, 'Hilton Clag', '999345792', 'not applied', 0, 0, 'office space', 300000, 790000),
(288, 'Bringerton', '8974367891', 'Flat', 2, 2, 'not applied', 400000, 556000);



INSERT INTO Work_With VALUES
(799, 100),
(801, 112),
(813, 123),
(845, 145),
(875, 168),
(999, 189),
(288, 201);

UPDATE Property 
SET price = 240000 
WHERE address = '2350 Gibson Road';

/* queries */ 
-- store procedures
DELIMITER //
CREATE PROCEDURE GetListingsByAgent(IN agentID INT)
BEGIN
    SELECT L.address, L.mlsNumber, L.dataListed, P.ownerName, P.price
    FROM Listing L
    JOIN Property P ON L.address = P.address
    WHERE L.agentId = agentID;
END //
DELIMITER ;
CALL GetListingsByAgent(100);

DELIMITER //
CREATE PROCEDURE GetBuyersByPropertyType(IN propertyType CHAR(20))
BEGIN
    SELECT B.id, B.name, B.phone, B.minimumPreferredPrice, B.maximumPreferredPrice
    FROM Buyer B
    WHERE B.propertyType = propertyType;
END //
DELIMITER ;
CALL GetBuyersByPropertyType('house');

DELIMITER //
CREATE PROCEDURE GetAgentBuyerNames()
BEGIN
    SELECT A.name AS agentName, B.name AS buyerName
    FROM Work_With WW
    RIGHT JOIN Agent A ON WW.agentId = A.agentId
    LEFT JOIN Buyer B ON WW.buyerId = B.id;
END //
DELIMITER ;
CALL GetAgentBuyerNames();
DELIMITER //
CREATE PROCEDURE Getbedroomsbyhouse (IN bedrooms INT)
BEGIN
     SELECT a.ownerName,a.bedrooms,a.bathrooms
	 FROM house a
     WHERE a.bedrooms=bedrooms ;
END //
DELIMITER ;
CALL GetbedroomsByhouse(3);
DELIMITER //
CREATE PROCEDURE GetpriceBybusinessproperty (IN price int)
BEGIN 
     SELECT a.ownerName, a.type, a.price, a.size 
     FROM businessproperty
     WHERE a.price=price;
END //
DELIMITER ;
CALL GetpriceBybusinessproperty(345000) ;
DROP PROCEDURE GetpriceBybusinessproperty

-- Innerjoin with store procedure
DELIMITER //
CREATE PROCEDURE GetAgentsWithListings(IN agentId int, name varchar(30) )
BEGIN
    SELECT A.agentId, A.name AS agentName, L.address, L.mlsNumber
    FROM Agent A
    INNER JOIN Listing L ON A.agentId = L.agentId;
END //
DELIMITER ;
CALL GetAgentsWithListings (100,'Leet kim');

-- aggregation functions
DELIMITER //
CREATE PROCEDURE GetTopPropertyOwners()
BEGIN
    SELECT ownerName, COUNT(*) AS propertyCount
    FROM Property
    GROUP BY ownerName
    ORDER BY propertyCount DESC
    LIMIT 5;
END //
DELIMITER ;
CALL GetTopPropertyOwners();

DELIMITER //
CREATE PROCEDURE GetHousesByCriteria (
    IN bedrooms INT,
    IN bathrooms INT,
    IN minPrice INT,
    IN maxPrice INT
)
BEGIN
    SELECT address, price
    FROM House
    WHERE bedrooms = bedrooms
      AND bathrooms = bathrooms
      AND price >= minPrice
      AND price <= maxPrice
    ORDER BY price DESC;
END //
DELIMITER ;
CALL GetHousesByCriteria(3, 2, 100000, 250000);

-- Average House Price by Number of Bedrooms

SELECT bedrooms, AVG(price) AS averagePrice
FROM House
GROUP BY bedrooms
HAVING averagePrice > 200000;

-- Count of Business Properties by Type
SELECT type, COUNT(*) AS propertyCount
FROM BusinessProperty
GROUP BY type
HAVING propertyCount > 2;

 -- Maximum and Minimum Prices of Houses Grouped by Bedrooms
SELECT bedrooms, MAX(price) AS maxPrice, MIN(price) AS minPrice
FROM House
GROUP BY bedrooms;

-- aggregation using subquries
SELECT * 
FROM Buyer 
WHERE maximumPreferredPrice = (SELECT MAX(maximumPreferredPrice) FROM Buyer);


-- operators
SELECT * FROM Buyer
WHERE (bedrooms >= 3 AND propertyType = 'house') OR maximumPreferredPrice < 300000;
SELECT *
FROM House, Buyer
WHERE Buyer.id = 799 AND
      Buyer.bedrooms = House.bedrooms AND
      Buyer.bathrooms = House.bathrooms AND
      Buyer.minimumPreferredPrice <= House.price AND
      Buyer.maximumPreferredPrice >= House.price;
 
-- Full Outer Join Between Buyer and Work_With
SELECT B.name AS buyerName, A.name AS agentName
FROM Buyer B
LEFT JOIN Work_With WW ON B.id = WW.buyerId
LEFT JOIN Agent A ON WW.agentId = A.agentId
UNION
SELECT B.name AS buyerName, A.name AS agentName
FROM Work_With WW
RIGHT JOIN Buyer B ON WW.buyerId = B.id
LEFT JOIN Agent A ON WW.agentId = A.agentId;

-- Cross Join Property and BusinessProperty
SELECT P.address AS propertyAddress, BP.address AS businessAddress
FROM Property P
CROSS JOIN BusinessProperty BP; 


-- order by query
SELECT address, price
FROM BusinessProperty
WHERE type = 'office space'
ORDER BY price DESC;

SELECT Agent.name AS Agent_Name, Buyer.name AS Buyer_Name
FROM Agent, Buyer, Work_With
WHERE Agent.agentId = Work_With.agentId AND Buyer.id = Work_With.buyerId;

-- mls case else query
SELECT l.mlsNumber, p.address,
       CASE 
           WHEN p.price > 500000 THEN 'High-value Property'
           WHEN p.price < 200000 THEN 'Low-value property'
           ELSE 'Affordable Property'
       END AS PriceCategory
FROM Listing l
JOIN Property p ON l.address = p.address;

-- subqueries 
DELIMITER //
CREATE PROCEDURE GetPropertyDetails()
BEGIN
    SELECT address, ownerName, price 
    FROM Property 
    WHERE price > ANY (SELECT price FROM BusinessProperty);
END //
DELIMITER ;
CALL GetPropertyDetails();


-- finding Buyers Who Have a Maximum Preferred Price That Matches Any Property Price
SELECT name, maximumPreferredPrice 
FROM Buyer 
WHERE maximumPreferredPrice IN (SELECT price FROM Property);

-- triggers
DELIMITER //
CREATE TRIGGER CheckPropertyPriceBeforeInsert
BEFORE INSERT ON Property
FOR EACH ROW
BEGIN
    DECLARE businessPriceCount INT;
    SELECT COUNT(*)
    INTO businessPriceCount
    FROM BusinessProperty
    WHERE NEW.price < price;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER AfterPropertyUpdate
AFTER UPDATE ON Property
FOR EACH ROW
BEGIN
    INSERT INTO PropertyChangeLog (address, oldOwnerName, oldPrice, newOwnerName, newPrice)
    VALUES (OLD.address, OLD.ownerName, OLD.price, NEW.ownerName, NEW.price);
END //
DELIMITER ;










