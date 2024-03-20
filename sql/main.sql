-- CREATE

CREATE DATABASE buses 
    DEFAULT CHARACTER SET "utf8"
    COLLATE "utf8_hungarian_ci";

USE buses;

CREATE TABLE drivers (
    id int PRIMARY KEY AUTO_INCREMENT,
    fullName varchar(32) NOT NULL,
    licenseplate varchar(7) NOT NULL
);

CREATE TABLE stops (
    id int PRIMARY KEY AUTO_INCREMENT,
    stopName varchar(32) NOT NULL
);

CREATE TABLE routes (
    id int PRIMARY KEY AUTO_INCREMENT,
    routeNumber int NOT NULL,
    firstDeparture time NOT NULL,
    lastDeparture time NOT NULL,
    cycle int NOT NULL
);

CREATE TABLE routegroups (
    id int PRIMARY KEY AUTO_INCREMENT,
    routeId int NOT NULL,
    stopId int NOT NULL, 
    minutetonextstop int, -- if the value is NULL then it's the last stop
    FOREIGN KEY (stopId) REFERENCES stops(id),
    FOREIGN KEY (routeId) REFERENCES routes(id)
);

CREATE TABLE assingments (
    id int PRIMARY KEY AUTO_INCREMENT,
    routeId int NOT NULL,
    driverId int NOT NULL,
    FOREIGN KEY (routeId) REFERENCES routes(id),
    FOREIGN KEY (driverId) REFERENCES drivers(id)
);

-- INSERT

INSERT INTO drivers VALUES
    (NULL, 'Gábor Kovács', 'ABV-456'),
    (NULL, 'Éva Nagy', 'XYD-789'),
    (NULL, 'Zoltán Szabó', 'CDD-123'),
    (NULL, 'Orsolya Tóth', 'GHG-987'),
    (NULL, 'István Horváth', 'JKZ-654'),
    (NULL, 'Katalin Varga', 'LMV-321'),
    (NULL, 'Máté Kovács', 'NPE-876'),
    (NULL, 'Eszter Farkas', 'QRJ-543'),
    (NULL, 'Péter Molnár', 'STX-210'),
    (NULL, 'Anita Kiss', 'UVZ-879');

INSERT INTO stops VALUES
    (NULL, 'Budapest'), -- 1
    (NULL, 'Debrecen'), -- 2
    (NULL, 'Szeged'), -- 3
    (NULL, 'Miskolc'), -- 4
    (NULL, 'Pécs'), -- 5
    (NULL, 'Győr'), -- 6
    (NULL, 'Nyíregyháza'), -- 7
    (NULL, 'Székesfehérvár'), -- 8
    (NULL, 'Kecskemét'), -- 9
    (NULL, 'Szombathely'); -- 10

INSERT INTO routes VALUES 
    (NULL, 100, '6:00', '17:30', 30), -- 1: Debrecen ->  Nyíregyháza -> Miskolc
    (NULL, 100, '6:00', '17:30', 30), -- 2: Miskolc -> Nyíregyháza -> Debrecen 

    (NULL, 101, '8:00', '17:30', 60), -- 3: Győr -> Szombathely 
    (NULL, 101, '8:00', '17:30', 60), -- 4: Szombathely -> Győr 

    (NULL, 102, '8:00', '17:30', 60), -- 5: Szeged -> Pécs
    (NULL, 102, '8:00', '17:30', 60), -- 6: Pécs -> Szeged 

    (NULL, 103, '7:00', '19:30', 120), -- 7: Budapest -> Kecskemét -> Szeged 
    (NULL, 103, '7:00', '19:30', 120), -- 8: Szeged -> Kecskemét -> Budapest

    (NULL, 104, '12:00', '16:30', 60), -- 9: Budapest -> Székesfehérvár
    (NULL, 104, '12:00', '16:30', 60); -- 10: Székesfehérvár -> Budapest 

INSERT INTO routegroups VALUES 
    (NULL, 1, 2, 30),
    (NULL, 1, 7, 45), 
    (NULL, 1, 4, NULL), 

    (NULL, 2, 4, 45),
    (NULL, 2, 7, 30),
    (NULL, 2, 2, NULL),

    (NULL, 3, 6, 90),
    (NULL, 3, 10, NULL),

    (NULL, 4, 10, 90),
    (NULL, 4, 6, NULL),

    (NULL, 5, 3, 120),
    (NULL, 5, 5, NULL),

    (NULL, 6, 5, 120),
    (NULL, 6, 3, NULL),

    (NULL, 7, 1, 45),
    (NULL, 7, 9, 60),
    (NULL, 7, 3, NULL),

    (NULL, 8, 3, 60),
    (NULL, 8, 9, 45),
    (NULL, 8, 1, NULL),

    (NULL, 9, 1, 30),
    (NULL, 9, 8, NULL),

    (NULL, 10, 8, 30),
    (NULL, 10, 1, NULL);

INSERT INTO assingments VALUES 
    (NULL, 1, 1),
    (NULL, 2, 2),
    (NULL, 3, 3),
    (NULL, 4, 4),
    (NULL, 5, 5),
    (NULL, 6, 6),
    (NULL, 7, 7),
    (NULL, 8, 8),
    (NULL, 9, 9),
    (NULL, 10, 10);
