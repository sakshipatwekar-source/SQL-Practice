-- ============================================================
-- DAY 3: SQL WINDOW FUNCTIONS PRACTICE
-- Database: patients.db
-- Table: patients
-- Total Questions: 50
-- ============================================================


-- Q1. Show each patient's name, city, age, and the average age of all patients.
SELECT name,
       city,
       age,
       AVG(age) OVER () AS average_age
FROM patients;


-- Q2. Show each patient and the total number of patients.
SELECT name,
       COUNT(*) OVER () AS total_patients
FROM patients;


-- Q3. Show each patient and the sum of all patient ages.
SELECT name,
       age,
       SUM(age) OVER () AS total_age
FROM patients;


-- Q4. Give each patient a row number ordered by age (youngest to oldest).
SELECT name,
       age,
       ROW_NUMBER() OVER (ORDER BY age) AS row_num
FROM patients;


-- Q5. Give each patient a row number within their city, ordered by age.
SELECT name,
       city,
       age,
       ROW_NUMBER() OVER (
           PARTITION BY city
           ORDER BY age
       ) AS city_row_num
FROM patients;


-- Q6. Rank all patients by age from oldest to youngest.
SELECT name,
       age,
       RANK() OVER (ORDER BY age DESC) AS age_rank
FROM patients;


-- Q7. Dense-rank all patients by age from oldest to youngest.
SELECT name,
       age,
       DENSE_RANK() OVER (ORDER BY age DESC) AS age_rank
FROM patients;


-- Q8. Show each patient's previous age when ordered from youngest to oldest.
SELECT name,
       age,
       LAG(age) OVER (ORDER BY age) AS previous_age
FROM patients;


-- Q9. Show each patient's next age when ordered from youngest to oldest.
SELECT name,
       age,
       LEAD(age) OVER (ORDER BY age) AS next_age
FROM patients;


-- Q10. Show the total age of patients in each city beside every patient.
SELECT name,
       city,
       age,
       SUM(age) OVER (PARTITION BY city) AS city_total_age
FROM patients;


-- Q11. Show the average age of patients in each city beside every patient.
SELECT name,
       city,
       age,
       AVG(age) OVER (PARTITION BY city) AS city_avg_age
FROM patients;


-- Q12. Rank patients within each city by age from oldest to youngest.
SELECT name,
       city,
       age,
       RANK() OVER (
           PARTITION BY city
           ORDER BY age DESC
       ) AS city_rank
FROM patients;


-- Q13. Dense-rank patients within each city by age from oldest to youngest.
SELECT name,
       city,
       age,
       DENSE_RANK() OVER (
           PARTITION BY city
           ORDER BY age DESC
       ) AS city_rank
FROM patients;


-- Q14. Show the oldest age in each city.
SELECT name,
       city,
       age,
       FIRST_VALUE(age) OVER (
           PARTITION BY city
           ORDER BY age DESC
       ) AS oldest_age
FROM patients;


-- Q15. Show the youngest age in each city.
SELECT name,
       city,
       age,
       LAST_VALUE(age) OVER (
           PARTITION BY city
           ORDER BY age
           ROWS BETWEEN UNBOUNDED PRECEDING
           AND UNBOUNDED FOLLOWING
       ) AS youngest_age
FROM patients;


-- Q16. Calculate the running total of all patient ages.
SELECT name,
       age,
       SUM(age) OVER (ORDER BY age) AS running_total
FROM patients;


-- Q17. Calculate the running average of patient ages.
SELECT name,
       age,
       AVG(age) OVER (ORDER BY age) AS running_average
FROM patients;


-- Q18. Show the difference between the current age and previous age.
SELECT name,
       age,
       LAG(age) OVER (ORDER BY age) AS previous_age,
       age - LAG(age) OVER (ORDER BY age) AS age_difference
FROM patients;


-- Q19. Show the next age and the difference between next age and current age.
SELECT name,
       age,
       LEAD(age) OVER (ORDER BY age) AS next_age,
       LEAD(age) OVER (ORDER BY age) - age AS age_difference
FROM patients;


-- Q20. Find the top 3 oldest patients using RANK().
SELECT *
FROM (
    SELECT name,
           age,
           RANK() OVER (ORDER BY age DESC) AS age_rank
    FROM patients
)
WHERE age_rank <= 3;


-- Q21. Find the top 2 oldest patients in each city.
SELECT *
FROM (
    SELECT name,
           city,
           age,
           RANK() OVER (
               PARTITION BY city
               ORDER BY age DESC
           ) AS city_rank
    FROM patients
)
WHERE city_rank <= 2;


-- Q22. Show each patient's difference from their city average age.
SELECT name,
       city,
       age,
       city_avg_age,
       age - city_avg_age AS difference_from_city_avg
FROM (
    SELECT name,
           city,
           age,
           AVG(age) OVER (PARTITION BY city) AS city_avg_age
    FROM patients
) AS t;


-- Q23. Find patients whose age is above their city average.
SELECT name,
       city,
       age,
       city_avg_age
FROM (
    SELECT name,
           city,
           age,
           AVG(age) OVER (PARTITION BY city) AS city_avg_age
    FROM patients
) AS t
WHERE age > city_avg_age;


-- Q24. Find the second-oldest patient in each city.
SELECT name,
       city,
       age
FROM (
    SELECT name,
           city,
           age,
           RANK() OVER (
               PARTITION BY city
               ORDER BY age DESC
           ) AS city_rank
    FROM patients
)
WHERE city_rank = 2;


-- Q25. Give every patient a row number from oldest to youngest.
SELECT name,
       age,
       ROW_NUMBER() OVER (ORDER BY age DESC) AS row_num
FROM patients;


-- Q26. Give every patient a unique row number within their city,
-- ordered from oldest to youngest.
SELECT name,
       city,
       age,
       ROW_NUMBER() OVER (
           PARTITION BY city
           ORDER BY age DESC
       ) AS row_num
FROM patients;


-- Q27. Dense-rank all patients by age from oldest to youngest.
SELECT name,
       age,
       DENSE_RANK() OVER (ORDER BY age DESC) AS age_rank
FROM patients;


-- Q28. Show the oldest age in each patient's city using FIRST_VALUE().
SELECT name,
       city,
       age,
       FIRST_VALUE(age) OVER (
           PARTITION BY city
           ORDER BY age DESC
       ) AS oldest_age
FROM patients;


-- Q29. Calculate a running total of age within each city.
SELECT name,
       city,
       age,
       SUM(age) OVER (
           PARTITION BY city
           ORDER BY age
       ) AS city_running_total
FROM patients;


-- Q30. Divide all patients into 4 age groups using NTILE().
SELECT name,
       age,
       NTILE(4) OVER (ORDER BY age) AS age_group
FROM patients;


-- Q31. Calculate each patient's relative age position among all patients.
SELECT name,
       age,
       PERCENT_RANK() OVER (ORDER BY age) AS age_percentile
FROM patients;


-- Q32. Divide patients within each city into 2 age groups.
SELECT name,
       city,
       age,
       NTILE(2) OVER (
           PARTITION BY city
           ORDER BY age
       ) AS age_group
FROM patients;


-- Q33. Calculate the age gap between each patient and the oldest patient.
SELECT name,
       age,
       MAX(age) OVER () AS oldest_age,
       MAX(age) OVER () - age AS age_gap
FROM patients;


-- Q34. Compare each patient with the previous patient by age.
SELECT name,
       age,
       LAG(age) OVER (ORDER BY age) AS previous_age,
       age - LAG(age) OVER (ORDER BY age) AS age_change
FROM patients;


-- Q35. Compare each patient with the next patient by age.
SELECT name,
       age,
       LEAD(age) OVER (ORDER BY age) AS next_age,
       LEAD(age) OVER (ORDER BY age) - age AS age_gap
FROM patients;


-- Q36. Calculate the running average of age within each city.
SELECT name,
       city,
       age,
       AVG(age) OVER (
           PARTITION BY city
           ORDER BY age
       ) AS city_running_avg
FROM patients;


-- Q37. Find the patient's distance from their city average.
SELECT name,
       city,
       age,
       AVG(age) OVER (PARTITION BY city) AS city_avg_age,
       ABS(age - AVG(age) OVER (PARTITION BY city)) AS difference_from_avg
FROM patients;


-- Q38. Show the youngest age in each city using FIRST_VALUE().
SELECT name,
       city,
       age,
       FIRST_VALUE(age) OVER (
           PARTITION BY city
           ORDER BY age
       ) AS youngest_patient_age
FROM patients;


-- Q39. Calculate the age difference from the previous patient
-- within the same city.
SELECT name,
       city,
       age,
       LAG(age) OVER (
           PARTITION BY city
           ORDER BY age
       ) AS previous_city_age,
       age - LAG(age) OVER (
           PARTITION BY city
           ORDER BY age
       ) AS age_difference
FROM patients;


-- Q40. Calculate the running age total as a percentage of total age.
SELECT name,
       age,
       SUM(age) OVER (ORDER BY age) AS running_age_total,
       SUM(age) OVER () AS total_age,
       SUM(age) OVER (ORDER BY age) * 100.0
           / SUM(age) OVER () AS running_percentage
FROM patients;


-- Q41. Find the oldest patient from each city.
SELECT name,
       city,
       age
FROM (
    SELECT name,
           city,
           age,
           ROW_NUMBER() OVER (
               PARTITION BY city
               ORDER BY age DESC
           ) AS rn
    FROM patients
)
WHERE rn = 1;


-- Q42. Show the youngest age, oldest age, and age range in each city.
SELECT name,
       city,
       age,
       MIN(age) OVER (PARTITION BY city) AS youngest_age,
       MAX(age) OVER (PARTITION BY city) AS oldest_age,
       MAX(age) OVER (PARTITION BY city)
       - MIN(age) OVER (PARTITION BY city) AS age_range
FROM patients;


-- Q43. Give each patient a position by age within their city.
SELECT name,
       city,
       age,
       ROW_NUMBER() OVER (
           PARTITION BY city
           ORDER BY age
       ) AS patient_number
FROM patients;


-- Q44. Calculate each city's total age and its percentage
-- of the overall total age.
SELECT name,
       city,
       age,
       SUM(age) OVER (PARTITION BY city) AS city_total_age,
       SUM(age) OVER () AS total_age,
       SUM(age) OVER (PARTITION BY city) * 100.0
           / SUM(age) OVER () AS city_percentage
FROM patients;


-- Q45. Find patients older than their city average.
SELECT name,
       city,
       age,
       city_avg_age
FROM (
    SELECT name,
           city,
           age,
           AVG(age) OVER (PARTITION BY city) AS city_avg_age
    FROM patients
)
WHERE age > city_avg_age;


-- Q46. Compare each city's average age with the overall average age.
SELECT name,
       city,
       age,
       AVG(age) OVER (PARTITION BY city) AS city_avg_age,
       AVG(age) OVER () AS overall_avg_age,
       AVG(age) OVER (PARTITION BY city)
       - AVG(age) OVER () AS difference
FROM patients;


-- Q47. Calculate each patient's percentile position within their city.
SELECT name,
       city,
       age,
       PERCENT_RANK() OVER (
           PARTITION BY city
           ORDER BY age
       ) AS city_percentile
FROM patients;


-- Q48. Calculate cumulative age distribution within each city.
SELECT name,
       city,
       age,
       CUME_DIST() OVER (
           PARTITION BY city
           ORDER BY age
       ) AS city_distribution
FROM patients;


-- Q49. Count the number of patients in each city.
SELECT name,
       city,
       age,
       COUNT(*) OVER (
           PARTITION BY city
       ) AS city_total_patients
FROM patients;


-- Q50. Calculate each patient's percentage contribution
-- to the total age of their city.
SELECT name,
       city,
       age,
       SUM(age) OVER (PARTITION BY city) AS city_total_age,
       age * 100.0
           / SUM(age) OVER (PARTITION BY city) AS age_share_in_city
FROM patients;

END OF DAY 3 — 50 SQL WINDOW FUNCTION QUESTIONS
