SELECT
 s.first_name,
 co.course_name
FROM student s
INNER JOIN class c ON s.class_id = c.class_id
LEFT JOIN course co ON c.class_id = co.class_id;