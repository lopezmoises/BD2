SELECT Country.Name,AVG(city.Population) AS Media_populacao
FROM world.country 
INNER JOIN world.city ON city.CountryCode = country.Code
GROUP BY Country.Name
HAVING Media_populacao > 70000
ORDER BY Media_populacao ASC;