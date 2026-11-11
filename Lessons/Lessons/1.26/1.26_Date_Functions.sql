SELECT 
    job_posted_date,
    job_posted_date::DATE AS date,
    job_posted_date::TIME AS TIME,
    job_posted_date::TIMESTAMP AS timestamp,
    job_posted_date::TIMESTAMPTZ AS timestamptz
FROM job_postings_fact
LIMIT 10;



--Extract
SELECT 
    EXTRACT (YEAR FROM job_posted_date) AS job_posted_year,
    EXTRACT (MONTH FROM job_posted_date) AS job_posted_month,
    COUNT(job_id) AS job_count
FROM job_postings_fact
WHERE job_title_short = 'Data Engineer'
GROUP BY
    EXTRACT (YEAR FROM job_posted_date),
    EXTRACT (MONTH FROM job_posted_date)
ORDER BY 
    job_posted_year,
    job_posted_month;

--Date_trunc
SELECT
    job_posted_date,
    Date_trunc ('month', job_posted_date) AS job_posted_month
FROM job_postings_fact
ORDER BY Random ()
LIMIT 10;


SELECT
    Date_trunc('month', job_posted_date) AS job_posted_month,
    COUNT(job_id) AS job_count
FROM job_postings_fact
WHERE 
    job_title_short = 'Data Engineer' AND 
    EXTRACT(YEAR FROM job_posted_date) = 2025
GROUP BY
    Date_trunc('month', job_posted_date)
ORDER BY 
    job_posted_month;


SELECT 
    '2026-01-01 00:00:00+00' :: TIMESTAMPTZ AT TIME ZONE 'CST';


SELECT 
    EXTRACT (HOUR FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST') AS job_posted_hour,
    COUNT(job_id)
FROM 
    job_postings_fact
WHERE 
    job_location LIKE 'New York, NY'
GROUP BY
    EXTRACT (HOUR FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST')
ORDER BY
    job_posted_hour;
