# basics
- SELECT population FROM world WHERE name = 'Germany';
- SELECT name, population FROM world WHERE name IN ('Sweden', 'Norway', 'Denmark');
- SELECT name, area FROM world WHERE area BETWEEN 200000 AND 250000;

# from world
- SELECT name, continent, population FROM world;
- SELECT name FROM world WHERE population >= 200000000;
- SELECT name, GDP/ population FROM world WHERE population >= 200000000;
- SELECT name, population/1000000 FROM world WHERE continent = 'South America';
- SELECT name, population FROM world WHERE name IN ('Italy', 'Germany', 'France');
- SELECT name FROM world WHERE name LIKE '%United%';
- SELECT name, population, area FROM world WHERE area > 3000000 OR population > 250000000;
- SELECT name, population, area FROM world WHERE area > 3000000 XOR population > 250000000;
- SELECT name, ROUND(population/1000000,2), ROUND(GDP/1000000000,2) FROM world WHERE continent='South America';
- SELECT name, ROUND(GDP/population,-3) FROM world WHERE GDP>= 1000000000000;
- SELECT name, capital FROM world WHERE LENGTH(name) =  LENGTH(capital);
- SELECT name, capital FROM world WHERE LEFT(name,1) = LEFT(capital,1) and name <> capital;
- SELECT name FROM world WHERE name LIKE '%a%' AND name LIKE '%e%' AND name LIKE '%i%' AND name LIKE '%o%' AND name LIKE '%u%' AND name NOT LIKE '% %';

# SELECT IN SELECT
- SELECT name FROM world WHERE population > (SELECT population FROM world WHERE name='Russia');
- SELECT name FROM world WHERE GDP/population > (SELECT GDP/population FROM world WHERE name = 'United Kingdom') AND continent = 'Europe';
- SELECT name, continent FROM world WHERE continent IN (SELECT continent FROM world WHERE name IN ('Argentina', 'Australia'))ORDER BY name;
- SELECT name, population FROM world WHERE population > (SELECT population FROM world WHERE name = 'Canada') AND  population < (SELECT population FROM world WHERE name = 'Poland')
- SELECT name, CONCAT(ROUND(100*population/(SELECT population FROM world WHERE name = 'Germany')),'%') FROM world WHERE continent = 'Europe'
- SELECT name FROM world WHERE gdp >= ALL(SELECT gdp FROM world WHERE gdp >=0 AND continent = 'Europe') AND continent != 'Europe'
- SELECT continent, name, area FROM world x WHERE area >= ALL (SELECT area FROM world y WHERE y.continent=x.continent AND area>0)
- SELECT continent, name FROM world x WHERE name <= ALL(SELECT name FROM world y WHERE y.continent = x.continent)
- SELECT name, continent, population FROM world x WHERE 25000000  > ALL(SELECT population FROM world y WHERE x.continent = y.continent AND y.population > 0)
- SELECT name, continent FROM world x WHERE population > ALL(SELECT population*3 FROM world y WHERE x.continent = y.continent AND population > 0 AND y.name != x.name)

# SUM and COUNT
- SELECT SUM(population) FROM world;
- SELECT DISTINCT(continent) FROM world;
- SELECT SUM(GDP) FROM world WHERE continent = 'Africa'
- SELECT COUNT(name) FROM world WHERE area >= 1000000
- SELECT SUM(population) FROM world WHERE name IN ('Estonia', 'Latvia', 'Lithuania')
- SELECT continent, COUNT(name) FROM world GROUP BY continent
- SELECT continent, COUNT(name) FROM world WHERE population >= 10000000 GROUP BY continent
- SELECT continent FROM world GROUP BY continent HAVING SUM(population) >= 100000000


# The JOIN operation
- SELECT matchid, player FROM goal WHERE teamid = 'GER'
- SELECT id,stadium,team1,team2 FROM game WHERE id = 1012
- SELECT goal.player,goal.teamid, stadium, mdate FROM game JOIN goal ON (id=matchid AND goal.teamid='GER')
- SELECT team1, team2 stadium, player FROM game JOIN goal ON (id=matchid AND player LIKE 'Mario%')
- SELECT player, teamid, coach, gtime FROM goal goal JOIN eteam on teamid=id WHERE gtime<=10
- SELECT mdate, teamname FROM game JOIN eteam ON (team1=eteam.id) WHERE coach = 'Fernando Santos';
- SELECT player FROM goal JOIN game ON (matchid = id) WHERE stadium = 'National Stadium, Warsaw'
- SELECT DISTINCT(player) FROM game JOIN goal ON matchid = id WHERE ((team1='GER' OR team2='GER') AND teamid != 'GER')
- SELECT teamname, COUNT(player) FROM eteam JOIN goal ON id=teamid GROUP BY teamname
- SELECT stadium ,COUNT(stadium)FROM game join goal ON(id = matchid) GROUP BY stadium                 
- SELECT matchid,mdate,COUNT(matchid) FROM game JOIN goal ON matchid = id WHERE (team1 = 'POL' OR team2 = 'POL') GROUP BY matchid, mdate    
- SELECT DISTINCT matchid, game.mdate,COUNT(matchid) FROM goal JOIN game on (matchid = id) WHERE teamid= 'GER' GROUP BY matchid,game.mdate                                                                                                  
