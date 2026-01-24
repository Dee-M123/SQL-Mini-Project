**Coffee Shop Sales Analysis**

Coffee shops are an integral part of daily routines in many cities, serving as both social hubs and convenient stops for customers throughout the day. 
Understanding what drives revenue in such environments is essential for optimizing operations, staffing, and product offerings.
Using transactional sales data from a multi-location coffee shop chain, this project analyzes sales performance across store locations, product categories, 
and time periods, with the goal of identifying patterns that can support data-driven business decisions.

Dataset provided by: https://www.kaggle.com/datasets/divu2001/coffee-shop-sales-analysis

**General Overview of the Dataset**

The dataset contains detailed transactional records, including information on store locations, products sold, transaction timing, quantities, and total sales values.

An initial inspection revealed that while the dataset was rich in information, it required substantial preparation before analysis. Column naming conventions were inconsistent,
with mixed casing and whitespace. Date-related information was fragmented across multiple columns (month, day name, hour), requiring reconstruction of a proper transaction date. 
Several derived columns were numeric but stored as strings, and some columns were not analytically useful in their original form.

No duplicated transactions were found. However, particular attention was required during data ingestion to ensure correct data types, foreign key alignment, 
and full loading of transaction records into the SQL database. Once cleaned and validated, the dataset was structured into relational tables representing stores, products, and transactions, enabling efficient SQL-based analysis.

**Possible Areas of Exploration**

Given the nature of the dataset, several business-relevant questions emerged:

Do certain store locations consistently outperform others?
Are coffee products truly the primary revenue drivers, or do alternative products contribute more?
Are there identifiable peak sales periods that could inform staffing and operational planning?
Based on these considerations, the following hypotheses were formulated.

**Hypotheses**

    H1: Certain store locations generate higher total revenue than others.

    H2: Coffee products contribute more to overall revenue than non-coffee products.

    H3: Sales revenue peaks during specific hours of the day.
    

**Findings**

    Store Performance (H1) Supported
Revenue varies significantly across store locations. Some locations consistently outperform others, not due to higher prices, 
but because they serve a greater number of customers. Average transaction values remain consistent across stores, indicating standardized pricing.
Among the three locations analyzed, Astoria generates the highest total revenue, driven by higher transaction volume.

Product Contribution (H2) Not Supported
Contrary to expectations, non-coffee products generate more total revenue than coffee products. The difference is driven by customer purchasing behavior rather than pricing,
as average transaction values are similar across product groups. This suggests that while coffee is the core product, customers frequently favor alternative offerings such as tea
and other beverages.

    Time-Based Sales Patterns (H3) Supported
Sales revenue shows a clear peak during the morning hours, particularly between 7:00 AM and 10:00 AM.
The highest concentration of both customers and revenue occurs at 9:00 AM.
Revenue declines steadily after the morning peak, with significantly lower activity in the late evening.

    Additional Purchasing Behavior Insight
Analysis of transaction quantities reveals that customers typically purchase single items per transaction. As a result, revenue growth is driven by customer volume rather than basket size, 
reinforcing the importance of foot traffic and peak-hour optimization.

**Project Structure**

 coffee-shop-sales-analysis
│

├──  data

│   ├── raw

│   ├── cleaned

│   ├── sql_table_csv

│   └── sql_python_visualisation_csv

│

├──  notebooks

│   ├── python

│   │   ├── 01_data_cleaning_sql.ipynb

│   │   ├── 02_erd_csv_creation.ipynb

│   │   └── 03_mini_project_visualisation.ipynb

│   │

│   └── sql

│       ├── 01_sql_mini_project_database_creation.sql

│       └── 02_sql_queries_and_analysis_mini_proj.sql

│

└── README.md

**How to Run the Project**
Environment Requirements

This project was developed using:

    Python 3 (Google Colab)

    MySQL & MySQL Workbench

    Python Libraries

    pandas

    matplotlib

(All required libraries are pre-installed in Google Colab.)

**Execution Order**

Data Cleaning (Python);

            Run 01_data_cleaning_sql.ipynb to clean raw data and reconstruct date fields.
            

ERD-Based CSV Creation (Python);

            Run 02_erd_csv_creation.ipynb to generate SQL-ready CSV files.
            

Database Creation (SQL);

            Execute 01_sql_mini_project_database_creation.sql to create tables and relationships.
            

Data Import (MySQL Workbench);


            Import CSV files into MySQL using the Table Data Import Wizard.
            

SQL Analysis;

            Run 02_sql_queries_and_analysis_mini_proj.sql to test hypotheses and export results.

Visualization (Python);

            Run 03_mini_project_visualisation.ipynb to create charts using exported SQL results.
            

**Key Insights**

Revenue differences across stores are driven by customer volume, not pricing.
Non-coffee products outperform coffee in total revenue, despite coffee being the core offering.
Morning hours represent the most critical revenue window.
Customers tend to make single-item purchases, emphasizing the importance of foot traffic.

**Conclusion**

This analysis demonstrates that revenue optimization in coffee shop environments depends less on pricing strategies and more on customer behavior, timing, and location performance. 
Morning peak hours, high-traffic locations, and strong demand for non-coffee products emerge as the most important levers for improving overall revenue. By aligning staffing, inventory,
and promotions with these patterns, coffee shop chains can make more informed and effective operational decisions.
