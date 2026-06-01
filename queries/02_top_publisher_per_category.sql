-- Query 2: Top 5 Publishers per Category
-- Business Question: Who are the top publishers in each category?

SELECT category_name, publisher, total
FROM (
    SELECT 
        CASE "CATEGORY"
            WHEN 'b' THEN 'Business'
            WHEN 't' THEN 'Technology'
            WHEN 'e' THEN 'Entertainment'
            WHEN 'm' THEN 'Medical'
        END AS category_name,
        "PUBLISHER" AS publisher,
        COUNT(*) AS total,
        RANK() OVER (
            PARTITION BY "CATEGORY" 
            ORDER BY COUNT(*) DESC
        ) AS rank
    FROM uci_news_aggregator
    GROUP BY "CATEGORY", "PUBLISHER"
) ranked
WHERE rank <= 5
ORDER BY category_name, total DESC;
