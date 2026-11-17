-- update
UPDATE member 
SET short_cv = 'Καθηγητής στο τμήμα Πληροφορικής με ερευνητικά ενδιαφέροντα στην Τεχνητή Νοημοσύνη και τα Κατανεμημένα Συστήματα.' 
WHERE first_name = 'Γεώργιος' AND last_name = 'Παπαδόπουλος';

UPDATE project 
SET budget = 500000.00 
WHERE title = 'AgroVision: Autonomous Drone Surveillance for Precision Agriculture';

-- delete
DELETE FROM participation 
WHERE role = 'Ειδικός Computer Vision';

DELETE FROM news 
WHERE title = 'Προσωρινή διακοπή λειτουργίας υπηρεσιών λόγω συντήρησης';
