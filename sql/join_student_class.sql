SELECT
 s.first_name,
 c.class_name
FROM student s
INNER JOIN class c ON s.class_id = c.class_id;