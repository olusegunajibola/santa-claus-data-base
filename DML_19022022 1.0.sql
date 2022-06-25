-- DROP DATABASE `projectsanta`;

-- parent
select * from parent;
INSERT INTO parent(parent_id, email)
VALUES (01, 'josh@hotmail.com');
INSERT INTO parent(parent_id, email)
VALUES (02, 'abdulahi@gmail.com');
INSERT INTO parent(parent_id, email)
VALUES (03, 'abbie@gmail.com');
DELETE FROM `projectsanta`.`parent`
WHERE email = 'abbie@gmail.com';
UPDATE `projectsanta`.`parent`
SET
`Email` = 'abu@gmail.com'
WHERE `Parent_ID` = 2;

-- child 
insert into 
child(FirstName, MidName, LastName, StreetName, PostalCode, HouseNumber, Country, child_id, parent_id)
values ('Frank', NULL, 'Josh', 'W Calderwood Street, Meridian,id', 83642,9,  'United States',1,1);
ALTER TABLE child
MODIFY PostalCode INT NULL;
insert into 
child(FirstName, MidName, LastName, StreetName, PostalCode, HouseNumber, Country, child_id, parent_id)
values ('Aisha', 'Abu', 'Abdulahi', 'Boulevard De La Liberation, Dakar',NULL,  39,'Senegal',2,2 );
insert into 
child(FirstName, MidName, LastName, StreetName, PostalCode, HouseNumber, Country, child_id, parent_id)
values ('Yousuff', 'Abu', 'Abdulahi', 'Boulevard De La Liberation, Dakar',NULL,  39,'Senegal',3,2 );
DELETE FROM `projectsanta`.`child`
WHERE child_id = 3;
UPDATE `projectsanta`.`child`
SET
`FirstName` = 'Aishatu',
`LastName` = 'Abdullahi'
WHERE `child_id` = 2;
insert into 
child(FirstName, MidName, LastName, StreetName, PostalCode, HouseNumber, Country, child_id, parent_id)
values ('Yousuff', 'Abu', 'Abdullahi', 'Boulevard De La Liberation, Dakar',NULL,  39,'Senegal',3,2 );
select * from child;

-- requested_by
select * from requested_by;
INSERT INTO `projectsanta`.`requested_by`
(`RequestID`,
`GiftRequested`)
VALUES
(01, 'toy gun'),(01, 'story book'),(02,'avenger comic book'),(02,'barbie doll'),(03, 'Arsenal jersey');
UPDATE `projectsanta`.`requested_by`
SET
`GiftRequested` = 'marvel comic book'
WHERE `id` = 6;
INSERT INTO `projectsanta`.`requested_by`
(`RequestID`,
`GiftRequested`)
VALUES
(03, 'Arsenal jersey');
DELETE FROM `projectsanta`.`requested_by`
WHERE id = 1 or id = 7;
DELETE FROM `projectsanta`.`requested_by` WHERE (`id` = '6');
-- LOAD DATA LOCAL INFILE 'C:\Users\USER\OneDrive\LAQUILA 2021\DB_Exam\03_request.csv'
-- INTO TABLE projectsanta.requested_by FIELDS TERMINATED BY ','
-- ENCLOSED BY '"' LINES TERMINATED BY '\n';

-- elves
ALTER TABLE elves
MODIFY YearsOf_Experience DECIMAL(4,2);
ALTER TABLE elves
MODIFY DailyProductionAmt TINYINT;
INSERT INTO `projectsanta`.`elves`
(`ElfName`,
`Elf_subDept`,
`Elf_Dept`,
`YearsOf_Experience`,
`Superv_Name`,
`DailyProductionAmt`)
VALUES
('Alabaster Snowball','toys','High-Tech',84.45,'Santa', 25),
('Bushy Evergreen', 'video gmes', 'High-Tech','23','Alabaster Snowball','20'),
('Pepper Minstix', 'candies', 'Food','16.25','Santa','10'),
('Shinny Upatree' , 'cakes', 'Food','4','Pepper Minstix','15'),
('Sugarplum Mary', 'dolls', 'Dolls','10.25','Santa','17'),
('Wunorse Openslae', 'Shipping', 'Shipping','25.55','Santa','21'),
('Kinky Fred', 'shirts', 'Clothes','1.45','Happy Lucy','6'),
('Happy Lucy', 'gowns', 'Clothes','2.75','Santa','6'),
('Dani Papi', 'Shipping', 'Shipping','20','Wunorse Openslae','21'),
('Scholar Papi', 'comics', 'Books','15','Elf Einstein','5'),
('Elf Einstein', 'novels', 'Books','75','Santa','25')
;
DELETE FROM `projectsanta`.`elves` WHERE (`ElfName` = 'Alabaster Snowball');
UPDATE `projectsanta`.`elves` SET `Elf_subDept` = 'video games' WHERE (`ElfName` = 'Bushy Evergreen');
select * from elves; 
INSERT INTO `projectsanta`.`elves`
(`ElfName`,
`Elf_subDept`,
`Elf_Dept`,
`YearsOf_Experience`,
`Superv_Name`,
`DailyProductionAmt`)
VALUES
('Alabaster Snowball','toys','High-Tech',84.45,'Santa', 25);


-- sub_department
select * from sub_department;
INSERT INTO `projectsanta`.`sub_department` (`subdept_id`, `SubdeptName`) VALUES ('01', 'toys');
INSERT INTO `projectsanta`.`sub_department` (`subdept_id`, `SubdeptName`) VALUES ('01', 'video games');
INSERT INTO `projectsanta`.`sub_department` (`subdept_id`, `SubdeptName`) VALUES ('2', 'candies');
INSERT INTO `projectsanta`.`sub_department` (`subdept_id`, `SubdeptName`) VALUES ('2', 'cakes');
INSERT INTO `projectsanta`.`sub_department` (`subdept_id`, `SubdeptName`) VALUES ('6', 'dolls');
INSERT INTO `projectsanta`.`sub_department` (`subdept_id`, `SubdeptName`) VALUES ('4', 'Shipping');
INSERT INTO `projectsanta`.`sub_department` (`subdept_id`, `SubdeptName`) VALUES ('3', 'shirts');
INSERT INTO `projectsanta`.`sub_department` (`subdept_id`, `SubdeptName`) VALUES ('3', 'gnows');
INSERT INTO `projectsanta`.`sub_department` (`subdept_id`, `SubdeptName`) VALUES ('5', 'comics');
INSERT INTO `projectsanta`.`sub_department` (`subdept_id`, `SubdeptName`) VALUES ('5', 'novels');
UPDATE `projectsanta`.`sub_department` 
SET 
    `subdept_id` = '3',
    `SubdeptName` = 'gowns'
WHERE
    (`subdept_id` = '3')
        AND (`SubdeptName` = 'gnows');
-- DELETE FROM `projectsanta`.`sub_department` WHERE (`subdept_id` = '1') and (`SubdeptName` = 'video games');

select * from department;
INSERT INTO `projectsanta`.`department` ( `D_MgrName`,`dept_id`,  `DeptName`) VALUES ( 'Alabaster Snowball','1',  'High-Tech');
INSERT INTO `projectsanta`.`department` (`D_MgrName`, `dept_id`,  `DeptName`) VALUES ( 'Pepper Minstix','2',  'Food');
INSERT INTO `projectsanta`.`department` ( `D_MgrName`,`dept_id`, `DeptName`) VALUES ( 'Happy Lucy','3', 'Clothes');
INSERT INTO `projectsanta`.`department` ( `D_MgrName`,`dept_id`, `DeptName`) VALUES ( 'Wunorse Openslae','4', 'Shipping');
INSERT INTO `projectsanta`.`department` ( `D_MgrName`,`dept_id`, `DeptName`) VALUES ( 'Elf Einstein','5', 'Books');
INSERT INTO `projectsanta`.`department` ( `D_MgrName`,`dept_id`, `DeptName`) VALUES ( 'Sugarplum Mary','6', 'Dolls');



-- raw_material
select * from raw_material;
INSERT INTO `projectsanta`.`raw_material` (`MaterialName`, `mat_id`, `Qty_grams`, `Qty_amt`) VALUES ('glass', '1', '5', '1000');
INSERT INTO `projectsanta`.`raw_material` (`MaterialName`, `mat_id`, `Qty_grams`, `Qty_amt`) VALUES ('plastic', '1', '10', '500');
INSERT INTO `projectsanta`.`raw_material` (`MaterialName`, `mat_id`, `Qty_grams`, `Qty_amt`) VALUES ('chips', '1', '100', '500');

ALTER TABLE `projectsanta`.`raw_material` 
CHANGE COLUMN `Qty_grams` `Qty_grams` decimal(8,2) UNSIGNED ZEROFILL NULL DEFAULT NULL ,
CHANGE COLUMN `Qty_amt` `Qty_amt` decimal(8,2) UNSIGNED ZEROFILL NULL DEFAULT NULL ;
INSERT INTO `projectsanta`.`raw_material` (`MaterialName`, `mat_id`, `Qty_grams`) VALUES ('flour', '2', '50');
INSERT INTO `projectsanta`.`raw_material` (`MaterialName`, `mat_id`, `Qty_grams`) VALUES ('chocolate', '2', '250');
INSERT INTO `projectsanta`.`raw_material` (`MaterialName`, `mat_id`, `Qty_grams`) VALUES ('sugar', '2', '300');
INSERT INTO `projectsanta`.`raw_material` (`MaterialName`, `mat_id`, `Qty_amt`) VALUES ('Wool', '3', '500');
INSERT INTO `projectsanta`.`raw_material` (`MaterialName`, `mat_id`, `Qty_amt`) VALUES ('silk', '3', '500');
INSERT INTO `projectsanta`.`raw_material` (`MaterialName`, `mat_id`, `Qty_amt`) VALUES ('cotton', '3', '500');
INSERT INTO `projectsanta`.`raw_material` (`MaterialName`, `mat_id`, `Qty_amt`) VALUES ('cartons', '4', '10000');
INSERT INTO `projectsanta`.`raw_material` (`MaterialName`, `mat_id`, `Qty_amt`) VALUES ('paper', '5', '10000');
INSERT INTO `projectsanta`.`raw_material` (`MaterialName`, `mat_id`, `Qty_amt`) VALUES ('ink', '5', '10000');
INSERT INTO `projectsanta`.`raw_material` (`MaterialName`, `mat_id`, `Qty_amt`) VALUES ('plastic', '6', '1000');
INSERT INTO `projectsanta`.`raw_material` (`MaterialName`, `mat_id`, `Qty_amt`) VALUES ('cloth', '6', '10000');
-- DELETE FROM `projectsanta`.`raw_material` WHERE (`mat_id` = '2') and (`MaterialName` = 'chocolate');
UPDATE `projectsanta`.`raw_material` SET `Qty_amt` = '100000' WHERE (`mat_id` = '2') and (`MaterialName` = 'chocolate');

-- gift_type
select * from gift_type;
ALTER TABLE `projectsanta`.`gift_type` 
DROP COLUMN `DeptName`;
INSERT INTO `projectsanta`.`gift_type` (`GiftSerialCode`, `GiftType`, `RawMaterial_id`, `GiftName`, `LocalizedVersion`, `ComplexityIndicator`, `ProductionLot`, `Qty`) VALUES ('01', 'Books', '5', 'A Christmas Adventure', 'English', '0.2', 'A1', '5');
ALTER TABLE `projectsanta`.`gift_type` 
CHANGE COLUMN `ComplexityIndicator` `ComplexityIndicator` DECIMAL(2,1) NOT NULL ;
INSERT INTO `projectsanta`.`gift_type` (`GiftSerialCode`, `GiftType`, `RawMaterial_id`, `GiftName`, `LocalizedVersion`, `ComplexityIndicator`, `ProductionLot`, `Qty`) VALUES ('2', 'Books', '5', 'Saving Earth', 'French', '0.2', 'A1', '2');
UPDATE `projectsanta`.`gift_type` SET `ComplexityIndicator` = '0.2' WHERE (`GiftSerialCode` = '1');
ALTER TABLE `projectsanta`.`gift_type` 
CHANGE COLUMN `LocalizedVersion` `LocalizedVersion` VARCHAR(15) NULL ;
INSERT INTO `projectsanta`.`gift_type` (`GiftSerialCode`, `GiftType`, `RawMaterial_id`, `GiftName`, `ComplexityIndicator`, `ProductionLot`, `Qty`) VALUES ('3', 'Dolls', '6', 'Barbie Deluxe', '0.3', 'B2', '4');
INSERT INTO `projectsanta`.`gift_type` (`GiftSerialCode`, `GiftType`, `RawMaterial_id`, `GiftName`, `LocalizedVersion`, `ComplexityIndicator`, `ProductionLot`, `Qty`) VALUES ('4', 'Clothes', '3', 'Mesut Ozil no 10', 'English', '0.5', 'C1', '2');

-- ALTER TABLE `projectsanta`.`deliver_to` 
-- ADD UNIQUE INDEX `giftid_UNIQUE` (`giftid` ASC) VISIBLE;
;
-- ALTER TABLE `projectsanta`.`deliver_to` 
-- DROP INDEX `giftid_UNIQUE` ;
;


-- deliver_to
select * from deliver_to;
INSERT INTO `projectsanta`.`deliver_to` (`child`, `giftid`) VALUES ('1', '1');
INSERT INTO `projectsanta`.`deliver_to` (`child`, `giftid`) VALUES ('2', '2');
INSERT INTO `projectsanta`.`deliver_to` (`child`, `giftid`) VALUES ('2', '3');
INSERT INTO `projectsanta`.`deliver_to` (`child`, `giftid`) VALUES ('3', '4');

-- we do not need the produced_by table since we already have the departments in it
DROP TABLE `projectsanta`.`produced_by`;

-- we also drop color and make it a single entry in gift_type table to make our work more simpler
DROP TABLE `projectsanta`.`gift_color`;


ALTER TABLE `projectsanta`.`gift_type` 
ADD COLUMN `gift_color` VARCHAR(45) NULL AFTER `Qty`;
select * from gift_type;
UPDATE `projectsanta`.`gift_type` SET `gift_color` = 'mixed' WHERE (`GiftSerialCode` = '1');
UPDATE `projectsanta`.`gift_type` SET `gift_color` = 'mixed' WHERE (`GiftSerialCode` = '2');
UPDATE `projectsanta`.`gift_type` SET `gift_color` = 'pink' WHERE (`GiftSerialCode` = '3');
UPDATE `projectsanta`.`gift_type` SET `gift_color` = 'red' WHERE (`GiftSerialCode` = '4');

ALTER TABLE `projectsanta`.`deliver_to` 
ADD COLUMN `delivery_date` DATETIME NULL AFTER `giftid`;
ALTER TABLE `projectsanta`.`deliver_to` 
CHANGE COLUMN `delivery_date` `delivery_date` DATE NULL DEFAULT NULL ;
ALTER TABLE `projectsanta`.`gift_type` 
ADD COLUMN `production_date_time` DATETIME NOT NULL AFTER `Qty`;

UPDATE `projectsanta`.`gift_type` SET `production_date_time` = '2020-11-15 17:16:45' WHERE (`GiftSerialCode` = '1');
UPDATE `projectsanta`.`gift_type` SET `production_date_time` = '2020-11-01 12:16:00' WHERE (`GiftSerialCode` = '2');
UPDATE `projectsanta`.`gift_type` SET `production_date_time` = '2020-11-03 12:16:45' WHERE (`GiftSerialCode` = '3');
UPDATE `projectsanta`.`gift_type` SET `production_date_time` = '2020-11-30 00:00:45' WHERE (`GiftSerialCode` = '4');

UPDATE `projectsanta`.`deliver_to` SET `delivery_date` = '2020-12-25' WHERE (`deliv_id` = '1');
UPDATE `projectsanta`.`deliver_to` SET `delivery_date` = '2020-12-25' WHERE (`deliv_id` = '2');
UPDATE `projectsanta`.`deliver_to` SET `delivery_date` = '2020-12-25' WHERE (`deliv_id` = '3');
UPDATE `projectsanta`.`deliver_to` SET `delivery_date` = '2020-12-25' WHERE (`deliv_id` = '4');

ALTER TABLE `projectsanta`.`deliver_to` 
CHANGE COLUMN `delivery_date` `delivery_date` DATE NOT NULL ;

ALTER TABLE `projectsanta`.`deliver_to` 
CHANGE COLUMN `delivery_date` `delivery_date` DATE NOT NULL ;
ALTER TABLE `projectsanta`.`deliver_to` 
ADD CONSTRAINT `giftid`
  FOREIGN KEY (`giftid`)
  REFERENCES `projectsanta`.`gift_type` (`GiftSerialCode`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
ADD CONSTRAINT `child`
  FOREIGN KEY (`child`)
  REFERENCES `projectsanta`.`child` (`child_id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE `projectsanta`.`elves` 
CHANGE COLUMN `YearsOf_Experience` `YearsOf_Experience` DECIMAL(4,2) NOT NULL ,
CHANGE COLUMN `DailyProductionAmt` `DailyProductionAmt` TINYINT NOT NULL ;

select * from parent;
select * from child;
select * from requested_by;
select * from elves;
select * from sub_department;
select * from department;
select * from raw_material;
select * from gift_type;
select * from deliver_to;

-- LOAD DATA LOCAL INFILE 'C:\Users\USER\OneDrive\LAQUILA 2021\DB_Exam\03_request.csv'
-- INTO TABLE projectsanta.requested_by FIELDS TERMINATED BY ','
-- ENCLOSED BY '"' LINES TERMINATED BY '\n';

-- a. Having a list of all the gifts that must be produced before a certain date;
select * from gift_type
where production_date_time < '2020-11-15 00:00:00';

-- b. Having a list of which are the gifts that must be included in a certain load;
select * from gift_type
where ProductionLot = 'A1';

-- c. Check if it is necessary to reorder the raw materials for the entire Santa’s factory;
select * from raw_material; -- this is not necessary

-- d. Checking which is the production state of the gifts for a certain family (parents);
select parent.email, child.child_id, gift_type.GiftName
from parent
join child
on  parent.parent_id =  child.child_id
JOIN deliver_to
ON deliver_to.child = child.parent_id
join gift_type
on deliver_to.deliv_id = gift_type.GiftSerialCode
GROUP BY parent.Email, gift_type.GiftName;
-- e. Having a list of all the departments where the elves have a personal production lower than a given threshold (e.g. 20);
select ElfName, DailyProductionAmt, Elf_Dept 
from department
inner join elves
where DailyProductionAmt < 20
ORDER BY DailyProductionAmt DESC ;
-- f. For each department that has an average production (among the elves) below a given
-- threshold (e.g 20) report the number of elves that has a personal production lower than the threshold.

