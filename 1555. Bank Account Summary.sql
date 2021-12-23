
SELECT u.user_id, u.user_name,SUM(trans) AS credit,
    CASE WHEN SUM(trans) < 0 THEN 'Yes' ELSE 'No' END AS 'credit_limit_breached'
FROM Users u
LEFT JOIN
    (
SELECT paid_by AS user_id, (-amount) AS trans FROM transactions
UNION ALL
SELECT paid_to AS user_id, (amount) AS trans FROM transactions
UNION ALL
SELECT user_id, credit AS trans FROM users
    )t
ON u.user_id = t.user_id
GROUP BY u.user_id
