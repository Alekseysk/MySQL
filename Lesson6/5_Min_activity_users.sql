SELECT user_id, activity +
	IFNULL(
		(SELECT activity FROM
			(SELECT from_users_id AS user_id, COUNT(1) AS activity FROM messages GROUP BY from_users_id) AS temp2
			WHERE temp1.user_id = temp2.user_id), 0) + 
	IFNULL(
		(SELECT activity FROM
			(SELECT users_id AS user_id, COUNT(1) AS activity FROM posts GROUP BY users_id) AS temp3
			WHERE temp1.user_id = temp3.user_id), 0) + 
	IFNULL(
		(SELECT activity FROM
			(SELECT users_id AS user_id, COUNT(1) AS activity FROM likes GROUP BY users_id) AS temp4
			WHERE temp1.user_id = temp4.user_id), 0) 
	AS activity
FROM (SELECT users.id AS user_id, 0 AS activity FROM users) AS temp1

ORDER BY activity ASC
LIMIT 10;