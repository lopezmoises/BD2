SELECT Continent, AVG(SurfaceArea) AS Media_areas
FROM world.country 
GROUP BY Continent;