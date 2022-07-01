USE codeup_test_db;

DROP TABLE IF EXISTS albums;

CREATE TABLE albums (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    artist VARCHAR(50),     -- string for storing the recording artist_name
    name VARCHAR(50),       -- string for storing a record_name
    release_date INT,       -- integer representing year record was released
    sales FLOAT(2),	        -- sales value for number of records sold in millions
    genre VARCHAR(80),      -- string for storing the records genres
    PRIMARY KEY (id)
);