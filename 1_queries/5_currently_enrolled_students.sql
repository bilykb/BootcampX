SELECT name, id, cohort_id
FROM students
WHERE cohort_id IS NOT NULL
ORDER BY cohort_id DESC;