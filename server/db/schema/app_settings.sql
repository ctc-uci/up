CREATE TABLE app_settings (
  id smallint PRIMARY KEY, 
  data jsonb NOT NULL,
  google_refresh_token bytea,
  updated_at timestamptz DEFAULT now() NOT NULL
);