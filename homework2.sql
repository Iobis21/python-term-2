SQL
-- ბაზის შექმნა და არჩევა
CREATE DATABASE IF NOT EXISTS hw_26;
USE hw_26;

-- 1. Authors ცხრილის შექმნა პირველადი გასაღებით (Primary Key)
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Country VARCHAR(50)
);

-- 2. Books ცხრილის შექმნა მეორადი გასაღებით (Foreign Key)
CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(100) NOT NULL,
    PublishYear INT,
    Price DECIMAL(6, 2),
    AuthorID INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- 3. მინიმუმ 5 ჩანაწერის დამატება ორივე ცხრილში
-- ჯერ ვამატებთ ავტორებს:
INSERT INTO Authors (FirstName, LastName, Country) VALUES
('ილია', 'ჭავჭავაძე', 'საქართველო'),
('აკაკი', 'წერეთელი', 'საქართველო'),
('ვაჟა', 'ფშაველა', 'საქართველო'),
('მიხეილ', 'ჯავახიშვილი', 'საქართველო'),
('გალაქტიონ', 'ტაბიძე', 'საქართველო');

-- შემდეგ ვამატებთ წიგნებს შესაბამისი AuthorID-ით:
INSERT INTO Books (Title, PublishYear, Price, AuthorID) VALUES
('კაცია-ადამიანი?!', 1869, 15.50, 1),
('ბაში-აჩუკი', 1895, 12.00, 2),
('სტუმარ-მასპინძელი', 1893, 14.20, 3),
('ჯაყოს ხიზნები', 1925, 18.00, 4),
('მთაწმინდის მთვარე', 1915, 10.50, 5);

-- 4. Books ცხრილში ჩანაწერის განახლება (Update)
-- მაგალითად: პირველი წიგნის ფასის შეცვლა
UPDATE Books
SET Price = 19.99
WHERE BookID = 1;

-- 5. გაერთიანებული ცხრილების ჩვენება (INNER JOIN)
SELECT 
    b.BookID,
    b.Title,
    b.PublishYear,
    b.Price,
    a.FirstName,
    a.LastName,
    a.Country
FROM Books b
INNER JOIN Authors a ON b.AuthorID = a.AuthorID;

-- 6. ყველა ჩანაწერის წაშლა (Delete)
-- Foreign Key-ს გამო ჯერ შვილობილ (Books) ცხრილს ვასუფთავებთ, შემდეგ მშობელს (Authors):
DELETE FROM Books;
DELETE FROM Authors;

-- 7. ცხრილების წაშლა (Drop)
-- აქაც ჯერ წიგნების ცხრილს ვშლით, შემდეგ ავტორების:
DROP TABLE Books;
DROP TABLE Authors;