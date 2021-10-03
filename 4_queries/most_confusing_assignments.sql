SELECT assignments.id, name, chapter, COUNT(assistance_requests.assignment_id) as total_requests
FROM assignments
JOIN assistance_requests ON assistance_requests.assignment_id = assignments.id
GROUP BY assignments.id
ORDER BY COUNT(assistance_requests.assignment_id) DESC;