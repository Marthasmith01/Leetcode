# Write your MySQL query statement below
select a.machine_id, 
round(avg(a1.timestamp - a.timestamp),3)
 as processing_time
from Activity as a 
left join Activity as a1
on a.machine_id = a1.machine_id
and a.process_id = a1.process_id
where a.activity_type = 'start' 
and a1.activity_type = 'end'
group by a.machine_id