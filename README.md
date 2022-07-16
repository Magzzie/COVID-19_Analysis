# COVID-19 Analysis

## COVID-19 Overview
#### As COVID-19 persists throughout the globe, the purpose of this exploration 
is to determine the relationship between different factors that contribute to the 
spread of COVID-19 as well as the outcomes noted by people across the world. By 
analyzing these health outcomes, the goal is ultimately to predict the health 
outcomes in future populations based on the factors determined significant by the 
machine learning model utilized below. 

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
dropped for columns total_cases and total_deaths.

## Database 
The original data was cleaned and edited to create a sample database with a 
smaller amount of data. For The database, AWS was employed to allow universal 
access to all team members. The dataset was imported, cleaned, and transformed 
into a dataframe with only the iso_code, total_cases, and total_deaths columns 
for the first phase of the project. AWS was then connected to PgAdmin to run the 
database locally. A schema was created for the sample_data table. Please see the 
sample_database_schema file or the image below for reference. A sample query was 
also completed as indicated in the image below.

![Sample Database](https://user-images.githubusercontent.com/99554642/
177604250-ea2a1d7e-8896-444f-a369-b0a1098cf798.png)



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