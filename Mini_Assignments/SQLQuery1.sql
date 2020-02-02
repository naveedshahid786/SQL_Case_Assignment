--5.1
SELECT teacher.teacher_number, surname, first_name, CourseInstance.instance_number, CourseInstance.course_code
 FROM Teacher
JOIN CourseInstance ON (CourseInstance.teacher_number = Teacher.teacher_number)
ORDER BY surname, first_name, course_code, instance_number;

--5.2
SELECT course_code, course_name, CONCAT (Teacher.surname, ', ', Teacher.first_name) AS "Person in Charge" 
FROM Course
JOIN Teacher ON (Teacher.teacher_number = Course.person_in_charge)
ORDER BY course_code ASC;

--5.3
SELECT surname, first_name, Student.student_number, CAST(AVG(grade * 1.0) AS DECIMAL(4,2)) AS "Grade Point Average"
FROM Student
JOIN CourseGrade ON (CourseGrade.student_number = Student.student_number)
GROUP BY Student.student_number, Student.first_name, Student.surname
ORDER BY surname, first_name, student_number ASC;

--5.4(a)
SELECT surname, first_name, AcademicAdvisor.teacher_number, AcademicAdvisor.start_date, AcademicAdvisor.end_date
FROM Teacher
JOIN AcademicAdvisor ON (AcademicAdvisor.teacher_number = Teacher.teacher_number)
WHERE AcademicAdvisor.end_date IS NULL
ORDER BY surname, first_name, teacher_number ASC;

--5.4b
SELECT surname, first_name, AcademicAdvisor.teacher_number, AcademicAdvisor.start_date, AcademicAdvisor.end_date
FROM Teacher
JOIN AcademicAdvisor ON (AcademicAdvisor.teacher_number = Teacher.teacher_number)
ORDER BY surname, first_name, teacher_number ASC;

--5.5
SELECT description AS "Misconduct occured this far"
FROM MisconductType 
JOIN MisconductIncident ON ( MisconductIncident.misconduct_code = MisconductType.misconduct_code )
WHERE decision_date IS NOT NULL
