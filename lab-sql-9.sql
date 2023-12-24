-- Create a table rentals_may to store the data from rental table with information for the month of May.
-- Insert values in the table rentals_may using the table rental, filtering values only for the month of May.
CREATE TABLE rentals_may AS
SELECT *
FROM rental
WHERE EXTRACT(MONTH FROM rental_date) = 5; -- Extracts the month from the rental_date

-- Create a table rentals_june to store the data from rental table with information for the month of June.
-- Insert values in the table rentals_june using the table rental, filtering values only for the month of June.
CREATE TABLE rentals_june AS
SELECT *
FROM rental
WHERE EXTRACT(MONTH FROM rental_date) = 6;

-- Check the number of rentals for each customer for May.
SELECT c.customer_id, c.first_name, c.last_name, COUNT(rm.rental_id) AS rental_count
FROM customer c
JOIN rentals_may rm ON c.customer_id = rm.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY rental_count DESC;
    
    -- Check the number of rentals for each customer for June
    
SELECT c.customer_id, c.first_name, c.last_name, COUNT(rm.rental_id) AS rental_count
FROM customer c JOIN rentals_june rm ON c.customer_id = rm.customer_id
GROUP BY c.customer_id , c.first_name , c.last_name
ORDER BY rental_count DESC;