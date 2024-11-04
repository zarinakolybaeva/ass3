WITH BoardingOrder AS (
    SELECT 
        person_name,
        weight,
        turn,
        SUM(weight) OVER (ORDER BY turn) AS cumulative_weight
    FROM 
        Queue
)
SELECT 
    person_name
FROM 
    BoardingOrder
WHERE 
    cumulative_weight <= 1000
ORDER BY 
    turn DESC
LIMIT 1;
