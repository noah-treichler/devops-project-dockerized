-- Create the professors table if it doesn't exist
CREATE TABLE IF NOT EXISTS professors (
    professor_id SERIAL PRIMARY KEY,
    professor_name VARCHAR(100),
    department VARCHAR(100)
    -- Add other columns as needed
);

-- Import CSV data into the professors table
COPY professors(professor_name, department)
FROM '/docker-entrypoint-initdb.d/professors.csv'
WITH (FORMAT csv, HEADER true);
