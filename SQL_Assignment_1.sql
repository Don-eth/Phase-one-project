create schema assignment;
set search_path to assignment;

select* from assignment.international_debt;

select *
from assignment.international_debt_with_missing_values;

select (sum (debt)/1000000)::numeric(12,2) 
from assignment.international_debt_with_missing_values

--How many distinct countries are recorded in the dataset?

select 
count (distinct country_name)as unique_countries
from assignment.international_debt_with_missing_values;

--What are the distinct types of debt indicators, and what do they represent?

select 
distinct indicator_name
from assignment.international_debt_with_missing_values;

--Which country has the highest total debt, and how much does it owe?

select distinct country_name,
sum (debt) as total_debt
from assignment.international_debt_with_missing_values
group by country_name
order by sum(debt) desc;

--What is the average debt across different debt indicators?
select distinct indicator_name, 
Avg (debt)
from assignment.international_debt_with_missing_values
group by indicator_name;

--Which country has made the highest amount of principal repayments?
select distinct country_name,
sum (debt)
from assignment.international_debt_with_missing_values
where indicator_name like '%Principal repayment%'
group by country_name 
order by sum(debt) desc;

select distinct country_name,
sum (debt)
from assignment.international_debt_with_missing_values
where indicator_name like '%Principal repayment%'
group by country_name
having sum(debt)>=0
order by sum(debt) desc;

--What is the most common debt indicator across all countries?
select indicator_name,
count (indicator_name)
from assignment.international_debt_with_missing_values
group by indicator_name
order by count (indicator_name) desc;

--Identify any other key debt trends and summarize your findings.