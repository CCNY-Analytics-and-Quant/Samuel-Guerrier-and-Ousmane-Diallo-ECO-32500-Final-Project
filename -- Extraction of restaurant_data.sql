-- Extraction of restaurant_data

/* Filter out restaurants with the safest zipcodes */ 
SELECT [dba],
       [zipcode]
FROM restaurant_data
WHERE ([zipcode] LIKE '11201' OR [zipcode] LIKE '10007' OR [zipcode] LIKE '10013')



/* Returns the number of unique restaurants that were inspected
in the last 7 days */
SELECT TOP 7 [inspection_date],
COUNT (DISTINCT camis) AS Inspected  
FROM violation_data
GROUP BY [inspection_date]
ORDER BY [inspection_date] DESC 



SELECT [camis]
FROM restaurant_data

