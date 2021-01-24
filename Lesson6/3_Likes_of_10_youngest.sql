SELECT COUNT(*) AS num_likes FROM likes_users
WHERE users_id IN
	(SELECT users_id FROM profiles
	WHERE birthday >=
		(SELECT MIN(birthday) FROM
		(SELECT birthday FROM profiles
		ORDER BY birthday DESC
		LIMIT 10) AS temp))
;