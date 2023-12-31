--1. Selezionare tutti gli studenti nati nel 1990 (160)
SELECT * FROM students WHERE YEAR(date_of_birth) = 1990;

--2. Selezionare tutti i corsi che valgono più di 10 crediti (479)
SELECT * FROM courses WHERE cfu > 10;

--3. Selezionare tutti gli studenti che hanno più di 30 anni
SELECT * FROM students WHERE YEAR(CURDATE()) - YEAR(date_of_birth) > 30;

--4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)
SELECT * FROM courses WHERE period = 'I semestre' AND year = 1;

--5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)
SELECT * FROM exams WHERE DATE(date) = '2020-06-20' AND TIME(hour) > '14:00';

--6. Selezionare tutti i corsi di laurea magistrale (38)
SELECT * FROM degrees WHERE name LIKE '%magistrale%';

--7. Da quanti dipartimenti è composta l'università? (12)
SELECT COUNT(*) AS n_dipartimenti FROM departments;

--8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)
SELECT COUNT(*) AS numero_insegnanti_senza_telefono FROM teachers WHERE phone IS NULL;

--9. Contare quanti iscritti ci sono stati ogni anno
SELECT YEAR(enrolment_date) AS anno_iscrizione, COUNT(*) AS numero_iscritti FROM students GROUP BY YEAR(enrolment_date) ORDER BY anno_iscrizione;

--10. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT office_address, COUNT(*) AS numero_insegnanti FROM teachers GROUP BY office_address;

--11. Calcolare la media dei voti di ogni appello d'esame
SELECT exam_id, ROUND(AVG(vote), 2) AS media_voti FROM exam_student GROUP BY exam_id;

--12. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT departments.id, departments.name AS nome_dipartimento, COUNT(degrees.id) AS numero_corsi_di_laurea FROM departments LEFT JOIN degrees ON departments.id = degrees.department_id GROUP BY departments.id, departments.name;