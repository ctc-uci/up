CREATE TABLE activity_log (
    id serial PRIMARY KEY,
    program_id int,
    FOREIGN KEY (program_id)
        REFERENCES programs(id)
        ON DELETE SET NULL,
    partner_id int,
    FOREIGN KEY (partner_id)
        REFERENCES partners(id)
        ON DELETE SET NULL,
    author_user_id int,
    FOREIGN KEY (author_user_id)
        REFERENCES users(id)
        ON DELETE SET NULL,
    kind varchar(8) NOT NULL
        CHECK (kind IN ('auto', 'note')),
    message text NOT NULL,
    created_at timestamptz DEFAULT now() NOT NULL
);