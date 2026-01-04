--Query Syntax Table Analysis OF Performance Analytics Kimia Farma Business Year 2020-2023
CREATE TABLE Kimia_Farma.final_task_dataset AS
SELECT 
    x.transaction_id, x.date,x.branch_id, x.branch_name,x.kota,x.provinsi, x.rating_cabang, x.customer_name, x.product_id, x.product_name, x.actual_price,x.discount_percentage,
    x.persentase_gross_laba, x.nett_sales,
    -- Calculation for Nett Profit: (Actual Price * Gross Laba %) - (Actual Price - Nett Sales)
    (x.actual_price * x.persentase_gross_laba) - (x.actual_price - x.nett_sales) AS nett_profit,
    x.rating as rating_transaksi,
FROM (
    SELECT 
        a.transaction_id, a.date,a.branch_id, b.branch_name, b.kota,b.provinsi, b.rating AS rating_cabang, a.customer_name, a.product_id, c.product_name, c.price AS actual_price,
        a.discount_percentage,
        -- Profit percentage logic based on price tiers
        CASE 
            WHEN c.price <= 50000 THEN 0.10
            WHEN c.price > 50000 AND c.price <= 100000 THEN 0.15
            WHEN c.price > 100000 AND c.price <= 300000 THEN 0.20
            WHEN c.price > 300000 AND c.price <= 500000 THEN 0.25
            WHEN c.price > 500000 THEN 0.30 
        END AS persentase_gross_laba,
        -- Calculation for Nett Sales: Price after discount
        (c.price - (c.price * a.discount_percentage)) AS nett_sales,
        a.rating
    FROM `Kimia_Farma.kf_final_transaction` AS a
    LEFT JOIN `Kimia_Farma.kf_kantor_cabang` AS b 
        ON a.branch_id = b.branch_id
    LEFT JOIN `Kimia_Farma.kf_product` AS c 
        ON a.product_id = c.product_id
) x;

