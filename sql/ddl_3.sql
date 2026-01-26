CREATE TABLE consultingfirm (
    consulting_firm_id SERIAL PRIMARY KEY,
    company_name VARCHAR(50) UNIQUE NOT NULL,
    org_number INTEGER UNIQUE NOT NULL,
    taxability BOOLEAN NOT NULL,
    address VARCHAR(50) NOT NULL
);

CREATE TABLE consultant (
    consultant_id SERIAL PRIMARY KEY,
    consulting_firm_id INTEGER NOT NULL,
    CONSTRAINT fk_consultant_consulting_firm
        FOREIGN KEY (consulting_firm_id)
        REFERENCES consultingfirm(consulting_firm_id),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    salary INTEGER NOT NULL
);

CREATE TABLE employee (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    salary INTEGER NOT NULL
);

CREATE TABLE educator (
    educator_id SERIAL PRIMARY KEY,
    employee_id INTEGER UNIQUE,
    CONSTRAINT fk_educator_employee
        FOREIGN KEY (employee_id)
        REFERENCES employee(employee_id),
    consultant_id INTEGER UNIQUE,
    CONSTRAINT fk_educator_consultant
        FOREIGN KEY (consultant_id)
        REFERENCES consultant(consultant_id),
    CHECK (
        (employee_id IS NOT NULL AND consultant_id IS NULL)
        OR
        (employee_id IS NULL AND consultant_id IS NOT NULL)
    )
);

CREATE TABLE classmanager (
    class_manager_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE class (
    class_id SERIAL PRIMARY KEY,
    class_manager_id INTEGER NOT NULL,
    CONSTRAINT fk_class_classmanager
        FOREIGN KEY (class_manager_id)
        REFERENCES classmanager(class_manager_id),
    class_name VARCHAR(50) NOT NULL
);

CREATE TABLE student (
    student_id SERIAL PRIMARY KEY,
    class_id INTEGER NOT NULL,
    CONSTRAINT fk_student_class
        FOREIGN KEY (class_id)
        REFERENCES class(class_id),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL
);


CREATE TABLE program (
    program_id SERIAL PRIMARY KEY,
    program_name VARCHAR(50) NOT NULL
);

CREATE TABLE city (
    city_id SERIAL PRIMARY KEY,
    city_name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE operation (
    operation_id SERIAL PRIMARY KEY,
    city_id INTEGER NOT NULL,
    CONSTRAINT fk_operation_city
        FOREIGN KEY (city_id)
        REFERENCES city(city_id),
    operation_name VARCHAR(50) UNIQUE NOT NULL
);


CREATE TABLE course (
    course_id SERIAL PRIMARY KEY,
    class_id INTEGER NOT NULL,
    CONSTRAINT fk_course_class
        FOREIGN KEY (class_id)
        REFERENCES class(class_id),
    educator_id INTEGER NOT NULL,
        CONSTRAINT fk_course_educator
        FOREIGN KEY (educator_id)
        REFERENCES educator(educator_id),
    operation_id INTEGER NOT NULL,
        CONSTRAINT fk_course_operation
        FOREIGN KEY (operation_id)
        REFERENCES operation(operation_id),
    program_id INTEGER,
        CONSTRAINT fk_course_program
        FOREIGN KEY (program_id)
        REFERENCES program(program_id),
    course_name VARCHAR(50) NOT NULL,
    course_code VARCHAR(50) NOT NULL,
    course_points INTEGER NOT NULL,
    course_desc VARCHAR(100) NOT NULL
);

CREATE TABLE classified (
    classified_id SERIAL PRIMARY KEY,
    employee_id INTEGER UNIQUE,
    CONSTRAINT fk_classified_employee
        FOREIGN KEY (employee_id)
        REFERENCES employee(employee_id),
    consultant_id INTEGER UNIQUE,
    CONSTRAINT fk_classified_consultant
        FOREIGN KEY (consultant_id)
        REFERENCES consultant(consultant_id),
    student_id INTEGER UNIQUE,
    CONSTRAINT fk_classified_student
        FOREIGN KEY (student_id)
        REFERENCES student(student_id),
    class_manager_id INTEGER UNIQUE,
    CONSTRAINT fk_classified_classmanager
        FOREIGN KEY (class_manager_id)
        REFERENCES classmanager(class_manager_id),
    CHECK (
        (employee_id IS NOT NULL AND consultant_id IS NULL AND student_id IS NULL AND class_manager_id IS NULL)
        OR
        (consultant_id IS NOT NULL AND employee_id IS NULL AND student_id IS NULL AND class_manager_id IS NULL)
        OR
        (consultant_id IS NULL AND employee_id IS NULL AND student_id IS NOT NULL AND class_manager_id IS NULL)
        OR
        (consultant_id IS NULL AND employee_id IS NULL AND student_id IS NULL AND class_manager_id IS NOT NULL)
    ),
    social_security_number INTEGER UNIQUE NOT NULL
);