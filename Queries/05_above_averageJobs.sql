-- Q3: Jobs Costing More Than Average Job Cost
-- Uses CTE, Subquery and AVG

WITH job_totals AS (
    SELECT sj.JobID,
           sj.LabourCharge
           + COALESCE(SUM(jp.Quantity * sp.UnitPrice), 0) AS total_cost
    FROM ServiceJob sj
    LEFT JOIN JobParts jp
           ON sj.JobID = jp.JobID
    LEFT JOIN SparePart sp
           ON jp.PartID = sp.PartID
    GROUP BY sj.JobID, sj.LabourCharge
)
SELECT JobID,
       total_cost
FROM job_totals
WHERE total_cost > (
    SELECT AVG(total_cost)
    FROM job_totals
)
ORDER BY total_cost DESC;