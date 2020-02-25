# find number of comments per each post

select 
    s2.sub_id as post_id 
    ,(select count(distinct(s1.sub_id))from submissions s1
      where s1.parent_id = s2.sub_id) as number_of_comments 
from submissions s2
where s2.parent_id is null
group by s2.sub_id;
     
