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
 
## Resources utilized
- Data Sources: owid-covid-data.csv, 
- Software & Framework:Python (3.7.6) & (3.7.13), Jupyter Notebook (6.4.11), Anaconda (4.10.3) & (4.13.0), PostgreSQL (11.15-R1), pgAdmin4 (6.7), Spark (3.2.1), Visual Studio Code (1.65.0)
- Libraries & Packages: 
    - Pandas (1.3.5), matplotlib (3.5.1), NumPy (1.21.5), 
    - PySpark, JAVA, PostgreSQL driver, MLlib, SQLalchemy (1.4.39), psycopg2 (2.9.3),
    - Scikit-learn (1.0.2), Scikit-learn (0.23.2) for Ensemble Learning, imbalanced-learn library (0.7.0), 
    - tensorflow (2.3.0), keras-applications (1.0.8),  keras-preprocessing (1.1.2). 
- Online Tools: AWS RDS, AWS S3, Google Colaboratory Notebooks, [COVID_19_Analysis GitHub Repository](https://github.com/Magzzie/COVID_19_Analysis)

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
Included tableau work book.
https://public.tableau.com/app/profile/richard.hamilton2558/viz/VIZ_16587125850040/Story1?publish=yes