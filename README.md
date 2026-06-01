# 📰 News Aggregator — SQL Analysis Portfolio

**Tool:** PostgreSQL  
**Dataset:** [UCI News Aggregator Dataset](https://www.kaggle.com/datasets/uciml/news-aggregator-dataset) — 422,419 news articles  
**Author:** Mulyadi | [LinkedIn](https://linkedin.com/in/justmulyadi) | [GitHub](https://github.com/Mulyadi-Leo)

---

## 🎯 Project Overview

This project analyzes a large-scale news aggregator dataset using PostgreSQL to answer key business questions around content distribution, publisher behavior, and publication timing patterns.

The analysis simulates the kind of questions a media analyst or digital content strategist would ask — directly applicable to real-world publishing and editorial decision-making.

---

## ❓ Business Questions Answered

| # | Question |
|---|----------|
| 1 | Which news category dominates the market? |
| 2 | Who are the top publishers in each category? |
| 3 | What time of day sees the most article publications? |
| 4 | Which publishers are the most niche-focused and consistent? |
| 5 | Which category has the most fragmented publisher landscape? |

---

## 🗄️ Dataset Structure

| Column | Type | Description |
|--------|------|-------------|
| ID | BIGINT | Unique article identifier |
| TITLE | TEXT | Article headline |
| URL | TEXT | Article URL |
| PUBLISHER | VARCHAR | Publisher name |
| CATEGORY | VARCHAR | b=Business, t=Technology, e=Entertainment, m=Medical |
| STORY | VARCHAR | Story cluster ID |
| HOSTNAME | VARCHAR | Publisher domain |
| TIMESTAMP | BIGINT | Unix timestamp (milliseconds) |

---

## 📊 Key Findings

### 1. Category Distribution
Entertainment leads with over 36% of all articles, while Medical remains a niche segment at 10.8%.

| Category | Total Articles | Share |
|----------|---------------|-------|
| Entertainment | 152,469 | 36.09% |
| Business | 115,967 | 27.45% |
| Technology | 108,344 | 25.65% |
| Medical | 45,639 | 10.80% |

> **Insight:** The market is heavily skewed toward Entertainment. Medical content is underserved relative to its importance — a potential opportunity for specialized publishers.

---

### 2. Top 5 Publishers per Category
Reuters dominates Business with 3,157 articles. Medical has the most fragmented top 5 — no single publisher holds a commanding lead (max: 381 articles).

| Category | Publisher | Articles |
|----------|-----------|----------|
| Business | Reuters | 3,157 |
| Business | NASDAQ | 1,922 |
| Business | Businessweek | 1,822 |
| Entertainment | Contactmusic.com | 2,309 |
| Entertainment | Entertainmentwise | 1,595 |
| Technology | Tech Times | 813 |
| Technology | Ubergizmo | 762 |
| Medical | Headlines & Global News | 381 |
| Medical | Tech Times | 362 |

> **Insight:** Business and Entertainment have clear market leaders. Technology and Medical are more competitive — harder to dominate but more open to new entrants.

---

### 3. Publication Time Patterns
Peak publishing hours are 20:00–22:00 (UTC), but midnight–03:00 is surprisingly active — likely driven by publishers operating in US/European timezones.

| Hour (UTC) | Total Articles | Share |
|------------|---------------|-------|
| 20:00 | 25,940 | 6.14% |
| 21:00 | 23,351 | 5.53% |
| 18:00 | 22,948 | 5.43% |
| 22:00 | 22,435 | 5.31% |
| 00:00 | 21,986 | 5.20% |
| 03:00 | 21,300 | 5.04% |

> **Insight:** Publishing traffic is spread across the day with evening peaks. Indonesian media publishers targeting global audiences should consider scheduling content between 18:00–22:00 UTC for maximum exposure.

---

### 4. Most Niche-Focused Publishers
All top 10 consistent publishers cover only 1 category — mostly Entertainment. Niche publishers outperform generalists in focus but not in total volume.

| Publisher | Categories Covered | Total Articles |
|-----------|-------------------|---------------|
| CarterMatt.com | 1 | 317 |
| MarketPulse (blog) | 1 | 268 |
| Crushable | 1 | 264 |
| OK! Magazine | 1 | 211 |
| AndroidOrigin | 1 | 210 |

> **Insight:** Specialized publishers maintain strong category focus. Generalist publishers sacrifice depth for breadth.

---

### 5. Publisher Fragmentation by Category
Entertainment and Business have the most unique publishers (6,600+) but low average articles per publisher — indicating a highly fragmented, competitive market.

| Category | Unique Publishers | Total Articles | Avg Articles/Publisher |
|----------|------------------|---------------|----------------------|
| Entertainment | 6,612 | 152,469 | 23.1 |
| Business | 6,420 | 115,967 | 18.1 |
| Technology | 6,224 | 108,344 | 17.4 |
| Medical | 5,098 | 45,639 | 9.0 |

> **Insight:** Medical has the fewest publishers AND the lowest average output per publisher — suggesting it is the least contested space with the most room for a focused publisher to build authority.

---

## 📁 Repository Structure

```
news-analysis-sql/
│
├── README.md
├── queries/
│   ├── 01_category_distribution.sql
│   ├── 02_top_publisher_per_category.sql
│   ├── 03_publish_time_pattern.sql
│   ├── 04_publisher_consistency.sql
│   └── 05_publisher_fragmentation.sql
└── results/
    ├── 01_category_distribution.csv
    ├── 02_top_publisher_per_category.csv
    ├── 03_publish_time_pattern.csv
    ├── 04_publisher_consistency.csv
    └── 05_publisher_fragmentation.csv
```

---

## 🛠️ How to Reproduce

1. Download dataset from [Kaggle](https://www.kaggle.com/datasets/uciml/news-aggregator-dataset)
2. Create PostgreSQL database: `CREATE DATABASE news_analysis;`
3. Create table using schema in `queries/00_setup.sql`
4. Import CSV via pgAdmin or `COPY` command
5. Run queries in `queries/` folder in order

---

## 💡 Skills Demonstrated

- PostgreSQL query writing (SELECT, GROUP BY, JOINS, Subqueries, Window Functions)
- Unix timestamp conversion using `TO_TIMESTAMP()`
- Window functions: `RANK() OVER`, `SUM() OVER`
- Business-oriented data interpretation
- Documentation and structured reporting
