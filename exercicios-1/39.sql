SELECT * FROM world.country 
LEFT JOIN world.countrylanguage ON world.countrylanguage.CountryCode = world.country.Code
WHERE world.countrylanguage.Language = 'Dutch'