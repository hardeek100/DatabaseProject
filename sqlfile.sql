/*
Spring 2021 TTU Concepts of Database System (CS-4354-001)
Project 1
Authors: Hardik Poudel, Reagan Schulte​, Bibek Pokharel​, Yathartha Regmi​

This is a sql program created for the project 1 of class CS-4354-001 Spring 2021 to demonstrate the 
relational database system.  
*/


-- creating the database

DROP DATABASE IF EXISTS basketball_League;
CREATE DATABASE IF NOT EXISTS basketball_League;
USE basketball_League;

DROP table teams;
CREATE TABLE teams
(
    teamID		INT    NOT NULL AUTO_INCREMENT,
    city        VARCHAR(25) NOT NULL,
    nickname    VARCHAR(25) NOT NULL,
    CONSTRAINT teamsPK PRIMARY KEY(teamID)
);

DROP table players;
CREATE TABLE players
(
    playerID	INT NOT NULL AUTO_INCREMENT,
    firstName	VARCHAR(25) NOT NULL,
    lastName    VARCHAR(25),
    teamID 		INT NULL,
    CONSTRAINT playersPK PRIMARY KEY(playerID)
	-- CONSTRAINT playersFK FOREIGN KEY(teamID) REFERENCES teams(teamID)
);

DROP table player_contract;
CREATE TABLE player_contract
(
	playerID	INT NOT NULL AUTO_INCREMENT,
    amount		float NOT NULL,
    years		INT NOT NULL,
    yearSigned	INT NOT NULL,
    CONSTRAINT pcPK PRIMARY KEY(playerID)
	-- CONSTRAINT pcFK FOREIGN KEY(playerID) REFERENCES players(playerID)
);

DROP table team_record;
CREATE TABLE team_record
(
    teamID		INT NOT NULL,
    season		INT NOT NULL,
    wins        INT NULL,
    losses      INT NULL,
    ties        INT NULL,
    CONSTRAINT trPK PRIMARY KEY(teamID, season)
	-- CONSTRAINT trFK FOREIGN KEY(teamID) REFERENCES teams(teamID)
);

DROP table player_stats;
CREATE TABLE player_stats
(
    playerID		INT NOT NULL,
    season			INT NOT NULL,
    Points			float NULL,
    Rebounds		float NULL,
    Assists			float NULL,
    CONSTRAINT psPK PRIMARY KEY(playerID, season)
	--  CONSTRAINT psFK FOREIGN KEY(playerID) REFERENCES players(playerID)
);

-- Inserting data to table Players

INSERT INTO Players(firstName, lastName, teamID)
VALUES
/* Team For Atlanta Hawks  */
('Begdan','Bagdanovic','1'),
('Clint','Capela','1'),
('Kris','Dunn','1'),
('Bruno','Fernando','1'),
('Brandon','Goodwin','1'),
('Solomon','Hill','1'),
('DeAndre','Hunter','1'),
('Nathan','Knight','1'),
('Onyeka','Okongwu','1'),
('Cam','Reddish','1'),

/* Team For Boston Celtics  */
 ('Jaylen','Brown','	2'),
('Carsen','Edwards','2'),
('Tacko','Fall','2'),
('Evan','Fournier','2'),
('Luke','Kornet','2'),
('Romeo','Langford','2'),
('Aaron','Nesmith','2'),
('Semi','Ojeleye','2'),
('Payton','Pritchard','2'),
('Marcus','Smart','2'),

/* Team For Brooklyn Nets  */
('Lamarcus','Aldridge','3'),
('Bruce','Brown', '3'),
('Chris','Chiozza', '3'),
('Nicolas','Claxton', '3'),
('Kevin','Durant', '3'),
('Jeff','Green', '3'),
('Blake','Griffin', '3'),
('James','Harden', '3'),
('Kyrie','Irving', '3'),
('Tyler','Johnson', '3'),

/* Team For Charlotte Hornets  */
('LaMelo','Ball','4'),
('Bismack','Biyombo','4'),
('Miles','Bridges','4'),
('Vernon','Jr','4'),
('Malik','Monk','4'),
('Nick','Richards','4'),
('Grant','Riller','4'),
('Terry','Rozier','4'),
('PJ','Washington','4'),
('Cody','Zeller','4'),

/* Team For Chicago Bulls */
('Ryan','Arcidiacono','5'),
('Troy','Brown','5'),
('Devon','Dotson','5'),
('Cristiano','Felicio','5'),
('Javonte','Green','5'),
('Zach','Lavine','5'),
('Lauri','Markkenen','5'),
('Adam','Mokoka','5'),
('Tomas','Satoransky','5'),


/* Team For Clevland Cavaliers  */
('Jarrett','Allen','6'),
('Matthew','Dellavedoda','6'),
('Damyean','Dotson','6'),
('Darius','Garland','6'),
('Kevin','Love','6'),
('Larry','Nance','6'),
('Isaac','Okoro','6'),
('Cedi','Osman','6'),
('Collin','Sexton','6'),
('Lamar','Stevens','6'),

/* Team Dallas Mavericks  */
('Tyler','Bey','7'),
('Jalen','Brunsen','7'),
('Trey','Burke','7'),
('Luka','Doncic','7'),
('Josh','Green','7'),
('Tim','Hardaway','7'),
('Nate','Hinton','7'),
('Maxi','Kleber','7'),
('Boban','Marjanovic','7'),
('Kristapas','Porzingis','7'),


/* Team For Denver Nuggets  */
('Will','Barton','8'),
('Bol','Bol','8'),
('Facundo','Campazzo','8'),
('Vlatko','Cancar','8'),
('PJ','Dozier','8'),
('Aaron','Gordon','8'),
('JaMychal','Green','8'),
('Markus','Howard','8'),
('JaVale','McGee','8'),
('Paul','Millsap','8'),

/* Team For Detroit Pistons  */
('Saddiq','Bey','9'),
('Tyler','Cook','9'),
('Hamidou','Diallo','9'),
('Sekou','Doumbouya','9'),
('Jerami','Grant','9'),
('Killian','Hayes','9'),
('Frank','Jackson','9'),
('Josh','Jackson','9'),
('Sanen','Lee','9'),
('Rodney','McGruder','9'),


/*. Team for Golden State Warrior */
('Kent','Bazemore','10'),
('Srephen','Curry','10'),
('Draymond','Green','10'),
('Damion','Lee','10'),
('Nico','Mannion','10'),
('Mychal','Mulder','10'),
('Kelly','Oubre','10'),
('Eric','Paschall','10'),
('Alen','Smailagic','10'),
('Klay','Thompson','10');


-- Inserting to teams table
INSERT into teams(city, nickname)
VALUES('Atlanta', 'Hawks'),('Boston', 'Celtics'),
		('Brooklyn', 'Nets'),('Charlotte', 'Hornets'),
        ('Chicago', 'Bulls'),('Cleveland', 'Cavaliers'),
        ('Dallas', 'Mavericks'),('Denver', 'Nuggets'),
        ('Detroit', 'Pistons'),('Golden State', 'Warriors');

-- creating a new table players to demonstrate trigger

DROP table players_account;
create table players_account(
	playerID    INT NOT NULL AUTO_INCREMENT,
	tax 		float NULL,
    age 		int NULL,
	CONSTRAINT paPK PRIMARY KEY(playerID)
	-- CONSTRAINT paFK FOREIGN KEY(playerID) REFERENCES players(playerID)
);

-- Triggering
-- This trigger function playerInfo will add tax paid by the players and random age (for demo) whenever 
-- data is inserted in the table player_contract

drop trigger playerInfo;
create trigger playerInfo 
AFTER INSERT ON player_contract
FOR EACH ROW
INSERT INTO players_account(tax, age)
	VALUES (new.amount * 37 /100 , FLOOR(RAND() * (45-18 + 1) + 18));

-- Inserting to player_contract table
INSERT into player_contract(amount, years, yearSigned) VALUES
(4198912, 3, 2020),
(5123531, 4, 2019),
(3232112, 2, 2019),
(4415255, 4, 2018),
(5423123, 3, 2021),
(343532, 2, 2021),
(542124, 4, 2017),
(909221, 4, 2018),
(44312231, 2, 2020),
(53231243, 2, 2020),
(21112424, 3, 2021),
(1012023, 3, 2019),
(50502100, 3, 2019),
(43212312, 3, 2018),
(34431223, 4, 2021),
(224412344, 2, 2021),
(541242311, 5, 2020),
(121231412, 2, 2019),
(234221234, 2, 2021),
(231421214, 3, 2019),
(989829832, 2, 2019),
(9288832, 1, 2020),
(23443233, 3, 2021),
(21231445, 4, 2018),
(24331222, 4, 2018),
(432334553, 4, 2019),
(294322345, 2, 2021),
(9892323, 2, 2021),
(90901122, 2, 2019),
(23232423, 3, 2021),
(243434312, 5, 2017),
(24455423, 4, 2018),
(4344322, 2, 2018),
(444555553, 3, 2020),
(6643223421, 4, 2016),
(243342134, 3, 2018),
(24432435, 3, 2021),
(597803423, 3, 2020),
(44542132, 3, 2019),
(24432445, 2, 2020),
(4334354534, 4, 2021),
(4325232342, 4, 2020),
(443231233, 2, 2020),
(44524232, 3, 2017),
(4543223422, 4, 2020),
(4524334, 2, 2019),
(4545412, 3, 2019),
(7346322433, 3, 2017),
(77890943, 4, 2019),
(434577984991, 6, 2018),
(5423423352, 3, 2021),
(2113443545, 5, 2020),
(443245787, 3, 2019),
(6643456334, 3, 2021),
(43425664343, 3, 2020),
(5654365345, 4, 2018),
(453423324, 5, 2019),
(5563423998, 3, 2020),
(5563455323, 2, 2019),
(435324324, 3, 2019),
(235423443423, 5, 2020),
(454325553, 5, 2020),
(98848457875, 3, 2021),
(878748383, 2, 2020),
(3455454566, 4, 2018),
(54543531232, 3, 2021),
(345698864, 3, 2020),
(5545332223, 2, 2021),
(5543543122, 2, 2020),
(345223455, 4, 2019),
(234254564565, 2, 2020),
(442342353, 3, 2021),
(4434533311, 3, 2019),
(4432423423, 3, 2020),
(2332132455, 3, 2018),
(289313124466, 6, 2017),
(3213145342, 3, 2019),
(33123231.54, 2, 2020),
(23452345.21, 2, 2020),
(4323444221.21, 5, 2019),
(31254534.32, 4, 2020),
(3423534552.21, 4, 2020),
(232356099.55, 3, 2019),
(54534232323.35, 4, 2019),
(34235534537, 4, 2020),
(45233423.56, 4, 2019),
(3232454546, 3, 2021),
(545346645, 3, 2019),
(43242355, 2, 2020),
(543545367.64, 3, 2019),
(56654453.95, 1, 2021),
(66455423565.32, 3, 2018),
(43245666767.44, 4, 2019),
(6457475699.49, 3, 2020),
(544221, 3, 2021),
(444555553, 3, 2020),
(6643223421, 4, 2016),
(243342134, 3, 2018),
(442342353, 3, 2021),
(4434533311, 3, 2019);

-- Inserting to player_stats table
INSERT into player_stats(playerID, season, Points, Rebounds, Assists) VALUES
(1 , 2016 , 10.7 , 3.4 , 2.6),
(2 , 2015 , 32.4 , 3.2 , 1.9),
(3 , 2020 , 32.4 , 5.9 , 2.5),
(4 , 2020 , 35.4 , 2.6 , 2.6),
(5 , 2020 , 4.4 , 4.4 , 5.9),
(6 , 2019 , 46.8 , 5.8 , 4.6),
(7 , 2020 , 9.4 , 0.1 , 5.7),
(8 , 2018 , 12.8 , 5.3 , 5.5),
(9 , 2021 , 12.6 , 1.5 , 1.6),
(10 , 2018 , 22.5 , 0.9 , 3.5),
(11 , 2015 , 2.3 , 2.2 , 3.7),
(12 , 2019 , 49.6 , 5.1 , 0.4),
(13 , 2018 , 22.2 , 3.1 , 5.4),
(14 , 2015 , 29.8 , 5.6 , 4.1),
(15 , 2021 , 12.4 , 1.5 , 0.4),
(16 , 2021 , 5.9 , 0.3 , 3.5),
(17 , 2021 , 26.2 , 3.9 , 3.9),
(18 , 2015 , 22.2 , 4.1 , 3.7),
(19 , 2020 , 19.1 , 3.7 , 5.1),
(20 , 2017 , 40.4 , 0.7 , 4.2),
(21 , 2017 , 39.9 , 2.9 , 0.7),
(22 , 2017 , 21.7 , 4.1 , 5.7),
(23 , 2015 , 3.4 , 3.7 , 0.5),
(24 , 2017 , 31.8 , 5.5 , 5.6),
(25 , 2020 , 35.1 , 0.3 , 1.4),
(26 , 2019 , 28.1 , 3.3 , 4.2),
(27 , 2019 , 49.8 , 5.8 , 0.1),
(28 , 2021 , 39.2 , 0.3 , 0.5),
(29 , 2021 , 39.4 , 0.7 , 2.2),
(30 , 2015 , 37.3 , 2.7 , 1.9),
(31 , 2020 , 9.7 , 3.3 , 2.6),
(32 , 2016 , 1.7 , 1.2 , 4.1),
(33 , 2015 , 40.1 , 1.4 , 5.9),
(34 , 2020 , 35.3 , 5.4 , 4.4),
(35 , 2019 , 47.6 , 5.2 , 4.8),
(36 , 2018 , 30.7 , 1.6 , 5.9),
(37 , 2016 , 1.9 , 5.8 , 4.8),
(38 , 2018 , 19.6 , 0.1 , 3.3),
(39 , 2017 , 16.1 , 1.8 , 5.6),
(40 , 2016 , 44.5 , 1.5 , 0.1),
(41 , 2018 , 14.9 , 4.3 , 3.7),
(42 , 2020 , 12.2 , 3.9 , 2.2),
(43 , 2016 , 26.4 , 1.4 , 4.2),
(44 , 2021 , 9.9 , 5.3 , 0.9),
(45 , 2021 , 8.8 , 5.9 , 2.6),
(46 , 2015 , 19.4 , 1.1 , 3.3),
(47 , 2020 , 20.7 , 4.5 , 3.9),
(48 , 2021 , 6.6 , 4.5 , 5.1),
(49 , 2015 , 7.6 , 2.1 , 4.7),
(50 , 2018 , 43.7 , 0.4 , 0.8),
(51 , 2016 , 9.3 , 0.2 , 0.1),
(52 , 2020 , 25.6 , 2.9 , 1.2),
(53 , 2018 , 18.7 , 4.4 , 2.5),
(54 , 2018 , 14.9 , 3.4 , 0.9),
(55 , 2021 , 16.5 , 1.2 , 0.7),
(56 , 2019 , 11.3 , 5.5 , 0.4),
(57 , 2015 , 22.8 , 1.6 , 1.7),
(58 , 2021 , 5.5 , 4.4 , 0.6),
(59 , 2017 , 11.3 , 1.7 , 5.5),
(60 , 2020 , 48.1 , 0.7 , 1.4),
(61 , 2019 , 26.2 , 2.3 , 4.4),
(62 , 2019 , 17.7 , 3.3 , 5.3),
(63 , 2017 , 31.1 , 5.1 , 2.7),
(64 , 2019 , 33.9 , 4.4 , 0.5),
(65 , 2020 , 1.3 , 0.5 , 0.8),
(66 , 2020 , 31.2 , 4.1 , 2.2),
(67 , 2018 , 28.1 , 4.1 , 0.1),
(68 , 2021 , 45.5 , 2.4 , 5.2),
(69 , 2019 , 23.6 , 2.7 , 0.6),
(70 , 2018 , 13.1 , 2.2 , 2.9),
(71 , 2019 , 34.3 , 2.8 , 3.8),
(72 , 2021 , 4.5 , 5.5 , 4.3),
(73 , 2015 , 18.3 , 4.9 , 2.8),
(74 , 2015 , 6.7 , 2.6 , 4.9),
(75 , 2016 , 41.1 , 3.3 , 4.4),
(76 , 2018 , 17.8 , 4.6 , 3.6),
(77 , 2021 , 33.5 , 1.4 , 3.6),
(78 , 2017 , 23.7 , 1.5 , 3.2),
(79 , 2018 , 21.8 , 5.9 , 5.2),
(80 , 2017 , 23.3 , 4.6 , 2.8),
(81 , 2016 , 29.9 , 3.4 , 5.5),
(82 , 2015 , 12.7 , 3.2 , 5.6),
(83 , 2018 , 41.6 , 0.3 , 0.5),
(84 , 2018 , 25.8 , 5.5 , 4.8),
(85 , 2018 , 25.4 , 2.8 , 4.9),
(86 , 2020 , 46.4 , 3.6 , 5.9),
(87 , 2016 , 28.6 , 2.2 , 5.9),
(88 , 2019 , 41.2 , 5.6 , 3.8),
(89 , 2019 , 46.4 , 0.3 , 2.4),
(90 , 2021 , 17.1 , 1.8 , 1.6),
(91 , 2020 , 45.7 , 1.3 , 1.1),
(92 , 2015 , 46.2 , 0.5 , 4.3),
(93 , 2021 , 43.5 , 1.5 , 2.5),
(94 , 2016 , 10.8 , 4.5 , 2.6),
(95 , 2017 , 10.1 , 4.6 , 4.2),
(96 , 2017 , 5.6 , 4.9 , 3.7),
(97 , 2019 , 25.8 , 4.3 , 0.5),
(98 , 2019 , 26.2 , 4.7 , 0.2),
(99 , 2019 , 23.2 , 3.2 , 2.4),
(100 , 2021 , 28.5 , 5.4 , 2.4);


-- Inserting to team_record table
INSERT into team_record(teamID, season, wins, losses, ties)
VALUES 
(1, 2021, 33, 7, 0),
(2, 2021, 32, 28, 0),
(3, 2021, 40, 20, 0),
(4, 2021, 29, 30, 0),
(5, 2021, 25, 34, 0),
(6, 2021, 21, 38, 0),
(7, 2021, 32, 26, 0),
(8, 2021, 38, 21, 0),
(9, 2021, 18, 42, 0),
(10, 2021, 30, 30, 0);


-- End of creating database.

