-- Table: users

-- DROP TABLE IF EXISTS public.users;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(120) NOT NULL,
    username VARCHAR(32) NOT NULL UNIQUE,
    password_hash VARCHAR(256) NOT NULL,
    role VARCHAR(16) NOT NULL CHECK (role IN ('admin', 'super_admin')),
    status VARCHAR(16) NOT NULL DEFAULT 'pending' CHECK (status IN ('pending', 'active', 'denied', 'deactivated')),
    color VARCHAR(16),
    approved_by int REFERENCES users(id),
    created_at TIMESTAMPTZ DEFAULT NOW()
);