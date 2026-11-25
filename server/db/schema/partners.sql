CREATE TABLE partners (
    id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    type VARCHAR(64) NOT NULL,
    address TEXT NOT NULL,
    city TEXT NOT NULL,
    county TEXT NOT NULL,
    notes TEXT NOT NULL,
    mou_signed_date DATE,
    coi_signed_date DATE,
    contacts JSONB NOT NULL,
    archived BOOLEAN NOT NULL DEFAULT FALSE,
    created_by INT REFERENCES users(id),
    created_at TIMESTAMPTZ DEFAULT NOW()
);