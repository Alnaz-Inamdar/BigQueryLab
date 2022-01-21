-- Exercise n. 8
-- Find the top 10 committers in 2016 on Github repositories that uses the Java language
-- Public Dataset: bigquery-public-data.github_repos
-- Tables involved: languages, sample_commits

SELECT samplecommit.committer.name as name, count(samplecommit.repo_name) as count
    FROM 
    `bigquery-public-data.github_repos.sample_commits`as samplecommit
JOIN 
    `bigquery-public-data.github_repos.languages` as lang
ON samplecommit.repo_name = lang.repo_name,
UNNEST(language) as la
WHERE (EXTRACT(YEAR FROM samplecommit.committer.date)=2016) 
AND (la.name = "Java")
GROUP BY name
ORDER BY count DESC
LIMIT 10