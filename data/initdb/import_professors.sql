CREATE TABLE IF NOT EXISTS professors (
    professor_id SERIAL PRIMARY KEY,
    professor_name VARCHAR(100),
    department VARCHAR(100)
);

COPY professors(professor_name, department)
FROM '/docker-entrypoint-initdb.d/professors.csv'
WITH (FORMAT csv, HEADER true);
