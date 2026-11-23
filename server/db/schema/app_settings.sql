CREATE TABLE app_settings (
  id smallint PRIMARY KEY DEFAULT 1 CHECK (id = 1), 
  data jsonb NOT NULL,
  google_refresh_token bytea,
  updated_at timestamptz DEFAULT now() NOT NULL
);