INSERT INTO silver.ERP_LOC_A101(
cid,
cntry
)

SELECT 
REPLACE(cid,'-','')cid,
CASE WHEN TRIM(cntry) = 'DE' THEN 'Germany'
	 WHEN TRIM(cntry) IN ('US', 'USA') THEN 'United States'
	 WHEN TRIM(cntry) = '' OR cntry IS NULL THEN 'n/a'
	 ELSE TRIM(cntry)
END as cntry
FROM bronze.ERP_LOC_A101;
