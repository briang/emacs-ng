SELECT firstname, lastname
FROM persons
WHERE age > 65
ORDER BY lastname ASC;

CREATE TABLE persons (
       id        INTEGER PRIMARY KEY,
       firstname VARCHAR,
       lastname  VARCHAR,
       age       INTEGER
);
