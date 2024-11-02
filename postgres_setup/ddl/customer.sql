CREATE TABLE customer (
    id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255),
    location_id INT,
    gender VARCHAR(50),
    FOREIGN KEY (location_id) REFERENCES locations(id)
);