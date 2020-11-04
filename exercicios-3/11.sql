SELECT Continent,MAX(SurfaceArea) AS Maior_area
FROM world.country 
GROUP BY Continent;