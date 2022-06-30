USE codeup_test_db;

DROP TABLE IF EXISTS books;

CREATE TABLE books (
	id                  INT UNSIGNED    NOT NULL AUTO_INCREMENT,
	title               VARCHAR(50)     NOT NULL,				    -- string for storing the book title
	author              VARCHAR(50)     NOT NULL DEFAULT 'Unknown', -- string for storing author name
	date_published      DATE            NOT NULL,                   -- date representing year book was released
	description         VARCHAR(250),                               -- description of book
	bestseller_weeks    SMALLINT        DEFAULT 0,                  -- SMALLINT showing weeks on bestseller list
	PRIMARY KEY (id)
	);				
