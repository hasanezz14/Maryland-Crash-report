select month, round(accidents/days,2) as avg_month_accidents
from (
 select 
 to_char(date(acc_date), 'Month') AS month, 
  extract('days' FROM date_trunc('month',date(acc_date))+interval '1 month - 1 day') as days,  
  count(*) as accidents 
 from crashes 
 group by month, days) as acc_per_month
Order by to_date(month, 'month')