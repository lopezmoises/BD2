SELECT * FROM world.city 
LEFT JOIN world.country ON world.country.Code = world.city.CountryCode
LEFT JOIN world.countrylanguage ON world.countrylanguage.CountryCode = world.country.Code
WHERE Language = 'Dutch';