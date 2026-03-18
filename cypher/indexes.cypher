// Speed up lookups by Movie title
CREATE INDEX movie_title_index IF NOT EXISTS FOR (m:Movie) ON (m.title);

// Speed up lookups by Person name
CREATE INDEX person_name_index IF NOT EXISTS FOR (p:Person) ON (p.name);

// Speed up lookups by User username
CREATE INDEX user_username_index IF NOT EXISTS FOR (u:User) ON (u.username);
