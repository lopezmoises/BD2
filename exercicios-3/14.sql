SELECT Name,COUNT(language) AS Total_idiomas
FROM world.country 
INNER JOIN world.countrylanguage ON countrylanguage.CountryCode = country.Code
GROUP BY Name
HAVING Total_idiomas > 10;