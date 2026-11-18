-- member
CREATE INDEX idx_member_name ON member(last_name, first_name);
CREATE INDEX idx_member_category ON member(category);

-- venue
CREATE INDEX idx_venue_type ON venue(type);

-- publication
CREATE INDEX idx_publication_area ON publication(area_id);
CREATE INDEX idx_publication_venue ON publication(venue_id);
CREATE INDEX idx_publication_year ON publication(pub_year DESC);

-- project
CREATE INDEX idx_project_chief ON project(chief_researcher);
CREATE INDEX idx_project_agency ON project(funding_agency);
CREATE INDEX idx_project_dates ON project(start_date, end_date);

-- news
CREATE INDEX idx_news_publish_date ON news(publish_date DESC);
CREATE INDEX idx_news_author ON news(author_id);

-- course
CREATE INDEX idx_course_level_semester ON course(level, semester);

-- authoring
CREATE INDEX idx_authoring_pub ON authoring(pub_id);

-- participation
CREATE INDEX idx_participation_project ON participation(project_id);

-- course_teaching
CREATE INDEX idx_teaching_year_semester ON course_teaching(academic_year, semester_type);

