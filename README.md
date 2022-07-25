# COVID-19 Analysis

## COVID-19 Overview
#### As COVID-19 persists throughout the globe, the purpose of this exploration is to determine the relationship between different factors that contribute to the spread of COVID-19 as well as the outcomes noted by people across the world. By analyzing these health outcomes, the goal is ultimately to predict the health outcomes in future populations based on the factors determined significant by the machine learning model utilized below. 

The data utilized for the analysis is from Our World in Data, which is an 
organization that focuses on researching international crises including issues 
like climate change, war, and disease. Specifically, Our World in Data has 
combined data from across the world to include country, continent, new COVID-19 
cases, total COVID-19 cases, population, age, and several other factors in 
reference to the COVID-19 pandemic. By analyzing the data, the goal is to answer 
questions such as how does age affect the health outcome of someone with a 
COVID-19 diagnosis? What differences exist between the health outcomes of people 
from different countries? How can future health outcomes be predicted from this 
data?

In completing the exploration described above, this team has agreed upon 
communication protocols to ensure the success of this project. All team members 
will contribute equally to the analysis by covering different aspects of the 
project. Each team member will manage their own git branch to this repository. 
Each team member will provide constructive feedback to the work of others to 
ensure cohesiveness of the project. Lastly, each team member will maintain open 
communication in Slack and Zoom. 

### Purpose
Using the One World In Data (OWID) COVID-19 dataset to build machine learning regression models that can predict the number of new COVID-19 cases and the number of new deaths related to the infection on a daily basis all over the world. <br>
Furthermore, we intend to build deep-learning regression neural networks with the same prediction goals and assess their performance against the ensemble Balanced RandomForest algorithms. 

## Objectives
1. Create an Amazon Web Service Relational DataBase (AWS RDS).
2. Create an S3 Bucket on AWS to store the OWID COVID-19 CSV file.
3. Connect the AWS RDS to a PostgreSQL database using pgAdmin using Spark and Google Colab.
4. Perform preliminary ETL on COVID-19 dataset in PostgreSQL.
5. Import data from SQL database into a Jupyter Notebook using SQLalchemy.
6. Preprocess data for the Random Forest Regression model. 
7. Reduce data dimensions using Principal Component Analysis (PCA). 
8. Possible use of K-means to cluster the data points priod to regression.
9. Build, train, and test a Balanced Random Forest regression model.* 
10. Compile, train, and evaluate a deep-learning regression neural network model.
11. Optimize the neural network model with synaptic boost techniques.
12. Tune up the neural network model using kerastuner module. 
13. Export the predictions results to the SQL database.**
14. Merge the predictions results table with the original dataset in SQL.
15. Use Tableau to build a representative dashboard of the complete analysis. 
 
## Resources
- Data Sources: owid-covid-data.csv, 
- Software & Framework:Python (3.7.6) & (3.7.13), Jupyter Notebook (6.4.11), Anaconda (4.10.3) & (4.13.0), PostgreSQL (11.15-R1), pgAdmin4 (6.7), Spark (3.2.1), Visual Studio Code (1.65.0)
- Libraries & Packages: 
    - Pandas (1.3.5), matplotlib (3.5.1), NumPy (1.21.5), 
    - PySpark, JAVA, PostgreSQL driver, MLlib, SQLalchemy (1.4.39), psycopg2 (2.9.3),
    - Scikit-learn (1.0.2), Scikit-learn (0.23.2) for Ensemble Learning, imbalanced-learn library (0.7.0), 
    - tensorflow (2.3.0), keras-applications (1.0.8),  keras-preprocessing (1.1.2). 
- Online Tools: AWS RDS, AWS S3, Google Colaboratory Notebooks, [COVID_19_Analysis GitHub Repository](https://github.com/Magzzie/COVID_19_Analysis)

## Methods & Code

### Database 
Utilizing AWS, an RDS instance was created to access the data file located in an S3 bucket. PySpark was then used to load the data and create a column was added to act as an identifier for the various rows of data (“id_row”). Following, the data type of the “date” column was changed to accurately indicate the date data type. From there, the data was split into two dataframes (cases_data and demos_data) to reflect data relating to the COVID-19 cases and the data relating to the demographics of individuals diagnosed with COVID-19, respectively. Lastly, PySpark was used again to load the dataframes into Postgres tables.

Using Postgres, the cases_data and demos_data tables were joined on the “id_row” column with a full outer join into the table combined_COVID_data. The data was filtered to only include valid countries within the location column and loaded into the table all_countries_data. A connection was made from the database to the next phase of analysis-the machine learning component. Please see the ERD below for the relationship between tables.


[[LINK TO ERD IMAGE]]


### Data Processing
The raw data was put into a DataFrame in Jupyter Notebook to be viewed.  The 
locations column was filtered to show the desired data and the null values were 
dropped for columns total_cases and total_deaths. Another DataFrame was made from this to show
the desired two years of COVID data for locations with more than 730 records.
#### ETL for New Cases Prediction 
- The OWID COVID-19 dataset contained initially (198,846) records of data organized in 67 columns between January 1st, 2020 and July 5th, 2022 when we pulled the dataset for analysis. 
- The raw metadata in the dataset included information about the total and new cases of COVID-19, total and new COVID-related deaths, hospitals' ICUs capacity and admissions, COVID-19 screening tests counts and results, numbers of vaccinations and boosters plus rates of  people vaccinated. Additionally, the dataset had various demographic, health, social, and economic criteria of the different countries.
- There were 244 unique values in the OWID COVID-19 location column initially. These included more general aggregations of locations such as the six continents, four income levels, in addition to geopolitical grouping into European Union, Internation, and World. 
- We Filtered the dataset excluding all the aforementioned groups which left us with 187,317 records of 231 distinct countries / territories. 
- **Dropping Data**: 
    - Northern Cyprus did not have a population value in the OWID COVID-19 dataset. Therefore, it was dropped, bringing the dataset down to 187,000 records.
    - We removed all COVID-19 testing data since testing policies, availability, interpretation, and reporting were sporadic and varied significantly among countries. This step decreased the number of columns from 67 to 58.
    - Next, we dropped all columns related to calculated excess_mortality since they are not relevant to our predictions. This step had decreased the number of columns from 58 to 54. 
    - Then, we dropped the columns related to Intenstive Care Unit (ICU) and hospital admissions since they had very high number of null values (more than 85% null). That had brought the number of columns down to 46. 
    - Lastly, we dropped general columns such as the 'iso_code', 'continent', 'aged_70_older' because they held redundent information included in other columns. The final count of columns was 43.

- **Handling Missing Values of Main Features in All Locations**: 
    - Since our goal was to predict the number of daily new cases in various locations of the world, we dropped all null values from the total_cases column then filled the new_cases nulls with zeros: There were 7,608 missing values out of 187,000 of the total number of COVID-19 cases from all locations. These missing values either represented no positive COVID-19 cases in that location, or missed reporting. Since we would construct a new column with reference to the number of COVID-19 number of days into the pandemic, we thought it would be redundent to keep these empty records with zero values. This step decreased the number of records to 179,392.
    - By dropping the missed values from total cases, we brought the missing values of new cases down from 7,889 to only 281. These few records might have represented actual zero new cases or simply missed reporting. However, since the corresponding total cases count of that location was not null, then it was probably the former cause. Hence, we decided to keep these records and fill them with zeros. 
    
            - The new_cases_smoothed column represented the past 7-day average of new COVID-19 cases. At that stage, it had 1,393 missing values. Upon further investigation, we discovered that the average was not calculated until the sixth day of the first COVID-19 cases in each location which would justify 1,150 null values for the 230 locations in the present population-based dataset. The remaining 243 missing averages could correspond with the missing new cases that we filled with zeros. In view of the big dataset we had, we decided to drop all records with missing averages for the past 7 days of new COVID-19 cases. That dropped the number of records to 177,999. 

    - Death-related columns would only be features in the COVID-related deaths prediction model but not in the daily new cases prediction model.
    - In the OWID COVID-19 dataset, the column reproduction_rate: represents a real-time estimate of the effective reproduction rate (R) of COVID-19. There was no clear pattern that explains why there were (31,175) missing values of reproduction rate when it comes to location or total_cases values, hence, we dropped the missing values of the reproduction rate since replacing them with zeros might skew the data and influence the results. This step has decreased the number of records to 148,217, and the locations to 190 from 230.
    - **Vaccinations**: Out of 148,217 records, there were only 44,719 records with reported daily total vaccinations numbers from all 190 locations. Vaccination reports has started on 2020-12-02 till 2022-07-02. 
        - We presume that vaccination  has played an integral role in the COVID-19 pandemic trajectory, and its influence may be observed over both COVID-19 cases and deaths.
        - We presume that the absence of vaccines emphasized certain trends in the pandemic; as such, vaccines initiation was expected to decrease the number of cases and covid-related deaths. Based on that, we filled the 103,498 total_vaccinations and total_vaccinations_per_hundered nulls with zeros.
        - **people_fully_vaccination** column represented the total number of people who received all doses prescribed by the initial vaccination protocol. The completion of vacciantion regimen indicated a superior level of immunity against the virus. We chose to depende on this column in our predictions instead of the **people_vaccinated** or **new_people_vaccinated** columns because they describe less than optimal protection against COVID-19. As such, we filled all 108,105 null values of **people_fully_vaccinated** and **people_fully_vaccinated_per_hundred** with zeros.
        - Since 29 March 2022, vaccination data was no longer updated on a daily basis. Updates afterwards were only on weekdays (Monday until Friday). Hence, we have shortened the window of analysis to all records from 2020-01-01 up until 2022-03-29 since the reporting was inconsistent in many countires even on the weekdays. That has decreased the records number to 129,977. 
        - The reporting of **people_vaccinated, new_vaccinations, new_people_vaccianted, new_vaccinations_smoothed, total_boosters** and their related normalized columns per million, hence we dropped them and left only total_vaccinations and people_full_vaccinated to reflect the vaccinations effect on the pandemic. By now, we had 34 columns in the cleaned dataset. 
    - **stringency_index**: Government Response Stringency Index is a composite measure based on 9 response indicators including school closures, workplace closures, and travel bans, rescaled to a value from 0 to 100 (100 = strictest response). There were 7,942 missing values that we filled with zeros. 
    - **population_density**: Number of people divided by land area, measured in square kilometers, most recent year available. There were 2,101 missing values that would have required individual calcualtions and time investment, so we dropped these records and continued with 127,876.
    - **median_age**: Median age of the population, UN projection for 2020. There were 4,238 missing values that we dropped and continued with 123,638.
    - **gdp_per_capita**: Gross domestic product at purchasing power parity (constant 2011 international dollars), most recent year available. We dropped 1,440 null values and continued with 122,198.
    - **extreme_poverty**: Share of the population living in extreme poverty, most recent year available since 2010. There was a large number of missing values in this column (36,430), and with the inclusion of other SES and general population metrics, we decided to drop the whole column instead of losing that number of records for information that could be insinuated in other variables. We continued with 33 columns. 
    - **handwashing_facilities**: Share of the population with basic handwashing facilities on premises, most recent year available. As for the extreme_poverty column, this column also had a large number of missing values 60,690 which is why we decided to drop the column and continue with 32 only. 
    - **human_development_index**: A composite index measuring average achievement in three basic dimensions of human development—a long and healthy life, knowledge and a decent standard of living. Values for 2019, imported from [hdr.undp.org](http://hdr.undp.org/en/indicators/137506). <br>We previously had 710 missing values. However, dropping the nulls from the gdp_per_capita column has removed the null values from the human_development_index as well. And by that, we concluded the cleaning part of the ETL and continued with (122198, 32). 


    










### Machine Learning Model
#### Feature Engineering & Data Preprocessing 
- We created a focused DataFrame from the following columns ('iso_code', 
'total_cases', 'total_deaths'). <br>
- Next, we visually inspected the relationship between the total number of cases 
and total deaths using a scatter plot. <br>
- Then, we instantiated a linear regression model from the Scikit-learn library, 
fit and transformed the focused data then made predictions. 
- Finally, we evaluated the linear regression model using coefficient and 
intercept. 

- **Date Transformation**:
    - We converted the 'date' column to a datetime.
    - The updated date range for the cleaned dataframe is from 2020-01-23 to 2022-03-28.
    - Next, we created a new column for days of COVID-19 and calculated its value from Jan 1, 2020 because that's the universal start date of the pandemic. The new column would reflect the number of days into the COVID-19 pandemic for each record of cases / vaccinations / deaths. 
    - Then, we swapped the covid_days and date columns in a new DataFrame.
- **
                        

#### Creating Model
Includes output labels for input data

## Results




    
        
        
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      





- Normalization:
    - **total_cases_per_100K** = total_cases_per_million / 10
    - **new_cases_per_100K** = new_cases_per_million / 10
    - **new_cases_smoothed_per_100K** = new_cases_smoothed_per_million / 10    
    
- people_vaccinated daily values are the exact as total_vaccinations in some records, but in other records the values were not self evident of how they related to the total_vaccinations values.   
- people_fully_vaccinated had more values in the dataset than people_vaccinated. Furthermore, being fully_vaccinated has been the standard for  actual immunity against the COVID-19 infection and would be considered the value that mattered more versus the number of people_vaccinated (but had not yet completed the vaccination regimen). 



### ETL for New COVID-deaths prediction 

- **total_deaths** and **new_deaths** columns had 17,385 and 17,561 missing records, respectively. These could have been the days of the pandemic when there were no COVID-related deaths or deaths were not reported by the official entities. The total_deaths column did not have any original zero values reflecting no deaths/ no reporting. We filled the missing values with zeros taking into account the substantial number of records. 










## COVID-19 Analysis Summary









---











