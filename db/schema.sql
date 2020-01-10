CREATE DATABASE kartify;
\c kartify

-- Table 'Questions'

CREATE TABLE IF NOT EXISTS questions (
  question_id SERIAL PRIMARY KEY,
  asker_name VARCHAR(40),
  asker_email VARCHAR(40),
  question_body VARCHAR(255),
  question_date DATE DEFAULT CURRENT_DATE,
  helpful SMALLINT DEFAULT 0,
  reported SMALLINT DEFAULT 0
);

-- Table 'Answers'

CREATE TABLE IF NOT EXISTS answers (
  id SERIAL PRIMARY KEY,
  question_id INT REFERENCES questions(id) NOT NULL,
  answerer_name VARCHAR(40) NOT NULL,
  answerer_email VARCHAR(40) NOT NULL,
  body VARCHAR(255) NOT NULL,
  date_written DATE DEFAULT CURRENT_DATE,
  helpful SMALLINT DEFAULT 0,
  reported SMALLINT DEFAULT 0
);

-- Table 'Photos'
		
CREATE TABLE IF NOT EXISTS answers_photos (
  id SERIAL PRIMARY KEY,
  answer_id INT REFERENCES answers(id) NOT NULL,
  url VARCHAR(2047) NOT NULL
);

CREATE INDEX questions_product_id ON questions(product_id);
CREATE INDEX answers_question_id ON answers(question_id);
CREATE INDEX answers_photos_answer_id ON answers_photos(answer_id);