/*Do not 画蛇添足:

No need to filter extra is not null. When action = 'report', extra is guaranteed not null.
No need to filter count > 0. If a group exists, it must have at least one row.
-- shawlu*/

select 
  extra as report_reason
  ,count(distinct post_id) as report_count
from Actions
where action_date = '2019-07-04'
  and action = 'report'
group by extra



/*yesterday*/
select 
    extra as report_reason
    , count(distinct post_id) as report_count
from actions
where action = 'report' 
and action_date = DATE_ADD('2019-07-05', INTERVAL -1 DAY)
group by extra
