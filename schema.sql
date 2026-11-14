CREATE TABLE member_category (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

CREATE TABLE member (
    member_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    web_page VARCHAR(255),
    short_cv TEXT,
    category INT REFERENCES member_category(category_id)
);

CREATE TABLE thematic_area (
    area_id SERIAL PRIMARY KEY,
    area_name VARCHAR(100) NOT NULL UNIQUE
);


CREATE TABLE venue (
    venue_id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    type VARCHAR(20) NOT NULL CHECK (type IN ('Conference', 'Journal')),
    publisher VARCHAR(150), -- if Journal
    location VARCHAR(150)   -- if Conference
);

CREATE TABLE publication (
    pub_id SERIAL PRIMARY KEY,
    title VARCHAR(300) NOT NULL,
    pub_year INT NOT NULL CHECK (pub_year >= 1960),
    external_authors VARCHAR(500),  
    area_id INT NOT NULL REFERENCES thematic_area(area_id) ON UPDATE CASCADE ON DELETE RESTRICT,
    venue_id INT NOT NULL REFERENCES venue(venue_id) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE project (
    project_id SERIAL PRIMARY KEY,
    title VARCHAR(400) NOT NULL,
    abstract TEXT,
    start_date DATE NOT NULL,
    end_date DATE,
    budget NUMERIC(10, 2) NOT NULL CHECK (budget > 0), 
    funding_agency VARCHAR(150) NOT NULL,
    chief_researcher INT NOT NULL REFERENCES member(member_id) ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT valid_project_dates CHECK (end_date IS NULL OR end_date >= start_date)
);

CREATE TABLE news (
    news_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    publish_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    author_id INT REFERENCES member(member_id) ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE course (
    course_id SERIAL PRIMARY KEY,
    course_code VARCHAR(50) NOT NULL UNIQUE,
    title VARCHAR(150) NOT NULL,
    level VARCHAR(20) NOT NULL CHECK (level IN ('Undergraduate', 'Postgraduate')),
    semester INT NOT NULL CHECK (semester BETWEEN 1 AND 12),
    ects INT NOT NULL CHECK (ects > 0)
);

CREATE TABLE authoring (
    member_id INT REFERENCES member(member_id) ON UPDATE CASCADE ON DELETE CASCADE,
    pub_id INT REFERENCES publication(pub_id) ON UPDATE CASCADE ON DELETE CASCADE,
    author_order INT NOT NULL CHECK (author_order > 0),
    PRIMARY KEY (member_id, pub_id)
);

CREATE TABLE participation (
    member_id INT REFERENCES member(member_id) ON UPDATE CASCADE ON DELETE CASCADE,
    project_id INT REFERENCES project(project_id) ON UPDATE CASCADE ON DELETE CASCADE,
    role VARCHAR(100) NOT NULL,
    PRIMARY KEY (member_id, project_id)
);

--- WARNING following snippet is gemini generated
CREATE TABLE course_teaching (
    member_id INT REFERENCES member(member_id) ON UPDATE CASCADE ON DELETE CASCADE,
    course_id INT REFERENCES course(course_id) ON UPDATE CASCADE ON DELETE CASCADE,
    academic_year VARCHAR(9) NOT NULL, -- π.χ. '2025-2026'
    semester_type VARCHAR(10) NOT NULL CHECK (semester_type IN ('Fall', 'Spring')),
    PRIMARY KEY (member_id, course_id, academic_year, semester_type)
);
