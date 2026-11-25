CREATE TABLE program_grants (
  program_id INTEGER REFERENCES programs(id) ON DELETE CASCADE,
  grant_id VARCHAR(16) REFERENCES grants(id) ON DELETE CASCADE,
  PRIMARY KEY (program_id, grant_id)
);