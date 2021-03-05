--Display the first 5 rows of data

SELECT * FROM train LIMIT 5;

--how isthe distribution of gender in the company income data?
SELECT gender,count(*) as count from train GROUP by gender  order by gender DESC;

--check the categories of education level of the employees
SELECT education,count(*) from train GROUP by education ;

--country distribution from highest pop of employees?

SELECT native_country,count(*) as count from train GROUP by native_country  order by native_country DESC;

--race distribution in the country
select race ,count(*) as count from train order by race DESC ;

/* How many distinct occupations ? */
SELECT DISTINCT(occupation)
FROM train
ORDER BY occupation;

-- whats max age and  min age in the DATA

select max(age)as MaxAge,
min(age) as MinAge FROM train;

--checking occupation of population where marital-status="divorced"
SELECT occupation,marital_status FROM train where marital_status="Divorced";

-- Change the name of department with age =  58 to 'gov'

UPDATE train
SET workclass = 'gov'
WHERE age = 58;

-- Querying all income with fnlwgt greater than 150 000 and smaller than 170 000

SELECT * FROM train
WHERE fnlwgt BETWEEN 150000 AND 170000;

--Querying all income fnlwgt with fnlwgt not equal to 180 000
*/
SELECT * FROM train
WHERE fnlwgt <> 80000;

-- Query all husbands that work in same occupation in sales
*/
SELECT * FROM train
WHERE relationship IN(
	SELECT relationship FROM train
    WHERE occupation LIKE 'sales'
)
AND occupation NOT LIKE 'sales';

--Query education of all employees together with age of occupation they work in, using JOIN
*/
SELECT train.education,train.age,train.occupation
FROM train
JOIN occupation dep
ON train.department_id = train.education
ORDER BY train.education, train.age;
