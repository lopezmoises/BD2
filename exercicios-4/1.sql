SELECT CountryCode,quantidade_linguas
FROM (SELECT CountryCode,COUNT(Language) AS quantidade_linguas FROM world.countrylanguage GROUP BY CountryCode) AS a
WHERE quantidade_linguas > (SELECT (SELECT COUNT(Language) FROM world.countrylanguage) / (SELECT COUNT(DISTINCT CountryCode) FROM world.countrylanguage)  )

