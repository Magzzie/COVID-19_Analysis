# Our World In Data COVID-19 Dataset
From [OWID GitHub Repository ReadMe.](https://github.com/owid/covid-19-data/tree/master/public/data)

## Data Citation 
Hannah Ritchie, Edouard Mathieu, Lucas Rodés-Guirao, Cameron Appel, Charlie Giattino, Esteban Ortiz-Ospina, Joe Hasell, Bobbie Macdonald, Diana Beltekian and Max Roser (2020) - "Coronavirus Pandemic (COVID-19)". Published online at OurWorldInData.org. Retrieved from: [Our World In Data / Coronavirus](https://ourworldindata.org/coronavirus)

## Data Explanation
The complete COVID-19 dataset is a collection of the COVID-19 data maintained by Our World in Data. It has been updated daily throughout the duration of the COVID-19 pandemic.<br>

The dataset includes all of the historical data on the pandemic up to the date of publication/ collection.<br>

**Here is a list of variables we will include in our machine learning and neural network prediction models:** 

| Variable | Description |
| --- | --- |
|**Confirmed Cases**|  |
|**total_cases**| Total confirmed cases of COVID-19. Counts can include probable cases, where reported.|
|**new_cases**| New confirmed cases of COVID-19. Counts can include probable cases, where reported. In rare cases where our source reports a negative daily change due to a data correction, we set this metric to NA.|
|**new_cases_smoothed**| New confirmed cases of COVID-19 (7-day smoothed). Counts can include probable cases, where reported.|
|**total_cases_per_million**| Total confirmed cases of COVID-19 per 1,000,000 people. Counts can include probable cases, where reported.|
|**new_cases_per_million**| New confirmed cases of COVID-19 per 1,000,000 people. Counts can include probable cases, where reported.|
|**new_cases_smoothed_per_million**| New confirmed cases of COVID-19 (7-day smoothed) per 1,000,000 people. Counts can include probable cases, where reported.|
|**Confirmed Deaths**|  |
|**total_deaths**| Total deaths attributed to COVID-19. Counts can include probable deaths, where reported.|
|**new_deaths**| New deaths attributed to COVID-19. Counts can include probable deaths, where reported. In rare cases where our source reports a negative daily change due to a data correction, we set this metric to NA.|
|**new_deaths_smoothed**| New deaths attributed to COVID-19 (7-day smoothed). Counts can include probable deaths, where reported.|
|**total_deaths_per_million**| Total deaths attributed to COVID-19 per 1,000,000 people. Counts can include probable deaths, where reported.|
|**new_deaths_per_million**| New deaths attributed to COVID-19 per 1,000,000 people. Counts can include probable deaths, where reported.|
|**new_deaths_smoothed_per_million**| New deaths attributed to COVID-19 (7-day smoothed) per 1,000,000 people. Counts can include probable deaths, where reported.|
|**Hospital & ICU**|   |
|**icu_patients**| Number of COVID-19 patients in intensive care units (ICUs) on a given day.|
|**icu_patients_per_million**| Number of COVID-19 patients in intensive care units (ICUs) on a given day per 1,000,000 people.|
|**hosp_patients**| Number of COVID-19 patients in hospital on a given day.|
|**hosp_patients_per_million**| Number of COVID-19 patients in hospital on a given day per 1,000,000 people.|
|**weekly_icu_admissions**| Number of COVID-19 patients newly admitted to intensive care units (ICUs) in a given week (reporting date and the preceeding 6 days).|
|**weekly_icu_admissions_per_million**| Number of COVID-19 patients newly admitted to intensive care units (ICUs) in a given week per 1,000,000 people (reporting date and the preceeding 6 days).|
|**weekly_hosp_admissions**| Number of COVID-19 patients newly admitted to hospitals in a given week (reporting date and the preceeding 6 days).|
|**weekly_hosp_admissions_per_million**| Number of COVID-19 patients newly admitted to hospitals in a given week per 1,000,000 people (reporting date and the preceeding 6 days).|
|**Policy Responses**|   |
|**stringency_index** | Government Response Stringency Index: composite measure based on 9 response indicators including school closures, workplace closures, and travel bans, rescaled to a value from 0 to 100 (100 = strictest response).|
|**Reproduction Rate**|   |
|**reproduction_rate**| Real-time estimate of the effective reproduction rate (R) of COVID-19.|
|**Vaccinations**|   |
|**total_vaccinations**| Total number of COVID-19 vaccination doses administered.|
|**people_vaccinated**| Total number of people who received at least one vaccine dose.|
|**people_fully_vaccinated**| Total number of people who received all doses prescribed by the initial vaccination protocol.|
|**total_boosters**| Total number of COVID-19 vaccination booster doses administered (doses administered beyond the number prescribed by the vaccination protocol).|
|**new_vaccinations**| New COVID-19 vaccination doses administered (only calculated for consecutive days).|
|**new_vaccinations_smoothed**| New COVID-19 vaccination doses administered (7-day smoothed). For countries that don't report vaccination data on a daily basis, we (OWID) assume that vaccination changed equally on a daily basis over any periods in which no data was reported. This produces a complete series of daily figures, which is then averaged over a rolling 7-day window.| 
|**total_vaccinations_per_hundred**| Total number of COVID-19 vaccination doses administered per 100 people in the total population.|
|**people_vaccinated_per_hundred**| Total number of people who received at least one vaccine dose per 100 people in the total population.|
|**people_fully_vaccinated_per_hundred**| Total number of people who received all doses prescribed by the initial vaccination protocol per 100 people in the total population.|
|**total_boosters_per_hundred**| Total number of COVID-19 vaccination booster doses administered per 100 people in the total population.|
|**new_vaccinations_smoothed_per_million**| New COVID-19 vaccination doses administered (7-day smoothed) per 1,000,000 people in the total population.|
|**new_people_vaccinated_smoothed**| Daily number of people receiving their first vaccine dose (7-day smoothed).|
|**new_people_vaccinated_smoothed_per_hundred**| Daily number of people receiving their first vaccine dose (7-day smoothed) per 100 people in the total population.|
|**Others**|   |
|**location**| Geographical location.|
|**date**| Date of observation.|
|**population**| Population (latest available values).|
|**population_density**| Number of people divided by land area, measured in square kilometers, most recent year available.|
|**median_age**| Median age of the population, UN projection for 2020.|
|**aged_65_older**| Share of the population that is 65 years and older, most recent year available.|
|**gdp_per_capita**| Gross domestic product at purchasing power parity (constant 2011 international dollars), most recent year available.|
|**extreme_poverty**| Share of the population living in extreme poverty, most recent year available since 2010.|
|**cardiovasc_death_rate**| Death rate from cardiovascular disease in 2017 (annual number of deaths per 100,000 people).|
|**diabetes_prevalence**| Diabetes prevalence (% of population aged 20 to 79) in 2017.|
|**female_smokers**| Share of women who smoke, most recent year available.|
|**male_smokers**| Share of men who smoke, most recent year available.|
|**handwashing_facilities**| Share of the population with basic handwashing facilities on premises, most recent year available.|
|**hospital_beds_per_thousand**| Hospital beds per 1,000 people, most recent year available since 2010.|
|**life_expectancy**| Life expectancy at birth in 2019.|
|**human_development_index**| A composite index measuring average achievement in three basic dimensions of human development—a long and healthy life, knowledge and a decent standard of living. Values for 2019, imported from [hdr.undp.org](http://hdr.undp.org/en/indicators/137506).|

**Here is a list of variables we will *not* include in our machine learning or neural network prediction models:**
- Excess mortality variables: describe the differences between reported and projected numbers of deaths.
    - excess_mortality
    - excess_mortality_cumulative
    - excess_mortality_cumulative_absolute
    - excess_mortality_cumulative_per_million
- Tests & Positivity variables: describe the numbers and results of COVID-19 testing.
    - total_tests
    - total_tests
    - total_tests_per_thousand
    - new_tests_per_thousand
    - new_tests_smoothed
    - new_tests_smoothed_per_thousand
    - positive_rate
    - tests_per_case
    - tests_units
- Other variables: 
    - iso_code
    - continent 
    - aged_70_older
    
## Variables Availability by Country
|Metrics| Updated | Countries |
|:---|:---:|:---:|
|**Vaccinations**| Daily | 218 |
|**Hospital & ICU**| Daily | 47 |
|**Confirmed cases**| Daily | 217 |
|**Confirmed deaths**| Daily | 217 |
|**Reproduction rate**| Daily | 192 |
|**Policy responses**| Daily | 187 |
|**Other variables of interest**| Fixed | 241 |


## Data Changelog
**Here are some important dates relating to the included variables, detailed by the OWID team:**
- Up until 17 March 2020, we were using WHO data manually extracted from their daily [situation report PDFs](https://www.who.int/emergencies/diseases/novel-coronavirus-2019/situation-reports).
- From 19 March 2020, we started relying on data published by the [European CDC](https://www.ecdc.europa.eu/en/publications-data/download-todays-data-geographic-distribution-covid-19-cases-worldwide). 
- On 9 May 2020, we added new variables related to demographic, economic, and public health data to our complete dataset.
- On 17 August 2020, we added 4 variables related to cases and deaths: new_cases_smoothed, new_deaths_smoothed, new_cases_smoothed_per_million, and new_deaths_smoothed_per_million. These metrics are averaged versions (over a rolling 7-day window) of the daily variables.
- On 10 September 2020, we added the human_development_index column to our complete dataset.
- On 29 October 2020, we added data on hospitalizations and intensive care unit (ICU) admissions, sourced from the [European Centre for Disease Prevention and Control (ECDC)](https://www.ecdc.europa.eu/en/publications-data/download-data-hospital-and-icu-admission-rates-and-current-occupancy-covid-19), who provide these statistics only for a select number of European countries, and update it on a weekly basis.
- On 10 November 2020, we added data on hospitalizations and intensive care unit (ICU) admissions for the United States, sourced from the [COVID Tracking Project](https://covidtracking.com/).
- On 13 November 2020, we added real-time estimates of the effective reproduction rate (R) of the virus, sourced from [Arroyo Marioli et al. (2020)](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3581633).
- On 30 November 2020, we changed our source for confirmed cases and deaths to the [COVID-19 Data Repository by the Center for Systems Science and Engineering (CSSE) at Johns Hopkins University](https://github.com/CSSEGISandData/COVID-19). Our previous source for confirmed cases and deaths, the European Centre for Disease Prevention and Control (ECDC), had announced in November 2020 that it would switch from a daily to a weekly reporting schedule from December. Our World in Data therefore had to transition away from the ECDC as a source to continue to provide daily updates of confirmed cases and deaths. The format (variable names and types) of our complete COVID-19 dataset remains the same.
- On 16 December 2020, we started collecting country-level time series on COVID-19 vaccinations.
- On 19 December 2020, we added data on hospitalizations and intensive care unit (ICU) admissions for Canada, sourced from the [COVID-19 Tracker](https://covid19tracker.ca/).
- On 6 January 2021, we added two variables for daily vaccinations to our complete dataset.
- On 7 January 2021, we replaced the United Kingdom's hospital and ICU data previously gathered by the European CDC with the [official data published by the British government](https://coronavirus.data.gov.uk/details/healthcare).
- On 26 January 2021, we added 4 variables on people vaccinated and people fully vaccinated to our complete dataset.
- On 5 March 2021, due to the COVID Tracking Project's announcement that their data collection effort would stop in March 2021, we transitioned to the [Department of Health & Human Services](https://healthdata.gov/Hospital/COVID-19-Reported-Patient-Impact-and-Hospital-Capa/g62h-syeh) as our source for data on hospitalizations and ICU admissions in the United States.
- On 15 July 2021, we added data on intensive care unit (ICU) patients for Algeria, sourced from the [Ministry of Health](https://github.com/yasserkaddour/covid19-icu-data-algeria).
- On 11 August 2021, we added the metric total_boosters to our vaccination data. This counts the total number of booster doses (doses administered beyond the number prescribed by the vaccination protocol).
- On 12 August 2021, we added hospital and ICU data for Switzerland, sourced from the [Federal Office of Public Health](https://opendata.swiss/fr/dataset/covid-19-schweiz).
- On 15 November 2021, we added the metrics new_people_vaccinated_smoothed and new_people_vaccinated_smoothed_per_hundred to our vaccination data. They count the daily number of people receiving their first vaccine dose.
- Since 29 March 2022, vaccination data is no longer updated on a daily basis. Updates now are only on weekdays (Monday until Friday).


## Notes 
**This notes are provided by the OWID team**
- Confirmed cases and deaths are collected by Johns Hopkins University by date of report, rathen than date of test/death. Therefore the number they report on a given day does not necessarily represent the actual number on that date, because of the long reporting chain that exists between a new case/death and its inclusion in statistics. This also means that time series can show sudden changes (negative or positive) when a country corrects historical data, because it had previously under- or overestimated the number of cases/deaths.
- In rare cases where our source for confirmed cases & deaths reports a negative daily change due to a data correction, we set the corresponding metric (new_cases or new_deaths) to NA. This also means that rolling metrics (7-day rolling average, weekly rolling sum, biweekly rolling sum) are set to NA until this missing value leaves the rolling window.
- Due to varying protocols and challenges in the attribution of the cause of death, the number of confirmed deaths may not accurately represent the true number of deaths caused by COVID-19.
- The population estimates we use to calculate per-capita metrics are based on the last revision of the [United Nations World Population Prospects](https://population.un.org/wpp/). The exact values can be viewed [here](https://github.com/owid/covid-19-data/blob/master/scripts/input/un/population_latest.csv). In a few cases, we use other sources (see column source in the population file) when the figures provided by the UN differ substantially from reliable and more recent national estimates. Population estimates for a few subnational locations are taken from national reports, and are stored here.































