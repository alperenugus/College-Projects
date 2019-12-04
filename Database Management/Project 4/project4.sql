-- NAME: ALPEREN UGUS  CWID: 10864101 
-- 1. How many Slytherin students are there?
SELECT COUNT(*) FROM hogwarts_students WHERE house='Slytherin';
-- 2. What is the earliest start year of any student in our data?
SELECT start FROM hogwarts_students WHERE start=(SELECT MIN(start) FROM hogwarts_students);
-- 3. How many students have some missing information?
SELECT COUNT(*) FROM hogwarts_students  WHERE NOT (hogwarts_students IS NOT NULL);
-- 4. How many Defense Against the Dark Arts (DADA) teachers have first names the same length as their last names?
SELECT COUNT(*) FROM hogwarts_dada WHERE LENGTH(CAST (first AS TEXT)) = LENGTH(CAST (last AS TEXT));
-- 5. How many students are listed in each house (include the number who have no house listed as well; order by greatest number of students first)?
SELECT house, COUNT(*) FROM hogwarts_students GROUP BY house ORDER BY count DESC;
-- 6. Which houses have more than 20 associated student records, and how many students are in those houses?
SELECT * FROM (SELECT house, COUNT(*) FROM hogwarts_students GROUP BY house) AS grouped_table WHERE count > 20; 
-- 7. By house, what was the average number of years spent at Hogwarts by students for whom we know both start and end years? Order by average number of years.
SELECT * FROM (SELECT house, AVG(finish - start) FROM hogwarts_students GROUP BY house ORDER BY avg) AS average_table; 
-- 8. Which family names (last names) appear exactly twice in the hogwarts_students table?
SELECT last FROM (SELECT last, COUNT(*) FROM hogwarts_students GROUP BY last) AS last_table WHERE count = 2;
-- 9. What are the names, houses, and house colors of the Defense Against the Dark Arts teachers (you only need to worry about the teachers who also have student records)?
SELECT hogwarts_students.last, hogwarts_students.first, hogwarts_students.house, hogwarts_houses.colors FROM hogwarts_students, hogwarts_dada, hogwarts_houses 
WHERE hogwarts_students.last = hogwarts_dada.last and hogwarts_students.first = hogwarts_dada.first and hogwarts_students.house = hogwarts_houses.house;
-- 10. Who is the earliest known student, and what year did they start?
SELECT last, first, start FROM hogwarts_students WHERE start=(SELECT MIN(start) FROM hogwarts_students);
-- 11. Which student has the shortest first name?
SELECT first FROM hogwarts_students ORDER BY LENGTH(first) ASC LIMIT 1;
-- 12. Who were the Gryffindors who would have had Dolores Umbridge as DADA teacher 
-- (assume all students take DADA, and all students are at school for the entire school 
-- year starting in Fall and ending in Spring, keeping in mind that each DADA teacher listed 
-- started in Fall and left the following Spring)?
SELECT DISTINCT hs.last, hs.first FROM hogwarts_students AS hs, hogwarts_dada AS hd WHERE hs.house = 'Gryffindor' AND hs.start = (SELECT start FROM hogwarts_dada WHERE last = 'Umbridge' AND first = 'Dolores');
-- 13. Which students have had other family members attend Hogwarts (assume anyone with the same last name is a family member)? Order by last name and first name.
SELECT last, first FROM hogwarts_students h1 WHERE (SELECT COUNT(last) FROM hogwarts_students h2 WHERE h1.last = h2.last)>1 ORDER BY last, first;
--14. How many students of each house are known to have started the year that Alastor Moody was the appointed DADA teacher?
-- I did not counted the null houses on purpose.
SELECT hs.house, COUNT(*) FROM hogwarts_students AS hs, hogwarts_dada AS hd WHERE hs.house IS NOT NULL AND hs.start =  (SELECT start FROM hogwarts_dada WHERE last = 'Moody' AND first = 'Alastor') GROUP BY hs.house;