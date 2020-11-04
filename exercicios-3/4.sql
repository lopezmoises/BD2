SELECT Continent, COUNT(Name) AS Countries_quantity 
FROM world.country 
GROUP BY Continent 
HAVING Countries_quantity > 50;