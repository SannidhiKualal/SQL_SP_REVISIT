SELECT f.* FROM public.factspactivitydetaildm AS f

SELECT DISTINCT ON (cattlename, activitydoneon)
  activitydetail AS "Activity Detail",
  TO_CHAR(activitydoneon, 'DD Mon YYYY') AS "Activity Date",
  farmername AS "Farmer Name",
  farmsubdistrict AS "Sub-District",
  farmlocality AS "Locality",
  cattlename AS "Cattle Name",
  breed AS "Breed",
  ageofcattle AS "Age (Months)",
  currentlactation AS "Lactation",
  CONCAT('Weight: ', latestweight, ' BCS: ', COALESCE(latestbcs::text, 'N/A')) AS "Weight / BCS",
  cattlecategory AS "Cattle Category",
  breedcyclestatus AS "Breed Cycle Status",
  CASE 
    WHEN cattlelatestdewormingdate >= CURRENT_DATE - INTERVAL '3 months' THEN 'Yes'
    ELSE 'No'
  END AS "Dewormed (3M)",
  CASE 
    WHEN cattlelatestvaccinationdate >= CURRENT_DATE - INTERVAL '1 year' THEN 'Yes'
    ELSE 'No'
  END AS "Vaccination (1Y)",
  CASE 
    WHEN cattlelatestcmtdate >= CURRENT_DATE - INTERVAL '3 months' THEN 'Yes'
    ELSE 'No'
  END AS "CMT Done (3M)"
FROM factspactivitydetaildm
WHERE
  LOWER(TRIM(activity)) != 'login'
  AND spname IN ('Ajay Solanki')
  AND farmlocality IN ('Bolas')
  AND activity IN ('Weight')
  AND (cattlelatestvaccinationdate < CURRENT_DATE - INTERVAL '1 year'
       OR cattlelatestvaccinationdate IS NULL)
  AND (cattlelatestdewormingdate < CURRENT_DATE - INTERVAL '3 months'
       OR cattlelatestdewormingdate IS NULL)
  AND (cattlelatestcmtdate < CURRENT_DATE - INTERVAL '3 months'
       OR cattlelatestcmtdate IS NULL)
  AND activitydoneon >= '2022-04-15'
  AND activitydoneon <= '2025-01-15'
  AND activityrecordeddate >= '2022-04-15'
  AND activityrecordeddate <= '2026-01-23'
ORDER BY cattlename, activitydoneon DESC, id DESC;







SELECT COUNT(DISTINCT v.spuserid) AS total_service_providers FROM vworganizationspassociationdetails v WHERE 

v.organizationid IN ('a7832639-0686-41f1-9b6e-21616b99c92f') 

AND v.isassociationactive = TRUE and

v.isuseractive = TRUE AND 

v.associationenddate IS null



SELECT 
  spname AS "Service Provider",
  sprole AS "Role",
  COUNT(DISTINCT farmlocality) AS "Farms With Activities",
  COUNT(*) AS "Activity Count"
FROM factspactivitydetaildm
WHERE
  LOWER(TRIM(activity)) != 'login'
  AND activitydoneon >= '2026-01-15'
  AND activitydoneon <= '2026-01-15'
  AND activityrecordeddate >= '2026-01-15'
  AND activityrecordeddate <= '2026-01-15'
GROUP BY spname, sprole
ORDER BY spname
LIMIT 10;


-- For SP Name Filter dropdown:
SELECT DISTINCT spname
FROM factspactivitydetaildm
WHERE spname IS NOT NULL 
  AND TRIM(spname) != ''
  AND spname NOT IN (
    SELECT DISTINCT spname
    FROM factspactivitydetaildm
    WHERE LOWER(TRIM(activity)) != 'login'
      AND spname IS NOT NULL
  )
  AND LOWER(TRIM(activity)) = 'login'
ORDER BY spname



SELECT 
  spname,
  activity,
  activitydetail,
  activitydoneon,
  activityrecordeddate,
  farmername,
  cattlename
FROM factspactivitydetaildm
WHERE spname = 'Narayan Jagtap'
ORDER BY activityrecordeddate DESC, activitydoneon desc



SELECT DISTINCT 
  spname,
  spuserid 
FROM factspactivitydetaildm
WHERE organisationid = 'f5a001bf-dc0b-42d0-b23c-040dedff17f6'
  AND spname IS NOT NULL 
  AND TRIM(spname) != ''
ORDER BY spname




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
  spname, activity, activitydetail, activitydoneon, farmername, 
  farmsubdistrict, farmlocality, cattlename, breed, ageofcattle, 
  currentlactation, latestweight, latestbcs, cattlecategory, 
  breedcyclestatus, cattlelatestdewormingdate, cattlelatestvaccinationdate, 
  cattlelatestcmtdate, id
  FROM factspactivitydetaildm
  WHERE
    LOWER(TRIM(activity)) != 'login'
    AND activitydoneon >= '2024-04-15'
    AND activitydoneon <= '2026-01-09'
    AND activityrecordeddate >= '2023-04-13'
    AND activityrecordeddate <= '2026-01-26'
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
  spname, activity, activitydetail, activitydoneon, farmername,
  farmsubdistrict, farmlocality, cattlename, breed, ageofcattle,
  currentlactation, latestweight, latestbcs, cattlecategory,
  breedcyclestatus, cattlelatestdewormingdate, cattlelatestvaccinationdate,
  cattlelatestcmtdate, id
  FROM factspactivitydetaildm
  WHERE
    LOWER(TRIM(activity)) != 'login'
    AND spname = 'Akshat Jain'
    AND activity = 'Outgoing Call'
    AND farmsubdistrict = 'Bengaluru Urban'
    AND farmlocality = 'Bengaluru'
    AND activitydoneon >= '2024-04-15'
    AND activitydoneon <= '2026-01-09'
    AND activityrecordeddate >= '2023-04-13'
    AND activityrecordeddate <= '2026-01-26'
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



SELECT DISTINCT
  spname,
  spuserid
FROM factspactivitydetaildm
WHERE organisationid = 'f5a001bf-dc0b-42d0-b23c-040dedff17f6'
  AND spname IS NOT NULL
  AND TRIM(spname) != ''
  AND spuserid IN (
    SELECT DISTINCT spuserid
    FROM factspactivitydetaildm
    WHERE organisationid = 'f5a001bf-dc0b-42d0-b23c-040dedff17f6'
      AND LOWER(TRIM(activity)) != 'login'
  )
ORDER BY spname









SELECT COUNT(DISTINCT f.activityid) AS total_activities, COUNT(DISTINCT f.farmid) AS unique_farms,

COUNT(DISTINCT f.spuserid) AS active_service_providers FROM factspactivitydetaildm f WHERE 1=1 AND 

LOWER(TRIM(f.activity)) != 'login' 

AND CAST(f.activityrecordeddate AS DATE) >= '2024-04-15' AND CAST(f.activityrecordeddate AS DATE) <= '2026-01-15' 

AND CAST(f.activitydoneon AS DATE) >= '2025-03-03' AND CAST(f.activitydoneon AS DATE) <= '2026-01-23'



SELECT COUNT(DISTINCT v.spuserid) AS total_service_providers FROM vworganizationspassociationdetails v WHERE 

v.organizationid IN ('a7832639-0686-41f1-9b6e-21616b99c92f') 

AND v.isassociationactive = TRUE and

v.isuseractive = TRUE AND 

v.associationenddate IS null




SELECT 
  COUNT(DISTINCT f.activityid) AS total_activities, 
  COUNT(DISTINCT f.farmid) AS unique_farms,
  COUNT(DISTINCT f.spuserid) AS active_service_providers 
FROM factspactivitydetaildm f 
WHERE 1=1 
  AND LOWER(TRIM(f.activity)) != 'login' 
  AND f.organisationid IN ('a7832639-0686-41f1-9b6e-21616b99c92f')
  AND f.spname in ('01 jagdish vala')
  AND f.farmsubdistrict in ('Achhidra')
  AND f.sprole in ('VOLUNTEER')
  AND f.activity in ('Cattle Registration')
  AND CAST(f.activitydoneon AS DATE) >= '2023-01-14' 
  AND CAST(f.activitydoneon AS DATE) <= '2026-01-08'
  AND CAST(f.activityrecordeddate AS DATE) >= '2023-01-14' 
  AND CAST(f.activityrecordeddate AS DATE) <= '2026-01-23'
  
  
  
  
  SELECT
  COUNT(DISTINCT f.activityid) AS total_activities,
  COUNT(DISTINCT f.farmid) AS unique_farms,
  COUNT(DISTINCT f.spuserid) AS active_service_providers
FROM factspactivitydetaildm f
WHERE 1=1
  AND LOWER(TRIM(f.activity)) != 'login'
  AND f.organisationid = 'a7832639-0686-41f1-9b6e-21616b99c92f'
AND f.spname = '01 jagdish vala'
  AND f.farmlocality  = 'Achhidra'
  and f.sprole ='VOLUNTEER'
  and f.activity ='Cattle Registration'
  
  SELECT 
  spname,
  activity,
  activitydoneon,
  activityrecordeddate,
  farmsubdistrict,
  sprole
FROM factspactivitydetaildm f
WHERE f.organisationid = 'a7832639-0686-41f1-9b6e-21616b99c92f'
  AND f.spname = '01 jagdish vala'
  AND f.farmlocality  = 'Achhidra'
  and f.sprole ='VOLUNTEER'
  and f.activity ='Cattle Registration'
LIMIT 10
  
  SELECT *
FROM factspactivitydetaildm f 
WHERE f.spname = '01 jagdish vala'
LIMIT 5



SELECT
  f.spname,
  f.sprole,
  f.activity,
  f.activitydetail,
  f.activitydoneon,
  f.activityrecordeddate,
  f.farmername,
  f.farmsubdistrict,
  f.farmlocality,
  f.cattlename,
  f.breed,
  f.activityid,
  f.farmid
FROM factspactivitydetaildm f
WHERE 1=1
  AND LOWER(TRIM(f.activity)) != 'login'
  AND f.organisationid = 'a7832639-0686-41f1-9b6e-21616b99c92f'
  AND f.spname = '01 jagdish vala'
  AND f.farmlocality = 'Achhidra'
  AND f.sprole = 'VOLUNTEER'
  AND f.activity = 'Cattle Registration'
  AND CAST(f.activitydoneon AS DATE) >= '2023-01-14' 
  AND CAST(f.activitydoneon AS DATE) <= '2026-01-08'
  AND CAST(f.activityrecordeddate AS DATE) >= '2023-01-14' 
  AND CAST(f.activityrecordeddate AS DATE) <= '2026-01-23'
ORDER BY f.activityrecordeddate DESC, f.activitydoneon DESC

  
  
  SELECT
  spname,
  activity,
  activitydetail,
  activitydoneon,
  farmername,
  farmsubdistrict,
  farmlocality,
  cattlename,
  breed,
  COUNT(*) as duplicate_count
FROM factspactivitydetaildm f
WHERE 1=1
  AND LOWER(TRIM(f.activity)) != 'login'
  AND f.organisationid = 'a7832639-0686-41f1-9b6e-21616b99c92f'
  AND f.spname = '01 jagdish vala'
  AND f.farmlocality = 'Achhidra'
  AND f.sprole = 'VOLUNTEER'
  AND f.activity = 'Cattle Registration'
GROUP BY 
  spname, activity, activitydetail, activitydoneon, farmername,
  farmsubdistrict, farmlocality, cattlename, breed
  
  
  
  
  SELECT COUNT(*) as distinct_record_count
FROM (
  SELECT DISTINCT
    f.spname,
    f.sprole,
    f.activity,
    f.activitydetail,
    f.activitydoneon,
    f.farmername,
    f.farmsubdistrict,
    f.farmlocality,
    f.cattlename,
    f.breed
  FROM factspactivitydetaildm f
  WHERE 1=1
    AND LOWER(TRIM(f.activity)) != 'login'
    AND f.organisationid = 'a7832639-0686-41f1-9b6e-21616b99c92f'
    AND f.spname = '01 jagdish vala'
    AND f.farmlocality = 'Achhidra'
    AND f.sprole = 'VOLUNTEER'
    AND f.activity = 'Cattle Registration'
    AND CAST(f.activitydoneon AS DATE) >= '2023-01-14' 
    AND CAST(f.activitydoneon AS DATE) <= '2026-01-08'
    AND CAST(f.activityrecordeddate AS DATE) >= '2023-01-14' 
    AND CAST(f.activityrecordeddate AS DATE) <= '2026-01-23'
) as distinct_records



SELECT DISTINCT
  f.spname,
  f.sprole,
  f.activity,
  f.activitydetail,
  f.activitydoneon,
  f.farmername,
  f.farmsubdistrict,
  f.farmlocality,
  f.cattlename,
  f.breed
FROM factspactivitydetaildm f
WHERE 1=1
  AND LOWER(TRIM(f.activity)) != 'login'
  AND f.organisationid = 'a7832639-0686-41f1-9b6e-21616b99c92f'
  AND f.spname = 'Krushik Ravaliya'
  AND f.farmlocality = 'Anida'
  AND f.sprole = 'VOLUNTEER'
  AND f.activity = 'Cattle Registration'
  AND CAST(f.activitydoneon AS DATE) >= '2023-01-14' 
  AND CAST(f.activitydoneon AS DATE) <= '2026-01-08'
  AND CAST(f.activityrecordeddate AS DATE) >= '2023-01-14' 
  AND CAST(f.activityrecordeddate AS DATE) <= '2026-01-23'
ORDER BY f.activitydoneon desc










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
    AND spname IN ('Anil Rathod')
    AND activity IN ('BCS')
    and farmlocality in ('Nakhada')
    AND (cattlelatestvaccinationdate < CURRENT_DATE - INTERVAL '1 year'
       OR cattlelatestvaccinationdate IS NULL)
  AND (cattlelatestdewormingdate >= CURRENT_DATE - INTERVAL '3 months'
       and cattlelatestdewormingdate IS not NULL)
  AND (cattlelatestcmtdate < CURRENT_DATE - INTERVAL '3 months'
       OR cattlelatestcmtdate IS NULL)
    AND activitydoneon >= '2024-04-15'
    AND activitydoneon <= '2026-01-09'
    AND activityrecordeddate >= '2023-04-13'
    AND activityrecordeddate <= '2026-01-26'
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






SELECT COUNT(DISTINCT f.activityid) AS total_activities,
COUNT(DISTINCT f.farmerid) AS unique_farms,
COUNT(DISTINCT f.spuserid) AS active_service_providers FROM factspactivitydetaildm f WHERE 1=1 AND
LOWER(TRIM(f.activity)) != 'login' AND CAST(f.activityrecordeddate AS DATE) >= '2025-03-03' and
CAST(f.activityrecordeddate AS DATE) <= '2026-01-23' AND CAST(f.activitydoneon AS DATE) >= '2024-04-15' AND CAST(f.activitydoneon AS DATE) <= '2026-01-15'
and f.organisationid  in ('a7832639-0686-41f1-9b6e-21616b99c92f')





SELECT COUNT(DISTINCT v.spuserid) AS total_service_providers FROM vworganizationspassociationdetails v WHERE 

v.organizationid IN ('a7832639-0686-41f1-9b6e-21616b99c92f') 

AND v.isassociationactive = TRUE and

v.isuseractive = TRUE AND 

v.associationenddate IS null








SELECT COUNT(DISTINCT v.spuserid) AS total_service_providers FROM organizationspassociationdetails v WHERE v.isassociationactive = TRUE and
v.isuseractive = TRUE AND v.associationenddate IS null and v.organizationid   in ('a7832639-0686-41f1-9b6e-21616b99c92f')



SELECT DISTINCT ON (cattlename, activitydoneon)
  activitydetail AS "Activity Detail",
  TO_CHAR(activitydoneon, 'DD Mon YYYY') AS "Activity Date",
  farmername AS "Farmer Name",
  farmsubdistrict AS "Sub-District",
  farmlocality AS "Locality",
  cattlename AS "Cattle Name",
  breed AS "Breed",
  ageofcattle AS "Age (Months)",
  currentlactation AS "Lactation",
  CONCAT('Weight: ', latestweight, ' BCS: ', COALESCE(latestbcs::text, 'N/A')) AS "Weight / BCS",
  cattlecategory AS "Cattle Category",
  breedcyclestatus AS "Breed Cycle Status",
  CASE 
    WHEN cattlelatestdewormingdate >= CURRENT_DATE - INTERVAL '3 months' THEN 'Yes'
    ELSE 'No'
  END AS "Dewormed (3M)",
  CASE 
    WHEN cattlelatestvaccinationdate >= CURRENT_DATE - INTERVAL '1 year' THEN 'Yes'
    ELSE 'No'
  END AS "Vaccination (1Y)",
  CASE 
    WHEN cattlelatestcmtdate >= CURRENT_DATE - INTERVAL '3 months' THEN 'Yes'
    ELSE 'No'
  END AS "CMT Done (3M)"
FROM factspactivitydetaildm
WHERE
  LOWER(TRIM(activity)) != 'login'
  AND spname IN ('Ajay Solanki')
  AND farmlocality IN ('Bolas')
  AND activity IN ('Weight')
  AND (cattlelatestvaccinationdate < CURRENT_DATE - INTERVAL '1 year'
       OR cattlelatestvaccinationdate IS NULL)
  AND (cattlelatestdewormingdate < CURRENT_DATE - INTERVAL '3 months'
       OR cattlelatestdewormingdate IS NULL)
  AND (cattlelatestcmtdate < CURRENT_DATE - INTERVAL '3 months'
       OR cattlelatestcmtdate IS NULL)
  AND activitydoneon >= '2022-04-15'
  AND activitydoneon <= '2025-01-15'
  AND activityrecordeddate >= '2022-04-15'
  AND activityrecordeddate <= '2026-01-23'
ORDER BY cattlename, activitydoneon DESC, id DESC;

SELECT COUNT(DISTINCT f.activityid) AS total_activities,
COUNT(DISTINCT f.farmerid) AS unique_farms,
COUNT(DISTINCT f.spuserid) AS active_service_providers FROM factspactivitydetaildm f WHERE 1=1 AND
LOWER(TRIM(f.activity)) != 'login' AND CAST(f.activityrecordeddate AS DATE) >= '2020-04-15' and
CAST(f.activityrecordeddate AS DATE) <= '2026-01-13' AND CAST(f.activitydoneon AS DATE) >= '2020-04-15' AND CAST(f.activitydoneon AS DATE) <= '2026-01-13'
and f.organisationid  in ('a7832639-0686-41f1-9b6e-21616b99c92f')







SELECT DISTINCT ON (cattlename, activitydoneon)
  spname AS "Service Provider",
  activity AS "Activity",
  activitydetail AS "Activity Detail",
  TO_CHAR(activitydoneon, 'DD Mon YYYY') AS "Activity Date",
  farmername AS "Farmer Name",
  farmsubdistrict AS "Sub-District",
  farmlocality AS "Locality",
  cattlename AS "Cattle Name"
FROM factspactivitydetaildm
WHERE
  LOWER(TRIM(activity)) != 'login'
  AND spname IN ('01 Balveer singh sarai')
  AND farmlocality IN ('SIYANA (TOWN AREA)')
  AND activity IN ('Weight')
  AND (cattlelatestvaccinationdate < CURRENT_DATE - INTERVAL '1 year'
       OR cattlelatestvaccinationdate IS NULL)
  AND (cattlelatestdewormingdate < CURRENT_DATE - INTERVAL '3 months'
       OR cattlelatestdewormingdate IS NULL)
  AND (cattlelatestcmtdate < CURRENT_DATE - INTERVAL '3 months'
       OR cattlelatestcmtdate IS NULL)
  AND activitydoneon >= '2024-04-15'
  AND activitydoneon <= '2026-01-28'
  AND activityrecordeddate >= '2023-08-15'
  AND activityrecordeddate <= '2026-01-14'
ORDER BY cattlename, activitydoneon DESC, id DESC;




SELECT COUNT(*)::int as count
FROM (
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
  id
  FROM factspactivitydetaildm
  WHERE (
    LOWER(TRIM(activity)) != 'login'
    AND organisationid IN ('a7832639-0686-41f1-9b6e-21616b99c92f')
   AND spname IN ('01 Balveer singh sarai')
  AND farmlocality IN ('SIYANA (TOWN AREA)')
  AND activity IN ('Weight')
    AND (cattlelatestvaccinationdate < CURRENT_DATE - INTERVAL '1 year'
         OR cattlelatestvaccinationdate IS NULL)
    AND (cattlelatestdewormingdate < CURRENT_DATE - INTERVAL '3 months'
         OR cattlelatestdewormingdate IS NULL)
    AND (cattlelatestcmtdate < CURRENT_DATE - INTERVAL '3 months'
         OR cattlelatestcmtdate IS NULL)
   AND activitydoneon >= '2024-04-15'
  AND activitydoneon <= '2026-01-28'
  AND activityrecordeddate >= '2023-08-15'
  AND activityrecordeddate <= '2026-01-14'
  )
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
) AS deduplicated;






SELECT COUNT(*)::int as count

FROM (

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

  id

  FROM factspactivitydetaildm

  WHERE (

    LOWER(TRIM(activity)) != 'login'

    AND organisationid IN ('a7832639-0686-41f1-9b6e-21616b99c92f')

    AND spname IN ('Anil Rathod')

    AND farmlocality IN ('Sara')

    AND activity IN ('PDT')

    AND cattlelatestvaccinationdate < CURRENT_DATE - INTERVAL '1 year' 

    OR cattlelatestvaccinationdate IS  NULL

    AND cattlelatestdewormingdate < CURRENT_DATE - INTERVAL '3 months' 

    OR cattlelatestdewormingdate IS  NULL

    AND cattlelatestcmtdate < CURRENT_DATE - INTERVAL '3 months' 

    OR cattlelatestcmtdate IS  NULL

    AND activitydoneon >= '2025-01-28'

    AND activitydoneon <= '2026-01-28'

    AND activityrecordeddate >= '2025-01-28'

    AND activityrecordeddate <= '2026-01-28'

  )

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

) AS deduplicated;









SELECT COUNT(*)::int as count
FROM (
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
  id
  FROM factspactivitydetaildm
  WHERE (
    LOWER(TRIM(activity)) != 'login'
    AND organisationid IN ('a7832639-0686-41f1-9b6e-21616b99c92f')
    AND spname IN ('Dr Ajit Gohil')
    AND farmlocality IN ('Umbri')
    AND activity IN ('Incoming Call')
    AND (cattlelatestvaccinationdate < CURRENT_DATE - INTERVAL '1 year'
         OR cattlelatestvaccinationdate IS NULL)
    AND (cattlelatestdewormingdate < CURRENT_DATE - INTERVAL '3 months'
         OR cattlelatestdewormingdate IS NULL)
    AND (cattlelatestcmtdate < CURRENT_DATE - INTERVAL '3 months'
         OR cattlelatestcmtdate IS NULL)
    AND activitydoneon >= '2025-01-28'
    AND activitydoneon <= '2026-01-28'
    AND activityrecordeddate >= '2025-01-28'
    AND activityrecordeddate <= '2026-01-28'
  )
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
) AS deduplicated;









SELECT *
FROM (
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
  WHERE (
    LOWER(TRIM(activity)) != 'login'
    AND organisationid IN ('a7832639-0686-41f1-9b6e-21616b99c92f')
    AND spname IN ('Bhalu Bhai Barad')
    AND farmlocality IN ('Lodhva')
    AND activity IN ('Incoming Call')
    AND (cattlelatestvaccinationdate < CURRENT_DATE - INTERVAL '1 year'
         OR cattlelatestvaccinationdate IS NULL)
    AND (cattlelatestdewormingdate < CURRENT_DATE - INTERVAL '3 months'
         OR cattlelatestdewormingdate IS NULL)
    AND (cattlelatestcmtdate < CURRENT_DATE - INTERVAL '3 months'
         OR cattlelatestcmtdate IS NULL)
    AND activitydoneon >= '2025-01-28'
    AND activitydoneon <= '2026-01-28'
    AND activityrecordeddate >= '2025-01-28'
    AND activityrecordeddate <= '2026-01-28'
  )
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
) AS deduplicated;


SELECT *,
  CASE
    WHEN cattlelatestdewormingdate >= CURRENT_DATE - INTERVAL '3 months' THEN 'Yes'
    ELSE 'No'
  END AS "Dewormed (3M)",
  CASE
    WHEN cattlelatestvaccinationdate >= CURRENT_DATE - INTERVAL '1 year' THEN 'Yes'
    ELSE 'No'
  END AS "Vaccination (1Y)",
  CASE
    WHEN cattlelatestcmtdate >= CURRENT_DATE - INTERVAL '3 months' THEN 'Yes'
    ELSE 'No'
  END AS "CMT Done (3M)"
FROM (
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
  WHERE (
    LOWER(TRIM(activity)) != 'login'
    AND organisationid IN ('a7832639-0686-41f1-9b6e-21616b99c92f')
    AND spname IN ('Bhalu Bhai Barad')
    AND farmlocality IN ('Lodhva')
    AND activity IN ('Incoming Call')
    AND (cattlelatestvaccinationdate < CURRENT_DATE - INTERVAL '1 year'
         OR cattlelatestvaccinationdate IS NULL)
    AND (cattlelatestdewormingdate < CURRENT_DATE - INTERVAL '3 months'
         OR cattlelatestdewormingdate IS NULL)
    AND (cattlelatestcmtdate < CURRENT_DATE - INTERVAL '3 months'
         OR cattlelatestcmtdate IS NULL)
    AND activitydoneon >= '2025-01-28'
    AND activitydoneon <= '2026-01-28'
    AND activityrecordeddate >= '2025-01-28'
    AND activityrecordeddate <= '2026-01-28'
  )
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
) AS deduplicated;







SELECT 
  spname AS "Service Provider",
  activity AS "Activity",
  activitydetail AS "Activity Detail",
  TO_CHAR(activitydoneon, 'DD Mon YYYY') AS "Activity Date",
  farmername AS "Farmer Name",
  farmsubdistrict AS "Sub-District",
  farmlocality AS "Locality",
  cattlename AS "Cattle Name",
  breed AS "Breed",
  ageofcattle AS "Age (Months)",
  currentlactation AS "Lactation",
  latestweight AS "Latest Weight",
  latestbcs AS "Latest BCS",
  cattlecategory AS "Cattle Category",
  breedcyclestatus AS "Breed Cycle Status",
  CASE
    WHEN cattlelatestdewormingdate >= CURRENT_DATE - INTERVAL '3 months' THEN 'Yes'
    ELSE 'No'
  END AS "Dewormed (3M)",
  CASE
    WHEN cattlelatestvaccinationdate >= CURRENT_DATE - INTERVAL '1 year' THEN 'Yes'
    ELSE 'No'
  END AS "Vaccination (1Y)",
  CASE
    WHEN cattlelatestcmtdate >= CURRENT_DATE - INTERVAL '3 months' THEN 'Yes'
    ELSE 'No'
  END AS "CMT Done (3M)"
FROM (
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
  WHERE (
    LOWER(TRIM(activity)) != 'login'
    AND organisationid IN ('a7832639-0686-41f1-9b6e-21616b99c92f')
    AND spname IN ('Bhalu Bhai Barad')
    AND farmlocality IN ('Lodhva')
    AND activity IN ('Incoming Call')
    AND (cattlelatestvaccinationdate < CURRENT_DATE - INTERVAL '1 year'
         OR cattlelatestvaccinationdate IS NULL)
    AND (cattlelatestdewormingdate < CURRENT_DATE - INTERVAL '3 months'
         OR cattlelatestdewormingdate IS NULL)
    AND (cattlelatestcmtdate < CURRENT_DATE - INTERVAL '3 months'
         OR cattlelatestcmtdate IS NULL)
    AND activitydoneon >= '2025-01-28'
    AND activitydoneon <= '2026-01-28'
    AND activityrecordeddate >= '2025-01-28'
    AND activityrecordeddate <= '2026-01-28'
  )
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
) AS deduplicated;




SELECT *
FROM (
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
  WHERE (
    LOWER(TRIM(activity)) != 'login'
    AND organisationid IN ('a7832639-0686-41f1-9b6e-21616b99c92f')
    AND spname IN ('Bhalu Bhai Barad')
    AND farmlocality IN ('Lodhva')
    AND activity IN ('Incoming Call')
    AND (cattlelatestvaccinationdate < CURRENT_DATE - INTERVAL '1 year'
         OR cattlelatestvaccinationdate IS NULL)
    AND (cattlelatestdewormingdate < CURRENT_DATE - INTERVAL '3 months'
         OR cattlelatestdewormingdate IS NULL)
    AND (cattlelatestcmtdate < CURRENT_DATE - INTERVAL '3 months'
         OR cattlelatestcmtdate IS NULL)
    AND activitydoneon >= '2025-01-28'
    AND activitydoneon <= '2026-01-28'
    AND activityrecordeddate >= '2025-01-28'
    AND activityrecordeddate <= '2026-01-28'
  )
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
) AS deduplicated;






SELECT COUNT(DISTINCT f.activityid) AS total_activities, COUNT(DISTINCT f.farmid) AS unique_farms,
COUNT(DISTINCT f.spuserid) AS active_service_providers FROM factspactivitydetaildm f WHERE 1=1 AND
LOWER(TRIM(f.activity)) != 'login' AND
CAST(f.activityrecordeddate AS DATE) >= '2025-01-09' AND CAST(f.activityrecordeddate AS DATE) <= '2026-01-09' and
CAST(f.activitydoneon AS DATE) >= '2025-01-09' AND CAST(f.activitydoneon AS DATE) <= '2026-01-09'
 
 
SELECT COUNT(DISTINCT v.spuserid) AS total_service_providers FROM vworganizationspassociationdetails v
WHERE v.isassociationactive = TRUE AND v.isuseractive = TRUE AND v.associationenddate IS null






SELECT 
  f.farmername AS "Farmer Name",
  f.farmsubdistrict AS "Sub-District",
  f.farmlocality AS "Locality",
  f.spname AS "Associated SP",
  f.cattlename AS "Cattle Name",
  f.activity AS "Activity",
  TO_CHAR(f.activitydueon, 'Day, DD Month YYYY') AS "Activity Due Date"
FROM factspactivitydetaildm f
WHERE 
  LOWER(TRIM(f.activity)) != 'login'
  AND f.farmername = 'Aebha bhai barad'
  AND f.farmlocality = 'Lati'
  AND f.spname = '11 dinesh bhai raja bhai zala GHCL'
  AND f.activity = 'PDT'
  AND CAST(f.activitydueon AS DATE) >= '2025-01-28'
  AND CAST(f.activitydueon AS DATE) <= '2026-01-28'
ORDER BY f.cattlename, f.activitydueon;






SELECT 
  f.spname AS sp_name,
  STRING_AGG(DISTINCT f.sprole, ', ') AS sp_role,
  COUNT(DISTINCT f.farmid) AS farms_with_activities,
  COUNT(DISTINCT f.activityid) AS activity_count
FROM factspactivitydetaildm f
WHERE 1=1
  AND LOWER(TRIM(f.activity)) != 'login'
  AND CAST(f.activityrecordeddate AS DATE) >= '2024-12-16'
  AND CAST(f.activityrecordeddate AS DATE) <= '2025-12-16'
  AND CAST(f.activitydoneon AS DATE) >= '2024-12-16'
  AND CAST(f.activitydoneon AS DATE) <= '2025-12-16'
GROUP BY f.spname
ORDER BY f.spname
LIMIT 10 OFFSET 0;





SELECT 
  farmername AS "Farmer Name",
  farmsubdistrict AS "Sub-District",
  farmlocality AS "Locality",
  spname AS "Associated SP",
  cattlename AS "Cattle Name",
  activity AS "Activity",
  TO_CHAR(activityduedate, 'Day, DD Month YYYY') AS "Activity Due Date"
FROM factspupcomingcattleactivitydm
WHERE 
  farmername = 'Ramsinh Parmar'
  AND farmlocality = 'Kindarva'
  AND spname = 'Kalpesh Babubhai Zala GHCL'
  AND activity = 'Deworming'
  AND activityduedate >= '2023-01-18'
  AND activityduedate <= '2026-01-15'
ORDER BY cattlename, activityduedate;


SELECT DISTINCT spname 
FROM factspupcomingcattleactivitydm
WHERE farmername = 'Ramsinh Parmar'
  AND farmlocality = 'Kindarva'
  AND activity = 'Deworming';



SELECT 
  farmername AS "Farmer Name",
  farmsubdistrict AS "Sub-District",
  farmlocality AS "Locality",
  spname AS "Associated SP",
  cattlename AS "Cattle Name",
  activity AS "Activity",
  TO_CHAR(activityduedate, 'Day, DD Month YYYY') AS "Activity Due Date"
FROM factspupcomingcattleactivitydm
WHERE 
  farmername = 'Ramsinh Parmar'
  AND farmlocality = 'Kindarva'
  AND activity = 'Deworming'
  AND activityduedate >= '2023-01-18'
  AND activityduedate <= '2026-01-15'
ORDER BY cattlename, activityduedate;




SELECT 
  farmername AS "Farmer Name",
  farmsubdistrict AS "Sub-District",
  farmlocality AS "Locality",
  spname AS "Associated SP",
  cattlename AS "Cattle Name",
  activity AS "Activity",
  TO_CHAR(activityduedate, 'Day, DD Month YYYY') AS "Activity Due Date"
FROM factspupcomingcattleactivitydm
WHERE 
  farmername = 'Aniruddh Mori'
  AND farmlocality = 'Savni'
  AND spname = 'Kalpesh Babubhai Zala GHCL'
  AND activity = 'PDT'
  AND activityduedate >= '2025-01-28'
  AND activityduedate <= '2026-01-28'
ORDER BY cattlename, activityduedate;






SELECT 
  farmername AS "Farmer Name",
  farmsubdistrict AS "Sub-District",
  farmlocality AS "Locality",
  spname AS "Associated SP",
  cattlename AS "Cattle Name",
  activity AS "Activity",
  TO_CHAR(activityduedate, 'Day, DD Month YYYY') AS "Activity Due Date"
FROM factspupcomingcattleactivitydm
WHERE 
  farmername = 'Ankit Paramar'
--  AND farmlocality = ''
  AND spname = 'Dr G H C L Ram Solanki'
  AND activity = 'Deworming'
  AND activityduedate >= '2024-01-10'
  AND activityduedate <= '2026-01-28'
   AND organisationid IN ('a7832639-0686-41f1-9b6e-21616b99c92f')
ORDER BY cattlename, activityduedate;




SELECT 
  farmername AS "Farmer Name",
  farmsubdistrict AS "Sub-District",
  farmlocality AS "Locality",
  spname AS "Associated SP",
  cattlename AS "Cattle Name",
  activity AS "Activity",
  TO_CHAR(lastactivitydate, 'Day, DD Month YYYY') AS "Last Activity Date",
  TO_CHAR(activityduedate, 'Day, DD Month YYYY') AS "Activity Due Date",
  (activityduedate - lastactivitydate) AS "Days Between"
FROM factspupcomingcattleactivitydm
WHERE 
  farmername = 'Ramsinh Parmar'
  AND farmlocality = 'Kindarva'
  AND spname = 'Kalpesh Babubhai Zala GHCL'
  AND activity = 'Deworming'
  AND activityduedate >= '2023-01-18'
  AND activityduedate <= '2026-01-15'
ORDER BY cattlename, activityduedate;







SELECT 
  farmername AS "Farmer Name",
  farmsubdistrict AS "Sub-District",
  farmlocality AS "Locality",
  spname AS "Associated SP",
  cattlename AS "Cattle Name",
  activity AS "Activity",
  TO_CHAR(activityduedate, 'Day, DD Month YYYY') AS "Activity Due Date"
FROM factspupcomingcattleactivitydm
WHERE 
  farmername = 'Ramsinh Parmar'
  AND farmlocality = 'Kindarva'
  AND activity = 'Deworming'
  AND activityduedate >= '2023-01-18'
  AND activityduedate <= '2026-01-15'
ORDER BY cattlename, activityduedate;



SELECT 
  farmername AS "Farmer Name",
  farmsubdistrict AS "Sub-District",
  farmlocality AS "Locality",
  spname AS "Associated SP",
  cattlename AS "Cattle Name",
  activity AS "Activity",
  TO_CHAR(activityduedate, 'Day, DD Month YYYY') AS "Activity Due Date"
FROM factspupcomingcattleactivitydm
WHERE 
  farmername IN ('Ramsinh Parmar')
  AND farmlocality IN ('Kindarva')
--  AND spname IN ('Kalpesh Babubhai Zala GHCL')  -- Use IN for filter dropdown
  AND activity IN ('Deworming')
  AND activityduedate >= '2023-01-18'
  AND activityduedate <= '2026-01-15'
ORDER BY cattlename, activityduedate;


SELECT 
  farmername AS "Farmer Name",
  farmsubdistrict AS "Sub-District",
  farmlocality AS "Locality",
  spname AS "Associated SP",
  cattlename AS "Cattle Name",
  activity AS "Activity",
  TO_CHAR(activityduedate, 'Day, DD Month YYYY') AS "Activity Due Date"
FROM factspupcomingcattleactivitydm
WHERE 
  farmername IN ('Ramsinh Parmar')
  AND farmlocality IN ('Kindarva')
  AND spname IN ('Kalpesh Babubhai Zala GHCL')  -- MUST be uncommented
  AND activity IN ('Deworming')
  AND activityduedate >= '2023-01-18'
  AND activityduedate <= '2026-01-15'
ORDER BY cattlename, activityduedate;


SELECT DISTINCT spname
FROM factspupcomingcattleactivitydm
WHERE farmername = 'Ramsinh Parmar'
  AND farmlocality = 'Kindarva'
  AND activity = 'Deworming'
  AND spname IS NOT NULL;



SELECT 
  farmername AS "Farmer Name",
  farmsubdistrict AS "Sub-District",
  farmlocality AS "Locality",
  spname AS "Associated SP",
  cattlename AS "Cattle Name",
  activity AS "Activity",
  TO_CHAR(activityduedate, 'Day, DD Month YYYY') AS "Activity Due Date"
FROM factspupcomingcattleactivitydm
WHERE 
  farmername = 'Ramsinh Parmar'
  AND farmlocality = 'Kindarva'
  AND spname LIKE '%Kalpesh%'
  AND activity = 'Deworming'
  AND activityduedate >= '2023-01-18'
  AND activityduedate <= '2026-01-15'
ORDER BY cattlename, activityduedate;




SELECT 
  farmername AS "Farmer Name",
  farmsubdistrict AS "Sub-District",
  farmlocality AS "Locality",
  spname AS "Associated SP",
  cattlename AS "Cattle Name",
  activity AS "Activity",
  TO_CHAR(lastactivitydate, 'Day, DD Month YYYY') AS "Last Activity Date",
  TO_CHAR(activityduedate, 'Day, DD Month YYYY') AS "Activity Due Date"
FROM factspupcomingcattleactivitydm
WHERE 
  farmername = 'Ramsinh Parmar'
  AND farmlocality = 'Kindarva'
  AND spname LIKE '%Kalpesh%'
  AND activity = 'Deworming'
  AND activityduedate >= '2023-01-18'
  AND activityduedate <= '2026-01-15'
ORDER BY cattlename, activityduedate;





SELECT *
FROM (
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
  WHERE (
    LOWER(TRIM(activity)) != 'login'
    AND organisationid IN ('a7832639-0686-41f1-9b6e-21616b99c92f')
    AND spname IN ('Rathod Hardik')
    AND farmlocality IN ('Savni')
    AND activity IN ('PDT')
    AND (cattlelatestvaccinationdate < CURRENT_DATE - INTERVAL '1 year'
         OR cattlelatestvaccinationdate IS NULL)
    AND (cattlelatestdewormingdate < CURRENT_DATE - INTERVAL '3 months'
         OR cattlelatestdewormingdate IS NULL)
    AND (cattlelatestcmtdate < CURRENT_DATE - INTERVAL '3 months'
         OR cattlelatestcmtdate IS NULL)
    AND activitydoneon >= '2025-01-28'
    AND activitydoneon <= '2026-01-28'
    AND activityrecordeddate >= '2025-01-28'
    AND activityrecordeddate <= '2026-01-28'
  )
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
) AS deduplicated;


