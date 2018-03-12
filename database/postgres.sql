CREATE TABLE grade
    (Student_id int, Mark varchar(2));

INSERT INTO grade
    (Student_id, Mark)
VALUES
    (1, 'A'),
    (2, 'B'),
    (2, 'B+'),
    (3, 'C'),
    (3, 'A');



CREATE TABLE student
    (Id int primary key, Name varchar(5));

INSERT INTO student
    (Id, Name)
VALUES
    (1, 'John'),
    (2, 'David'),
    (3, 'Will');


create table grade2 as 
select Student_id,array_agg(Mark) as marks
from grade
group by Student_id
;


SELECT name, 
    STRING_AGG(Grade.Mark, ',' ORDER BY Grade.Mark) As marks
FROM Student
LEFT JOIN Grade ON Grade.Student_id = Student.Id
GROUP BY Student.Name;


SELECT name, 
    array_to_string(ARRAY_AGG(Grade.Mark),';') As marks
FROM Student
LEFT JOIN Grade ON Grade.Student_id = Student.Id
GROUP BY Student.Name;


select jsonb_build_object(Student_id, Mark) as a
from grade; 


-- 存在该记录则更新,不存在则插入
INSERT INTO test_postgre(id,name,InputTime,age)  
VALUES('1','postgre','2018-01-10 22:00:00',24)  
ON conflict(id)   
DO UPDATE SET name = 'postgreOk', InputTime ='2018-02-22 12:00:00' 