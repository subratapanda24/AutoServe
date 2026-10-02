-- Q2: Revenue and Jobs Handled Per Mechanic
-- Uses JOIN, Subquery, COUNT, SUM and GROUP BY


SELECT m.MechanicID,
       m.Name,
       COUNT(jt.JobID) AS jobs_handled,
       SUM(jt.total_cost) AS revenue
FROM Mechanic m
JOIN (
    SELECT sj.JobID,
           sj.MechanicID,
           sj.LabourCharge
           + COALESCE(SUM(jp.Quantity * sp.UnitPrice), 0) AS total_cost
    FROM ServiceJob sj
    LEFT JOIN JobParts jp
           ON sj.JobID = jp.JobID
    LEFT JOIN SparePart sp
           ON jp.PartID = sp.PartID
    GROUP BY sj.JobID,
             sj.MechanicID,
             sj.LabourCharge
) jt
ON m.MechanicID = jt.MechanicID
GROUP BY m.MechanicID, m.Name
ORDER BY revenue DESC;