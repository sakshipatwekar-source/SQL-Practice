-- SQL Day 2 Practice
-- Questions 17-45


-- Q17: Find the number of patients in each city.
-- Show only cities having more than 2 patients.

SELECT city, COUNT(*) AS patient_count
FROM patients
GROUP BY city
HAVING COUNT(*) > 2;


-- Q18: Find the average age of patients in each city.
-- Show only cities where the average age is greater than 40.

SELECT city, AVG(age) AS average_age
FROM patients
GROUP BY city
HAVING AVG(age) > 40;


-- Q19: Find the number of male and female patients in each city.

SELECT city, gender, COUNT(*) AS patient_count
FROM patients
vGROUP BY city, gender;


-- Q20: Find the youngest patient in each city.

SELECT city, MIN(age) AS youngest_age
FROM patients
GROUP BY city;

-- Q21: Find the oldest patient in each city.

SELECT city, MAX(age) AS oldest_age
FROM patients
GROUP BY city;


-- Q22: Find the average age of male patients in each city.
-- Show only cities where the average male age is greater than 40.

SELECT city, AVG(age) AS average_age
FROM patients
WHERE gender = 'Male'
GROUP BY city
HAVING AVG(age) > 40;


-- Q23: Find the city with the highest average age among female patients.

SELECT city, AVG(age) AS average_age
FROM patients
WHERE gender = 'Female'
GROUP BY city
ORDER BY AVG(age) DESC
LIMIT 1;


-- Q24: Find the city with the highest number of patients older than 40.

SELECT city, COUNT(*) AS patient_count
FROM patients
WHERE age > 40
GROUP BY city
ORDER BY COUNT(*) DESC
LIMIT 1;


-- Q25: Find the city with the highest average age
-- among patients older than 30.

SELECT city, AVG(age) AS average_age
FROM patients
WHERE age > 30
GROUP BY city
ORDER BY AVG(age) DESC
LIMIT 1;


-- Q26: Find the number of patients in each city
-- whose age is between 20 and 50.
-- Show only cities having at least 2 such patients.

SELECT city, COUNT(*) AS patient_count
FROM patients
WHERE age BETWEEN 20 AND 50
GROUP BY city
HAVING COUNT(*) >= 2;


-- Q27: Find the city with the highest number of male
-- patients older than 30.

SELECT city, COUNT(*) AS patient_count
FROM patients
WHERE gender = 'Male' AND age > 30
GROUP BY city
ORDER BY COUNT(*) DESC
LIMIT 1;


-- Q28: Find the average age of male and female patients
-- separately in each city.
-- Show only city-gender groups with average age greater than 35.

SELECT city, gender, AVG(age) AS average_age
FROM patients
GROUP BY city, gender
HAVING AVG(age) > 35;

-- Q29: Find the city with the highest average age
-- among male patients.
-- Show only cities having at least 2 male patients.

SELECT city, AVG(age) AS average_age, COUNT(*) AS patient_count
FROM patients
WHERE gender = 'Male'
GROUP BY city
HAVING COUNT(*) >= 2
ORDER BY AVG(age) DESC
LIMIT 1;


-- Q30: Find the city with the lowest average age
-- among female patients.
-- Show only cities having at least 2 female patients.

SELECT city, AVG(age) AS average_age, COUNT(*) AS patient_count
FROM patients
WHERE gender = 'Female'
GROUP BY city
HAVING COUNT(*) >= 2
ORDER BY AVG(age) ASC
LIMIT 1;


-- Q31: Find the city with the most patients aged between 30 and 60.
-- Show only cities having at least 2 such patients.

SELECT city, COUNT(*) AS patient_count
FROM patients
WHERE age BETWEEN 30 AND 60
GROUP BY city
HAVING COUNT(*) >= 2
ORDER BY COUNT(*) DESC
LIMIT 1;


-- Q32: Find the city with the highest average age.
-- Show only cities having at least 3 patients.

SELECT city, AVG(age) AS average_age, COUNT(*) AS patient_count
FROM patients
GROUP BY city
HAVING COUNT(*) >= 3
ORDER BY AVG(age) DESC
LIMIT 1;


-- Q33: Find the city with the highest number of male patients
-- aged between 25 and 50.
-- Show only cities having at least 2 such patients.

SELECT city, COUNT(*) AS patient_count
FROM patients
WHERE gender = 'Male' AND age BETWEEN 25 AND 50
GROUP BY city
HAVING COUNT(*) >= 2
ORDER BY COUNT(*) DESC
LIMIT 1;


-- Q34: Find the average age and total number of patients
-- for each city.
-- Show only cities having at least 3 patients
-- and an average age greater than 35.

SELECT city, AVG(age) AS average_age, COUNT(*) AS patient_count
FROM patients
GROUP BY city
HAVING COUNT(*) >= 3 AND AVG(age) > 35;


-- Q35: Find the city with the highest average age
-- among female patients.
-- Show only cities having at least 2 female patients
-- and an average age greater than 30.

SELECT city, AVG(age) AS average_age, COUNT(*) AS patient_count
FROM patients
WHERE gender = 'Female'
GROUP BY city
HAVING COUNT(*) >= 2 AND AVG(age) > 30
ORDER BY AVG(age) DESC
LIMIT 1;


-- Q36: Find the gender with the highest average age.

SELECT gender, AVG(age) AS average_age
FROM patients
GROUP BY gender
ORDER BY AVG(age) DESC
LIMIT 1;


-- Q37: Find the city with the highest total number of patients.
-- Consider only cities where the average age is greater than 30.

SELECT city, COUNT(*) AS patient_count, AVG(age) AS average_age
FROM patients
GROUP BY city
HAVING AVG(age) > 30
ORDER BY COUNT(*) DESC
LIMIT 1;


-- Q38: Find the city with the highest average age
-- among patients aged between 20 and 60.
-- Show only cities having at least 2 such patients.

SELECT city, AVG(age) AS average_age, COUNT(*) AS patient_count
FROM patients
WHERE age BETWEEN 20 AND 60
GROUP BY city
HAVING COUNT(*) >= 2
ORDER BY AVG(age) DESC
LIMIT 1;


-- Q39: Find the city with the highest number of female patients.
-- Consider only cities where the average female age is greater than 35.

SELECT city, COUNT(*) AS patient_count, AVG(age) AS average_age
FROM patients
WHERE gender = 'Female'
GROUP BY city
HAVING AVG(age) > 35
ORDER BY COUNT(*) DESC
LIMIT 1;


-- Q40: Find the city with the highest number of male patients.
-- Consider only cities where the average male age is greater than 35.

SELECT city, COUNT(*) AS patient_count, AVG(age) AS average_age
FROM patients
WHERE gender = 'Male'
GROUP BY city
HAVING AVG(age) > 35
ORDER BY COUNT(*) DESC
LIMIT 1;


-- Q41: Find the city with the highest average age
-- among male patients aged between 30 and 60.
-- Show only cities having at least 2 such patients.

SELECT city, AVG(age) AS average_age, COUNT(*) AS patient_count
FROM patients
WHERE gender = 'Male' AND age BETWEEN 30 AND 60
GROUP BY city
HAVING COUNT(*) >= 2
ORDER BY AVG(age) DESC
LIMIT 1;


-- Q42: Find the city with the lowest average age
-- among female patients aged between 25 and 55.
-- Show only cities having at least 2 such patients.

SELECT city, AVG(age) AS average_age, COUNT(*) AS patient_count
FROM patients
WHERE gender = 'Female' AND age BETWEEN 25 AND 55
GROUP BY city
HAVING COUNT(*) >= 2
ORDER BY AVG(age) ASC
LIMIT 1;


-- Q43: Find the city with the highest number of patients
-- older than 40.
-- Consider only cities where the average age of those patients
-- is greater than 45.

SELECT city, COUNT(*) AS patient_count, AVG(age) AS average_age
FROM patients
WHERE age > 40
GROUP BY city
HAVING AVG(age) > 45
ORDER BY COUNT(*) DESC
LIMIT 1;


-- Q44: Find city-gender groups with the highest number
-- of patients aged between 30 and 50.
-- Show only groups having at least 2 such patients.

SELECT city, gender, COUNT(*) AS patient_count
FROM patients
WHERE age BETWEEN 30 AND 50
GROUP BY city, gender
HAVING COUNT(*) >= 2
ORDER BY COUNT(*) DESC;


-- Q45: Find the city with the highest average age.
-- Calculate the average only from patients aged 30 or above.
-- Show only cities having at least 2 qualifying patients.

SELECT city, AVG(age) AS average_age, COUNT(*) AS patient_count
FROM patients
WHERE age >= 30
GROUP BY city
HAVING COUNT(*) >= 2
ORDER BY AVG(age) DESC
LIMIT 1;
