create table sales(
		transaction_id	 int primary key,
		sale_date	      date,
		Customer_id	   varchar(20),
		gender	      varchar(10),
		age	         int,
		product_category	varchar(20),
		quantity	     int,
		Price_per_unit	   numeric(10,2),
		total_amount      numeric(10,2)

)

select count(*) from sales;

select * from sales limit 10;

--data cleaning (identifying rows with incomplete date)

select * from sales 
		where transaction_id	 is null or 
		sale_date	     		 is null or 
		Customer_id	  			 is null or 
		gender					is null or 
		age	     			    is null or 
		product_category		is null or 
		quantity	   			 is null or 
		Price_per_unit	  		 is null or 
		total_amount    		is null

--data exploration 

--how many revenure we maked 
select sum(Price_per_unit) from sales;

--how many unique customer we have 

select distinct Customer_id  from sales ;
select count(distinct Customer_id)  from sales ;


--count all categorys

select distinct product_category from sales;


--data analysis
--1] Write a sql query to retrieve all columns for sales made on '2023-06-01'

select * from sales;

select * from sales where sale_date ='2023-06-01';

--2] write a query to retrieve all transactions where the category is 'clothing' and the quantity sold is more than and equal to 4 in the month of nov2022

--3] write a query to calculate the total sales for each category

select product_category ,sum(total_amount) ,count(*) as total_orders 
from sales 
group by product_category;

--4] write a query to find the average age of customers who purchased items from electronics category 

select round(avg(age)) 
from sales 
where product_category='Electronics'; 

--5] count all trasactions where the total sale is > 1000

select count(*) from sales  where total_amount>1000;

--6] find the total number of trasactions made by each gender in each category

select * from sales;

select  count(*),gender,product_category  
from sales  
group by gender,product_category  
order by 1

--7] calculate the avg sale for each month.and also find out best selling month in each year

select * from sales;

select  extract (year from sale_date) as year,extract (month from sale_date) as month,round(avg(total_amount))
from sales 
group by 1,2
order by 2 , 
3 desc;

		

--8]find the top 5 customers based on the highest total sales

select * from sales;

select customer_id, sum(total_amount)  as total
from sales
group by customer_id
order by  total desc 
limit 5;

--9]find the number of unique customers who purchased items from each category

select count(*) from sales;

select count(distinct customer_id),product_category 
from sales
group by product_category;

--10]Write a SQL query to create each shift and number of orders(Example Morning <=12, Afternoon Between 12 & 17, Evening >17)




--backlog-7th and 10 th

--11]Create a new book record : 978-1-60129-456-2','To kill a mockingbird','Classic',6.00,'yes','Harper lee','J.B Lippincott & C0'

select * from sales;

insert into sales(     transaction_id	, 
						sale_date	,      
						Customer_id	,   
						gender	,     
						age	,        
						product_category,	
						quantity	,   
						Price_per_unit	,  
						total_amount   )   

values (1111,'2025-09-24','CUST1111', 'Male', 99,'Electronics' , 5 , 1000000 , 500000);


--12] update the quantity of the customer  with ID CUST559  to '16' 

select * from sales;

update sales 
set quantity=16 where customer_id = 'CUST559';

select * from sales where  customer_id = 'CUST559';

--13] Delete the record with transaction_id = 999 from the issued_status table.

delete from sales where transaction_id=999;

--14] Retrive all books issued by specific employee 
-- Objective : Write an sql query to list all were the with customer_id=CUST888

select * from sales where customer_id='CUST888';

--17] Retrive all books from classic category.
-- Objective : Write an sql query to fetch all books from the books table that belong to the 'Classic' category.

select customer_id,transaction_id as total,product_category as total  from sales where product_category='Electronics';


--19] List transactions which registed in the last 180 days
-- Objective : Write an sql query to display all transactions from the last 912 days from todays date

select * from sales;

select* from sales 
where sale_date >=current_date-interval '912 days';


--20]find total revenue by each category

select round(sum(total_amount)) ,product_category  from sales  
group by product_category 
order by 1 desc

--21] Create a table of book with price per unit above a 7

select avg(price_per_unit) from sales;

select * from sales;

create table big_customer as 
select transaction_id,customer_id, total_amount from sales where price_per_unit >450;

select * from big_customer;

--22] Monthly revenue trend
-- How has total revenue changed month by month over the analysis period?
-- Are there any noticeable peaks, drops, or seasonal patterns?

select * from sales;

select date_trunc('month',sale_date) as month , round(sum(total_amount)) as monthly_revenue
from sales 
group by 1
order by 1;

--23] Monthly order count trend
-- How has the number of orders varied month by month?
-- Does order volume follow the same pattern as revenue?

select    date_trunc ('month',sale_date), count(distinct transaction_id) 

from sales
group by 1
order by 1;

--24] Revenue drive analysis (Volume vs AOV)
-- Is overall revenue growth primarily driven by an increses in order volume or by changes in avgrage order value(AOV)?

select * from sales;

select  date_trunc ('month',sale_date) as month,
		count(distinct transaction_id)  as monthly_order_count,
		round(sum(total_amount)) as monthly_revenue

from sales
group by 1
order by 3 desc    limit 5;

-- Volume → how many orders happened

-- AOV (Average Order Value) → how much money one order makes on average

-- Volume vs AOV means:
-- Is revenue increasing because more orders are coming in,
-- or because each order is more expensive?

--25] Revenue by product category.
--How is total revenue distributed across different product categories?
--Which categories are the main revenue drivers?

select * from sales;

select product_category, round(sum(total_amount)) 
from sales

group by 1  
order by 1  desc ;

--26] Customer revenue concentration
--What percentage of total revenue is generated by the top 10 % of customers?
--Does the business rely heavily on a small group of high-value customer?


--27] How does spending behavior vary by gender and age groups?

select * from sales;

select   gender,
		 case    
		 		 when age < 30 then 'Under_30'
		      	 when age between 30 and 49 then '30-49'
				 else '50+'
		 end as age_group,
 		 round(sum(total_amount)) as total_spending

from sales
group by 1,2
order by 1,2 ,3 desc;
				 
--28] Which category to focus on.(Strategic Category Focus)
--Based on revenue & performance trends,which product category should the business prioritize and why?

--Answer: The business should focus on Electronis category,as it generates the highest total revenue,slightly ahead of clothing & beauty,making it the strongest contributor to overall sales.

--29] Is customer concentration a risk?
--Does the revenue concentration among top customers represent a potential business risk?

--Answer: Yes,customer concentration is a potential risk,because a small percentage of top customers contributes a large share of total revenue,

--30]Key Metrics to Track Going Forward
--What three business metrics should be monitored regularly to track growth, stability, and risk?

--Answer: i) Monthly revenue -to monitor overall business groth & seasonality.
--        ii) Monthly order count - to track changes in sustomer demand & volume
--        iii) Top 10% customer revenue share - to watch customer concentration risk.


















