# Write your MySQL query statement below
select st.student_id, st.student_name, s.subject_name,
count(e.subject_name) as attended_exams
from students as st 
cross join subjects as s
left join examinations as e
on st.student_id = e.student_id
and s.subject_name = e.subject_name
group by st.student_id, st.student_name, s.subject_name
order by st.student_id, s.subject_name
;
