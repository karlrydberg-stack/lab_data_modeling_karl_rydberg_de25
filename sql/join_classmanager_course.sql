SELECT
cm.first_name,
co.course_name
FROM classmanager cm
INNER JOIN class c ON cm.class_manager_id = c.class_manager_id
INNER JOIN course co ON c.class_id = co.class_id;