SELECT teachers.name AS teacher, cohorts.name AS cohort, COUNT(assistance_requests.teacher_id) AS total_assistances
FROM assistance_requests
JOIN teachers ON teachers.id = assistance_requests.teacher_id
JOIN students ON students.id = assistance_requests.student_id
JOIN cohorts ON cohorts.id = students.cohort_id
WHERE cohorts.name = 'JUL02'
GROUP BY cohorts.name, teachers.name
ORDER BY total_assistances DESC;