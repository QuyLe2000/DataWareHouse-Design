# DataWareHouse-Design
Data warehouse design with staging &amp; star schema: Extract, validate &amp; transform data in staging. Load into star schema (fact &amp; dimension tables). Aggregates &amp; indexes optimize performance. Enables efficient data storage, analysis &amp; reporting.

First, the data collection step, I retrieve data from adventure 2014 bak: https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver16&tabs=ssms.
![bak](https://github.com/QuyLe2000/DataWareHouse-Design/assets/90446677/e8f3d20f-0cc6-4458-b12b-c292b714e711)
Then, i imported to SQL Server by Restore Database

![rs](https://github.com/QuyLe2000/DataWareHouse-Design/assets/90446677/47502a0f-52d5-42cc-8770-03bf73c5443c)
Then
![screenshot_1691572712](https://github.com/QuyLe2000/DataWareHouse-Design/assets/90446677/cd8a113f-c28f-4c67-add6-6d6b874ef3d0)

And i have Database like this, i want to create a Database name "Staging" to load data from this but some tables i need ( In fact, we just get some tables in needed)
This is why i created this database: 
Data Validation and Cleaning: The staging database acts as an intermediate step where you can validate and clean the incoming data. This helps to ensure that the data being loaded into the data warehouse is accurate, consistent, and follows the required data quality standards. You can identify and handle data anomalies, missing values, or inconsistencies in the staging database before moving the data to the data warehouse.

Data Transformation: Often, data from different sources might have varying formats, structures, and data types. The staging database allows you to transform the data into a unified format that is suitable for the data warehouse. This transformation can include tasks like data type conversion, data aggregation, and data enrichment.

Data Auditing and Traceability: Staging databases can be useful for auditing purposes. You can keep track of the changes made to the data during the ETL process. This provides transparency and traceability, which is crucial for compliance, troubleshooting, and understanding how data has been modified before entering the data warehouse.

Performance Optimization: Loading data directly into a data warehouse can be resource-intensive and impact the overall performance of the system, especially if transformations and validations are performed during the load process. Using a staging database allows you to offload some of the processing overhead from the data warehouse, ensuring smoother and more efficient data loading.

Retry and Recovery: If a data load process fails for any reason, having a staging database allows you to easily retry the load without having to go back to the original data sources. This can save time and resources, especially when dealing with large volumes of data.

Minimizing Impact: Loading data directly into the data warehouse can impact the availability and performance of the warehouse for end-users. By using a staging database, you can perform data transformations and validations without affecting the data warehouse's performance. Once the data is ready, you can efficiently transfer it to the data warehouse during off-peak hours.

