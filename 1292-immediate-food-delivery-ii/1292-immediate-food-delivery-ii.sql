# Write your MySQL query statement below
with FirstOrders as 

#creates secondary table from delivery table

(select d.* from Delivery d

#selects the whole delivery table

join

(select 
customer_id, min(order_date) as first_order_date

#defines minimum order date as first_order_date
#left joins customer_id and first order date 

from Delivery

group by customer_id) f

#group by means that 
#labels joined table of customer id and first_order_date as f

on d.customer_id = f.customer_id and d.order_date = f.first_order_date)

#joins them so that only rows where order_date is first_order_date and customer ids match as usual

select 
round(sum(case when order_date = customer_pref_delivery_date then 1 else 0 end) * 100.0/ count(*),2) as immediate_percentage

#round arg rounds to 2dp
#sum arg counts cases where first_order_date is customer_pref_delivery_date
#names this as new column immediate_percentage

from FirstOrders;

#now selecting from this new table with from FirstOrders