SELECT friend FROM

(SELECT IF (from_users_id = 1532, to_users_id, from_users_id) AS friend, COUNT(*) AS messages FROM messages

WHERE from_users_id = 1532 AND to_users_id IN 
	(SELECT IF (from_users_id = 1532, to_users_id, from_users_id) AS friends
	FROM friend_requests
	WHERE status = 1 AND (from_users_id = 1532 OR to_users_id = 1532))
OR to_users_id = 1532 and from_users_id in
	(SELECT IF (from_users_id = 1532, to_users_id, from_users_id) AS friends
	FROM friend_requests
	WHERE status = 1 AND (from_users_id = 1532 OR to_users_id = 1532))
    
GROUP BY friend

ORDER BY messages DESC
LIMIT 1) AS temp;