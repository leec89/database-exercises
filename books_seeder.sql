USE codeup_test_db;

TRUNCATE TABLE books;

INSERT INTO books (title, author, date_published, description, bestseller_weeks)
VALUES ('To Kill a Mockingbird', 'Harper Lee', '1960-07-11', 'This is a book about birds.', 0),
       ('The Great Gatsby', 'F. Scott Fitzgerald', '1925-04-10', 'This is a book about a great thing.', 10),
       ('Harry Potter and the Sorcerer`s Stone', 'J.K. Rowling', '1997-06-26', 'This is a book about sorcerers.', 70),
       ('The Hobbit', 'J.R.R. Tolkien', '1937-07-21', 'This is a book about hobbits.', 5),
       ('The Da Vinci Code', 'Dan Brown', '2003-03-18', 'Book about symbols and codes', '28'),
       ('The Girl with the Dragon Tattoo', 'Larsson Stieg', '2005-08-01', 'Book is a psychological thriller', '10'),
       ('The Very Hungry Caterpillar', 'Eric Carle', '1969-06-03', 'Childrens book for bedtime', '997');
	
