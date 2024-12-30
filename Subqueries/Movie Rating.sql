# Write your MySQL query statement below
# A > B > C> ...
WITH TOP_USER AS (
SELECT MR.user_id, U.name, COUNT(*) AS CNT
    FROM
        MovieRating MR
    LEFT JOIN
        Users U
    ON MR.user_id = U.user_id
    GROUP BY MR.user_id, U.name
)
, TOP_MOVIES AS (
SELECT MR.movie_id, M.title, AVG(rating) AS avg_rating
    FROM
        MovieRating MR
    LEFT JOIN
        Movies M
    ON MR.movie_id = M.movie_id
    WHERE created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY MR.movie_id, M.title
)
SELECT
(
    SELECT name
        FROM TOP_USER
        WHERE cnt = (SELECT MAX(cnt) FROM TOP_USER)
        ORDER BY name
        LIMIT 1
) AS results
UNION ALL
SELECT
(
    SELECT title
        FROM TOP_MOVIES
        WHERE avg_rating = (SELECT MAX(avg_rating) FROM TOP_MOVIES)
        ORDER BY title
        LIMIT 1
)  AS results
