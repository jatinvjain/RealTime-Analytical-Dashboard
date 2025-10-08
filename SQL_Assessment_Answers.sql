--Module 1

--Q1. Show each student's name and their marks increased by 5 (bonus marks).
select name, marks, marks + 5 AS bonus_marks
from students;

--Q2. Find all students whose names start with the letter 'B'.
select * 
from students
where name LIKE 'B%';

--Q3. Retrieve students whose names end with the letter 'e'.
select *
from students
where name LIKE '%e';

--Q4. List students who have scored more than 85 marks.
select *
from students
where marks > 85;

--Q5. Find students aged exactly 22.
select *
from students
where age = 22;

--Q6. Get students who are older than 21 and have scored less than 80.
select *
from students
where age > 21 AND marks < 80;

--Q7. Find students who are either named 'Bob' or have marks greater than 90.
select *
from students
where name = 'Bob' OR marks > 90;

--Q8. Display all students sorted by age in ascending order and marks in descending order.
select *
from students
order by age asc, marks desc;

--Q9. Find students whose marks plus 10 would exceed 90.
select *,  marks + 10 as bonus_marks
from students
where marks + 10 > 90;

--Q10. Display student name, marks, and percentage (assuming marks are out of 120).
select name, marks, (marks * 100.0 / 120) AS percentage
from students;


-------------------------------------

--Module 2

select * from students;
select * from courses;

--Q1. Get student names along with their course names.
select s.name, c.course_name
from students s
inner join courses c on s.course_id = c.course_id;

--Q2. List students and instructors for those enrolled in existing courses only.
select s.name, c.instructor
from students s
inner join courses c on s.course_id = c.course_id;

--Q3. Show student name, marks, and course name for students who scored more than 80.
select s.name, s.marks, c.course_name
from students s
inner join courses c on s.course_id = c.course_id
where s.marks > 80;

--Q4. List all students and their course names, even if the course is missing in the Courses table.
select s.name, c.course_name
from students s
right join courses c on s.course_id = c.course_id;

--Q5. List course names and student names include courses with no students.

select c.course_name, s.name AS student_name
from Students s
right join Courses c on s.course_id = c.course_id;
---------------------------------------------------------------------------

--Module 3

--Q1: List each student age and the total number of students of that age.
select age, count(*) as count_by_age
from students
group by age;

--Q2: Show the maximum and minimum marks scored in each course.
select course_id, max(marks) as max_marks, min(marks) as min_marks
from students
group by course_id;

--Q3: Count the number of students enrolled in each course.
select course_id, count(*) as student_count
from students
group by course_id;

--Q4: find the average marks of students in each course.
select course_id, avg(marks) as average_marks
from students
group by course_id;

--Q5: Show course name and total marks scored by students in that course.
select c.course_name, sum(s.marks) as total_marks
from students s
join courses c on s.course_id = c.course_id
group by c.course_name;

-------------------------------------------------------------------------

--Module 4

--Q1: Show course ids where the average marks of students is greater than 80.
select course_id, avg(marks) as avg_marks
from students
group by course_id
having avg(marks) > 80;

--Q2: List student ages where more than 2 students share the same age.
select age, count(*) as count_by_age
from students
group by age
having count(*) > 2;

--Q3: Show course names where total marks scored by students is less than 250.
select c.course_name, sum(s.marks) as total_marks
from students s
join courses c on s.course_id = c.course_id
group by c.course_name
having sum(s.marks) < 250;

--Q4: Find course ids with a maximum mark greater than 90.
select course_id, max(marks) as max_marks
from students
group by course_id
having max(marks) > 90;

--Q5: show all ages where the average mark of students is below 75.
select age, avg(marks) as avg_marks
from students
group by age
having avg(marks) < 75;

----------------------------------------------------------------------------

--Module 5

--Q1: Show students whose marks are above the average marks of all students.
select name, marks
from students
where marks > (select avg(marks) from students);

--Q2: Find course_name where the average marks is higher than the average of all students.
select c.course_name,  avg(marks)
from students s
join courses c on s.course_id = c.course_id
group by c.course_name
having avg(s.marks) > (select avg(marks) from students);

--Q3: List all students who scored less than the average marks of all students.
select name, marks
from Students
where marks < (select avg(marks) from Students);


------------------

select 
name,
count(*)
from students
group by name
having count(*) > 1


select 
*,
row_number () over (partition by name) as dup_names
from students








