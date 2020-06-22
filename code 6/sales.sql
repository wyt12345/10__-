SELECT * FROM fitbit_new.sales;

select tran_id,date into @tran,@wsr from sales where date>'2016-6-10' limit 1;
select * from shipping where tran_id=@tran;

select ship.*  -- 切换到ship
from sales s,shipping ship
where s.tran_id=ship.tran_id and  s.date>'2016-06-10'

explain select s.*,ship.*
from sales s
join shipping ship
on s.tran_id = ship.tran_id
where s.date>'2016-06-10';

