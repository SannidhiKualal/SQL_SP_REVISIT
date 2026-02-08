SELECT COUNT(DISTINCT f.activityid) AS total_activities, COUNT(DISTINCT f.farmid) AS unique_farms,

COUNT(DISTINCT f.spuserid) AS active_service_providers FROM factspactivitydetaildm f WHERE 1=1 AND 

LOWER(TRIM(f.activity)) != 'login' AND f.organisationid IN ('a7832639-0686-41f1-9b6e-21616b99c92f') 

AND CAST(f.activityrecordeddate AS DATE) >= '2023-01-13' AND CAST(f.activityrecordeddate AS DATE) <= '2026-01-13' 

AND CAST(f.activitydoneon AS DATE) >= '2023-01-13' AND CAST(f.activitydoneon AS DATE) <= '2026-01-13'


SELECT COUNT(DISTINCT v.spuserid) AS total_service_providers FROM vworganizationspassociationdetails v WHERE 

v.organizationid IN ('a7832639-0686-41f1-9b6e-21616b99c92f') 

AND v.isassociationactive = TRUE and

v.isuseractive = TRUE AND 

v.associationenddate IS null



