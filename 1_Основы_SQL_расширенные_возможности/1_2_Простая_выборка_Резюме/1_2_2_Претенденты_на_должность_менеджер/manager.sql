SELECT DISTINCT applicant, position
FROM resume 
WHERE position LIKE '%менеджер%'
order by applicant;