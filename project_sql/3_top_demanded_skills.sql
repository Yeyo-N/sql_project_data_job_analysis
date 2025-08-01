SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    (job_title LIKE 'Data Scien%'
        OR job_title LIKE 'AI%'
        OR job_title LIKE 'A.I%'
        OR job_title LIKE 'ML%'
        OR job_title LIKE 'Machin%')
    AND job_work_from_home = TRUE
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 10
