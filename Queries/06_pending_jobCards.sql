
-- PendingJobCards View


CREATE OR REPLACE VIEW PendingJobCards AS
SELECT sj.JobID,
       sj.JobDate,
       sj.Status,
       v.RegNo,
       v.Make,
       v.Model,
       m.MechanicID,
       m.Name AS mechanic_name,
       sj.LabourCharge
FROM ServiceJob sj
JOIN Vehicle v
     ON sj.VehicleID = v.VehicleID
JOIN Mechanic m
     ON sj.MechanicID = m.MechanicID
WHERE sj.Status <> 'Completed';


-- Display all pending/in-progress jobs

SELECT *
FROM PendingJobCards
ORDER BY JobDate;


-- Count open jobs handled by each mechanic

SELECT mechanic_name,
       COUNT(*) AS open_jobs
FROM PendingJobCards
GROUP BY mechanic_name
ORDER BY open_jobs DESC;