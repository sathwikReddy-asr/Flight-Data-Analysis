--Platform used:Mode.com
--Table used:tutorial.sat_scores
--Date:14-06-2025

--Q1: Find the minimum marks in sat_verbal in the dataset ?
select min(sat_verbal) as min_marks_in_sat_verbal                                              --selecting sat_verbal column and giving alias name and minimum marks
from tutorial.sat_scores;

--Q2: Find the maximum marks in sat_writing in the dataset ?
select max(sat_writing) as max_marks_in_sat_writing                                             --selecting sat_writing column and giving alias name and maximum marks 
from tutorial.sat_scores;

--Q3: Find the count of students in the dataset ?
select count(*) as count_of_students                                                            --counting all students and giving alias name
from tutorial.sat_scores;

--Q4: Find the average marks in sat_math in the dataset ?
select avg(sat_math) as average_marks_in_sat_math                                               --selecting sat_math column and giving alias name and average marks
from tutorial.sat_scores;

--Q5: Find the sum of hrs_studied in the dataset ?
select sum(hrs_studied) as total_hrs_studied                                                       --selecting hrs_studied column and giving alias name and sum of total hrs studied
from tutorial.sat_scores;

--Q6: Find the list of unique school in the data using Group by clause ?
select school                                                                                      --selecting school column
from tutorial.sat_scores
group by 1;                                                                                        --grouping by school column

--Q7: Find the list of unique school and teachers in the data using Group by clause ?
select school,teacher                                                                              --selecting school and teacher columns
from tutorial.sat_scores
group by 1,2;                                                                                      --grouping by school and teacher columns

--Q8: Find the total number of hours studied per school ?
select school,sum(hrs_studied) as total_hrs_studied                                                --selecting school column and sum of hrs studied and giving alias name
from tutorial.sat_scores 
group by 1;                                                                                        --grouping by school column

--Q9: Find the number of students in each school ?
select school,count(*) as no_of_students                                                          --selecting school column and count of students and giving alias name
from tutorial.sat_scores
group by 1;                                                                                       --grouping by school column

--Q10: Find the average marks scored in sat_writing per teacher for the school 'Petersville HS’ ?
select teacher,avg(sat_writing) as avg_marks_in_sat_writing                                       --selecting teacher column and average sat_writing and giving alias name
from tutorial.sat_scores 
where school='Petersville HS'
group by 1;                                                                                      --grouping by teacher column

--Q11: Find the maximum marks scored in sat_math per teacher for the school ‘Washington HS’ ? 
select teacher, max(sat_math) as max_marks_in_sat_math                                           --selecting teacher column and maximum marks in sat_math and giving alias name
from tutorial.sat_scores 
where school='Washington HS'
group by 1;                                                                                        --grouping by teacher column

--Q12: Find the list of unique school and teachers in the data using Group by clause and sort it by ascending order for school and descending order for teacher name ?
select school,teacher,count(*) as total_count                                                      --selecting school and teacher columns and count students and giving alias name
from tutorial.sat_scores
group by 1,2                                                                                       --grouping by school and teacher columns
order by 1,2 desc;                                                                                 --sorting school by ascending and teacher by descending order

--Q13: Find the list of all the teachers along with the minimum marks scored by their students in sat_verbal. Only consider those teachers where minimum marks is more than 220. Sort the output in ascending order ?
select teacher,min(sat_verbal) as min_marks_in_sat_verbal                                            --selecting teacher column and minimum sat_verbal marks and giving alias name
from tutorial.sat_scores 
group by 1                                                                                           --grouping by teacher
having min(sat_verbal) >220                                                                          --getting minimum sat_verbal marks more than 220 using having clause
order by 1 ;                                                                                         --sorting by teacher

--Q14: Find the first 5 rows of the data ?
select *                                                                                              --selecting all columns from the data
from tutorial.sat_scores limit 5;                                                                     --limiting the data for only 5 rows
