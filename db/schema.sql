DROP TABLE IF EXISTS pokemon;

CREATE TABLE pokemon (
	id SERIAL PRIMARY KEY,
	name VARCHAR UNIQUE,
	poke_type VARCHAR,
	cp INT,
	img_url TEXT
);
