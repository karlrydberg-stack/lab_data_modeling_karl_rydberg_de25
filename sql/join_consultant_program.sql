SELECT
c.first_name,
p.program_name
FROM consultant c
INNER JOIN educator e ON c.consultant_id = e.consultant_id
INNER JOIN course co ON e.educator_id = co.educator_id
INNER JOIN program p ON co.program_id = p.program_id;