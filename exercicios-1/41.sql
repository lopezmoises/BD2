SELECT * FROM world.country 
LEFT JOIN world.countrylanguage ON world.countrylanguage.CountryCode = world.country.Code
WHERE Language = 'Spanish' AND IsOfficial = 'T'