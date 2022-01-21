-- Exercise n. 7
-- Find the most popular programming language
-- Public Dataset: bigquery-public-data.github_repos
-- Table involved: languages

SELECT
  col.name AS language_name,
  COUNT(col.name) AS count
FROM
  `bigquery-public-data.github_repos.languages`,
  UNNEST(LANGUAGE) col
GROUP BY col.name
ORDER BY count DESC 
LIMIT 1
