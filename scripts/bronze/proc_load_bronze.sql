EXEC bronze.load_bronze;

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME , @batch_start_time DATETIME, @batch_end_time DATETIME;
	BEGIN TRY
		SET @batch_start_time = GETDATE()
		print '============================================================';
		PRINT 'Loading Bronze Layer';
		print '============================================================';
		print '------------------------------------------------------------';
		PRINT 'Loading CRM Tables';
		print '------------------------------------------------------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.crm_cust_info';
		TRUNCATE TABLE BRONZE.crm_cust_info;

		PRINT '>> Inserting Data Into: bronze.crm_cust_info';
		BULK INSERT BRONZE.crm_cust_info
		FROM 'C:\Users\balap\OneDrive\Documents\sql\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK 
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF (SECOND, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '<<------------------------>>'

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.crm_prd_info';
		TRUNCATE TABLE BRONZE.crm_prd_info;

		PRINT '>> Inserting Data Into: bronze.crm_prd_info';
		BULK INSERT BRONZE.crm_prd_info
		FROM 'C:\Users\balap\OneDrive\Documents\sql\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK 
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF (SECOND, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '<<------------------------>>'


		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.crm_sales_details';
		TRUNCATE TABLE BRONZE.crm_sales_details;

		PRINT '>> Inserting Data Into: bronze.crm_sales_details';
		BULK INSERT BRONZE.crm_sales_details
		FROM 'C:\Users\balap\OneDrive\Documents\sql\datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK 
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF (SECOND, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '<<------------------------>>'


		print '------------------------------------------------------------'
		PRINT 'Loading ERP Tables'
		print '------------------------------------------------------------'

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.ERP_CUST_AZ12';
		TRUNCATE TABLE BRONZE.ERP_CUST_AZ12;

		PRINT '>> Inserting Data Into: bronze.ERP_CUST_AZ12';
		BULK INSERT BRONZE.ERP_CUST_AZ12
		FROM 'C:\Users\balap\OneDrive\Documents\sql\datasets\source_erp\CUST_AZ12.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK 
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF (SECOND, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '<<------------------------>>'


		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.ERP_LOC_A101';
		TRUNCATE TABLE BRONZE.ERP_LOC_A101;

		PRINT '>> Inserting Data Into: bronze.ERP_LOC_A101';
		BULK INSERT BRONZE.ERP_LOC_A101
		FROM 'C:\Users\balap\OneDrive\Documents\sql\datasets\source_erp\LOC_A101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK 
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF (SECOND, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '<<------------------------>>'


		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.ERP_PX_CAT_G1V2';
		TRUNCATE TABLE BRONZE.ERP_PX_CAT_G1V2;

		PRINT '>> Inserting Data Into: bronze.ERP_PX_CAT_G1V2';
		BULK INSERT BRONZE.ERP_PX_CAT_G1V2
		FROM 'C:\Users\balap\OneDrive\Documents\sql\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK 
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF (SECOND, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '<<------------------------>>';
		SET @batch_end_time = GETDATE();
		PRINT '<<------------------------>>';
		PRINT 'Loading Bronze Layer is Completed';
		PRINT '>> Batch Duration :' + CAST(DATEDIFF (SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR) + 'seconds';
		PRINT '<<------------------------>>';

		END TRY
		BEGIN CATCH
		PRINT '====================================================';
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER';
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '====================================================';
		END CATCH
END
