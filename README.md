# Pharmaceutical-Sales-Data-analysis
1. Project Overview

This project focuses on analyzing pharmaceutical sales data to identify sales trends, product performance, and time-based patterns.
The objective was to transform raw sales data into meaningful insights that can support business and operational decision-making.

The project follows an end-to-end data analytics workflow using Python, SQL, and Power BI, followed by structured reporting.

2. Dataset Description

Number of Records: ~2100 daily observations

Data Granularity: Daily sales

Key Columns:

Date

Product sales (ATC drug codes)

Year

Month

Weekday

Product Codes and Drug Categories (ATC Classification)

M01AB – Anti-inflammatory & antirheumatic drugs (Acetic acid derivatives)

M01AE – Anti-inflammatory & antirheumatic drugs (Propionic acid derivatives)

N02BA – Analgesics (Salicylic acid derivatives)

N02BE – Analgesics (Pyrazolones)

N05B – Psycholeptics (Anxiolytics)

N05C – Psycholeptics (Hypnotics & sedatives)

R03 – Drugs for obstructive airway diseases

R06 – Antihistamines for systemic use

These product codes follow the WHO ATC drug classification system.

3. Tools and Technologies Used
Python

Loaded and explored the raw dataset

Converted date columns to proper format

Verified missing values and data consistency

Saved cleaned data for further analysis

SQL (PostgreSQL)

Imported cleaned data into the database

Performed aggregation and validation checks

Analyzed product-wise, weekday-wise, and time-based patterns

Power BI

Reshaped data using unpivoting for flexible analysis

Created calculated measures for business metrics

Built an interactive dashboard with slicers

4. Data Preparation and Modeling

Key preparation steps included:

Correcting data types for dates and numeric fields

Reshaping wide product columns into a long format with:

Product_Code

Sales

Creating a Total Sales measure to represent overall sales volume

This data model supports accurate filtering, aggregation, and visualization.

5. Dashboard Design

The Power BI dashboard was designed as a single-page interactive report with the following components:

Key Metrics

Total Sales – Overall pharmaceutical sales volume

Visualizations

Monthly Sales Trend – Shows seasonality and trend over time

Product Performance – Compares sales contribution by ATC drug code

Weekday Sales Analysis – Highlights demand variation across weekdays

Interactive Filters (Slicers)

Year

Month

Product Code

6. Key Insights

Seasonal Sales Pattern:
Sales decline during mid-year and recover toward the end of the year, indicating seasonality.

Product Concentration:
A limited number of drug categories contribute a major share of total sales, while some products show relatively low performance.

Weekday Variability:
Sales are not evenly distributed across weekdays, suggesting opportunities for operational and sales planning.

Year-wise Comparison:
Year-based filtering reveals variations in overall performance, enabling comparative analysis across periods.

7. Business Impact

Helps identify high-performing and low-performing drug categories

Supports inventory and supply planning

Assists in sales force and promotion strategy

Enables data-driven decision-making through interactive analysis

8. Conclusion

This project demonstrates a complete data analytics lifecycle, from data cleaning and SQL analysis to interactive dashboard development and reporting.
The insights generated provide a strong foundation for strategic and operational decision-making in a pharmaceutical sales context
