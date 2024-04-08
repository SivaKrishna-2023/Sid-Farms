SELECT v.Vehicle_id,
       o.Product_Name,
       SUM(o.Quantity) AS Total_Quantity
FROM Customers c
JOIN Routes r ON c.Route_id = r.Route_id
JOIN Vehicles v ON r.Vehicle_id = v.Vehicle_id
JOIN Orders o ON c.Customer_id = o.Customer_id
WHERE o.Order_status = 'confirmed'
  AND o.Delivery_date BETWEEN [start_date] AND [end_date]
GROUP BY v.Vehicle_id, o.Product_Name;