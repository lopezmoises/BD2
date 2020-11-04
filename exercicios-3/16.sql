SELECT Country.Name,AVG(city.Population) AS Media_populacao
FROM world.country 
INNER JOIN world.city ON city.CountryCode = country.Code
GROUP BY Country.Name;