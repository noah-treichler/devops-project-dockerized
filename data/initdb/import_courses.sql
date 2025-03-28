DROP TABLE IF EXISTS courses;

CREATE TABLE IF NOT EXISTS courses (
    course_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    course_number VARCHAR(50),
    semester VARCHAR(50),
    average_gpa NUMERIC(3,1),
    professor_id INTEGER
);

COPY courses(name, course_number, semester, average_gpa, professor_id)
FROM '/docker-entrypoint-initdb.d/courses.csv'
WITH (
  FORMAT csv,
  HEADER true
);
