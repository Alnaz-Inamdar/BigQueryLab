-- Exercise n. 6
-- Find the top 10 StackOverflow users (the id) by accepted responses on 2010 posts
-- Public Dataset: bigquery-public-data.stackoverflow
-- Table involved: stackoverflow_posts, posts_answers, users

WITH obtainedUserid AS(
    SELECT 
    pa.owner_user_id AS id_user,
    FROM
    `bigquery-public-data.stackoverflow.stackoverflow_posts` sp
    JOIN 
    `bigquery-public-data.stackoverflow.posts_answers` pa
    ON sp.accepted_answer_id=pa.id
    WHERE sp.accepted_answer_id IS NOT NULL
    AND (EXTRACT(YEAR FROM sp.creation_date)=2010)
)
SELECT users.id AS id_user ,COUNT(*) AS count FROM obtainedUserid  AS obt
JOIN `bigquery-public-data.stackoverflow.users` AS users
ON users.id= obt.id_user
GROUP BY users.id
ORDER BY count DESC
LIMIT 10
