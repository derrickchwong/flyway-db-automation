-- postgres create table statement for a table called person with column person id, which is a primary key, and columns to include first name, last name, birthday, phone number and address
CREATE TABLE person (
  person_id SERIAL PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  birthday DATE NOT NULL,
  phone_number VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL
);
