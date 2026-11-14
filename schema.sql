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

