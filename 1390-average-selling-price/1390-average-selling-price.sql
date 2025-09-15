# Write your MySQL query statement below
#
select p.product_id,
round(
    ifnull(sum(us.units * p.price) * 1.0 / sum(us.units), 0),
    2) AS average_price
#IFNULL(expression, 0) means: If expression null return 0, Otherwise, return expression
from Prices as p
left join UnitsSold as us
    on p.product_id = us.product_id 
#so products are matched up
   and us.purchase_date between p.start_date and p.end_date
#so only price set at the time of purchase applies for each product 
group by p.product_id;
#so there is one row/avg price per product