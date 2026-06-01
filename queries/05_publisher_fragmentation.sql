-- Query 5: Publisher Fragmentation by Category
-- Business Question: Which category has the most fragmented publisher landscape?

SELECT 
    CASE "CATEGORY"
        WHEN 'b' THEN 'Business'
        WHEN 't' THEN 'Technology'
        WHEN 'e' THEN 'Entertainment'
        WHEN 'm' THEN 'Medical'
    END AS category_name,
    COUNT(DISTINCT "PUBLISHER") AS unique_publishers,
    COUNT(*) AS total_articles,
    ROUND(COUNT(*) * 1.0 / COUNT(DISTINCT "PUBLISHER"), 1) AS avg_articles_per_publisher
FROM uci_news_aggregator
GROUP BY "CATEGORY"
ORDER BY unique_publishers DESC;
