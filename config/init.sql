CREATE TABLE IF NOT EXISTS professors (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS courses (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    course_number VARCHAR(20) NOT NULL,
    semester VARCHAR(20) NOT NULL,
    average_gpa DECIMAL(2,1),
    professor_id INT REFERENCES professors(id)
);

DO
$$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM professors) THEN
        COPY professors FROM '/data/professors.csv' DELIMITER ',' CSV HEADER;
    END IF;
    
    IF NOT EXISTS (SELECT 1 FROM courses) THEN
        COPY courses FROM '/data/courses.csv' DELIMITER ',' CSV HEADER;
    END IF;
END
$$;