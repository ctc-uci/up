CREATE TABLE people (
    id VARCHAR(16) PRIMARY KEY,
    kind VARCHAR(16) NOT NULL, -- Should this be an enum? - Adarsh
    name VARCHAR(120) NOT NULL,
    email TEXT NOT NULL,
    phone TEXT NOT NULL,
    trained BOOLEAN NOT NULL DEFAULT TRUE,
    training_date DATE,
    active BOOLEAN NOT NULL DEFAULT TRUE
);