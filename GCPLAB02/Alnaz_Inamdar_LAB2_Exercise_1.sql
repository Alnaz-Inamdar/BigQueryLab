-- Exercise n1.
-- Given the shared file top_4000_movies_data.csv
-- 1. Create a BigQuery table “Movie”
-- 2. Find the top 10 highest budget films, year by year, from 2016 to 2020


WITH alldata AS(
    SELECT year,Movie_Title,Production_Budget,RANK() OVER(PARTITION BY year ORDER BY Production_Budget DESC) AS rank
    FROM
        (SELECT
            EXTRACT(YEAR FROM Release_Date) AS year,Movie_Title,Production_Budget
            FROM `nttdata-c4e-bde.uc1_14.Movie`
            WHERE Release_Date BETWEEN '2016-01-01' AND '2020-12-31'
        )
)
SELECT
year,Movie_Title,Production_Budget,rank
FROM alldata
where rank<=10
ORDER BY year DESC,
Production_Budget DESC

