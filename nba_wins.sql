use gamelogs;

UPDATE gamelogs SET Wins = 
CASE
    WHEN Wins_Losses = 'W' THEN 1
    ELSE 0
END

CREATE TABLE NBA_Team_Wins (
    Team varchar(255),
    Season int,
    Win_Percentage float
);

INSERT INTO NBA_Team_Wins
SELECT Team, Season, ROUND((COUNT(*)/82)*100,2)  AS 'Win Percentage' 
FROM gamelogs WHERE Wins=1
GROUP BY Team, Season;

select * from NBA_Team_Wins
INTO OUTFILE 'C:/Users/herma/OneDrive/Documents/JupyterWorkspace/orders.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'







