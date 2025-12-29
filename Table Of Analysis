--Creating Table Of Analysis
WITH base_table AS (
  SELECT 
    t.transaction_id,
    t.date,
    t.branch_id,
    c.branch_name,
    c.kota,
    c.provinsi,
    c.rating as rating_cabang,
    t.customer_name,
    t.product_id,
    p.product_name,
    p.price,
    t.discount_percentage,
    -- Perhitungan persentase laba berdasarkan harga produk
    CASE 
      WHEN p.price <= 50000 THEN 0.10
      WHEN p.price > 50000 AND p.price <= 100000 THEN 0.15
      WHEN p.price > 100000 AND p.price <= 300000 THEN 0.20
      WHEN p.price > 300000 AND p.price <= 500000 THEN 0.25
      ELSE 0.30
    END AS persentase_gross_laba,
    t.rating as rating_transaction
  FROM `rakaminkfanalytics-482207.Rakamin_KF_Analytics.kf_final_transaction` AS t
  LEFT JOIN `rakaminkfanalytics-482207.Rakamin_KF_Analytics.kf_kantor_cabang` AS c 
    ON t.branch_id = c.branch_id
  LEFT JOIN `rakaminkfanalytics-482207.Rakamin_KF_Analytics.kf_product` AS p 
    ON t.product_id = p.product_id
)

SELECT 
  *,
  -- Menghitung harga setelah diskon
  (price * (1 - discount_percentage)) AS nett_sales,
  -- Menghitung keuntungan bersih
  ((price * (1 - discount_percentage)) * persentase_gross_laba) AS nett_profit
FROM base_table

