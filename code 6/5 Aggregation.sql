
/***************
 * Aggregation * 
 ***************/
select count(*) as total_no from sales;-- 计算

-- Find minimum msrp of all products
select min(msrp) from product; -- 找到最小的价格

-- Find maximum msrp of all products
select max(msrp) from product;-- 找到最大

select msrp from product order by msrp desc limit 4;

-- Top 2 MSRP of all products;
select name,msrp  -- 基于指导价格，以降序排，只取两条数据
from product
order by msrp desc
limit 2;

-- Find average msrp of all products
select avg(msrp) from product;-- 指导价格平均值

-- Find how many kind of products we have

-- Find total of msrp of all kind of products
select AVG(msrp), class 
from product
group by class;


-- Find total sales revenue(amount);-- 总共的销售额
select  sum(price*quantity) as sales_amount 
from sales;
select sum(amount) as salest  -- view
from fitbit_new.sales_amount;



/***************
 *  Group by   * 
 ***************/
-- total sales revenue(amount);
/* format to $xxx.xxn 给出钱币格式concat*/
SELECT concat('$ ',format(sum(amount),2)) as d_amount FROM fitbit_new.sales_amount;

-- Find total sales revenue by product. Order by sales_amount desendingly;
SELECT concat('$ ',format(sum(amount),2)) as d_amount, product_id
FROM fitbit_new.sales_amount
group by product_id
order by d_amount asc;  -- 降序升序有问题，当字符串处理了2 4 5

SELECT sum(amount) as d_amount, product_id
FROM fitbit_new.sales_amount
group by product_id
order by d_amount asc;  -- 升序

SELECT sum(amount) as d_amount, product_id
FROM fitbit_new.sales_amount
group by product_id
order by d_amount ;-- 默认升序ascend

SELECT sum(amount) as d_amount, product_id
FROM fitbit_new.sales_amount
group by product_id
order by d_amount desc;-- 降序descend

-- total # of transactions by product

-- practice: calculate total sales amount, # of transactons, min amount, max amount, 
-- avg amount, total units by product name. Order by total_amounts desendingly;

-- 报表 
CREATE OR REPLACE VIEW product_sales as
select 
    p.name,
	sum(amount) totalsales_amount_amount,
    count(s.tran_id) cnt_tran,
    min(amount) min_amount,
    max(amount) max_amount,
    sum(s.quantity) total_unints
from sales_amount s , product p
where s.product_id = p.product_id
group by p.name
order by total_amount desc; -- reporting


-- average price vs weighted(total) average price;



-- count distinct product and client that have sales;
select count(distinct product_id) dist_product, sales.client_id,
       count(*) total
from sales
group by client_id
;

-- how many different/unique products each client purchased;
select c.name, count(distinct s.product_id) dist_product, c.client_id
from sales s, client c
where s.client_id = c.client_id  -- 在前
group by s.client_id
HAVING dist_product > 2 -- 在后s.product 不可以
;


-- find clients that purchase more than 1 unique products;
select c.name,c.client_id,count(distinct s.product_id) dist_product
from sales s,client c
WHERE s.client_id = c.client_id
GROUP BY c.name
HAVING dist_product > 1;

-- practice: find products that are sold less than 20 units;
select p.name,sum(quantity) as total_quantity
from sales s
left join product p
on s.product_id = p.product_id
group by s.product_id-- 基于产品做整合，算出每个产品的总和
HAVING total_quantity<20
;


-- practice: total sales by weekday. hint: use WEEKDAY function to get weekday;
select WE
from sales
where s.date ;

/***************
 * Aggregation * 
 实时：
 随查，能看到  --reporting,BI dashboard,view
 蹦字，数据产生，到我们系统 real-time view 做不了，MySQL只做数据存储
 画图也不可以
 
 数据产生=》数据库=》tabulea/power BI/EXCEL +MYSQL(SQL)
 
 python Numpy pandas matpoltilib
 
 ***************/


