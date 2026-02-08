SELECT
  f.spname AS "spName",
  f.activity AS "activity",
  f.activitydetail AS "activityDetail",
  TO_CHAR(f.activitydoneon, 'YYYY-MM-DD') AS "activityDoneOn",
  f.farmername AS "farmerName",
  f.farmsubdistrict AS "subDistrict",
  f.farmlocality AS "locality",
  f.cattlename AS "cattleName",
  f.breed AS "breed",
  f.ageofcattle AS "ageOfCattleInMonths",
  f.currentlactation AS "currentLactation",
  CONCAT(COALESCE(f.latestweight::text, ''), ' / ', COALESCE(f.latestbcs::text, '')) AS "latestWeightAndBCS",
  f.cattlecategory AS "cattleCategory",
  f.breedcyclestatus AS "breedCycleStatus",
  CASE
    WHEN f.cattlelatestdewormingdate >= CURRENT_DATE - INTERVAL '3 months'
         AND f.cattlelatestdewormingdate IS NOT NULL
    THEN 'Yes'
    ELSE 'No'
  END AS "isDewormedIn3Months",
  CASE
    WHEN f.cattlelatestvaccinationdate >= CURRENT_DATE - INTERVAL '1 year'
         AND f.cattlelatestvaccinationdate IS NOT NULL
    THEN 'Yes'
    ELSE 'No'
  END AS "isVaccinatedIn1Year",
  CASE
    WHEN f.cattlelatestcmtdate >= CURRENT_DATE - INTERVAL '3 months'
         AND f.cattlelatestcmtdate IS NOT NULL
    THEN 'Yes'
    ELSE 'No'
  END AS "isCMTDoneIn3Months"
FROM factspactivitydetaildm f
WHERE 1=1
  AND LOWER(TRIM(f.activity)) != 'login'
  AND CAST(f.activitydoneon AS DATE) >= '2022-08-10'
  AND CAST(f.activitydoneon AS DATE) <= '2025-12-19'
  AND CAST(f.activityrecordeddate AS DATE) >= '2022-08-10'
  AND CAST(f.activityrecordeddate AS DATE) <= '2025-12-19'
  AND f.spname IN ('Ajeet Chauhan')
  AND f.farmlocality IN ('BIHUNI')
  AND f.activity IN ('Incoming Call')
  -- Dewormed filter: no
  AND (f.cattlelatestdewormingdate < CURRENT_DATE - INTERVAL '3 months' or f.cattlelatestdewormingdate IS  null)
  
  -- Vaccinated filter: NO
  AND (f.cattlelatestvaccinationdate < CURRENT_DATE - INTERVAL '1 year' or f.cattlelatestvaccinationdate  is null)
  
  -- CMT filter: No
  AND (f.cattlelatestcmtdate < CURRENT_DATE - INTERVAL '3 months' OR f.cattlelatestcmtdate IS NULL)
ORDER BY f.activitydoneon DESC, f.activityrecordeddate DESC
LIMIT 10 OFFSET 0;


SELECT 
  f.spname AS sp_name,
  STRING_AGG(DISTINCT f.sprole, ', ') AS sp_role,
  COUNT(DISTINCT f.farmid) AS farms_with_activities,
  COUNT(DISTINCT f.activityid) AS activity_count
FROM factspactivitydetaildm f
WHERE 1=1
  AND LOWER(TRIM(f.activity)) != 'login'
  AND CAST(f.activityrecordeddate AS DATE) >='2022-08-10'
  AND CAST(f.activityrecordeddate AS DATE) <= '2025-12-19'
  AND CAST(f.activitydoneon AS DATE) >= '2022-08-10'
  AND CAST(f.activitydoneon AS DATE) <= '2025-12-16'
GROUP BY f.spname
ORDER BY f.spname
LIMIT 10 OFFSET 0;


 
 
 
this for fetching Count
 
SELECT COUNT(DISTINCT f.spname) AS total_records
FROM factspactivitydetaildm f
WHERE 1=1
  AND LOWER(TRIM(f.activity)) != 'login'
  AND CAST(f.activityrecordeddate AS DATE) >= '2024-12-16'
  AND CAST(f.activityrecordeddate AS DATE) <= '2025-12-16'
  AND CAST(f.activitydoneon AS DATE) >= '2024-12-16'
  AND CAST(f.activitydoneon AS DATE) <= '2025-12-16';


SELECT
  COUNT(DISTINCT f.activityid) AS total_activities,
  COUNT(DISTINCT f.farmid) AS unique_farms,
  COUNT(DISTINCT f.spuserid) AS active_service_providers
FROM factspactivitydetaildm f
WHERE 1=1
  AND LOWER(TRIM(f.activity)) != 'login'
  AND CAST(f.activityrecordeddate AS DATE) >= '2022-08-10'
  AND CAST(f.activityrecordeddate AS DATE) <= '2025-12-19'
  AND CAST(f.activitydoneon AS DATE) >= '2022-08-10'
  AND CAST(f.activitydoneon AS DATE) <= '2025-12-19';

SELECT 
  COUNT(DISTINCT v.spuserid) AS total_service_providers 
FROM vworganizationspassociationdetails v 
WHERE v.isassociationactive = TRUE 
  AND v.isuseractive = TRUE 
  AND v.associationenddate IS NULL;


SELECT
  COUNT(DISTINCT f.activityid) AS total_activities,
  COUNT(DISTINCT f.farmid) AS unique_farms,
  COUNT(DISTINCT f.spuserid) AS active_service_providers
FROM factspactivitydetaildm f
WHERE 1=1
  AND LOWER(TRIM(f.activity)) != 'login'
  AND CAST(f.activityrecordeddate AS DATE) >= '2022-08-10'
  AND CAST(f.activityrecordeddate AS DATE) <= '2025-12-18'
  AND CAST(f.activitydoneon AS DATE) >= '2022-08-10'
  AND CAST(f.activitydoneon AS DATE) <= '2025-12-18';

SELECT
  COUNT(DISTINCT f.activityid) AS total_activities,
  COUNT(DISTINCT f.farmid) AS unique_farms,
  COUNT(DISTINCT f.spuserid) AS active_service_providers
FROM factspactivitydetaildm f
WHERE 1=1
  AND LOWER(TRIM(f.activity)) != 'login'
  AND CAST(f.activityrecordeddate AS DATE) >= '2023-02-15'
  AND CAST(f.activityrecordeddate AS DATE) <= '2025-12-19'
  AND CAST(f.activitydoneon AS DATE) >= '2023-02-15'
  AND CAST(f.activitydoneon AS DATE) <= '2025-12-19';


select COUNT(DISTINCT f.spname) AS service_provider_count,
  (SELECT COUNT(DISTINCT spname) FROM factspactivitydetaildm WHERE LOWER(TRIM(activity)) != 'login') AS total_service_providers,
  COUNT(DISTINCT f.activityid) AS activity_count,
  COUNT(DISTINCT f.farmid) AS farms_with_activities
FROM factspactivitydetaildm f
WHERE 1=1
  AND LOWER(TRIM(f.activity)) != 'login'
  AND CAST(f.activityrecordeddate AS DATE) >= '2023-02-15'
  AND CAST(f.activityrecordeddate AS DATE) <= '2025-12-19'
  AND CAST(f.activitydoneon AS DATE) >= '2023-02-15'
  AND CAST(f.activitydoneon AS DATE) <= '2025-12-19';

SELECT
  COUNT(DISTINCT f.activityid) AS total_activities,
  COUNT(DISTINCT f.farmid) AS unique_farms,
  COUNT(DISTINCT f.spuserid) AS active_service_providers
FROM factspactivitydetaildm f
WHERE 1=1
  AND LOWER(TRIM(f.activity)) != 'login'
  AND CAST(f.activityrecordeddate AS DATE) >= '2022-10-12'
  AND CAST(f.activityrecordeddate AS DATE) <= '2025-12-18'
  AND CAST(f.activitydoneon AS DATE) >= '2022-10-12'
  AND CAST(f.activitydoneon AS DATE) <= '2025-12-18';


SELECT
  f.activityid,
  COUNT(*) AS duplicate_count,
  STRING_AGG(DISTINCT f.spname, ', ') AS service_providers,
  STRING_AGG(DISTINCT f.farmername, ', ') AS farmers
FROM factspactivitydetaildm f
WHERE 1=1
  AND LOWER(TRIM(f.activity)) != 'login'
  AND CAST(f.activityrecordeddate AS DATE) >= '2022-10-12'
  AND CAST(f.activityrecordeddate AS DATE) <= '2025-12-18'
  AND CAST(f.activitydoneon AS DATE) >= '2022-10-12'
  AND CAST(f.activitydoneon AS DATE) <= '2025-12-18'
GROUP BY f.activityid
HAVING COUNT(*) > 1
ORDER BY duplicate_count DESC;


-- Count distinct SPs with activities
SELECT
  COUNT(DISTINCT f.spname) AS total_sp_with_activities
FROM factspactivitydetaildm f
WHERE 1=1
  AND LOWER(TRIM(f.activity)) != 'login'
  AND CAST(f.activityrecordeddate AS DATE) >= '2022-10-12'
  AND CAST(f.activityrecordeddate AS DATE) <= '2025-12-18'
  AND CAST(f.activitydoneon AS DATE) >= '2022-10-12'
  AND CAST(f.activitydoneon AS DATE) <= '2025-12-18';

SELECT
  COUNT(DISTINCT f.activityid) AS total_activities,
  COUNT(DISTINCT f.farmid) AS unique_farms,
  COUNT(DISTINCT f.spuserid) AS active_service_providers
FROM factspactivitydetaildm f
WHERE 1=1
  AND LOWER(TRIM(f.activity)) != 'login'
  AND CAST(f.activityrecordeddate AS DATE) >= '2022-10-12'
  AND CAST(f.activityrecordeddate AS DATE) <= '2025-12-18'
  AND CAST(f.activitydoneon AS DATE) >= '2022-10-12'
  AND CAST(f.activitydoneon AS DATE) <= '2025-12-18';

SELECT
  COUNT(DISTINCT f.activityid) AS total_activities,
  COUNT(DISTINCT f.farmid) AS unique_farms,
  COUNT(DISTINCT f.spuserid) AS active_service_providers
FROM factspactivitydetaildm f
WHERE 1=1
  AND LOWER(TRIM(f.activity)) != 'login'
  AND CAST(f.activityrecordeddate AS DATE) >= '2022-10-12'
  AND CAST(f.activityrecordeddate AS DATE) <= '2025-12-18'
  AND CAST(f.activitydoneon AS DATE) >= '2022-10-12'
  AND CAST(f.activitydoneon AS DATE) <= '2025-12-18';

