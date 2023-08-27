# DataWareHouse-Design-With-SSIS-SQL
Data warehouse design with staging &amp; star schema: Extract, validate &amp; transform data in staging. Load into star schema (fact &amp; dimension tables). Aggregates &amp; indexes optimize performance. Enables efficient data storage, analysis &amp; reporting.

First, the data collection step, I retrieve data from adventure 2014 bak: https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver16&tabs=ssms.
![bak](https://github.com/QuyLe2000/DataWareHouse-Design/assets/90446677/e8f3d20f-0cc6-4458-b12b-c292b714e711)
Then, i imported to SQL Server by Restore Database

![rs](https://github.com/QuyLe2000/DataWareHouse-Design/assets/90446677/47502a0f-52d5-42cc-8770-03bf73c5443c)
Then

![screenshot_1691572712](https://github.com/QuyLe2000/DataWareHouse-Design/assets/90446677/cd8a113f-c28f-4c67-add6-6d6b874ef3d0)

And I have Database like this :

![rs](https://github.com/QuyLe2000/DataWareHouse-Design/assets/90446677/d694870c-660b-4ee4-bb75-06ce7d4da5bd)

After that, i want to create a Database name "Staging" to load data from this but some tables i need ( In fact, we just get some tables in needed)
This is why i created this database: 
Data Validation and Cleaning: The staging database acts as an intermediate step where you can validate and clean the incoming data. This helps to ensure that the data being loaded into the data warehouse is accurate, consistent, and follows the required data quality standards. You can identify and handle data anomalies, missing values, or inconsistencies in the staging database before moving the data to the data warehouse.

Data Transformation: Often, data from different sources might have varying formats, structures, and data types. The staging database allows you to transform the data into a unified format that is suitable for the data warehouse. This transformation can include tasks like data type conversion, data aggregation, and data enrichment.

Data Auditing and Traceability: Staging databases can be useful for auditing purposes. You can keep track of the changes made to the data during the ETL process. This provides transparency and traceability, which is crucial for compliance, troubleshooting, and understanding how data has been modified before entering the data warehouse.

Performance Optimization: Loading data directly into a data warehouse can be resource-intensive and impact the overall performance of the system, especially if transformations and validations are performed during the load process. Using a staging database allows you to offload some of the processing overhead from the data warehouse, ensuring smoother and more efficient data loading.
I used SISS to load data from Data Source to Staging Database:
An example , i loaded Employee Table 
![image](https://github.com/QuyLe2000/DataWareHouse-Design/assets/90446677/cef874d8-7620-4c88-8df2-ead61ec3d6b9)

![image](https://github.com/QuyLe2000/DataWareHouse-Design/assets/90446677/3d664458-4620-4e2a-b4ec-e1f3e526d56d)


My staging database:

![rs](https://github.com/QuyLe2000/DataWareHouse-Design/assets/90446677/c5cb557e-0726-4b54-9318-94687dbffe49)

Then i use SSIS to load data from Staging to Data Warehouse.Finally, I have a data Warehouse with Star Schema like this :

![image](https://github.com/QuyLe2000/DataWareHouse-Design/assets/90446677/5c6e5e84-0bf8-40d5-ab92-a64792e5fb3b)

