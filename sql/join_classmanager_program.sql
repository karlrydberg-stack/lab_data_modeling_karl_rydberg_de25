SELECT
cm.first_name,
cm.last_name,
c.class_name,
p.program_name
FROM classmanager cm
INNER JOIN class c ON c.class_manager_id = cm.class_manager_id
INNER JOIN course co ON c.class_id = co.class_id
INNER JOIN program p ON co.program_id = p.program_id;