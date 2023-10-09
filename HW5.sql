use learn;
SELECT *
FROM students;
-- Поменять тип у gender на char(1)(вспоминаем modify    
ALTER TABLE students
MODIFY gender char(1);
SELECT *
FROM students;
-- переименовать поле name на firstname
ALTER TABLE students
CHANGE COLUMN name firstname VARCHAR(64);

-- Задача 6. Выборки


-- найти учеников, у которых оценка больше 4
SELECT * 
FROM students
WHERE avg_mark > 4;

-- найти учеников, у которых не входит в диапазон от 3 до 4
SELECT * 
FROM students
WHERE avg_mark NOT BETWEEN 3 AND 4;

-- найти учеников, у которых имя начинается на И
SELECT * 
FROM students
WHERE firstname LIKE 'И%';

-- найти учеников, у которых оценка 2.2 или 3.1 или 4.7
SELECT * 
FROM students
WHERE avg_mark IN (2.2, 3.1, 4.7);

-- Создать представление, которое содержит всех мужчин
CREATE VIEW view_Mstudents AS -- pochemu to sozdalos s malenkoj bukvi mstudents
SELECT * 
FROM students
WHERE  gender = 'M';
SELECT * 
FROM view_mstudents;

--  Создать представление, которое содержит всех женщин
CREATE VIEW view_Fstudents AS
SELECT * 
FROM students
WHERE gender = 'F';
SELECT * 
FROM view_fstudents;

--  Найти набор уникальных оценок
SELECT DISTINCT avg_mark 
FROM students;

-- Увеличить всем учащимся оценку в 10 раз (предварительно нужно сделать drop check на колонке с оценками,
-- drop check ( ogranichenia na kolonku s ocenkami?) 
UPDATE students
SET avg_mark = avg_mark * 10; -- ????

-- а так же изменить тип колонки на более большой numeric(3,1))
ALTER TABLE students
MODIFY COLUMN avg_mark NUMERIC(4, 1);
--  Поменяйте у Олега Петрова фамилию на Сидоров
UPDATE students
SET name = 'Олег Сидоров'
WHERE name = 'Олег Петров';

--  Для всех учеников, у которых оценка не больше 31 увеличить на 10

UPDATE students
SET avg_mark = avg_mark + 10
WHERE avg_mark > 31;
