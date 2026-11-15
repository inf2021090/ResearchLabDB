INSERT INTO member_category (category_name) VALUES 
('Μέλη ΔΕΠ'),
('Ερευνητές'),
('Υποψήφιοι Διδάκτορες'),
('Μεταπτυχιακοί Φοιτητές'),
('Προπτυχιακοί Φοιτητές');

INSERT INTO thematic_area (area_name) VALUES
('Artificial Intelligence'),
('Natural Language Processing (NLP)'),
('Computer Vision (CV)');

-- Following data generated with gemini
INSERT INTO venue (name, type, publisher, location) VALUES 
-- Interantional Journals
('IEEE Transactions on Pattern Analysis and Machine Intelligence', 'Journal', 'IEEE', NULL),
('Journal of Artificial Intelligence Research (JAIR)', 'Journal', 'AI Access Foundation', NULL),
('Elsevier Computer Vision and Image Understanding', 'Journal', 'Elsevier', NULL),

-- International Conferences
('IEEE Conference on Computer Vision and Pattern Recognition (CVPR)', 'Conference', NULL, 'Seattle, USA'),
('Annual Meeting of the Association for Computational Linguistics (ACL)', 'Conference', NULL, 'Toronto, Canada'),
('Neural Information Processing Systems (NeurIPS)', 'Conference', NULL, 'Vancouver, Canada'),

-- Greek/Cypriot Journals & Conferences
('PCI - Panhellenic Conference on Informatics', 'Conference', NULL, 'Athens, Greece'),
('SETN - Hellenic Conference on Artificial Intelligence', 'Conference', NULL, 'Patras, Greece'),
('Cyprus Conference on Computer Science and Engineering', 'Conference', NULL, 'Nicosia, Cyprus'),
('Greek Journal of Artificial Intelligence and Computing', 'Journal', 'Hellenic AI Society', NULL);
