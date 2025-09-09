# Write your MySQL query statement below
select name, unique_id
from employees as e
left join employeeuni as eu
on e.id = eu.id
;
