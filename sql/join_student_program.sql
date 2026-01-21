SELECT
 s.first_name,
 pr.program_id
FROM student s
LEFT JOIN class c ON s.class_id = c.class_id
LEFT JOIN courseclass cc ON c.class_id = cc.class_id
LEFT JOIN course co ON cc.course_id = co.course_id
LEFT JOIN curriculum cu ON cu.curriculum_id = co.curriculum_id
LEFT JOIN program pr ON cu.program_id = pr.program_id;