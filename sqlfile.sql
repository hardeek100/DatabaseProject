DROP DATABASE IF EXISTS basketball_League;
CREATE DATABASE IF NOT EXISTS basketball_League;
USE basketball_League;

    
DROP table teams;
DROP table team_record;
DROP table players;
DROP table player_stats;
DROP table player_contract;


CREATE TABLE teams
(
    teamID        INT    NOT NULL AUTO_INCREMENT,
    city        VARCHAR(25) NOT NULL,
    nickname    VARCHAR(25) NOT NULL,
    CONSTRAINT teamsPK PRIMARY KEY(teamID)
);
CREATE TABLE players
(
    playerID    INT NOT NULL AUTO_INCREMENT,
    firstName    VARCHAR(25) NOT NULL,
    lastName    VARCHAR(25),
    teamID 	INT NULL,
    CONSTRAINT playersPK PRIMARY KEY(playerID),
	CONSTRAINT playersFK FOREIGN KEY(teamID) REFERENCES teams(teamID)
);

CREATE TABLE player_contract
(
     playerID    INT NOT NULL AUTO_INCREMENT,
    amount    float NOT NULL,
    years    INT NOT NULL,
    yearSigned    INT NOT NULL,
    CONSTRAINT pcPK PRIMARY KEY(playerID),
    -- CONSTRAINT pcPK PRIMARY KEY(playerID, amount, years),
    	CONSTRAINT pcFK FOREIGN KEY(playerID) REFERENCES players(playerID)
);
CREATE TABLE team_record
(
    teamID        INT NOT NULL,
    season        INT NOT NULL,
    wins        INT NULL,
    losses        INT NULL,
    ties        INT NULL,
    CONSTRAINT trPK PRIMARY KEY(teamID, season),
	CONSTRAINT trFK FOREIGN KEY(teamID) REFERENCES teams(teamID)
);
CREATE TABLE player_stats
(
    playerID    INT NOT NULL,
    season        INT NOT NULL,
    Points        float NULL,
    Rebounds    float NULL,
    Assists        float NULL,
    CONSTRAINT psPK PRIMARY KEY(playerID, season),
	CONSTRAINT psFK FOREIGN KEY(playerID) REFERENCES players(playerID)
    );
    
    
SELECT * from teams;
SELECT * from team_record;
SELECT * from players;
SELECT * from player_stats;
SELECT * from player_contract;

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

SELECT * from player_contract;
select * from player_contract INNER JOIN players ON player_contract.playerID = players.playerID NATURAL JOIN teams where city = "Dallas";


