-- 1.Finding the Oldest Customers --
SELECT *
FROM users
ORDER BY created_at ASC
LIMIT 10;
#There are 10 users who have stayed around the longest on Instagram , they had opened their accounts between 6th May and 3rd June in 2016

-- 2.Finding the most inactive users --
SELECT username ,COALESCE(COUNT(photos.id), 0)  as posts
 FROM users
LEFT JOIN photos ON users.id = photos.user_id
GROUP BY username
HAVING COALESCE(COUNT(photos.id), 0)  < 3
ORDER BY posts;

-- 3.Finding the day when the most users registered -- 
SELECT DAYNAME(created_at) AS day_of_the_week,COUNT(*) AS total_users_registered
FROM users
GROUP BY day_of_the_week
ORDER BY  total_users_registered DESC;
#Most users registered on Sunday and Thursday

-- 4.Average users activity --
SELECT ROUND((SELECT COUNT(*)FROM photos)/(SELECT COUNT(*) FROM users),2) AS avearge_user_activity;

-- 5.User ranking by posts higher to lower --
SELECT users.username,COUNT(photos.image_url) AS posts
FROM users
JOIN photos ON users.id = photos.user_id
GROUP BY users.id
ORDER BY posts DESC;

-- 6.Photo contest --
SELECT  username, photos.id AS photo_id, photos.image_url, COUNT(*) AS total_likes
FROM photos
JOIN likes
ON likes.photo_id = photos.id
JOIN users
ON photos.user_id = users.id
GROUP BY username, photos.id, photos.image_url
ORDER BY total_likes DESC
LIMIT 3;

-- 7.Total no. of users who have posted at least one time --
SELECT COUNT(DISTINCT(users.id)) AS posted_one_time
FROM users
JOIN photos ON users.id = photos.user_id;

-- 8.Top 5 most used hashtags --
SELECT  tag_name, COUNT(*) AS count
FROM tags
JOIN photo_tags 
ON tags.id = photo_tags.tag_id
GROUP BY tag_name
ORDER BY count DESC
LIMIT 5;

-- 9.User ranking --
SELECT users.username,COUNT(*) AS _photos_posted, DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS user_rank
FROM users
JOIN photos ON users.id = photos.user_id
GROUP BY username
ORDER BY user_rank;

-- 10.Finding users who have liked every single photo on the site --
SELECT users.id,username, COUNT(users.id) As total_likes_by_user
FROM users
JOIN likes ON users.id = likes.user_id
GROUP BY users.id
ORDER BY total_likes_by_user;


-- 11.Finding the users who have liked every single post --
SELECT users.id AS user_id, users.username 
FROM users 
JOIN likes 
ON users.id = likes.user_id
GROUP BY users.id, users.username 
HAVING COUNT(*) = (
    SELECT COUNT(*)
    FROM photos
);
#We find that 13 of ours users have liked every photo on Instagram clone.


-- 12.Finding the proportion of people who have liked every post on Instagram clone and never commented on any post --
WITH all_likes AS 

(SELECT COUNT(*) AS total_A FROM
			(SELECT users.id
				FROM users
				JOIN likes ON users.id = likes.user_id
				GROUP BY users.id
				HAVING COUNT(*) = (SELECT COUNT(*) FROM photos)) AS total_number_users_likes_every_photos
),

no_comments AS 

(SELECT COUNT(*) AS total_B FROM
			(SELECT users.id
				FROM users
				LEFT JOIN comments ON users.id = comments.user_id
				WHERE comments.id IS NULL) AS total_number_of_users_without_comments
)

SELECT
    total_A AS "Number of users who liked every photo",
    ROUND((total_A * 100.0) / (SELECT COUNT(*) FROM users), 2) AS percentage_likes_every_photo,
    total_B AS "Number of users who never commented",
    ROUND((total_B * 100.0) / (SELECT COUNT(*) FROM users), 2) AS percentage_never_commented
FROM all_likes, no_comments;

