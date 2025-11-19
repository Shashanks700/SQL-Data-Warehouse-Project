/* 
=====================================================================================================================
DDL Script: Create Bronze Tables
=====================================================================================================================

Script Purpose:
	This script creates tables in the 'bronze' schema, dropping existing tables
	if they already exist.
	Run this script to re-define the DDL structure of 'bronze' tables

=====================================================================================================================
*/



Create or Alter Procedure bronze.load_bronze as
Begin
Declare @start_time Datetime, @end_time datetime, @batch_start_time datetime, @batch_end_time datetime;
Begin Try

set @batch_start_time=GETDATE();
     print('========================');
	 Print('Loading the bronze layer');
	 print('========================');

	 print('--------------------------');
	 print('Loading CRM layer');
	 print('--------------------------');

    set @start_time= GETDATE();
	print('>> Truncating the table: bronze.crm_cust_info');
	Truncate table bronze.crm_cust_info;

	print('>> Inserting the data: bronze.crm_cust_info');
	Bulk insert bronze.crm_cust_info
	from 'C:\Users\ADMIN\Downloads\f78e076e5b83435d84c6b6af75d8a679 (1)\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
	with (
	Firstrow=2,
	Fieldterminator=',',
	Tablock
	);
	set @end_time= GETDATE();
	Print '>> Load Duration: '  + Cast(Datediff(second,@start_time,@end_time) as nvarchar) + '  seconds';
	Print '>>---------------------';


	set @start_time= GETDATE();
	print('>> Truncating the table: bronze.crm_prd_info');
	Truncate table bronze.crm_prd_info;

	print('>> Inserting the data: bronze.crm_prd_info');
	Bulk insert bronze.crm_prd_info
	from 'C:\Users\ADMIN\Downloads\f78e076e5b83435d84c6b6af75d8a679 (1)\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
	with (
	Firstrow=2,
	Fieldterminator=',',
	Tablock
	);
	set @end_time= GETDATE();
	Print '>> Load Duration: '  + Cast(Datediff(second,@start_time,@end_time) as nvarchar) + '  seconds';
	Print '>>---------------------';

	Set @start_time=GETDATE();
    print('>> Truncating the table: bronze.crm_sales_details');
	Truncate table bronze.crm_sales_details;

	print('>> Inserting the data: bronze.crm_sales_details');
	Bulk insert bronze.crm_sales_details
	from 'C:\Users\ADMIN\Downloads\f78e076e5b83435d84c6b6af75d8a679 (1)\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
	with (
	Firstrow=2,
	Fieldterminator=',',
	Tablock
	);
	set @end_time= GETDATE();
	Print '>> Load Duration: '  + Cast(Datediff(second,@start_time,@end_time) as nvarchar) + '  seconds';
	Print '>>---------------------';



     print('--------------------------');
	 print('Loading ERP layer');
	 print('--------------------------')


    set @start_time=GETDATE();
	print('>> Truncating the table: bronze.erp_px_cat_g1v2');
	Truncate table bronze.erp_px_cat_g1v2;

	print('>> Inserting the data: bronze.erp_px_cat_g1v2');
	Bulk insert bronze.erp_px_cat_g1v2
	from 'C:\Users\ADMIN\Downloads\f78e076e5b83435d84c6b6af75d8a679 (1)\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
	with (
	Firstrow=2,
	Fieldterminator=',',
	Tablock
	);
	set @end_time= GETDATE();
	Print '>> Load Duration: '  + Cast(Datediff(second,@start_time,@end_time) as nvarchar) + '  seconds';
	Print '>>---------------------';


	set @start_time=GETDATE();
	print('>> Truncating the table: bronze.erp_cust_az12');
	Truncate table bronze.erp_cust_az12;

	print('>> Inserting the data: bronze.erp_cust_az12');
	Bulk insert bronze.erp_cust_az12
	from 'C:\Users\ADMIN\Downloads\f78e076e5b83435d84c6b6af75d8a679 (1)\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
	with (
	Firstrow=2,
	Fieldterminator=',',
	Tablock
	);
	set @end_time= GETDATE();
	Print '>> Load Duration: '  + Cast(Datediff(second,@start_time,@end_time) as nvarchar) + '  seconds';
	Print '>>---------------------';


	set @start_time=GETDATE()
	print('>> Truncating the table: bronze.erp_loc_a101');
	Truncate table bronze.erp_loc_a101;

	print('>> Inserting the data: bronze.erp_loc_a101');
	Bulk insert bronze.erp_loc_a101
	from 'C:\Users\ADMIN\Downloads\f78e076e5b83435d84c6b6af75d8a679 (1)\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
	with (
	Firstrow=2,
	Fieldterminator=',',
	Tablock
	);
	set @end_time= GETDATE();
	Print '>> Load Duration: '  + Cast(Datediff(second,@start_time,@end_time) as nvarchar) + '  seconds';
	Print '>>---------------------';

	set @batch_end_time=GETDATE();
	Print '---------------------------------------------------------------------'
	Print 'Total Duration of Loading Bronze Layer Whole Batch: ' + Cast(Datediff(second,@batch_start_time,@batch_end_time) as varchar)
			+ ' second'		
	Print 'Data completed loaded in the bronze layer'			
    Print '---------------------------------------------------------------------'
End Try
Begin Catch
   Print('===============================================');
   Print('Error occured during loading bronze layer');
   Print('Error Message') + Error_Message();
   Print('Error Message') + Cast(Error_Number() as nvarchar);
   Print('Error Message') + Cast(Error_state() as nvarchar);
   Print('===============================================');
End Catch
End
