
select e1.name 
from employee as e1
left join employee as e2
on e1.id = e2.managerid
group by e1.id, e1.name
having count(e2.managerid) >= 5
