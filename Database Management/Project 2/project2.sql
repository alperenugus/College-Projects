-- NAME: ALPEREN UGUS  CWID: 10864101 
-- 1. What animal is on the crest of the Hufflepuff house?
SELECT animal FROM hogwarts_houses WHERE house = 'Hufflepuff';
-- 2. What years did Sirius Black start and finish at Hogwarts?
SELECT start, finish FROM hogwarts_students WHERE first = 'Sirius' and last = 'Black';
-- 3. Which student (first and last name) started at Hogwarts in 1947?
SELECT first, last FROM hogwarts_students WHERE start = 1947;
-- 4. What are the relics of the Hogwarts houses?
SELECT relic FROM hogwarts_houses;
-- 5. How many years was Katie Bell at Hogwarts?
SELECT finish - start FROM hogwarts_students WHERE first = 'Katie' and last = 'Bell';
-- 6. What students' houses are unknown?
SELECT * FROM hogwarts_students WHERE house IS NULL;
-- 7. What are the names of all Gryffindor students who started in 1991, given as "firstname lastname", without extra spaces, ordered by last name and -- first name? E.g., the answer should include strings like
SELECT first,last FROM hogwarts_students WHERE house = 'Gryffindor' and  start = 1991 ORDER BY last, first;
-- 8. What defense against the dark arts teacher's last name started with 'L' whose first name did not start with 'G'?
SELECT first, last FROM hogwarts_dada WHERE last LIKE 'L%' and first NOT LIKE 'G%';
-- 9. What members of the Weasley family attended Hogwarts and when did they attend, ordered by start year?
SELECT first, start FROM hogwarts_students WHERE last = 'Weasley' ORDER BY start;
-- 10. Give the names of the Hogwarts houses, sorted by animal.
SELECT house FROM hogwarts_houses ORDER BY animal;
-- 11. Give all information about Hufflepuff students, sorted by start year in descending order, then by last name.
SELECT * FROM hogwarts_students WHERE house = 'Hufflepuff' ORDER BY start desc, last;
-- 12. What are the names and house colors of all the students in the Black family?
SELECT hogwarts_students.first, hogwarts_houses.colors FROM hogwarts_students, hogwarts_houses WHERE hogwarts_students.last = 'Black' and  hogwarts_students.house = hogwarts_houses.house;
-- 13. Who founded the house that Parvati Patil sorted into?
SELECT founder FROM hogwarts_houses, hogwarts_students WHERE hogwarts_students.first = 'Parvati' and hogwarts_students.last = 'Patil' and hogwarts_students.house = hogwarts_houses.house;
-- 14. What are the names and houses of the defense against the dark arts teachers for whom we have student records?
SELECT hogwarts_dada.first, house FROM hogwarts_dada, hogwarts_students WHERE hogwarts_dada.first = hogwarts_students.first and hogwarts_dada.last = hogwarts_students.last;