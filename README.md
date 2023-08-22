# Crowdfunding_ETL
Repository for Monash University Bootcamp Project 2

## File structure
- `Resources` directory includes all the .XLSX files used for import and the exported .CSV files
- `ETL_Mini_Project_BChamot.ipynb` is a Jupyter notebook used to import the XLSX and create the CSV files
- `DataExploration.ipynb` is a Jupyter notebook used to analyse the CSV file and recommend a structure for the database (tables, columns and types)
- `crowdfunding_db_schema.sql` is the SQL code used to create the database in Postgres
- `select.sql` is the SQL code used to check the data are correctly imported into the tables

## Database
A database is created in Postgres using `crowdfunding_db_schema.sql`. The following ERD is used for the database

![ERD for crowdfunding_db](ERD.png)

The database is populated with the following files in `Resources`:
- table `campaign` from `campaign.csv`
- table `category` from `category.csv`
- table `subcategory` from `subcategory.csv`
- table `contact` from `contacts.xlsx`