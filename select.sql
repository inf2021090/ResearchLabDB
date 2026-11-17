SELECT 
    pr.title AS project_title,
    pr.budget AS project_budget,
    pr.funding_agency,
    CONCAT(m.first_name, ' ', m.last_name) AS faculty_member_name,
    m.email
FROM project pr
JOIN member m ON pr.chief_researcher = m.member_id
ORDER BY pr.budget DESC
LIMIT 3;

SELECT 
    CONCAT(m.first_name, ' ', m.last_name) AS faculty_member_name,
    COALESCE(SUM(c.ects), 0) AS total_ects_taught_2025_2026,
    COUNT(DISTINCT n.news_id) AS total_news_published,
    COUNT(DISTINCT pr.project_id) AS projects_led_count
FROM member m
LEFT JOIN course_teaching ct ON m.member_id = ct.member_id AND ct.academic_year = '2025-2026'
LEFT JOIN course c ON ct.course_id = c.course_id
LEFT JOIN news n ON m.member_id = n.author_id
LEFT JOIN project pr ON m.member_id = pr.chief_researcher
WHERE m.category = 1 -- ΔΕΠ 
GROUP BY m.member_id, m.first_name, m.last_name
ORDER BY total_ects_taught_2025_2026 DESC, total_news_published DESC;
