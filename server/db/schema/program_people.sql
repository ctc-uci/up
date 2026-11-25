CREATE TABLE program_people(
    program_id INTEGER REFERENCES programs(id) ON DELETE CASCADE,
    person_id VARCHAR(16) REFERENCES people(id) ON DELETE CASCADE,
    PRIMARY KEY (program_id, person_id)
);