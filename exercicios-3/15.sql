SELECT Country.Name,COUNT(city.name) AS Total_cidades
FROM world.country 
INNER JOIN world.city ON city.CountryCode = country.Code
GROUP BY Country.Name;