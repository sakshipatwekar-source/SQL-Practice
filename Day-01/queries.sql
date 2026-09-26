-- =====================================================
-- SQL DAILY PRACTICE - DAY 01
-- Table: patients
-- Total Questions: 52
-- =====================================================


-- Q1. Display all patients.
SELECT *
FROM patients;


-- Q2. Display only the names of all patients.
SELECT name
FROM patients;


-- Q3. Display patients who are older than 30.
SELECT *
FROM patients
WHERE age > 30;


-- Q4. Display patients who are younger than 40.
SELECT *
FROM patients
WHERE age < 40;


-- Q5. Display patients whose age is exactly 30.
SELECT *
FROM patients
WHERE age = 30;


-- Q6. Display all female patients.
SELECT *
FROM patients
WHERE gender = 'Female';


-- Q7. Display all male patients.
SELECT *
FROM patients
WHERE gender = 'Male';


-- Q8. Display patients from Pune.
SELECT *
FROM patients
WHERE city = 'Pune';


-- Q9. Display patients from Mumbai.
SELECT *
FROM patients
WHERE city = 'Mumbai';


-- Q10. Display patients whose age is between 20 and 40.
SELECT *
FROM patients
WHERE age BETWEEN 20 AND 40;


-- Q11. Count the total number of patients.
SELECT COUNT(*)
FROM patients;


-- Q12. Find the average age of all patients.
SELECT AVG(age)
FROM patients;


-- Q13. Find the youngest patient.
SELECT MIN(age)
FROM patients;


-- Q14. Find the oldest patient.
SELECT MAX(age)
FROM patients;


-- Q15. Find the number of patients in each city.
SELECT city, COUNT(*)
FROM patients
GROUP BY city;


-- Q16. Find the average age of patients in each city.
SELECT city, AVG(age)
FROM patients
GROUP BY city;


-- Q17. Find the number of patients in each city who are older than 40.
SELECT city, COUNT(*)
FROM patients
WHERE age > 40
GROUP BY city;


-- Q18. Find the average age in each city,
-- only where average age is greater than 40.
SELECT city, AVG(age)
FROM patients
GROUP BY city
HAVING AVG(age) > 40;


-- Q19. Find the city with the highest average patient age.
SELECT city, AVG(age)
FROM patients
GROUP BY city
ORDER BY AVG(age) DESC
LIMIT 1;


-- Q20. Find the youngest patient in each city.
SELECT city, MIN(age)
FROM patients
GROUP BY city;


-- Q21. Find the oldest patient in each city.
SELECT city, MAX(age)
FROM patients
GROUP BY city;


-- Q22. Find the number of male patients in each city.
SELECT city, COUNT(*)
FROM patients
WHERE gender = 'Male'
GROUP BY city;


-- Q23. Find the number of female patients in each city.
SELECT city, COUNT(*)
FROM patients
WHERE gender = 'Female'
GROUP BY city;


-- Q24. Find the average age of female patients in each city.
SELECT city, AVG(age)
FROM patients
WHERE gender = 'Female'
GROUP BY city;


-- Q25. Find the city with the youngest average patient age.
SELECT city, AVG(age)
FROM patients
GROUP BY city
ORDER BY AVG(age) ASC
LIMIT 1;


-- Q26. Find the city with the highest number of patients.
SELECT city, COUNT(*)
FROM patients
GROUP BY city
ORDER BY COUNT(*) DESC
LIMIT 1;


-- Q27. Find the city with the lowest number of patients.
SELECT city, COUNT(*)
FROM patients
GROUP BY city
ORDER BY COUNT(*) ASC
LIMIT 1;


-- Q28. Find the average age of patients older than 30 in each city.
SELECT city, AVG(age)
FROM patients
WHERE age > 30
GROUP BY city;


-- Q29. Find the city with the highest average age
-- among patients older than 30.
SELECT city, AVG(age)
FROM patients
WHERE age > 30
GROUP BY city
ORDER BY AVG(age) DESC
LIMIT 1;


-- Q30. Find the number of male patients in each city
-- who are older than 30.
SELECT city, COUNT(*)
FROM patients
WHERE gender = 'Male'
AND age > 30
GROUP BY city;


-- Q31. Find the number of female patients in each city
-- who are younger than 40.
SELECT city, COUNT(*)
FROM patients
WHERE gender = 'Female'
AND age < 40
GROUP BY city;


-- Q32. Find the average age of male patients older than 30
-- in each city.
SELECT city, AVG(age)
FROM patients
WHERE gender = 'Male'
AND age > 30
GROUP BY city;


-- Q33. Find the city with the highest number of female patients.
SELECT city, COUNT(*)
FROM patients
WHERE gender = 'Female'
GROUP BY city
ORDER BY COUNT(*) DESC
LIMIT 1;


-- Q34. Find the city with the lowest number of female patients.
SELECT city, COUNT(*)
FROM patients
WHERE gender = 'Female'
GROUP BY city
ORDER BY COUNT(*) ASC
LIMIT 1;


-- Q35. Find the number of patients in each city
-- whose age is between 30 and 50.
SELECT city, COUNT(*)
FROM patients
WHERE age BETWEEN 30 AND 50
GROUP BY city;


-- Q36. Find the city having the highest number of patients
-- aged between 30 and 50.
SELECT city, COUNT(*)
FROM patients
WHERE age BETWEEN 30 AND 50
GROUP BY city
ORDER BY COUNT(*) DESC
LIMIT 1;


-- Q37. Find the average age of patients aged between 30 and 50
-- in each city.
SELECT city, AVG(age)
FROM patients
WHERE age BETWEEN 30 AND 50
GROUP BY city;


-- Q38. Find the city having the highest average age
-- among patients aged between 30 and 50.
SELECT city, AVG(age)
FROM patients
WHERE age BETWEEN 30 AND 50
GROUP BY city
ORDER BY AVG(age) DESC
LIMIT 1;


-- Q39. Find the number of male patients aged between 30 and 50
-- in each city.
SELECT city, COUNT(*)
FROM patients
WHERE gender = 'Male'
AND age BETWEEN 30 AND 50
GROUP BY city;


-- Q40. Find the number of female patients aged between 30 and 50
-- in each city.
SELECT city, COUNT(*)
FROM patients
WHERE gender = 'Female'
AND age BETWEEN 30 AND 50
GROUP BY city;


-- Q41. Find the average age of male patients aged between
-- 30 and 50 in each city.
SELECT city, AVG(age)
FROM patients
WHERE gender = 'Male'
AND age BETWEEN 30 AND 50
GROUP BY city;


-- Q42. Find the average age of female patients aged between
-- 30 and 50 in each city.
SELECT city, AVG(age)
FROM patients
WHERE gender = 'Female'
AND age BETWEEN 30 AND 50
GROUP BY city;


-- Q43. Find the city with the highest average age of male patients
-- aged between 30 and 50.
SELECT city, AVG(age)
FROM patients
WHERE gender = 'Male'
AND age BETWEEN 30 AND 50
GROUP BY city
ORDER BY AVG(age) DESC
LIMIT 1;


-- Q44. Find the city with the highest average age of female patients
-- aged between 30 and 50.
SELECT city, AVG(age)
FROM patients
WHERE gender = 'Female'
AND age BETWEEN 30 AND 50
GROUP BY city
ORDER BY AVG(age) DESC
LIMIT 1;


-- Q45. Find the number of patients younger than 30 in each city.
SELECT city, COUNT(*)
FROM patients
WHERE age < 30
GROUP BY city;


-- Q46. Find the city with the highest number of patients
-- younger than 30.
SELECT city, COUNT(*)
FROM patients
WHERE age < 30
GROUP BY city
ORDER BY COUNT(*) DESC
LIMIT 1;


-- Q47. Find the average age of patients younger than 30
-- in each city.
SELECT city, AVG(age)
FROM patients
WHERE age < 30
GROUP BY city;


-- Q48. Find the city with the lowest average age
-- among patients younger than 30.
SELECT city, AVG(age)
FROM patients
WHERE age < 30
GROUP BY city
ORDER BY AVG(age) ASC
LIMIT 1;


-- Q49. Find the number of patients who are exactly 30 years old
-- in each city.
SELECT city, COUNT(*)
FROM patients
WHERE age = 30
GROUP BY city;


-- Q50. Find the city with the highest number of patients
-- who are exactly 30 years old.
SELECT city, COUNT(*)
FROM patients
WHERE age = 30
GROUP BY city
ORDER BY COUNT(*) DESC
LIMIT 1;


-- Q51. Find the city with the highest average age among
-- female patients.
SELECT city, AVG(age)
FROM patients
WHERE gender = 'Female'
GROUP BY city
ORDER BY AVG(age) DESC
LIMIT 1;


-- Q52. Find the city with the lowest average age among
-- all patients.
SELECT city, AVG(age)
FROM patients
GROUP BY city
ORDER BY AVG(age) ASC
LIMIT 1;