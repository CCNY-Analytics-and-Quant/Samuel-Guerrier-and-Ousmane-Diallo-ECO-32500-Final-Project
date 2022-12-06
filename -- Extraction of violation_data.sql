-- Extraction of violation_data

/* Filtering of the restaurant with the a score of 0, no violations
and the most recent inspection date */
SELECT [camis], 
     [inspection_date],
        [action],
        [score]
FROM violation_data
WHERE ([action] LIKE 'No violations were recorded at the time of this inspection.')
                AND ([score] LIKE '0')
ORDER BY inspection_date DESC 




/* Filtering of the restaurant with the a score of 0, no violations
and the most recent grade date */
SELECT [camis], 
     [grade_date],
        [action],
        [score]
FROM violation_data
WHERE ([action] LIKE 'No violations were recorded at the time of this inspection.')
                AND ([score] LIKE '0')
ORDER BY grade_date DESC



/* Filtering of the restaurant with the a score of 0, no violations
and the most recent record date */
SELECT [camis], 
     [record_date],
        [action],
        [score]
FROM violation_data
WHERE ([action] LIKE 'No violations were recorded at the time of this inspection.')
                AND ([score] LIKE '0')
ORDER BY record_date DESC

/* the camis column in each query will be used to join the restaurants to the 
corresponding violation data */




SELECT * 
FROM violation_data



/* inspection type with the average lowest score, highest grade */
SELECT inspection_type
        , AVG(score) AS ITscore
FROM violation_data
GROUP BY inspection_type
ORDER BY ITscore ASC


/* violation code with the average lowest score, highest grade */
SELECT violation_code
        , AVG(score) AS ITscore
FROM violation_data
GROUP BY violation_code
ORDER BY ITscore ASC
