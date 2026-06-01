-- Query 4: Most Niche-Focused Publishers
-- Business Question: Which publishers are the most consistent and category-focused?

SELECT 
    "PUBLISHER",
    COUNT(DISTINCT "CATEGORY") AS total_categories,
    MAX(COUNT(*)) OVER (PARTITION BY "PUBLISHER") AS max_articles_in_one_category,
    COUNT(*) AS total_articles
FROM uci_news_aggregator
GROUP BY "PUBLISHER"
HAVING COUNT(*) > 100
ORDER BY total_categories ASC, total_articles DESC
LIMIT 10;
