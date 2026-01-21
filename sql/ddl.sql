CREATE TABLE educator (
    educator_id SERIAL PRIMARY KEY
);

CREATE TABLE city (
    city_id SERIAL PRIMARY KEY,
    city_name VARCHAR(50) NOT NULL
);

CREATE TABLE operation (
    operation_id SERIAL PRIMARY KEY,
    city_id INTEGER,
    CONSTRAINT fk_operation_city
        FOREIGN KEY (city_id)
        REFERENCES City(city_id),
    operation_name VARCHAR(50) NOT NULL
);

CREATE TABLE program (
    program_id SERIAL PRIMARY KEY,
    program_name VARCHAR(50) NOT NULL
);

CREATE TABLE curriculum (
    curriculum_id SERIAL PRIMARY KEY,
    program_id INTEGER,
    CONSTRAINT fk_curriculum_program
        FOREIGN KEY (program_id)
        REFERENCES program(program_id)
);

CREATE TABLE classmanager (
    class_manager_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE course (
    course_id SERIAL PRIMARY KEY,
    curriculum_id INTEGER,
    CONSTRAINT fk_course_curriculum
        FOREIGN KEY (curriculum_id)
        REFERENCES curriculum(curriculum_id),
    educator_id INTEGER,
    CONSTRAINT fk_course_educator
        FOREIGN KEY (educator_id)
        REFERENCES educator(educator_id),
    course_name VARCHAR(50) NOT NULL,
    course_code VARCHAR(50) NOT NULL,
    course_points INTEGER NOT NULL,
    course_desc VARCHAR(100)
);

CREATE TABLE courseoffer (
    course_offer_id SERIAL PRIMARY KEY,
    operation_id INTEGER,
    CONSTRAINT fk_courseoffer_operation
        FOREIGN KEY (operation_id)
        REFERENCES operation(operation_id),
    course_id INTEGER,
    CONSTRAINT fk_courseoffer_course
        FOREIGN KEY (course_id)
        REFERENCES course(course_id)
);

CREATE TABLE class (
    class_id SERIAL PRIMARY KEY,
    class_manager_id INTEGER,
    CONSTRAINT fk_class_classmanager
        FOREIGN KEY (class_manager_id)
        REFERENCES classmanager(class_manager_id),
    class_name VARCHAR(50) NOT NULL
);

CREATE TABLE courseclass (
    course_class_id SERIAL PRIMARY KEY,
    course_id INTEGER,
    CONSTRAINT fk_courseclass_course
        FOREIGN KEY (course_id)
        REFERENCES course(course_id),
    class_id INTEGER,
    CONSTRAINT fk_courseclass_class
        FOREIGN KEY (class_id)
        REFERENCES class(class_id)
);




CREATE TABLE student (
    student_id SERIAL PRIMARY KEY,
    class_id INTEGER,
    CONSTRAINT fk_student_class
        FOREIGN KEY (class_id)
        REFERENCES class(class_id),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE employee (
    employee_id SERIAL PRIMARY KEY,
    educator_id INTEGER,
    CONSTRAINT fk_employee_educator
        FOREIGN KEY (educator_id)
        REFERENCES educator(educator_id),
    operation_name VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    salary INTEGER NOT NULL
);

CREATE TABLE consultingfirm (
    consulting_firm_id SERIAL PRIMARY KEY,
    company_name VARCHAR(50) NOT NULL,
    org_number INTEGER NOT NULL,
    taxability BOOLEAN NOT NULL,
    address VARCHAR(50) NOT NULL
);

CREATE TABLE consultant (
    consultant_id SERIAL PRIMARY KEY,
    educator_id INTEGER,
    CONSTRAINT fk_consultant_educator
        FOREIGN KEY (educator_id)
        REFERENCES educator(educator_id),
    consulting_firm_id INTEGER,
    CONSTRAINT fk_consultant_consulting_firm
        FOREIGN KEY (consulting_firm_id)
        REFERENCES consultingfirm(consulting_firm_id),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    salary INTEGER NOT NULL
);



CREATE TABLE classified (
    classified_id SERIAL PRIMARY KEY,
    employee_id INTEGER,
    CONSTRAINT fk_classified_employee
        FOREIGN KEY (employee_id)
        REFERENCES employee(employee_id),
    consultant_id INTEGER,
    CONSTRAINT fk_classified_consultant
        FOREIGN KEY (consultant_id)
        REFERENCES consultant(consultant_id),
    student_id INTEGER,
    CONSTRAINT fk_classified_student
        FOREIGN KEY (student_id)
        REFERENCES student(student_id),
    class_manager_id INTEGER,
    CONSTRAINT fk_classified_classmanager
        FOREIGN KEY (class_manager_id)
        REFERENCES classmanager(class_manager_id),
    social_security_number INTEGER
);