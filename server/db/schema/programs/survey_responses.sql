DROP TABLE IF EXISTS survey_responses CASCADE;

CREATE TABLE survey_responses (
  id SERIAL PRIMARY KEY,
  progam_id INT REFERENCES programs(id),
  phase VARCHAR(8) 
    CHECK (phase in ('pre', 'mid', 'post')),
  submitted_at TIMESTAMPTZ,
  initials VARCHAR(8),
  is_returning BOOLEAN,

  --demographics
  gender VARCHAR(64),
  grade SMALLINT,
  race_ethnicity VARCHAR(64),
  mental_health_history BOOLEAN,

  --WHO-5 well-being, 0–5
  q1_cheerful SMALLINT CHECK (q1_cheerful BETWEEN 0 AND 5),
  q2_calm SMALLINT CHECK (q2_calm BETWEEN 0 AND 5),
  q3_active SMALLINT CHECK (q3_active BETWEEN 0 AND 5),
  q4_rested SMALLINT CHECK (q4_rested BETWEEN 0 AND 5),
  q5_interested SMALLINT CHECK (q5_interested BETWEEN 0 AND 5),

  --Emotion regulation, 1–4 (all phases)
  er_stay_in_control SMALLINT CHECK (er_stay_in_control BETWEEN 1 AND 4),
  er_out_of_bad_mood SMALLINT CHECK (er_out_of_bad_mood BETWEEN 1 AND 4),
  er_relaxed_when_others_angry SMALLINT CHECK (er_relaxed_when_others_angry BETWEEN 1 AND 4),
  er_control_emotions SMALLINT CHECK (er_control_emotions BETWEEN 1 AND 4),
  er_relax_when_upset SMALLINT CHECK (er_relax_when_upset BETWEEN 1 AND 4),
  er_calm_when_wrong SMALLINT CHECK (er_calm_when_wrong BETWEEN 1 AND 4),

  --Growth mindset, 1–4 (pre and post)
  gm_talent SMALLINT CHECK (gm_talent BETWEEN 1 AND 4),
  gm_liking_subject SMALLINT CHECK (gm_liking_subject BETWEEN 1 AND 4),
  gm_intelligence SMALLINT CHECK (gm_intelligence BETWEEN 1 AND 4),
  gm_effort SMALLINT CHECK (gm_effort BETWEEN 1 AND 4),
  gm_behavior SMALLINT CHECK (gm_behavior BETWEEN 1 AND 4),
  gm_giving_up SMALLINT CHECK (gm_giving_up BETWEEN 1 AND 4),

  --Leadership, 1–4 (all phases)
  ld_lead_group SMALLINT CHECK (ld_lead_group BETWEEN 1 AND 4),
  ld_teach_skill SMALLINT CHECK (ld_teach_skill BETWEEN 1 AND 4),
  ld_see_self_as_leader SMALLINT CHECK (ld_see_self_as_leader BETWEEN 1 AND 4),

  --Program experience, yes/no (mid and post)
  felt_accepted BOOLEAN,
  more_confident BOOLEAN,
  gained_tools BOOLEAN,

  --Open-ended and follow-up (all phases)
  open_answers JSONB DEFAULT '{}'::jsonb,
  wants_support BOOLEAN
);

