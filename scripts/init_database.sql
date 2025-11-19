
/* 
================================================================================================================================
Create Database and Schemas
================================================================================================================================
This script creates new database and also creating three layers of schemas within the database which are 'bronze', silver and 'gold'*/

-- Create Database 'DataWareHouse'

Create Database DataWarehouse;
Go

Use Database DataWarehouse;
Go

-- Create Schemas


Create Schema bronze;
Go

Create Schema silver;
Go

Create Schema gold;
Go
