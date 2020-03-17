select distinct viewer_id as id
from views
group by viewer_id, view_date
having count(distinct article_id, viewer_id) > 1
order by viewer_id asc;


#########################################################
My learning process: 

select viewer_id as id
from views
group by viewer_id
having count(view_date) > 1
order by viewer_id asc;

{"headers": ["id"], "values": [[4], [5], [6]]}
We do not account for viewer_id = 4, who read same article. 
Also, will need to group by both viewer_id, view_date



