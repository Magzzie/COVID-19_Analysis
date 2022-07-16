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
				  'High income', 'Low income', 'Northern Cyprus',
				  'Lower middle income', 'Upper middle income',
				  'European Union', 'International', 'World');

--Putting only countries into a separate table
INSERT INTO countries_data
SELECT * FROM total_data
WHERE location NOT IN ('Africa', 'Asia', 'Europe', 
				  'North America', 'Oceania', 'South America',
				  'High income', 'Low income', 'Northern Cyprus',
				  'Lower middle income', 'Upper middle income',
				  'European Union', 'International', 'World');

--Putting only countries with a population > 1000000 into coutnrues_data
INSERT INTO countries_data
SELECT * FROM total_data
WHERE location NOT IN ('Africa', 'Asia', 'Europe', 
				  'North America', 'Oceania', 'South America',
				  'High income', 'Low income', 'Northern Cyprus',
				  'Lower middle income', 'Upper middle income',
				  'European Union', 'International', 'World')
AND population > 1000000;

--Joining cases_data and demos_data into combined_COVID_data
CREATE TABLE combined_COVID_data as
SELECT A.id_row, A.iso_code, A.continent, A.location, A.date, 
A.total_cases, A.new_cases, A.new_cases_smoothed, 
A.total_deaths, A.new_deaths, A.new_deaths_smoothed, 
A.total_cases_per_million, A.new_cases_per_million, 
A.new_cases_smoothed_per_million, A.total_deaths_per_million, 
A.new_deaths_per_million, A.new_deaths_smoothed_per_million, 
A.reproduction_rate, A.icu_patients, A.icu_patients_per_million, 
A.hosp_patients, A.hosp_patients_per_million, A.weekly_icu_admissions, 
A.weekly_icu_admissions_per_million, A.weekly_hosp_admissions, 
A.weekly_hosp_admissions_per_million, A.total_tests, A.new_tests, 
A.total_tests_per_thousand, A.new_tests_per_thousand, A.new_tests_smoothed, 
A.new_tests_smoothed_per_thousand, A.positive_rate, A.tests_per_case, 
A.tests_units, A.total_vaccinations, A.people_vaccinated, 
A.people_fully_vaccinated, A.total_boosters, A.new_vaccinations, 
A.new_vaccinations_smoothed, A.total_vaccinations_per_hundred, 
A.people_vaccinated_per_hundred, A.people_fully_vaccinated_per_hundred, 
A.total_boosters_per_hundred, A.new_vaccinations_smoothed_per_million, 
A.new_people_vaccinated_smoothed, A.new_people_vaccinated_smoothed_per_hundred, 
A.stringency_index, B.population,B.population_density, B.median_age, 
B.aged_65_older, B.aged_70_older, B.gdp_per_capita, B.extreme_poverty, 
B.cardiovasc_death_rate, B.diabetes_prevalence, B.female_smokers, 
B.male_smokers, B.handwashing_facilities, B.hospital_beds_per_thousand, 
B.life_expectancy, B.human_development_index, B.excess_mortality_cumulative_absolute, 
B.excess_mortality_cumulative, B.excess_mortality, B.excess_mortality_cumulative_per_million
FROM cases_data as A
FULL OUTER JOIN demos_data as B on A.id_row=B.id_row;