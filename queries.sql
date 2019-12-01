# 1) get a list of all employees, ordered by last name;
SELECT * FROM employe
ORDER BY employe.last_name;


# 2) get average salary by employee;
SELECT s.employe_id,
       AVG(s.salary_sum)
FROM salary AS s
GROUP BY s.employe_id;


# 3) get average and highest salary by position;
SELECT p.position_id,
       AVG(s.salary_sum) AS average_salary_position,
       MAX(s.salary_sum) AS highest_salary_position
FROM position AS p
LEFT JOIN employe AS e ON p.position_id = e.position_id
INNER JOIN salary AS s ON e.employe_id = s.employe_id
GROUP BY p.position_id;

# 4) get total number of days every person worked and total income;
SELECT e.employe_id,
       COUNT(i.date) AS total_work_days_employe,
       SUM(i.earnings) AS total_income_employe
FROM employe AS e
         LEFT JOIN income AS i ON e.employe_id = i.employe_id
GROUP BY e.employe_id;


# 5) get overall (total) income by transport, average income and a number of working days in the descending order;
SELECT t.transport_id,
       COUNT(i.date) AS total_work_days_transport,
       SUM(i.earnings) AS total_income_transport,
       SUM(i.earnings)/COUNT(i.date) AS average_income_transport
FROM transport AS t
LEFT JOIN income AS i ON t.transport_id = i.transport_id
GROUP BY t.transport_id
ORDER BY total_work_days_transport DESC ;


# 6) get people who have birthday in May;
SELECT e.employe_id
FROM employe AS e
WHERE MONTH(e.dob) = '05';


# 7) get a number of years every person works in `CherkasyElektroTrans`
SELECT e.employe_id,
       (UNIX_TIMESTAMP(CURDATE()) - UNIX_TIMESTAMP(e.start_of_w)) / 31556926 AS years_works
FROM employe AS e;
