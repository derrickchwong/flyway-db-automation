-- alter person table and add a column for country, default to HK 

ALTER TABLE person ADD COLUMN country VARCHAR(255) DEFAULT 'HK';