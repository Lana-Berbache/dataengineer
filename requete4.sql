SELECT rental.customer_id, customer.first_name, customer.last_name, address.address,address.city,       address.postal_code, COUNT(*) 
FROM `rental` join `address` join `customer`
WHERE customer.address_id =address.address_id and rental.customer_id = customer.customer_id 
GROUP BY customer_id 
HAVING COUNT(*)=(SELECT  MAX(nb) 
FROM (SELECT rental.customer_id, customer.first_name, customer.last_name, address.address,address.city,       address.postal_code,  COUNT(*)  nb
      FROM `rental` join `address` join `customer`
      WHERE customer.address_id =address.address_id and rental.customer_id = customer.customer_id
      GROUP BY rental.customer_id) as maxxx);