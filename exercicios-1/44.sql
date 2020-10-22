SELECT country.name,country.Continent,country.Region,country.Population,city.Name,city.District,city.Population,countrylanguage.Language 
FROM world.country 
LEFT JOIN world.city ON world.city.CountryCode = world.country.Code
LEFT JOIN world.countrylanguage ON world.countrylanguage.CountryCode = world.country.Code
WHERE Continent = 'Europe';
