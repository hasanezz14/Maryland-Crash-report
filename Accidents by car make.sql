SELECT        coalesce(vehicles.veh_make, vehicles .veh_model, 'Unknown') AS Vehicle, count(*) as accidents_made
FROM            crashes INNER JOIN
                         persons ON crashes.report_no = persons.report_no INNER JOIN
                         vehicles ON persons.report_no = vehicles.report_no
GROUP BY Vehicle
order by accidents_made desc
limit 10;