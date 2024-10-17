DROP TABLE world;
CREATE TABLE world(id INT, word VARCHAR(255));
COPY world(id, word) FROM './lines.csv' DELIMITER ',' CSV HEADER;
SELECT * from world LIMIT 10;