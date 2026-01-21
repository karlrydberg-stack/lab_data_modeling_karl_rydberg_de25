SELECT
 e.educator_id,
 pr.program_name
FROM educator e
LEFT JOIN course co ON e.educator_id = co.educator_id
LEFT JOIN curriculum cu ON co.curriculum_id = cu.curriculum_id
LEFT JOIN program pr ON cu.program_id = pr.program_id;