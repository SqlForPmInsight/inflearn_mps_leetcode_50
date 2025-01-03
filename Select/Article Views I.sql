# Write your MySQL query statement below
SELECT DISTINCT author_id AS id
    FROM Views
    WHERE author_id = viewer_id #at least one of their own articles
    ORDER BY id