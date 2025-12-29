# Kimia Farma Sales Analysis (2020-2023)

This project provides a comprehensive analysis of Kimia Farma's business performance across Indonesia using **Google BigQuery**. This analysis was developed as part of the **Big Data Analytics Intern** project at Kimia Farma.

## 📊 Key Insights
* **Branch Network:** 1.725 branches strategically distributed throughout Indonesia.
* **Top Contributor:** West Java Province, leading with a net sales value of **Rp94.9 Billion**.
* **Leading Product Category:** *Psycholeptics* drugs (Hypnotics & Anxiolytics) are the highest sales contributors, accounting for **20.1%** of total product sales.
* **Operational Scale:** Successfully processed **672,458 transactions** from **264,601 customers** between 2020 and 2023.

## 💻 BigQuery Syntax Example
Below is the SQL query used to analyze sales performance by province:

```sql
--TOP 10 Total transaksi dan Nett Sales Cabang Provinsi
SELECT 
  provinsi,
    COUNT(DISTINCT transaction_id) AS total_transaksi,
  ROUND(SUM(nett_sales)) AS total_pendapatan
FROM 
  `rakaminkfanalytics-482207.Rakamin_KF_Analytics.KF_Tabel_Analisis`
GROUP BY 
  1
ORDER BY 
  total_transaksi DESC
LIMIT 10;
