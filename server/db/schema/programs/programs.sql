CREATE TABLE programs (
  id serial PRIMARY KEY, 
  name varchar(200) NOT NULL,
  partner_id int NOT NULL,
  FOREIGN KEY(partner_id)
    REFERENCES partners(id)
    ON DELETE CASCADE,
  program_type_id varchar(64) NOT NULL,
  stage varchar(16) DEFAULT 'pending' NOT NULL,
  location text NOT NULL,
  address text NOT NULL,
  parking text NOT NULL,
  attire text NOT NULL,
  supply_dropoff text,
  compensation text NOT NULL,
  waiver_link text NOT NULL,
  mentor_notes text NOT NULL,
  drive_folder_url text NOT NULL,
  pre_survey_sheet text NOT NULL,
  mid_survey_sheet text,
  post_survey_sheet text NOT NULL,
  survey_synced_at timestamptz,
  calendar_synced_at timestamptz,
  created_by int,
  created_at timestamptz DEFAULT now() NOT NULL,
  FOREIGN KEY(created_at)
    REFERENCES users(id)
    ON DELETE CASCADE,
  updated_at timestamptz DEFAULT now() NOT NULL
);