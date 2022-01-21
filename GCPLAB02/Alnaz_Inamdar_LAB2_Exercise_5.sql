-- Exercise n. 5
-- Find the top 10 users (the id) who answered the most questions.
-- Public Dataset: bigquery-public-data.stackoverflow
-- Table involved: posts_answers, users

SELECT users.id AS id_user, COUNT(posts_answers.owner_user_id) as count
    FROM `bigquery-public-data.stackoverflow.users` users
INNER JOIN
    `bigquery-public-data.stackoverflow.posts_answers` posts_answers
ON users.id=posts_answers.owner_user_id
WHERE (EXTRACT(YEAR FROM posts_answers.creation_date)=2010)
GROUP BY id_user
ORDER BY count DESC
LIMIT 10