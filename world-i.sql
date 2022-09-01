# USE world;

# 1. Get all the list of countries that are in the continent of Europe.
SELECT * FROM country WHERE continent = 'Europe';

# 2. Get all the list of countries that are in the continent of North America and Africa.
SELECT * FROM country WHERE continent IN ('North America', 'Africa');

# 3. Get all the list of cities that are part of a country with population greater than 100 millions.
SELECT co.Code AS country_code, co.Name AS country_name, co.Continent AS continent, co.Population AS country_population, ci.Name AS city
FROM city AS ci
LEFT JOIN country AS co
ON co.Code = ci.CountryCode
WHERE co.Population > 100000000;

# 4. Get all the list of countries (display the full country name) who speak 'Spanish' as their language.
SELECT co.Name AS country, l.language
FROM country AS co
LEFT JOIN countrylanguage AS l
ON l.CountryCode = co.Code
WHERE l.language = 'Spanish';

# 5. Get all the list of countries (display the full country name) who speak 'Spanish' as their official language.
SELECT co.Name AS country, l.language, l.IsOfficial 
FROM country AS co
LEFT JOIN countrylanguage AS l
ON l.CountryCode = co.Code
WHERE l.language = 'Spanish' AND l.IsOfficial = 'T';

# 6. Get all the list of countries (display the full country name) who speak either 'Spanish' or 'English' as their official language.
SELECT co.Name AS country, l.language, l.IsOfficial 
FROM country AS co
LEFT JOIN countrylanguage AS l
ON l.CountryCode = co.Code
WHERE l.language IN ('Spanish', 'English') AND l.IsOfficial = 'T';

# 7. Get all the list of countries (display the full country name) where 'Arabic' is spoken by more 
# than 30% of the population but where it's not the country's official language.
SELECT co.Name AS country, l.language, l.Percentage AS percentage, l.IsOfficial 
FROM country AS co
LEFT JOIN countrylanguage AS l
ON l.CountryCode = co.Code
WHERE l.language = 'Arabic' AND co.Population * (l.Percentage/100) > co.Population * (30/100) AND l.IsOfficial != 'T';

# 8. Get all the list of countries (display the full country name) where 'French' is the official language but where less
# than 50% of the population in that country actually speaks that language.
SELECT co.Name AS country, l.language, l.Percentage AS percentage, l.IsOfficial 
FROM country AS co
LEFT JOIN countrylanguage AS l
ON l.CountryCode = co.Code
WHERE l.language = 'French' AND l.IsOfficial = 'T' AND co.Population * (l.Percentage/100) < co.Population * (50/100);

# 9. Get all the list of countries (display the full country name and the full language name) and their official
# language. Order the result so that those with the same official language are shown together.
SELECT co.Name AS country, l.language, l.IsOfficial 
FROM country AS co
LEFT JOIN countrylanguage AS l
ON l.CountryCode = co.Code
WHERE l.IsOfficial != 'F'
ORDER BY l.language;

# 10. Get the top 100 cities with the most population. Display the city's full country name also as well as their official language.
SELECT co.Name AS country, ci.Name AS city, co.Population AS population, l.Language AS language, l.IsOfficial
FROM city AS ci
LEFT JOIN country AS co
ON co.Code = ci.CountryCode
LEFT JOIN countrylanguage AS l
ON l.CountryCode = co.Code
WHERE l.IsOfficial != 'F'
ORDER BY population DESC 
LIMIT 100;

# 11. Get the top 100 cities with the most population where the life_expectancy for the country is less than 40.
SELECT co.Name AS country, ci.Name AS city, co.LifeExpectancy as life_expectancy, co.Population AS population
FROM city AS ci
LEFT JOIN country AS co
ON co.Code = ci.CountryCode
WHERE co.LifeExpectancy < 40
ORDER BY population DESC 
LIMIT 100;

# 12. Get the top 100 countries who speak English and where life expectancy is highest. Show the country with the
# highest life expectancy first.
SELECT co.Name AS country, ci.Name AS city, co.LifeExpectancy as life_expectancy, l.Language AS language
FROM city AS ci
LEFT JOIN country AS co
ON co.Code = ci.CountryCode
LEFT JOIN countrylanguage AS l
ON l.CountryCode = co.Code
WHERE language = 'English'
ORDER BY life_expectancy DESC
LIMIT 100;
