use ecommerce;
-- Q 3
select cus_gender, count(cus_gender) from customer_table
inner join order_table on customer_table.cus_id = order_table.cus_id 
where ord_amount >= 3000
group by cus_gender;

-- Q 4
select cus_id, product_details_table.prod_id, ord_id, pro_name, product_table.pro_id
from order_table
inner join product_details_table on product_details_table.prod_id = order_table.prod_id
inner join product_table on product_table.pro_id = product_details_table.pro_id
where order_table.cus_id = 2;

-- Q 5
select supplier_details.supp_id, supplier_details.supp_name, supplier_details.supp_city, supplier_details.supp_phone
pro_name, count(product_details_table.pro_id) as "No. of products"
from product_table
inner join product_details_table on product_details_table.pro_id = product_table.pro_id
inner join supplier_details on supplier_details.supp_id = product_details_table.supp_id
group by product_details_table.supp_id having count(product_table.pro_name) > 1;
-- Q 6
select category_table.cat_id, category_table.cat_name, product_table.pro_name, ord_amount
from category_table
inner join product_table on product_table.cat_id = category_table.cat_id
inner join product_details_table on  product_details_table.pro_id = product_table.pro_id
inner join order_table on  order_table.prod_id= product_details_table.prod_id  
having min(order_table.ord_amount);

-- Q 7
select product_details_table.prod_id, product_table.pro_name, ord_date
from order_table
inner join product_details_table on product_details_table.prod_id = order_table.prod_id
inner join product_table on product_table.pro_id = product_details_table.pro_id
where order_table.ord_date >  "2021-10-05";

-- Q 8
Select cus_name, cus_gender from customer_table where cus_name like "A%" or cus_name like "%A" order by cus_name;

-- Q 9
call ecommerce_rating;