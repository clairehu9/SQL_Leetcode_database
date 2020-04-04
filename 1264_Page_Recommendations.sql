SELECT DISTINCT page_id AS recommended_page 
FROM likes
WHERE user_id IN (
         SELECT user2_id FROM friendship WHERE user1_id = 1
         UNION ALL
         SELECT user1_id FROM friendship WHERE user2_id = 1
         )
AND page_id NOT IN(SELECT page_id FROM likes WHERE user_id = 1)

/*
如果换成 page_id IN(SELECT page_id FROM likes WHERE user_id ！= 1) 
依旧会出现88。为什么呢？*/
