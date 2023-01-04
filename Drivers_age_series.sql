with bins AS 
         (SELECT generate_series(20, 65, 5) AS from_age, generate_series(25, 70, 5) AS to_age),
           ages as (select extract(year from now()) - extract(year from date(date_of_birth)) as age from persons
				   where person_type_desc = 'Driver')
SELECT        from_age, to_age, count(age) as drivers_causing_acc
FROM            bins 
 left join ages on age >= from_age and age< to_age
group by from_age, to_age
order by from_age