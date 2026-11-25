DROP TABLE IF EXISTS sessions CASCADE;

CREATE TABLE sessions (
  id SERIAL PRIMARY KEY,
  program_id INT REFERENCES programs(id),
  session_date DATE,
  start_time TIME,
  end_time TIME,
  status VARCHAR(16) NOT NULL DEFAULT 'scheduled'
    CHECK (status IN ('scheduled', 'cancelled')),
  note TEXT, 
  google_event_id VARCHAR(128) 
);
