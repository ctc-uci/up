CREATE TABLE email_outbox (
    id serial PRIMARY KEY,
    program_id int,
    FOREIGN KEY (program_id)
        REFERENCES programs(id)
        ON DELETE SET NULL,
    to_email varchar(256) NOT NULL,
    subject text NOT NULL,
    body text NOT NULL,
    status varchar(16) NOT NULL
        CHECK (status IN ('sending', 'sent', 'failed')),
    delivered_to varchar(256),
    error text,
    sent_by int,
    FOREIGN KEY (sent_by)
        REFERENCES users(id)
        ON DELETE SET NULL,
    sent_at timestamptz DEFAULT now() NOT NULL
);