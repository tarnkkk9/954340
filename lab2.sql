#Show me all orders in November.
select OrderID, CustomerID, EmployeeID, OrderDate from orders
where month(OrderDate) = 11;

#List all shipper taking orders in November
select ShipperName, OrderID, OrderDate from shippers join orders using (ShipperID)
where month(OrderDate) = 11
order by day(OrderDate);

#List top-10 employees receiving the highest total values of order
select FirstName, LastName, round(sum(Quantity * Price),2) as total from orders
join order_details using (OrderID)
join products using (ProductID)
join employees using (EmployeeID)
group by OrderID
order by total desc
limit 10;

#List all orders from “Tokyo Traders” (don’t use join)
select OrderID from order_details
where ProductID in
(select ProductID from products where SupplierID in
(select SupplierID from suppliers where SupplierName ="Tokyo Traders"));
