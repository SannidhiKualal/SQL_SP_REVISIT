SELECT f.* FROM public.factspupcomingcattleactivitydm AS f
SELECT
    farmername,
    farmsubdistrict,
    farmlocality,
    COALESCE(spname, 'Unknown SP') as associated_sp,
    cattlename,
    activity,
    MAX(TRIM(TO_CHAR(activityduedate, 'Day')) || ', ' ||
    TO_CHAR(activityduedate, 'DD Month YYYY')) as activity_due_date
FROM factspupcomingcattleactivitydm
WHERE activityduedate BETWEEN '2024-01-26' AND '2026-01-11'
    AND farmername = ' abhaysinhzala'
    AND farmlocality = 'Sutrapada'
    AND activity = 'Deworming'
GROUP BY farmername, farmsubdistrict, farmlocality, spname, cattlename, activity, activityduedate
ORDER BY farmername, activityduedate

SELECT
    farmername,
    farmsubdistrict,
    farmlocality,
    COALESCE(spname, 'Unknown SP') as associated_sp,
    cattlename,
    activity,
    MAX(TRIM(TO_CHAR(activityduedate, 'Day')) || ', ' ||
    TO_CHAR(activityduedate, 'DD Month YYYY')) as activity_due_date
FROM factspupcomingcattleactivitydm
WHERE activityduedate BETWEEN '2024-12-25' AND '2026-01-11'
GROUP BY farmername, farmsubdistrict, farmlocality, spname, cattlename, activity, activityduedate
ORDER BY farmername, activityduedate






SELECT 
    farmername,
    farmsubdistrict,
    farmlocality,
    COALESCE(spname, 'Unknown SP') as associated_sp,
    cattlename,
    activity,
    COUNT(*) as record_count
FROM factspupcomingcattleactivitydm
WHERE activityduedate BETWEEN '2022-12-25' AND '2026-01-12'
GROUP BY farmername, farmsubdistrict, farmlocality, spname, cattlename, activity
ORDER BY farmername, activityduedate;


SELECT 
    activity,
    COUNT(*) as activity_count
FROM factspupcomingcattleactivitydm
WHERE activityduedate BETWEEN '2022-12-25' AND '2026-01-12'
GROUP BY activity
ORDER BY activity_count DESC;



SELECT 
    farmername,
    farmsubdistrict,
    farmlocality,
    COALESCE(spname, 'Unknown SP') as associated_sp,
    cattlename,
    activity,
    COUNT(*) as record_count
FROM factspupcomingcattleactivitydm
WHERE activityduedate BETWEEN '2020-12-25' AND '2026-01-12'
GROUP BY farmername, farmsubdistrict, farmlocality, spname, cattlename, activity
ORDER BY farmername, activityduedate;


SELECT 
    farmername,
    farmsubdistrict,
    farmlocality,
    COALESCE(spname, 'Unknown SP') as associated_sp,
    cattlename,
    activity,
    COUNT(*) as record_count
FROM factspupcomingcattleactivitydm
WHERE activityduedate BETWEEN '2020-12-25' AND '2026-01-12'
GROUP BY farmername, farmsubdistrict, farmlocality, spname, cattlename, activity
ORDER BY farmername, record_count DESC;


SELECT COUNT(*) as total_records
FROM factspupcomingcattleactivitydm
 f.organisationid ='a7832639-0686-41f1-9b6e-21616b99c92f'
WHERE activityduedate BETWEEN '2020-12-25' AND '2026-01-12';


SELECT COUNT(*) as total_records
FROM factspupcomingcattleactivitydm f
WHERE f.organisationid = 'a7832639-0686-41f1-9b6e-21616b99c92f'
  AND activityduedate BETWEEN '2020-12-25' AND '2026-01-12';



SELECT COUNT(DISTINCT f.spuserid ) AS total_records
FROM factspupcomingcattleactivitydm f
WHERE 1=1
  AND LOWER(TRIM(f.activity)) != 'login'
  AND CAST(f.activityduedate AS DATE) >= '2020-12-25'
  AND CAST(f.activityduedate AS DATE) <= '2026-01-12'
 
  
  SELECT COUNT(DISTINCT f.spuserid) AS total_records
FROM factspupcomingcattleactivitydm f
WHERE LOWER(TRIM(f.activity)) != 'login'
  AND f.activityduedate >= '2020-12-25'
  AND f.activityduedate <= '2026-01-12'
  
  
  
  SELECT
    farmername,
    farmsubdistrict,
    farmlocality,
    COALESCE(spname, 'Unknown SP') as associated_sp,
    cattlename,
    activity,
    MAX(TRIM(TO_CHAR(activityduedate, 'Day')) || ', ' ||
    TO_CHAR(activityduedate, 'DD Month YYYY')) as activity_due_date
FROM factspupcomingcattleactivitydm
WHERE activityduedate BETWEEN '2024-01-26' AND '2026-01-11'
GROUP BY farmername, farmsubdistrict, farmlocality, spname, cattlename, activity, activityduedate
ORDER BY farmername, activityduedate


-- Get count
SELECT COUNT(*) as total_records
FROM factspupcomingcattleactivitydm
WHERE activityduedate BETWEEN '2024-01-26' AND '2026-01-12';

-- Get paginated data
SELECT
    farmername,
    farmsubdistrict,
    farmlocality,
    COALESCE(spname, 'Unknown SP') as associated_sp,
    cattlename,
    activity,
    TO_CHAR(activityduedate, 'Day, DD Month YYYY') as activity_due_date
FROM factspupcomingcattleactivitydm
WHERE activityduedate BETWEEN '2024-01-26' AND '2026-01-12'
ORDER BY farmername, activityduedate
LIMIT 10 OFFSET 0;

SELECT COUNT(DISTINCT farmerid) as total_records
FROM (
    SELECT DISTINCT
        farmername,
        farmsubdistrict,
        farmlocality,
        spname,
        cattlename,
        activity,
        activityduedate
    FROM factspupcomingcattleactivitydm
    WHERE 1=1
        AND CAST(activityduedate AS DATE) >= '2024-01-26'
        AND CAST(activityduedate AS DATE) <= '2026-01-12'
) subquery;

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'factspupcomingcattleactivitydm'
ORDER BY ordinal_position;



SELECT COUNT(*) as total_records
FROM (
    SELECT DISTINCT
        farmerid,
        farmername,
        farmsubdistrict,
        farmlocality,
        spname,
        cattleid,
        cattlename,
        activity,
        activityduedate
    FROM factspupcomingcattleactivitydm
    WHERE 1=1
        AND CAST(activityduedate AS DATE) >= '2024-01-26'
        AND CAST(activityduedate AS DATE) <= '2026-01-12'
) subquery;


SELECT COUNT(DISTINCT spname ) as total_records
FROM factspupcomingcattleactivitydm
WHERE 1=1
    AND CAST(activityduedate AS DATE) >= '2024-01-26'
    AND CAST(activityduedate AS DATE) <= '2026-01-12';

SELECT COUNT(*) AS total_records
FROM (
    SELECT DISTINCT
        f.farmerid,
        f.farmername,
        f.farmsubdistrict,
        f.farmlocality,
        f.spname,
        f.cattleid,
        f.cattlename,
        f.activity,
        f.activityduedate
    FROM factspupcomingcattleactivitydm f
    WHERE 1=1
        AND CAST(f.activityduedate AS DATE) >= '2024-01-26'
        AND CAST(f.activityduedate AS DATE) <= '2026-01-12'
) subquery;


SELECT COUNT(DISTINCT f.activity) AS total_records
FROM factspupcomingcattleactivitydm f
WHERE 1=1
    AND CAST(f.activityduedate AS DATE) >= '2024-01-26'
    AND CAST(f.activityduedate AS DATE) <= '2026-01-12';

SELECT COUNT(DISTINCT f.activity  ) AS total_records
FROM factspupcomingcattleactivitydm f
WHERE 1=1
  AND LOWER(TRIM(f.activity)) != 'login'
   AND CAST(f.activityduedate AS DATE) >= '2024-01-26'
    AND CAST(f.activityduedate AS DATE) <= '2026-01-12';


SELECT COUNT(DISTINCT f.activityid) AS total_activities, COUNT(DISTINCT f.farmid) AS unique_farms,
COUNT(DISTINCT f.spuserid) AS active_service_providers FROM factspactivitydetaildm f WHERE 1=1 AND
LOWER(TRIM(f.activity)) != 'login' AND
CAST(f.activityrecordeddate AS DATE) >= '2024-01-26' AND CAST(f.activityrecordeddate AS DATE) <= '2024-01-26' and
CAST(f.activitydoneon AS DATE) >= '2026-01-26' AND CAST(f.activitydoneon AS DATE) <= '2024-01-26'
 
SELECT COUNT(DISTINCT v.spuserid) AS total_service_providers FROM vworganizationspassociationdetails v
WHERE v.isassociationactive = TRUE AND v.isuseractive = TRUE AND v.associationenddate IS NULL
SELECT 
  f.spname AS sp_name,
  STRING_AGG(DISTINCT f.sprole, ', ') AS sp_role,
  COUNT(DISTINCT f.farmid) AS farms_with_activities,
  COUNT(DISTINCT f.activityid) AS activity_count
FROM factspactivitydetaildm f
WHERE 1=1
  AND LOWER(TRIM(f.activity)) != 'login'
  AND CAST(f.activityrecordeddate AS DATE) >= '2024-01-26'
  AND CAST(f.activityrecordeddate AS DATE) <= '2026-01-12'
  AND CAST(f.activitydoneon AS DATE) >= '2024-01-26'
  AND CAST(f.activitydoneon AS DATE) <= '2026-01-12'
GROUP BY f.spname
ORDER BY f.spname
LIMIT 10 OFFSET 0;


 SELECT * FROM (
  SELECT DISTINCT ON (
    COALESCE(spname, '')::text,
    COALESCE(activity, '')::text,
    COALESCE(activitydetail, '')::text,
    CAST(activitydoneon AS DATE),
    COALESCE(farmername, '')::text,
    COALESCE(farmsubdistrict, '')::text,
    COALESCE(farmlocality, '')::text,
    COALESCE(cattlename, '')::text,
    COALESCE(breed, '')::text,
    COALESCE(ageofcattle, 0),
    COALESCE(currentlactation, 0),
    COALESCE(latestweight, 0)::numeric(10,2),
    COALESCE(latestbcs, 0)::numeric(10,2),
    COALESCE(cattlecategory, '')::text,
    COALESCE(breedcyclestatus, '')::text,
    CAST(cattlelatestdewormingdate AS DATE),
    CAST(cattlelatestvaccinationdate AS DATE),
    CAST(cattlelatestcmtdate AS DATE)
  )
  *
  FROM factspactivitydetaildm
  WHERE
    LOWER(TRIM(activity)) != 'login'
    AND spname IN ('vishesh tyagj')
    AND activity IN ('LabTest', 'Calving', 'Deworming', 'Heat', 'Insemination', 'Farm Registration', 'Incoming Call')
    AND activitydoneon >= '2025-01-01'
    AND activitydoneon <= '2026-01-15'
    AND activityrecordeddate >= '2026-01-01'
    AND activityrecordeddate <= '2026-01-20'
  ORDER BY
    COALESCE(spname, '')::text,
    COALESCE(activity, '')::text,
    COALESCE(activitydetail, '')::text,
    CAST(activitydoneon AS DATE),
    COALESCE(farmername, '')::text,
    COALESCE(farmsubdistrict, '')::text,
    COALESCE(farmlocality, '')::text,
    COALESCE(cattlename, '')::text,
    COALESCE(breed, '')::text,
    COALESCE(ageofcattle, 0),
    COALESCE(currentlactation, 0),
    COALESCE(latestweight, 0)::numeric(10,2),
    COALESCE(latestbcs, 0)::numeric(10,2),
    COALESCE(cattlecategory, '')::text,
    COALESCE(breedcyclestatus, '')::text,
    CAST(cattlelatestdewormingdate AS DATE),
    CAST(cattlelatestvaccinationdate AS DATE),
    CAST(cattlelatestcmtdate AS DATE),
    id
) AS deduplicated
