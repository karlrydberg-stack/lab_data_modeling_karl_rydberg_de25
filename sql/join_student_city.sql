SELECT
 s.first_name,
 o.operation_name
FROM student s
INNER JOIN class c ON s.class_id = c.class_id
INNER JOIN course co ON c.class_id = co.class_id
INNER JOIN operation o ON co.operation_id = o.operation_id;