-- tracks each talk at the conference
CREATE TABLE sessions (
  id INTEGER,
  title TEXT,
  speaker TEXT,
  session_date DATE
);

-- first talk on the schedule
INSERT INTO sessions (id, title, speaker, session_date)
VALUES (1, 'Intro to Data Visualization', 'Maya Chen', '2026-05-01');

-- the other two talks
INSERT INTO sessions (id, title, speaker, session_date)
VALUES (2, 'Building Reliable APIs', 'Jordan Patal', '2026-05-02');

INSERT INTO sessions (id, title, speaker, session_date)
VALUES (3, 'Cybersecurity Basics for Teams', 'Elena Rivera', '2026-05-03');

-- jordan renamed his talk
UPDATE sessions
SET title = 'Building Reliable REST APIs'
WHERE id = 2;

-- just jordan's talk title
SELECT title
FROM sessions
WHERE speaker = 'Jordan Patal';

-- room for each talk
ALTER TABLE sessions
ADD COLUMN room TEXT;

-- assign a room to each talk
UPDATE sessions
SET room = 'A'
WHERE id = 1;

UPDATE sessions
SET room = 'B'
WHERE id = 2;

UPDATE sessions
SET room = 'C'
WHERE id = 3;

-- elena canceled, remove her talk
DELETE FROM sessions
WHERE id = 3;

-- final schedule
SELECT * FROM sessions;
