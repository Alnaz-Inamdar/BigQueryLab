-- Exercise n. 3
-- Find how many times a page it was visited in July 2017. Group by date the result
-- Public Dataset: bigquery-public-data.google_analytics_sample
-- Table involved: ga_sessions_201707* (wildcard)

SELECT 
    CONCAT(
        SUBSTR(date,1,4),'-',SUBSTR(date,5,2),'-',SUBSTR(date,7,2)
    ) AS date,
    hit.page.pagePath AS pagePath, COUNT(hit.page.pagePath) AS counter
FROM 
    `bigquery-public-data.google_analytics_sample.ga_sessions_201707*`,
    UNNEST(hits) AS hit
GROUP BY date, pagePath
ORDER BY date,counter DESC