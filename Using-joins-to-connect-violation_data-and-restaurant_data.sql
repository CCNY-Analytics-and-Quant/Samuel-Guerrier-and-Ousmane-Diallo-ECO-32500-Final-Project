/* Use of joins to connect the restaurant data to violation data,
using LEFT joins where 'camis' in violation_data is going to be the left index,
in order to get the restaurant that matches the filtered violation_data 
database.*/
/* violation_data is the left table and restaurant_data is the right table */

/* Filtering of the restaurant with the a score of 0, no violations
and the most recent inspection date */
SELECT vio.[camis], 
       res.[camis],
           [dba],
           [boro],
     [inspection_date],
        [action],
        [score]
FROM violation_data vio
LEFT JOIN restaurant_data res
ON vio.camis = res.camis
WHERE ([action] LIKE 'No violations were recorded at the time of this inspection.')
                AND ([score] LIKE '0')
ORDER BY inspection_date DESC

SELECT *
FROM restaurant_data


/* Filtering of the restaurant with the a score of 0, no violations
and the most recent grade date */
SELECT vio.[camis],
       res.[camis],
           [dba],
           [boro],
     [grade_date],
        [action],
        [score]
FROM violation_data vio
LEFT JOIN restaurant_data res
ON vio.camis = res.camis
WHERE ([action] LIKE 'No violations were recorded at the time of this inspection.')
                AND ([score] LIKE '0')
ORDER BY grade_date DESC


/* Filtering of the restaurant with the a score of 0, no violations
and the most recent record date */
SELECT vio.[camis],
       res.[camis],
           [dba],
           [boro],
     [record_date],
        [action],
        [score]
FROM violation_data vio 
LEFT JOIN restaurant_data res
ON vio.camis = res.camis
WHERE ([action] LIKE 'No violations were recorded at the time of this inspection.')
                AND ([score] LIKE '0')
ORDER BY record_date DESC


/* inspection type with the average lowest score, highest grade */
-- Figure out how to use joins with the GROUP BY functions
SELECT vio.[camis],
       res.[camis],
           [dba],
     inspection_type,
    AVG(score) AS ITscore
FROM violation_data vio 
LEFT JOIN restaurant_data res
ON vio.camis = res.camis
GROUP BY inspection_type
ORDER BY ITscore ASC


-- safest zipcodes
SELECT [dba],
       [zipcode]
FROM restaurant_data
WHERE ([zipcode] LIKE '11201' OR [zipcode] LIKE '10007' OR [zipcode] LIKE '10013')


/* This query filters out restaurants that were recently closed down */
SELECT vio.[camis], 
       res.[camis],
           [dba],
           [boro],
     [record_date],
        [action],
        [score]
FROM violation_data vio
LEFT JOIN restaurant_data res
ON vio.camis = res.camis
WHERE ([action] LIKE 'Establishment Closed by DOHMH. Violations were cited in the following area(s) and those requiring immediate action were addressed.')
ORDER BY record_date DESC







