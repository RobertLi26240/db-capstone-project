
-- Week 2 Exercise 1
-- Task 1
CREATE VIEW OrdersView AS
SELECT OrderID, OrderQuantity, OrderTotalCost
FROM Orders
WHERE OrderQuantity > 2;


Select * from OrdersView;

-- Task 2

select 
Orders.CustomerID, CustomerName, OrderID, OrderTotalCost, MenuName, CourseName, StarterName
from Orders
join Customers
on Orders.CustomerID = Customers.CustomerID
join Menu
on Orders.FoodID = Menu.MenuID
order by
OrderTotalCost 
limit 4;


-- Task 3

select MenuName from Menu, Orders
where Menu.MenuID = Orders.OrderID
and Orders.Orderquantity > any (
select OrderQuantity
from Orders
where OrderQuantity > 2
)

-- Week 2 Exercise 2
-- Task 1
delimiter //
create procedure GetMaxQuantity ()
begin
select max(OrderQuantity) from Orders;
end //
delimiter ;

CALL GetMaxQuantity();

-- Task 2
PREPARE GetOrderDetail from 'select OrderID, OrderQuantity, OrderTotalCost FROM Orders where OrderID = ?';


-- Task 3
delimiter //
create procedure CancelOrder (in ID int)
begin
delete from Orders where OrderID = ID;
end //
delimiter ;
