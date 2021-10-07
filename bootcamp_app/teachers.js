const { Pool } = require('pg');
const { argv } = require('process');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const cohortName = argv[2];

pool.query(`
SELECT DISTINCT teachers.name AS teacher, cohorts.name AS cohort
FROM assistance_requests
JOIN teachers ON teachers.id = assistance_requests.teacher_id
JOIN students ON students.id = assistance_requests.student_id
JOIN cohorts ON cohorts.id = students.cohort_id
WHERE cohorts.name = '${ cohortName || 'JUL02' }'
ORDER BY teachers.name;
`)
  .then(res => {
    console.log(res.rows);
    res.rows.forEach((row) => {
      console.log(`${row.cohort}: ${row.teacher} `)
    });
  });