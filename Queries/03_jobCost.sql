-- =====================================================
-- Q1: Total Cost Per Service Job
-- Labour Charge + Spare Part Costs
-- =====================================================

SELECT sj.JobID,
       sj.LabourCharge,
       COALESCE(SUM(jp.Quantity * sp.UnitPrice), 0) AS parts_cost,
       sj.LabourCharge
       + COALESCE(SUM(jp.Quantity * sp.UnitPrice), 0) AS total_job_cost
FROM ServiceJob sj
LEFT JOIN JobParts jp
       ON sj.JobID = jp.JobID
LEFT JOIN SparePart sp
       ON jp.PartID = sp.PartID
GROUP BY sj.JobID, sj.LabourCharge
ORDER BY sj.JobID;