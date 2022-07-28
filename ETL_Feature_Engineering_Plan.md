- The following columns have very high number of null values (more than 85% null). So, we will drop these columns from potential features list:
    - icu_patients                               
    - icu_patients_per_million 
    - hosp_patients
    - hosp_patients_per_million
    - weekly_icu_admissions
    - weekly_icu_admissions_per_million
    - weekly_hosp_admissions 
    - weekly_hosp_admissions_per_million

- Cleaning features columns:


1. **total_cases**: drop nulls of total_cases: there is no point in filling empty days with zero cases becuase the covid_days of first reported cases will reflect the delayed spread of COVID-19 in that location. (We could, instead of dropping all nulls, drop only nulls before the first non-null total_cases for each location through a for loop, then for the missing total_cases inbetween records, we could create a for loop that fills these nulls with the total_cases from the cell above if not null; we don't want to do total_cases average of the cell above and below because the cell below might be null too). However, there are only 2,701 null total_cases, so for better time management, we will simply drop these values as most of them will be the days of no reporting before the first positive case in that location. 

2. **new_cases**: fill what's left of null new_cases (after dropping null total_cases) with zeros because if they exist without corresponding nulls in total_cases then they are probably zeros. 

**Create a clean dataframe**

3. **new_cases_smoothed**: the OWID team start calculating the smoothed average on the sixth day of the the first case reported in that location. However, there are missing values in between established positive cases reports, so we will drop this column and replace it with out own calculation: **(new_cases_smoothed = total_cases[i] - new_cases[i-7] / 7)**
- or we check new_cases_smoothed nulls after dropping total_cases nulls and filling what's left null in new_cases with zero: if there are new_cases_smoothed nulls then we either calculate them by creating a loop that checks if new_cases_smoothed is null then **fillna** with (new_cases_smoothed = total_cases[i] - new_cases[i-7] / 7).

4. **total_deaths**: there are 12,382 nulls total_deaths in the cleaned df. 
5. **new_deaths**: there are 12,523 nulls new_deaths in the cleaned df. 

we either fillna total_deaths and new_deaths with zeros and leave them with cases columns in one dataframe, eventhough we will not be including deaths-related columns in the features to predict cases numbers because it's *post factum* event.
or we create a sub df from cleaned df (because cases occurance is a feature in death predictions), which has the deaths-related columns and then we treat total_deaths and new_deaths nulls in the same way we handled total_cases and new_cases, where we would drop total_deaths nulls becase they mostly reflect delayed incidence of deaths in that location, then fill the left nulls of new_deaths with zeros because if they exsit with nonull total_deaths then they would probably be missed values of no deaths or no reporting. 

It would be easier to handle deaths-related nulls than handling zeros, so it's better to leave them null till after all other columns are processed then subsection them into a separate df with all other processed columns. 

6. **new_deaths_smoothed**: same as new_cases_smoothed.
7. **total_cases_per_million**: check nulls after dropping total_cases nulls and filling new_cases nulls with 0, if there are nulls in total_cases_per_million, loop and fill with calculation (total_cases/population * 1000000). 
8. **new_cases_per_million**: check nulls after dropping total_cases nulls and filling new_cases na with 0, if there are nulls in new_cases_per_million, loop and fill with calculation (new_cases/population * 1000000). 
9. **new_cases_smoothed_per_million**: check nulls after..., if nulls, loop and fill with calculation **(new_cases_smoothed/population * 1000000)**.
10. **total_deaths_per_million**: if there are nulls in total_deaths_per_million, loop and fill with calculation (total_deaths/population * 1000000).
11. **new_deaths_per_million**: if there are nulls in new_deaths_per_million, loop and fill with calculation (new_deaths/population * 1000000).
12. **new_deaths_smoothed_per_million**: check nulls after..., if nulls, loop and fill with calculation **(new_deaths_smoothed/population * 1000000)**.
13. **reproduction_rate**: check nulls, decide to drop or fill with zero.
14. **total_vaccinations**: 
    - first vaccination available in the dataset is 2020-12-02, 
    - window of reporting changed from daily to weekdays only after march 29, 2022
    - we need to find the first vaccination records for each location and fillna with zero everything above it. 
    - Then, check for nulls, either stop the data at march 29, 2022 (then check for nulls in new march df and fillna with zeros), or drop the nulls till July 4, 2022.
15. **people_vaccinated**: check nulls after handling total_vaccinations. then apply same fillna(0) as total_vaccinations for the rows above first entry for the location and drop the rest.  
16. **people_fully_vaccinated**: check nulls after handling total_vaccinations. then apply same fillna(0) as total_vaccinations for the rows above first entry for the location and drop the rest.  
17. **total_boosters**: fillna(0)
18. **new_vaccinations**: fillna(0)
19. **new_vaccinations_smoothed**: same as new_cases_smoothed.
20. **total_vaccinations_per_hundred**: fillna(0)
21. **people_vaccinated_per_hundred**: fillna(0)
22. **people_fully_vaccinated_per_hundred**: fillna(0)
23. **total_boosters_per_hundred**: fillna(0)
24. **new_vaccinations_smoothed_per_million**: if there are nulls in total_cases_per_million, loop and fill with calculation (total_cases/population * 1000000). 
25. **new_people_vaccinated_smoothed**: 
26. **new_people_vaccinated_smoothed_per_hundred**:
27. **stringency_index**:
28. **population**:
29. **population_density**:
30. **median_age**:
31. **aged_65_older**:
32. **gdp_per_capita**:
33. **extreme_poverty**:
34. **cardiovasc_death_rate**:
35. **diabetes_prevalence**:
36. **female_smokers**:
37. **male_smokers**:
38. **handwashing_facilities**:
39. **hospital_beds_per_thousand**:
40. **life_expectancy**:
41. **human_development_index**:

## New Columns to normalize data per 100,000 people
All the following calculations are possible if after dropping nulls in the raw number columns, the calculated columns don't have nulls. Otherwise, we would have to create for loops that calculate the rates per 100,000 by dividing the original numbers / population * 100000

- **total_cases_per_100K** = total_cases_per_million / 10
- **new_cases_per_100K** = new_cases_per_million / 10
- **new_cases_smoothed_per_100K** = new_cases_smoothed_per_million / 10
- **total_deaths_per_100K** = total_deaths_per_million / 10
- **new_deaths_per_100K** = new_deaths_per_million / 10 
- **new_deaths_smoothed_per_100K** = new_deaths_smoothed_per_million / 10 
- **total_vaccinations_per_100K** = total_vaccinations_per_hundred * 1000
- **people_vaccinated_per_100K** = people_vaccinated_per_hundred * 1000
- **people_fully_vaccinated_per_100K** = people_fully_vaccinated_per_hundred * 1000
- **total_boosters_per_100K**  total_boosters_per_hundred * 1000
- **new_vaccinations_per_100K** = new_vaccinations / population * 100000
- **new_vaccinations_smoothed_per_100K** = new_vaccinations_smoothed_per_million / 10
- **new_people_vaccinated_smoothed_per_100K** = new_people_vaccinated_smoothed_per_hundred * 1000
- **hospital_beds_per_100K** = hospital_beds_per_thousand * 100


## Define Relevant Features
- Drop the location and date columns 
















