# retail-sales-analysis-sql
This project analyzes retail transaction data using SQL for data exploration, business analysis, and reporting, along with basic data quality profiling using Python.

It demonstrates how raw transactional data can be validated, explored, and transformed into business insights using common data analyst workflows.

## Project Overview

Tools: SQL (PostgreSQL), Python (Pandas) – used for analysis and basic data quality checks  
Type: Data Analysis and Data Quality Assessment (Beginner level)  

The dataset contains sales transactions including customer details, product categories, quantities, pricing, and dates. The analysis focuses on revenue trends, customer behavior, product performance, and basic business risk indicators.

## Dataset Structure

Table: sales  

Columns:  

- transaction_id    
- sale_date    
- customer_id    
- gender    
- age  
- product_category  
- quantity  
- price_per_unit  
- total_amount  

## Files Included

- sales_analysis.sql – table creation, data cleaning queries, analytical queries, and business metrics
- sales_data.csv – raw dataset
- data_profiling_report.html – generated YData Profiling report  

## Analysis Performed (SQL)

### Data validation and exploration

- Row count and data sampling
- Null value detection across all columns
- Unique customer count
- Category distribution

### Revenue and performance analysis

- Total revenue calculation
- Category-wise revenue and order counts
- Top 5 customers by total spending
- High-value transaction identification
- Gender and age-group spending behavior

## Time-based analysis

- Daily and monthly revenue trends
- Monthly order volume trends
- Best-performing months by revenue
- Recent transaction filtering using date intervals

### Business analytics

- Revenue drivers analysis (order volume vs average order value)
- Product category contribution to total revenue
- Customer revenue concentration (top customers)
- Strategic category focus recommendation
- Basic business risk assessment due to customer concentration

### Data transformation

- CRUD operations (INSERT, UPDATE, DELETE)
- Derived table creation using CTAS (big_customer table)

## Example Business Questions Answered

- How much revenue does the business generate overall?
- Which product categories drive the most revenue?
- Who are the highest-value customers?
- How does revenue change month to month?
- Is revenue driven more by order volume or by order value?
- Is the business dependent on a small group of customers?
- How does spending vary by gender and age group?

## How to Run

### SQL
1.Create a database  
2.Create the sales table using the provided schema  
3.Import the CSV data  
4.Run sales_analysis.sql to execute all analysis queries  

### Python
1.Open Profiling.ipynb  
2.Install dependencies (pandas, ydata-profiling)  
3.Run all cells to generate the profiling report  

### Skills Demonstrated
- SQL table design and querying
- Data validation and cleaning in SQL
- Business-oriented analytical queries
- Date-based trend analysis
- Customer segmentation
- Revenue analysis
- CTAS for derived tables
- Automated data profiling using Python

## Example Use Cases
- Monitor monthly sales performance
- Identify key revenue drivers
- Detect data quality issues early
- Support product and pricing strategy decisions
- Assess customer concentration risk

## Author

Yadnyesh Thakare  
LinkedIn: https://linkedin.com/in/yadnyesh-thakare  
Gmail: thakareyadnyesh@gmail.com  

## Summary


This project demonstrates a practical workflow for analyzing retail transaction data using SQL and validating dataset quality using Python-based automated profiling. It reflects real-world tasks commonly performed in entry-level data analyst and reporting roles, including data cleaning, trend analysis, customer segmentation, and business metric evaluation.


