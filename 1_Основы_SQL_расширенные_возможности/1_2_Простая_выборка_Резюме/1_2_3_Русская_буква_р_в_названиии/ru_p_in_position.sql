SELECT DISTINCT applicant, position, date_birth
FROM resume 
WHERE position LIKE '%р'
order by position, date_birth asc;