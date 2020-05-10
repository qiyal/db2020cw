-- TASK 2 | A
CREATE TABLE Organization (
    organizationID SERIAL NOT NULL,
    regionName VARCHAR(30) NOT NULL,
    CONSTRAINT pk_organisation PRIMARY KEY (organizationID)
);

CREATE TABLE Registration (
    regNumber VARCHAR(10) NOT NULL,
    regDate Date,
    CONSTRAINT pk_registration PRIMARY KEY (regNumber)
);


CREATE TABLE Volunteer (
    volunteerID SERIAL NOT NULL,
    name VARCHAR(50) NOT NULL,
    dateOfBirth Date NOT NULL,
    experience INT DEFAULT 0,
    organizationID INT NULL, CONSTRAINT pk_volunteer PRIMARY KEY (volunteerID),
    CONSTRAINT fk_organisation FOREIGN KEY (organizationID) REFERENCES Organization (organizationID)
);

CREATE TABLE Counselor (
    counselorID SERIAL NOT NULL,
    name VARCHAR(50) NOT NULL,
    dateOfBirth Date NOT NULL,
    experience INT DEFAULT 0,
    organizationID INT NULL,
    CONSTRAINT pk_counselor PRIMARY KEY (counselorID),
    CONSTRAINT fk_organization FOREIGN KEY (organizationID) REFERENCES Organization (organizationID)
);

CREATE TABLE Disabled (
    disabledID SERIAL NOT NULL,
    dName VARCHAR(50) NOT NULL,
    dateOfBirth Date NOT NULL ,
    gender VARCHAR(10) NOT NULL ,
    address VARCHAR(40), phone VARCHAR(20),
    regNumber VARCHAR(10) NULL,
    organizationID INT NULL,
    counselorID INT NULL,
    CONSTRAINT pk_disable PRIMARY KEY (DisabledID),
    CONSTRAINT fk_registration FOREIGN KEY (regNumber) REFERENCES Registration (regNumber),
    CONSTRAINT fk_organization FOREIGN KEY (organizationID) REFERENCES Organization (organizationID),
    CONSTRAINT fk_counselor FOREIGN KEY (counselorID) REFERENCES Counselor (counselorID)
);

CREATE TABLE DisabledAndVolunteer (
    disabledID INT NOT NULL,
    volunteerID INT NOT NULL,
    CONSTRAINT pk_disabledAndVolunteer PRIMARY KEY (disabledID, volunteerID),
    CONSTRAINT fk1_disabled FOREIGN KEY (disabledID) REFERENCES Disabled (disabledID),
    CONSTRAINT fk2_volunteer FOREIGN KEY (volunteerID) REFERENCES Volunteer (volunteerID)
);

-- TASK 2 | B 
INSERT INTO Organization VALUES (1, 'Auezov');
INSERT INTO Organization VALUES (2, 'Bostandik');
INSERT INTO Organization VALUES (3, 'Medeu');
INSERT INTO Organization VALUES (4, 'Turksib');
INSERT INTO Organization VALUES (5, 'Almali');

INSERT INTO Counselor VALUES (1, 'Arman', '1995-01-01', 2, 1);
INSERT INTO Counselor VALUES (2, 'Dulat', '1993-02-02', 3, 2);
INSERT INTO Counselor VALUES (3, 'Assel', '1996-03-03', 2, 3);
INSERT INTO Counselor VALUES (4, 'Dana', '1990-04-04', 2, 5);
INSERT INTO Counselor VALUES (5, 'Aidana', '1990-05-05', 5, 4);
INSERT INTO Counselor VALUES (6, 'Abay', '1998-06-06', 1, 1);

INSERT INTO Volunteer VALUES (1, 'Yerbolat', '2000-01-26', 3, 3);
INSERT INTO Volunteer VALUES (2, 'Ayaulym', '2001-08-02', 2, 3);
INSERT INTO Volunteer VALUES (3, 'Munira', '2000-06-13', 3, 3);
INSERT INTO Volunteer VALUES (4, 'Shyngys', '2000-04-08', 2, 1);
INSERT INTO Volunteer VALUES (5, 'Dulat', '2000-02-19', 2, 1);
INSERT INTO Volunteer VALUES (6, 'Nurbolat', '1999-06-06', 4, 2);
INSERT INTO Volunteer VALUES (7, 'Araylym', '2001-07-04', 1, 3);
INSERT INTO Volunteer VALUES (8, 'Bagdat', '2000-08-06', 1, 4);
INSERT INTO Volunteer VALUES (9, 'Alia', '1999-07-14', 3, 4);
INSERT INTO Volunteer VALUES (10, 'Kamila', '2001-10-11', 1, 5);
INSERT INTO Volunteer VALUES (11, 'Saule', '2000-07-17', 3, 5);
INSERT INTO Volunteer VALUES (12, 'Magzhan', '1999-11-11', 3, 2);
INSERT INTO Volunteer VALUES (13, 'Nazerke', '2000-01-24', 2, 2);




-- TASK 2 | C 
INSERT INTO Registration VALUES ('R100', '1990-04-24'); 
INSERT INTO Registration VALUES ('R101', '1995-05-26');
INSERT INTO Registration VALUES ('R102', '1997-01-28'); 
INSERT INTO Registration VALUES ('R103', '2000-01-14'); 
INSERT INTO Registration VALUES ('R104', '2005-07-18');
INSERT INTO Registration VALUES ('R105', '2008-12-18');
INSERT INTO Registration VALUES ('R106', '2015-03-28');
INSERT INTO Registration VALUES ('R107', '2016-09-28');
INSERT INTO Registration VALUES ('R108', '2020-05-11');

INSERT INTO Disabled VALUES (1, 'Oskar', '1981-04-05', 'Male', 'Raimbek St., bld. 210', '87071234556', 'R100', 1, 1); 
INSERT INTO Disabled VALUES (2, 'Nisha', '1985-02-26', 'Female', 'Al-Farabi St., bld. 131, apt. 48', '87771234512', 'R101', 2, 2); 
INSERT INTO Disabled VALUES (3, 'Artur', '1986-03-18', 'Male', 'Nikolskaya St., bld. 37', '87014483735', 'R102', 3, 3); 
INSERT INTO Disabled VALUES (4, 'Herman', '1997-08-28', 'Male', 'Shevchenko St., bld. 164/B', '87072398278', 'R103', 4, 5);
INSERT INTO Disabled VALUES (5, 'Tomi', '2002-02-04', 'Male', 'Rozybakieva St., bld. 777', '87089422565', 'R104', 2, 2); 
INSERT INTO Disabled VALUES (6, 'Kim', '1990-08-02', 'Male', 'Muratbaeva St., bld. 48, apt. 31', '87077965225', 'R102', 1, 1); 
INSERT INTO Disabled VALUES (7, 'Alysia', '1996-08-20', 'Female', '13 Military Townc St., bld. 6, apt. 11', '87027451890', 'R103', 3, 3);
INSERT INTO Disabled VALUES (8, 'Una', '1996-12-05', 'Female', 'Ryskulova St., bld. 58, apt. 20', '87053906815', 'R103', 5, 4); 
INSERT INTO Disabled VALUES (9, 'Aden', '2005-04-14', 'Male', 'Shevchenko St., bld. 164/B', '87059377441', 'R105', 3, 3); 
INSERT INTO Disabled VALUES (10, 'Olaf', '2005-10-25', 'Male', 'Mkr.koktem-2, bld. 11/А', '87082396973', 'R105', 4, 5); 
INSERT INTO Disabled VALUES (11, 'Sam', '2012-05-21', 'Female', '2A Mkrn, bld. 4, apt. 6', '87772378808', 'R106', 1, 6); 
INSERT INTO Disabled VALUES (12, 'Pascal', '2010-01-11', 'Male', 'Nauryzbay Batyr St., bld. 82', '87016645349', 'R106', 2, 2); 
INSERT INTO Disabled VALUES (13, 'Clay', '2010-12-10', 'Male', 'Furmanova St., bld. 240/G', '87012512653', 'R106', 5, 4); 
INSERT INTO Disabled VALUES (14, 'Roberto', '2013-01-17', 'Male', 'Mkr.6, bld. 50, apt. 8', '87752230654', 'R107', 3, 3);
INSERT INTO Disabled VALUES (15, 'Nicky', '2014-12-22', 'Female', ' Mkr.aksay-1, bld. 12, apt. 27', '87052240664', 'R107', 4, 5);
INSERT INTO Disabled VALUES (16, 'Katarina', '2015-06-15', 'Female', 'Dzhandosova St., bld. 55', '87022623568', 'R107', 1, 6);
INSERT INTO Disabled VALUES (17, 'Anabel', '2014-12-15', 'Female', 'Mkr.tastak-2, bld. 9, apt. 45', '87012263567', 'R108', 2, 2);
INSERT INTO Disabled VALUES (18, 'Nicole', '2015-04-21', 'Female', 'Pr.dostyk, bld. 93, apt. 1', '87052272718', 'R108', 5, 4);
INSERT INTO Disabled VALUES (19, 'Samad', '2016-11-22', 'Male', ' Pr.dostyk, bld. 107/2, apt. 4', '87022772486', 'R108', 5, 4);
INSERT INTO Disabled VALUES (20, 'Robert', '2010-09-15', 'Male', 'Mkr.shanyrak 2, bld. 852', '87012509250', 'R108', 4, 5);

INSERT INTO DisabledAndVolunteer VALUES (1, 4);
INSERT INTO DisabledAndVolunteer VALUES (6, 5);
INSERT INTO DisabledAndVolunteer VALUES (11, 4);
INSERT INTO DisabledAndVolunteer VALUES (16, 5);

INSERT INTO DisabledAndVolunteer VALUES (2, 6);
INSERT INTO DisabledAndVolunteer VALUES (5, 12);
INSERT INTO DisabledAndVolunteer VALUES (12, 13);
INSERT INTO DisabledAndVolunteer VALUES (17, 13);

INSERT INTO DisabledAndVolunteer VALUES (3, 1);
INSERT INTO DisabledAndVolunteer VALUES (7, 2);
INSERT INTO DisabledAndVolunteer VALUES (9, 3);
INSERT INTO DisabledAndVolunteer VALUES (14, 7);

INSERT INTO DisabledAndVolunteer VALUES (4, 8);
INSERT INTO DisabledAndVolunteer VALUES (10, 8);
INSERT INTO DisabledAndVolunteer VALUES (15, 9);
INSERT INTO DisabledAndVolunteer VALUES (20, 9);

INSERT INTO DisabledAndVolunteer VALUES (8, 10);
INSERT INTO DisabledAndVolunteer VALUES (13, 11);
INSERT INTO DisabledAndVolunteer VALUES (18, 11);
INSERT INTO DisabledAndVolunteer VALUES (19, 10);




-- TASK 2 | D 
SELECT d.dName, d.disabledID, d.address FROM Disabled as d
    WHERE d.organizationID = (SELECT o.organizationID FROM Organization as o
                                WHERE o.regionName = 'Turksib');



-- TASK 2 | Е 
SELECT Children.* FROM Disabled as Children
    WHERE Children.dateOfBirth >= '2010-01-01';




--TASK 2 | F 
SELECT v.name, count(v.volunteerID) as DisableCount FROM Volunteer as v
    INNER JOIN DisabledAndVolunteer as dav on v.volunteerID = dav.volunteerID
    GROUP BY v.volunteerID
    HAVING count(v.volunteerID) > 1;




-- TASK 2 | G
SELECT c.name, c.experience, v.name, v.experience, o.regionName FROM Counselor as c
    INNER JOIN Volunteer v on c.organizationID = v.organizationid
    INNER JOIN Organization o on c.organizationID = o.organizationID
    WHERE c.experience > v.experience;




-- TASK 2 | H 
ALTER TABLE Volunteer
    ADD salary INT DEFAULT 5000 NULL;

ALTER TABLE Counselor
    ADD salary INT DEFAULT 45000 NULL;

UPDATE Counselor
    SET salary = salary * POW(1.02, experience);




-- TASK 2 | I 
SELECT SUM(c.experience) SumOfCounselors, SUM(v.experience) SumOFVolunteers, o.regionName FROM Counselor c
    JOIN Volunteer v on c.organizationID = v.organizationID
    JOIN Organization o on o.organizationID = c.organizationID
    GROUP BY o.organizationID;




-- TASK 2 | J 
SELECT * FROM Counselor as c
    WHERE c.salary < (SELECT avg(salary) FROM Counselor);




-- TASK 2 | K 
SELECT c.name FROM Counselor as c
    INNER JOIN Volunteer as v on c.organizationID = v.organizationID
    GROUP BY c.name
    HAVING count(c.name) >= ALL (SELECT count(c.name) FROM Counselor as c
        INNER JOIN Volunteer as v on c.organizationID = v.organizationID
        GROUP BY c.name);

