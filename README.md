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


## Resources Utilized
##### Data Source: owid-covid-data.csv

##### Software: Python 3.7.6; Anaconda 4.10.3; PgAdmin 4; PostgreSQL 11; Visual 
Studio Code 1.65.0
## Data Processing
The raw data was put into a DataFrame in Jupyter Notebook to be viewed.  The 
locations column was filtered to show the desired data and the null values were 
dropped for columns total_cases and total_deaths. Another DataFrame was made from this to show
the desired two years of COVID data for locations with more than 730 records.

## Database 
Utilizing AWS, an RDS instance was created to access the data file located in an S3 bucket. PySpark was then used to load the data and create a column was added to act as an identifier for the various rows of data (“id_row”). Following, the data type of the “date” column was changed to accurately indicate the date data type. From there, the data was split into two dataframes (cases_data and demos_data) to reflect data relating to the COVID-19 cases and the data relating to the demographics of individuals diagnosed with COVID-19, respectively. Lastly, PySpark was used again to load the dataframes into Postgres tables.

Using Postgres, the cases_data and demos_data tables were joined on the “id_row” column with a full outer join into the table combined_COVID_data. The data was filtered to only include valid countries within the location column and loaded into the table all_countries_data. A connection was made from the database to the next phase of analysis-the machine learning component. Please see the ERD below for the relationship between tables.


[[LINK TO ERD IMAGE]]


## Machine Learning Model
#### Data Preprocessing 
- We created a focused DataFrame from the following columns ('iso_code', 
'total_cases', 'total_deaths'). <br>
- Next, we visually inspected the relationship between the total number of cases 
and total deaths using a scatter plot. <br>
- Then, we instantiated a linear regression model from the Scikit-learn library, 
fit and transformed the focused data then made predictions. 
- Finally, we evaluated the linear regression model using coefficient and 
intercept. 
                                                                                  
                        

#### Creating Model
Includes output labels for input data



## COVID-19 Analysis Summary
## VIZ
Used tableau to make representations of the cleaned cases_pred data set.