-- Selecting all values that are not countries
SELECT * FROM total_data
WHERE location in ('Africa', 'Asia', 'Europe', 
				  'North America', 'Oceania', 'South America',
				  'High income', 'Low income', 
				  'Lower middle income', 'Upper middle income',
				  'European Union', 'International', 'World');

--Selecting all values that are coutnries
SELECT * FROM total_data
WHERE location not in ('Africa', 'Asia', 'Europe', 
				  'North America', 'Oceania', 'South America',
				  'High income', 'Low income', 
				  'Lower middle income', 'Upper middle income',
				  'European Union', 'International', 'World');

--Putting not countries into a separate table
INSERT INTO not_countries_data
SELECT * FROM total_data
WHERE location in ('Africa', 'Asia', 'Europe', 
				  'North America', 'Oceania', 'South America',
				  'High income', 'Low income', 
				  'Lower middle income', 'Upper middle income',
				  'European Union', 'International', 'World');

--Putting only countries into a separate table
INSERT INTO countries_data
SELECT * FROM total_data
WHERE location NOT IN ('Africa', 'Asia', 'Europe', 
				  'North America', 'Oceania', 'South America',
				  'High income', 'Low income', 
				  'Lower middle income', 'Upper middle income',
				  'European Union', 'International', 'World');