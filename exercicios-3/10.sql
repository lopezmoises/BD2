SELECT Continent, AVG(SurfaceArea) AS Media_areas
FROM world.country 
GROUP BY Continent
ORDER BY Media_areas DESC;