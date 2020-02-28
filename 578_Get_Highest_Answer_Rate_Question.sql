-- run code result shows accept, but showm wrong answer after submit

SELECT question_id AS survey_log  
FROM(SELECT 
        question_id
        ,SUM(CASE WHEN action = 'answer' THEN 1 ELSE 0 END) AS answer_num
        ,SUM(CASE WHEN action = 'show' THEN 1 ELSE 0 END) AS show_num
     FROM survey_log
     GROUP BY question_id) AS t
WHERE answer_num/show_num =1

