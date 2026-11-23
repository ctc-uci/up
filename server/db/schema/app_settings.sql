CREATE TABLE app_settings (
  id smallint PRIMARY KEY, 
  data jsonb NOT NULL,
  google_refresh_to_ken bytea,
  updated_at timestamptz DEFAULT now(),
);