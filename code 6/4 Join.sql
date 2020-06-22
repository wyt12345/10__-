
/***************
 * join tables *
 ***************/
 
-- list all sales for FLEX and BLAZE;
select date, s.product_id,p.name,client_id,price,quantity
from sales s,product p
where name in ('FLEX', 'BLAZE') and s.product_id=p.product_id;
-- what happens without a.product_id=b.product_id;
-- use table alias;

select date, s.product_id,p.name,client_id,price,quantity
from sales s
left join product p
on name in ('FLEX', 'BLAZE') and s.product_id=p.product_id;
 
 
-- practice: list all transactions with Amazon;



-- practice: list sales date, client_name, sales_amount for FLEX;



-- list all sales with msrp > 100 and quantity >= 10, or quality >= 100; ignore non-existing product_id in PRODUCT;
-- ignore non-existing product_id in PRODUCT;



/***************
*     Join     * 
***************/

-- list all transactions; show shipping status if there is any;



-- show all transactions with shipping status;

/* inner join */
select date, s.product_id,p.name,client_id,price,quantity
from sales s,product p
where name in ('FLEX', 'BLAZE') and s.product_id=p.product_id;
-- list all shipments with shipping status; show client_id and product_id if exists;
-- list all shipping status with client_id and product_id;
/* right join */
select date, s.product_id,p.name,client_id,price,quantity
from sales s
left join product p
on name in ('FLEX', 'BLAZE') and s.product_id=p.product_id;

-- list all sales and shipping status in one table;


-- list all transactions and shipping status in one table;
/* full join MySQL不支持*/

; -- MySQL doesn't support full join!


/*********************
 *    set operators  *
 *********************/
-- union 同类型组合一下,不予许有重复，对于不同条件变量的不一致的不可以合并，允许的column必须是一致的，这样才能给他们加到一块;
select * from sales
where tran_id>2
union
select * from sales
where tran_id<4;
-- union all 同类型组合一下,会有重复，就是想结合，可以允许有重复;
select * from sales
where tran_id>2
union all
select * from sales
where tran_id<4;

select product_id tran_id,mrsp price from product where product_id>2
union
select tran_id,price from sales where tran_id<4;

select date,p.name,s.quantity
from sales s join product p
on s.product_id=p.product_id;

-- intersect



-- except


