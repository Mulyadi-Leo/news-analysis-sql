-- Query 1: Category Distribution
-- Business Question: Which news category dominates the market?

SELECT 
    CASE "CATEGORY"
        WHEN 'b' THEN 'Business'
        WHEN 't' THEN 'Technology'
        WHEN 'e' THEN 'Entertainment'
        WHEN 'm' THEN 'Medical'
    END AS category_name,
    COUNT(*) AS total_articles,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS percentage
FROM uci_news_aggregator
GROUP BY "CATEGORY"
ORDER BY total_articles DESC;
