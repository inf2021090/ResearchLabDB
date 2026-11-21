CREATE OR REPLACE PROCEDURE report_member_activities_by_year(
    IN p_member_id INT,
    IN p_year INT DEFAULT NULL,
    INOUT p_cursor REFCURSOR DEFAULT 'member_activities_cur'
)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Προαιρετικός έλεγχος αν υπάρχει το μέλος
    IF NOT EXISTS (SELECT 1 FROM member WHERE member_id = p_member_id) THEN
        RAISE EXCEPTION 'Το μέλος με ID % δεν βρέθηκε.', p_member_id;
    END IF;

    OPEN p_cursor FOR
    -- 1. Δημοσιεύσεις
    SELECT 
        p.pub_year AS activity_year,
        'Publication'::VARCHAR(30) AS activity_type,
        p.title::VARCHAR(400) AS title,
        ('Σειρά συγγραφής: ' || a.author_order || ' | ' || v.type || ': ' || v.name)::TEXT AS details
    FROM authoring a
    JOIN publication p ON a.pub_id = p.pub_id
    JOIN venue v ON p.venue_id = v.venue_id
    WHERE a.member_id = p_member_id
      AND (p_year IS NULL OR p.pub_year = p_year)

    UNION ALL

    -- 2α. Έργα ως Chief Researcher
    SELECT 
        EXTRACT(YEAR FROM pr.start_date)::INT AS activity_year,
        'Project (Lead)'::VARCHAR(30) AS activity_type,
        pr.title::VARCHAR(400) AS title,
        ('Ρόλος: Chief Researcher | Φορέας: ' || pr.funding_agency || ' | Budget: ' || pr.budget || '€')::TEXT AS details
    FROM project pr
    WHERE pr.chief_researcher = p_member_id
      AND (p_year IS NULL OR EXTRACT(YEAR FROM pr.start_date)::INT = p_year)

    UNION ALL

    -- 2β. Έργα ως Συμμετέχων
    SELECT 
        EXTRACT(YEAR FROM pr.start_date)::INT AS activity_year,
        'Project (Participant)'::VARCHAR(30) AS activity_type,
        pr.title::VARCHAR(400) AS title,
        ('Ρόλος: ' || pa.role || ' | Φορέας: ' || pr.funding_agency)::TEXT AS details
    FROM participation pa
    JOIN project pr ON pa.project_id = pr.project_id
    WHERE pa.member_id = p_member_id
      AND (p_year IS NULL OR EXTRACT(YEAR FROM pr.start_date)::INT = p_year)

    UNION ALL

    -- 3. Μαθήματα που διδάσκει
    SELECT 
        SPLIT_PART(ct.academic_year, '-', 1)::INT AS activity_year,
        'Course Teaching'::VARCHAR(30) AS activity_type,
        c.title::VARCHAR(400) AS title,
        ('Κωδικός: ' || c.course_code || ' | Ακαδ. Έτος: ' || ct.academic_year || ' (' || ct.semester_type || ')')::TEXT AS details
    FROM course_teaching ct
    JOIN course c ON ct.course_id = c.course_id
    WHERE ct.member_id = p_member_id
      AND (p_year IS NULL OR SPLIT_PART(ct.academic_year, '-', 1)::INT = p_year)

    ORDER BY activity_year DESC, activity_type, title;
END;
$$;

BEGIN;
CALL report_member_activities_by_year(1, NULL, 'my_cur');
FETCH ALL IN "my_cur";
COMMIT;
