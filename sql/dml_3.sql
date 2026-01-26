INSERT INTO consultingfirm (consulting_firm_id, company_name, org_number, taxability, address)
VALUES
(1, 'Bolaget AB', 123, TRUE, 'Liljeholmen');

INSERT INTO consultant (consultant_id, consulting_firm_id, first_name, last_name, email, salary)
VALUES
(1, 1, 'Arne', 'Dahl', 'arne@gmail.com', 100),
(2, 1, 'Lukas', 'Eriksson', 'lukas@gmail.com', 200);

INSERt INTO employee (employee_id, first_name, last_name, email, salary)
VALUES
(1, 'Lars', 'Henriksson', 'lasse@gmail.com', 1000);

INSERT INTO educator (educator_id, employee_id, consultant_id)
VALUES
(1, NULL, 1),
(2, NULL, 2),
(3, 1, NULL);

INSERT INTO city (city_id, city_name)
VALUES
(1, 'Stockholm'),
(2, 'Göteborg'),
(3, 'Luleå');

INSERT INTO operation (operation_id, city_id, operation_name)
VALUES
(1, 1, 'Stockholmsskolan'),
(2, 2, 'Göteborgsskolan');

INSERT INTO program (program_id, program_name)
VALUES
(1, 'Data Engineer'),
(2, 'AI Engineer');

INSERT INTO classmanager (class_manager_id, first_name, last_name, email)
VALUES
(1, 'Anders', 'Andersson', 'anders@stockholmsskolan.se'),
(2, 'Bosse', 'Björnsson', 'björnen@gs.se');

INSERT INTO class (class_id, class_manager_id, class_name)
VALUES
(1, 1, 'DE23'),
(2, 1, 'DE24'),
(3, 1, 'DE25'),
(4, 2, 'Matematik(Fristående)');

INSERT INTO student (student_id, class_id, first_name, last_name, email)
VALUES
(1, 1, 'Per', 'Rask', 'per@gmail.com'),
(2, 1, 'Conny', 'Bloom', 'conny@gmail.com'),
(3, 2, 'Ulrik', 'Hansson', 'ulrik@gmail.com'),
(4, 2, 'Rickard', 'Frisk', 'rickard@gmail.com'),
(5, 3, 'Torsten', 'Björnsson', 'torsten@gmail.com'),
(6, 4, 'Sara', 'Andersson', 'sara@gmail.com');

INSERT INTO course (course_id, program_id, educator_id, class_id, operation_id, course_name, course_code, course_points, course_desc)
VALUES
(1, 1, 1, 1, 1, 'Python', 'Py', 100, 'Programmera i Python'),
(2, 1, 1, 2, 1, 'Python', 'Py', 100, 'Programmera i Python'),
(3, 1, 2, 3, 1, 'Python', 'Py', 100, 'Programmera i Python'),
(4, 1, 2, 1, 1, 'Datamodellering', 'DAT', 100, 'Modellera mera'),
(5, NULL, 3, 4, 2, 'Tillämpad Matematik', 'MAT', 100, 'Tillämpa matematik');

INSERT INTO classified (classified_id, employee_id, consultant_id, student_id, class_manager_id, social_security_number)
VALUES
(1, NULL, 1, NULL, NULL, 123),
(2, NULL, 2, NULL, NULL, 321),
(3, NULL, NULL, 1, NULL, 222),
(4, NULL, NULL, NULL, 1, 543),
(5, 1, NULL, NULL, NULL, 999);