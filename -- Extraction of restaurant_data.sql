-- Extraction of restaurant_data

/* Filter out restaurants with the safest zipcodes */ 

SELECT [dba],
       [zipcode]
FROM restaurant_data
WHERE ([zipcode] LIKE '11201' OR [zipcode] LIKE '10007' OR [zipcode] LIKE '10013')