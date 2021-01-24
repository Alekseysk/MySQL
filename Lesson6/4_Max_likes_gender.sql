SELECT * FROM
	(SELECT COUNT(*) AS number_likes,
		(SELECT gender FROM `profiles` WHERE `profiles`.users_id = likes.users_id) AS gender
	FROM likes
	GROUP BY gender) AS temp
WHERE gender IN ('m', 'f')
ORDER BY number_likes DESC
LIMIT 1;