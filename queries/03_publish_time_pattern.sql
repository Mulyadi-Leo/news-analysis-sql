-- Query 3: Publication Time Pattern
-- Business Question: What time of day sees the most article publications?
-- Note: TIMESTAMP column is Unix time in milliseconds

SELECT 
    EXTRACT(HOUR FROM TO_TIMESTAMP("TIMESTAMP" / 1000)) AS hour_of_day,
    COUNT(*) AS total_articles,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS percentage
FROM uci_news_aggregator
GROUP BY hour_of_day
ORDER BY total_articles DESC
LIMIT 10;
