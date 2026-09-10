-- 1. ბაზის შექმნა და არჩევა
CREATE DATABASE IF NOT EXISTS lesson27_hw;
USE lesson27_hw;

-- 2. ცხრილების შექმნა დიზაინის მიხედვით
CREATE TABLE migrations (
    id INT PRIMARY KEY,
    distance INT,
    days INT
);

CREATE TABLE sea_lions (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    species VARCHAR(100)
);

-- მონაცემების შეტანა migrations ცხრილში
INSERT INTO migrations (id, distance, days) VALUES
(10484, 1000, 107),
(11728, 1531, 56),
(11729, 1370, 37),
(11732, 1622, 62),
(11734, 1491, 58),
(11735, 2723, 82),
(11736, 1571, 52),
(11737, 1957, 92);

-- მონაცემების შეტანა sea_lions ცხრილში
INSERT INTO sea_lions (id, name, species) VALUES
(10484, 'Ayah', 'Zalophus californianus'),
(11728, 'Spot', 'Zalophus californianus'),
(11729, 'Tiger', 'Zalophus californianus'),
(11732, 'Mabel', 'Zalophus californianus'),
(11734, 'Rick', 'Zalophus californianus'),
(11790, 'Jolee', 'Zalophus californianus');


-- 3. JOIN ოპერაციები და შედარება

-- 3.1. INNER JOIN (აბრუნებს მხოლოდ იმ ჩანაწერებს, რომელთა id ემთხვევა ორივე ცხრილში)
SELECT 
    m.id, m.distance, m.days,
    s.name, s.species
FROM migrations m
INNER JOIN sea_lions s ON m.id = s.id;


-- 3.2. LEFT JOIN (აბრუნებს migrations-ის ყველა ჩანაწერს; თუ sea_lions-ში არ მოიძებნა, დაიწერება NULL)
SELECT 
    m.id, m.distance, m.days,
    s.name, s.species
FROM migrations m
LEFT JOIN sea_lions s ON m.id = s.id;


-- 3.3. RIGHT JOIN (აბრუნებს sea_lions-ის ყველა ჩანაწერს; თუ migrations-ში არ მოიძებნა, დაიწერება NULL)
SELECT 
    s.id, s.name, s.species,
    m.distance, m.days
FROM migrations m
RIGHT JOIN sea_lions s ON m.id = s.id;


-- 3.4. FULL JOIN (UNION-ით: აერთიანებს LEFT და RIGHT JOIN-ს და დუბლიკატებს შლის)
SELECT 
    m.id AS mig_id, m.distance, m.days,
    s.id AS sl_id, s.name, s.species
FROM migrations m
LEFT JOIN sea_lions s ON m.id = s.id
UNION
SELECT 
    m.id AS mig_id, m.distance, m.days,
    s.id AS sl_id, s.name, s.species
FROM migrations m
RIGHT JOIN sea_lions s ON m.id = s.id;


-- 3.5. FULL JOIN (UNION ALL-ით: აერთიანებს LEFT და RIGHT JOIN-ს დუბლიკატების წაშლის გარეშე)
SELECT 
    m.id AS mig_id, m.distance, m.days,
    s.id AS sl_id, s.name, s.species
FROM migrations m
LEFT JOIN sea_lions s ON m.id = s.id
UNION ALL
SELECT 
    m.id AS mig_id, m.distance, m.days,
    s.id AS sl_id, s.name, s.species
FROM migrations m
RIGHT JOIN sea_lions s ON m.id = s.id;