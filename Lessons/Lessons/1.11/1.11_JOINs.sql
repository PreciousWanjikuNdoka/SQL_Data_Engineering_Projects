SELECT
    jpf.job_id,
    jpf.job_title_short,
    cd.company_id,
    cd.name AS company_name,
    jpf.job_location
FROM
    job_postings_fact AS jpf
LEFT JOIN company_dim AS cd
    ON jpf.company_id = cd. company_id
LIMIT 10;



SELECT
    jpf.job_id,
    jpf.job_title_short,
    cd.company_id,
    cd.name AS company_name,
    jpf.job_location
FROM
    job_postings_fact AS jpf
RIGHT JOIN company_dim AS cd
    ON jpf.company_id = cd. company_id
LIMIT 10;



SELECT
    jpf.job_id,
    jpf.job_title_short,
    cd.company_id,
    cd.name AS company_name,
    jpf.job_location
FROM
    job_postings_fact AS jpf
INNER JOIN company_dim AS cd
    ON jpf.company_id = cd. company_id
LIMIT 10;



SELECT
    jpf.job_id,
    jpf.job_title_short,
    cd.company_id,
    cd.name AS company_name,
    jpf.job_location
FROM
    job_postings_fact AS jpf
FULL OUTER JOIN company_dim AS cd
    ON jpf.company_id = cd. company_id
LIMIT 10;



SELECT *
FROM skills_job_dim
LIMIT 10;

SELECT *
FROM skills_dim
LIMIT 10;