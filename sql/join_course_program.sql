SELECT
s.first_name,
co.course_name
FROM student s
LEFT JOIN class c on s.class_id = c.class_id
LEFT JOIN courseclass cc ON c.class_id = cc.class_id
LEFT JOIN course co on cc.course_class_id = co.course_class_id;