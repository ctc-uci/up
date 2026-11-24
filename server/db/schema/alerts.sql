CREATE TABLE alerts (
    id serial PRIMARY KEY,
    kind varchar(32) NOT NULL
        CHECK (kind IN ('checklist_overdue', 'session_cancelled', 
                        'session_changed', 'mou_renewal', 
                        'coi_renewal', 'calendar_failed', 
                        'sync_failed', 'email_failed')),
    scope varchar(16) NOT NULL
        CHECK (scope IN ('program', 'partner', 'system')),
    program_id int,
    FOREIGN KEY (program_id)
        REFERENCES (programs.id)
        ON DELETE SET NULL,
    partner_id int,
    FOREIGN KEY (partner_id)
        REFERENCES (partners.id)
        ON DELETE SET NULL,
    message text NOT NULL,
    dedupe_key varchar(200) NOT NULL UNIQUE,
    created_at timestamptz DEFAULT now() NOT NULL,
    resolved_at timestamptz,
    resolved_by int,
    FOREIGN KEY (resolved_by)
        REFERENCES (users.id)
        ON DELETE SET NULL,
);