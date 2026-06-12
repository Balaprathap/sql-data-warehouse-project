INSERT INTO silver.ERP_PX_CAT_G1V2
(id,
cat,
subcat,
maintenance)

SELECT
id,
cat,
subcat,
maintenance
FROM bronze.ERP_PX_CAT_G1V2
