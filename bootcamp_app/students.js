const { Pool } = require('pg');
const { argv } = require('process');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const cohort = argv[2];
const limit = argv[3];

pool.query(`
SELECT students.id, students.name AS student, cohorts.name AS cohort
FROM students
JOIN cohorts ON students.cohort_id = cohorts.id
WHERE cohorts.name LIKE '${cohort}%'
LIMIT ${limit};
`)
  .then(res => {
    res.rows.forEach(user => {
      console.log(`${user.student} has an id of ${user.id} and was in the ${user.cohort} cohort`);
    });
  })
  .catch(err => console.error('query error', err.stack));