SELECT students.name AS student, AVG(assignment_submissions.duration) AS average_assignment_duration, AVG(assignments.duration) as average_estimated_duration
FROM students
JOIN assignment_submissions ON student_id = students.id
JOIN assignments ON assignments.id = assignment_submissions.assignment_id
WHERE end_date IS NULL
GROUP BY student
HAVING AVG(assignments.duration) > AVG(assignment_submissions.duration)
ORDER BY average_assignment_duration;