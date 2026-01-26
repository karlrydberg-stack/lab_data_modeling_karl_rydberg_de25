SELECT
 o.operation_name,
 p.program_name
FROM operation o
INNER JOIN course c ON o.operation_id = c.operation_id
INNER JOIN program p ON c.program_id = p.program_id;