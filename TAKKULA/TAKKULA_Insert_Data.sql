-- TAKKULA_Insert_Data.sql 
-- 
-- Inserts test data into the Takkula 2.0 database.
--
-- IMPORTANT: Do NOT modify this test data!
--
-- Version 2.1 Kari Silpiö 2.2.2016

-- First, delete all existing test data
DELETE FROM MisconductIncident;
DELETE FROM SanctionType;
DELETE FROM MisconductType; 
DELETE FROM CourseGrade; 
DELETE FROM CourseInstance;
DELETE FROM Prerequisite;
DELETE FROM CourseInstance;
DELETE FROM AcademicAdvisor;
DELETE FROM Teacher;
DELETE FROM Student;
DELETE FROM Campus;


-- CAMPUS
INSERT INTO campus (campus_code, campus_name, street, postcode, city) VALUES 
('c111', 'Pasila',    'Rautatienkatu 13',   '00520', 'Helsinki'),
('c222', 'Malmi',     'Hietakummuntie 1 A', '00700', 'Helsinki'),
('c333', 'Vierumäki', 'Kaskelantie 10',     '19120', 'Vierumäki'),
('c444', 'Porvoo',    'Taidetehtaankatu 1', '06100', 'Porvoo');
    
-- STUDENT
INSERT INTO student (student_number, first_name, surname, birth_date, street, postcode, city, gender, email) VALUES 
('o148', 'Sanna',  'Rentukka', '1985-10-22', 'Puronvarsi 662 F',    '00630', 'Helsinki',  'F', 'sanna@gmail.com'),
('o210', 'Kaarlo', 'Kuikka',   '1980-08-31', 'Huilupolku 58 C 2',   '00560', 'Helsinki',  'M', 'o210@takkula.fi'),
('o298', 'Raimo',  'Veto',     '1977-12-01', 'Ketjukuja 196 A 81',  '00680', 'Helsinki',  'M', 'o298@takkula.fi'),
('o348', 'Kaarina','Käki',     '1985-04-03', 'Äimäkuja 79',         '01260', 'Vantaa',    'F', 'o348@takkula.fi'),
('o349', 'Matti',  'Keto',     '1986-05-17', 'Övre-Gumminkuja 115', '01590', 'Maisala',   'M', 'o349@takkula.fi'),
('o354', 'Usko',   'Huhta',    '1981-05-22', 'Toivola 100',         '01800', 'Klaukkala', 'M', '0354@takkula.fi'),
('o410', 'Leila',  'Liimatta', '1969-03-03', 'Nysätie 44 G',        '02880', 'Veikkola',  'F', '0410@takkula.fi'),
('o473', 'Fredrik','Leino',    '1986-11-22', 'Haukas 20 A 20',      '02400', 'Kyrkslätt', 'M', NULL),
('o548', 'Valma',  'Vuori',    '1984-10-10', 'Jäspilänkatu 22',     '04200', 'Kerava',    'F', 'valma@gmail.com'),
('o558', 'Greta',  'Hullerus', '1977-03-28', 'Havs-hanikka 800 A',  '02320', 'Esbo',      'F', '0558@takkula.fi'),
('o649', 'Martti', 'Keto',     '1977-03-28', 'Siamintie 66 B 1',    '00560', 'Helsinki',  'M', 'martti@jeps.fi'),
('o654', 'Rosina', 'Laine',    '1978-05-07', 'Liplatus 55 D',       '02320', 'Espoo',     'F', 'o654@takkula.fi'),
('o889', 'Kuikka', 'Kaarlo',   '1967-02-27', 'Kuusikuja 6',         '03210', 'Klaukkala', 'M', NULL);

-- TEACHER
INSERT INTO teacher (teacher_number, first_name, surname, birth_date, gender, phone, salary, campus_code) VALUES
('h303', 'Veli',  'Ponteva',  '1975-07-25', 'M', '09-123456',  9720.00, 'c111'),
('h290', 'Sisko', 'Saari',    '1950-11-01', 'F', '09-776655', 15725.00, 'c222'),
('h430', 'Emma',  'Virta',    '1948-04-18', 'F', '015-33002', 18100.00, 'c111'),
('h180', 'Seppo', 'Kokki',    '1960-02-03', 'M', '09-808800', 15780.00, 'c111'),
('h560', 'Olka',  'Tahko',    '1970-05-30', 'F', '09-666977', 15899.00, NULL),
('h784', 'Veera', 'Vainio',   '1977-04-12', 'F', '09-203749', 16049.00, 'c333'),
('h999', 'Marja', 'Kiisseli', '1985-07-12', 'F', '09-222333', 25000.00, NULL), 
('h714', 'Olka',  'Tahko',    '1985-07-12', 'F', '09-222333', 11500.00, NULL), 
-- and the additional insert...
('h777', 'Mauri', 'Matikka',  '1965-02-25', 'M', '09-333444',  2550.75, 'c222');  

-- ACADEMIC ADVISOR
INSERT INTO AcademicAdvisor (teacher_number, campus_code, start_date, end_date) VALUES 
('h180', 'c111', '2011-01-01', '2011-12-15'),
('h303', 'c111', '2012-01-01', NULL),
('h303', 'c111', '2010-01-15', '2011-06-30'),
('h430', 'c111', '2011-01-16', NULL),
('h290', 'c222', '2012-01-01', NULL),
('h999', 'c222', '2012-01-01', NULL);

-- COURSE
INSERT INTO Course (course_code, course_name, credits, person_in_charge) VALUES
('a450', 'Cloud Computing',      3, 'h430'),
('a730', 'E-business',           4, 'h290'),
('a290', 'Java Basics',          2, 'h430'),
('a480', 'Data Management',      3, 'h784'),
('a500', 'Database Developer',   3, 'h303'),
('a510', 'Database Design',      3, 'h303'),
-- and the additional insert...
('a800', 'Finnish 1',            6, 'h777');

-- COURSE INSTANCE
INSERT INTO CourseInstance (course_code, instance_number, start_date, end_date, teacher_number, participants) VALUES 
('a730', 2, '2007-08-20', '2007-10-05', 'h303', 15),
('a730', 1, '2007-03-15', '2007-05-30', 'h290', 16),
('a730', 3, '2007-10-01', '2007-11-20', 'h303', 22),
('a730', 4, '2014-01-15', NULL,         NULL,   NULL),
('a290', 2, '2008-02-02', NULL,         NULL,   NULL),
('a290', 1, '2007-08-01', '2007-09-15', 'h430', 14),
('a480', 1, '2007-02-10', '2007-04-22', 'h180', 16),
('a480', 2, '2008-01-15', '2008-02-23', 'h784', 25),
('a450', 4, '2009-08-21', '2009-12-14', 'h303', 18),
('a450', 1, '2007-01-03', '2007-02-25', 'h303', 16),
('a450', 2, '2007-12-01', '2008-02-10', 'h560', 12),
('a450', 3, '2008-01-01', NULL,         'h303', 17);

-- PREREQUISITE
INSERT INTO prerequisite (course_code, prerequisite_code) VALUES 
('a510', 'a730'),
('a510', 'a500'),
('a500', 'a480');

-- COURSE GRADE
INSERT INTO CourseGrade (student_number, course_code, instance_number, grade_date, grade, examiner) VALUES 
('o148', 'a730', 1, '2007-06-01', 4, 'h290'),
('o210', 'a450', 2, '2008-02-15', 3, 'h303'),
('o210', 'a730', 1, '2007-06-05', 1, 'h290'),
('o298', 'a290', 1, '2007-09-20', 3, 'h430'),
('o298', 'a480', 2, '2008-02-20', 3, 'h784'),
('o348', 'a730', 1, '2007-06-07', 5, 'h290'),
('o349', 'a290', 1, '2007-09-28', 4, 'h430'),
('o354', 'a480', 1, '2007-05-22', 2, 'h784'),
('o410', 'a290', 1, '2007-10-15', 2, 'h180'),
('o410', 'a730', 1, '2007-06-01', 3, 'h290'),
('o473', 'a450', 1, '2007-03-14', 2, 'h303'),
('o473', 'a730', 1, '2007-06-10', 3, 'h290'),
('o473', 'a480', 2, '2008-02-20', 0, 'h784'),
('o473', 'a290', 1,  NULL,        NULL, NULL),
('o548', 'a290', 1, '2007-09-20', 2, 'h430'),
('o548', 'a450', 2,  NULL,        NULL, NULL),
('o649', 'a730', 1, '2007-06-02', 4, 'h290'),
('o649', 'a480', 1, '2007-05-03', 4, 'h180'),
('o654', 'a450', 1, '2007-03-18', 5, 'h303');

-- MISCONDUCT TYPE
INSERT INTO MisconductType (misconduct_code, description) VALUES 
('m001', 'Dual submission (submitting own work, which already has been graded for an earlier course, for a second course)'),
('m002', 'Falsifying a list of attendees'),
('m003', 'Copying of coursework from another student'),
('m004', 'Assisting another student to cheat (e.g., by allowing own coursework to be copied)'),
('m005', 'Freeloading in a group work assignment'),
('m006', 'Giving false information to University staff to gain an academic advantage'),
('m007', 'Cheating in an exam'),
('m008', 'Collusion (unauthorized collaboration)'),
('m009', 'Fabrication (making things up in research-oriented coursework)'),
('m010', 'Falsification (modifying data in research-oriented coursework)'),
('m011', 'Submitting a paper or assignment that is retrieved from the Internet or a paper-mill'),
('m012', 'Lack of citation or improper citation'), 
('m013', 'Use of intoxicants or being under the influence of intoxicants'),
('m014', 'Disturbing teaching or fellow students'),
('m015', 'Refusal to take a drug test');
    
-- SANCTION TYPE
INSERT INTO SanctionType (sanction_code, description, decision_maker) VALUES 
('s001', 'Oral warning',    'Head of faculty'),
('s002', 'Written warning', 'President of the University'),
('s003', 'Expulsion',       'Board of the University');
    
-- MISCONDUCT INCIDENT
INSERT INTO MisconductIncident 
(student_number, misconduct_code, course_code, instance_number, sanction_code, decision_date) VALUES
('o473', 'm001', 'a480', 2, 's001', '2012-06-18'),
('o548', 'm005', 'a450', 2, 's002', '2009-11-15');

-- End --


