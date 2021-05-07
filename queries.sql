-- queries to demonstrate relational database system.

-- To view all the data in the table.
SELECT * from teams;
SELECT * from team_record;
SELECT * from players;
SELECT * from player_stats;
SELECT * from player_contract;
SELECT * from players_account;

-- Create view players_city to view players from Dallas city.
DROP VIEW players_dallas;
CREATE VIEW players_dallas as SELECT * from players NATURAL JOIN teams where city = "Dallas";
SELECT firstName, lastName from players_dallas;
SELECT * from players_dallas NATURAL JOIN player_stats;

-- To view players for all cities
select * from players INNER JOIN teams ON players.teamID = teams.teamID;

-- To view players with city like boston
select * from players NATURAL JOIN teams where city LIKE "%boston%"; 

-- To view players and their contracts;
select * from players NATURAL JOIN player_contract;

-- To view player contracts for team 3
select * from players NATURAL JOIN player_contract where teamID = 3;

-- To view player contracts signed after or in 2020
select * from players NATURAL JOIN player_contract where yearSigned >= 2020;

-- To view players names who has player contract more than 2 years
select firstName, lastName ,years from players NATURAL JOIN player_contract where years > 2;

-- To view players details with its team who earns the maximum amount
select * from players NATURAL JOIN player_contract NATURAL JOIN teams where amount = (select max(amount) from player_contract);

-- To view player details with its team who ears the minimum amount
select * from players NATURAL JOIN player_contract NATURAL JOIN teams where amount = (select min(amount) from player_contract);

-- To view players with their stats
select * from players NATURAL JOIN player_stats;

-- To view player first name in order of the points
select firstName, Points from players NATURAL JOIN player_stats order by Points ASC;

-- To view the team record
select * from teams NATURAL JOIN team_record;

-- To view the teams with maximum wins
select * from teams NATURAL JOIN team_record where wins = (SELECT max(wins) from team_record);

-- To view the teams with lowest wins
select * from teams NATURAL JOIN team_record where wins = (SELECT min(wins) from team_record);

-- To view the teams in order of their wins in descending order
select * from teams NATURAL JOIN team_record order by wins DESC;

-- To get the total tax paid by all players
select sum(tax) from players_account;

select playerID, amount, amount* 37/100, yearSigned, tax, age from player_contract NATURAL JOIN players_account;

-- Indexing table team_record ( NA in our database)
DROP INDEX team_index ON team_record; 
CREATE INDEX team_index ON team_record(season);
select * from team_record;

select * from player_contract INNER JOIN players ON player_contract.playerID = players.playerID NATURAL JOIN teams where city = "Dallas";


-- Storage engines
SHOW VARIABLES LIKE "default_storage_engine";
SELECT table_name, engine FROM information_schema.tables WHERE table_schema = 'ap';