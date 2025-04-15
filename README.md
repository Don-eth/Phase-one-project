# INTERNATIONAL DEBT ANALYSIS USING SQL
## OVERVIEW  
Understanding international debt is crucial for evaluating the financial health and economic strategies of countries across the globe. This article explores a dataset containing global debt statistics, including various debt indicators such as principal repayments, interest payments, and loan commitments. Through SQL queries, we uncover insights into the total global debt, identify countries with the highest debt burdens, analyze debt repayment trends, and examine the most common types of debt instruments. These findings provide a clearer picture of how nations manage external financial obligations and the patterns that emerge from global debt data.
The Database has the following columns;
```
a. Country_name (Varchar)
b. Country_code (Varchar)
c. Indicator_name (Varchar)
d. Indicator_code (Varchar)
e. Debt (Float)
```

#### Schema setup
###### A schema is the logical structure of the Database. This creates a new schema called assignment and sets it as the default search path, meaning all subsequent 
queries will target tables within this schema unless otherwise specified.
```
create schema assignment;
set search_path to assignment;
```
#### Preview the international debt
```
select * from assignment.international_debt;
```
###### The above SQL query displays all records from the international_debt table. It's typically used to understand the structure and contents of the dataset.

#### Preview table with missing values
###### This query selects all data from a similar table that contains missing values. It helps analyze data quality or investigate gaps in the dataset.
```
select * from assignment.international_debt_with_missing_values;
```

#### Total debt in millions
###### This query calculates the total global debt across all countries and indicators, converting it into millions and rounding to two decimal places.
```
select (sum (debt)/1000000)::numeric(12,2) 
from assignment.international_debt_with_missing_values;
```
#### How many distinct countries are recorded in the dataset?
###### This query counts how many distinct countries are represented in the dataset.
```
select 
count (distinct country_name)as unique_countries
from assignment.international_debt_with_missing_values;
```
#### What are the distinct types of debt indicators, and what do they represent?
###### This query lists the different types of debt indicators, such as Principal repayments, Interest payments etc. 
These describe the nature of the debt entries.
```
select 
distinct indicator_name
from assignment.international_debt_with_missing_values;
```
#### Which country has the highest total debt, and how much does it owe?
###### This query identifies the unique country with the highest accumulated debt by summing the debt values per country and ordering them from highest to lowest.

```
select distinct country_name,
sum (debt) as total_debt
from assignment.international_debt_with_missing_values
group by country_name
order by sum(debt) desc;
```

#### What is the average debt across different debt indicators?
###### Calculates the average debt associated with each type of debt indicator across all countries.
```
select distinct indicator_name, 
Avg (debt) as avg_debt
from assignment.international_debt_with_missing_values
group by indicator_name;
```
#### Which country has made the highest amount of principal repayments?
###### Finds the country that has made the highest total principal repayments. This shows repayment activity, indicating financial responsibility or maturity of loans.
```
select distinct country_name,
sum (debt)
from assignment.international_debt_with_missing_values
where indicator_name like '%Principal repayment%'
group by country_name 
order by sum(debt) desc;
```
#### What is the most common debt indicator across all countries?
###### Shows the most frequently recorded debt indicator in the dataset, giving insight into the most commonly tracked debt types.
```
select indicator_name,
count (indicator_name)
from assignment.international_debt_with_missing_values
group by indicator_name
order by count (indicator_name) desc;
```





