CREATE DATABASE PlayerStats;
 USE PlayerStats;
create table StatTypes(
StatCode VARCHAR(4) NOT NULL,
Name VARCHAR(150) NOT NULL,
primary key(StatCode)
);
INSERT INTO StatTypes(StatCode,Name)VALUES( 'G','Goal');
INSERT INTO StatTypes(StatCode,Name)VALUES( 'A','Assist');
INSERT INTO StatTypes(StatCode,Name)VALUES( 'R','Red Card');
INSERT INTO StatTypes(StatCode,Name)VALUES( 'Y','Yellow card');
INSERT INTO StatTypes(StatCode,Name)VALUES( 'OG','Own Goal');
INSERT INTO StatTypes(StatCode,Name)VALUES( 'IN','Player in');
INSERT INTO StatTypes(StatCode,Name)VALUES( 'OUT','Player out');
create table Positions(
PositionCode VARCHAR(4) NOT NULL,
Name VARCHAR(150) NOT NULL,
primary key (PositionCode)
);
INSERT INTO Positions(PositionCode,Name)
VALUES( 'GK','Goal keeper');
INSERT INTO Positions(PositionCode,Name)
VALUES( 'RB','Right back');
INSERT INTO Positions(PositionCode,Name)
VALUES( 'LB','Left back');  
INSERT INTO Positions(PositionCode,Name)
VALUES( 'CB','Centre back');  
INSERT INTO Positions(PositionCode,Name)
VALUES( 'RM','Right midfield');  
INSERT INTO Positions(PositionCode,Name)
VALUES( 'LM','Left midfield');  
INSERT INTO Positions(PositionCode,Name)
VALUES( 'CM','Centre midfield');  
INSERT INTO Positions(PositionCode,Name)
VALUES( 'CF','Centre forward');
create table Players(
    id int auto_increment not null,
    Name VARCHAR(150) not null,
    Num int not null,
    PositionCode VARCHAR(4) NOT NULL,
    primary key (id,Num,Name),
    FOREIGN KEY (PositionCode) REFERENCES Positions(PositionCode)
);
INSERT INTO Players(Name,Num,PositionCode)
VALUES('Ivaylo Trifonov',1,'GK');
INSERT INTO Players(Name,Num,PositionCode)
VALUES('Valko Trifonov',2,'RB');
INSERT INTO Players(Name,Num,PositionCode)
VALUES('Ognyan Yanev',3,'CB');
INSERT INTO Players(Name,Num,PositionCode)
VALUES('Zahari Dragomirov',4,'CB');
INSERT INTO Players(Name,Num,PositionCode)
VALUES('Bozhidar Chilikov',5,'LB');
INSERT INTO Players(Name,Num,PositionCode)
VALUES('Timotei Zahariev',6,'CM');
INSERT INTO Players(Name,Num,PositionCode)
VALUES('Marin Valentinov',7,'CM');
INSERT INTO Players(Name,Num,PositionCode)
VALUES('Mitre Cvetkov',99,'CF');
INSERT INTO Players(Name,Num,PositionCode)
VALUES('Zlatko Genov',9,'CF');
INSERT INTO Players(Name,Num,PositionCode)
VALUES('Matey Goranov',10,'RM');
INSERT INTO Players(Name,Num,PositionCode)
VALUES('Sergei Zhivkov',11,'LM');
create table Tournaments (
id int not null auto_increment,
 Name VARCHAR(50),
 primary key(id)
);
insert into Tournaments(Name)
values('Champions League');
insert into Tournaments(Name)
values('First Professional Football League');
insert into Tournaments(Name)
values('Bulgarian Cup');
insert into Tournaments(Name)
values('Bulgarian Supercup');
create table Matches (
id int not null auto_increment,
MatchDate DATE,
TournamentId int,
primary key(id,TournamentId),
 FOREIGN KEY (TournamentId) REFERENCES Tournaments(id)
);
insert into Matches( MatchDate,TournamentId)
values('2017-04-08',2);
insert into Matches( MatchDate,TournamentId)
values('2017-04-13',2);
insert into Matches( MatchDate,TournamentId)
values('2017-04-21',2);
insert into Matches( MatchDate,TournamentId)
values('2017-04-28',2);
insert into Matches( MatchDate,TournamentId)
values('2017-05-06',2);
insert into Matches( MatchDate,TournamentId)
values('2017-05-11',2);
insert into Matches( MatchDate,TournamentId)
values('2016-09-21',3);
insert into Matches( MatchDate,TournamentId)
values('2016-10-26',3);
create table MatchStats (
id int not null auto_increment,
MatchId int not null,
PlayerId int not null,
EventMinute int not null,
StatCode VARCHAR(4) NOT NULL,
primary key(id),
foreign key (MatchId) references Matches(id),
foreign key (PlayerId) references Players(id),
foreign key (StatCode) references StatTypes(StatCode)
 
);
insert into MatchStats(MatchId,PlayerId,EventMinute,StatCode)
values(8,9,14,'G');
insert into MatchStats(MatchId,PlayerId,EventMinute,StatCode)
values(8,8,14,'A');
insert into MatchStats(MatchId,PlayerId,EventMinute,StatCode)
values(8,3,43,'Y');
insert into MatchStats(MatchId,PlayerId,EventMinute,StatCode)
values(7,2,28,'Y');
insert into MatchStats(MatchId,PlayerId,EventMinute,StatCode)
values(7,10,45,'Y');
insert into MatchStats(MatchId,PlayerId,EventMinute,StatCode)
values(7,10,65,'R');
insert into MatchStats(MatchId,PlayerId,EventMinute,StatCode)
values(1,10,23,'G');
insert into MatchStats(MatchId,PlayerId,EventMinute,StatCode)
values(1,9,23,'A');
insert into MatchStats(MatchId,PlayerId,EventMinute,StatCode)
values(1,9,43,'G');
insert into MatchStats(MatchId,PlayerId,EventMinute,StatCode)
values(2,4,33,'OG');
insert into MatchStats(MatchId,PlayerId,EventMinute,StatCode)
values(2,9,68,'G');
insert into MatchStats(MatchId,PlayerId,EventMinute,StatCode)
values(2,1,68,'A');
insert into MatchStats(MatchId,PlayerId,EventMinute,StatCode)
values(3,3,35,'G');
insert into MatchStats(MatchId,PlayerId,EventMinute,StatCode)
values(3,4,35,'A');
insert into MatchStats(MatchId,PlayerId,EventMinute,StatCode)
values(3,8,55,'G');
insert into MatchStats(MatchId,PlayerId,EventMinute,StatCode)
values(3,11,55,'A');
insert into MatchStats(MatchId,PlayerId,EventMinute,StatCode)
values(4,3,9,'G');
insert into MatchStats(MatchId,PlayerId,EventMinute,StatCode)
values(4,8,9,'G');
insert into MatchStats(MatchId,PlayerId,EventMinute,StatCode)
values(4,8,56,'OG');
insert into MatchStats(MatchId,PlayerId,EventMinute,StatCode)
values(5,8,67,'G');