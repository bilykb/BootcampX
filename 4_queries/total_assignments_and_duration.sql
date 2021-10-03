SELECT day, COUNT(day), SUM(duration)
FROM assignments
GROUP BY day
ORDER BY day;