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
    teamID 		VARCHAR(25),
    CONSTRAINT playersPK PRIMARY KEY(playerID)
);

CREATE TABLE player_contract
(
    playerAssignmentID    INT    NOT NULL,
    amount    float NOT NULL,
    years    INT NOT NULL,
    yearSigned    INT NOT NULL,
    CONSTRAINT pcPK PRIMARY KEY(playerAssignmentID, amount, years)
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

