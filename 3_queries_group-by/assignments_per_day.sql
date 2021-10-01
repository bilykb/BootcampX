SELECT day, COUNT(day) as total_assignments
FROM assignments
GROUP BY day
ORDER BY day;