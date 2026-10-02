-- Demonstration: View Updates Automatically

-- Job 1006 is currently Pending.
-- Change it to Completed.

UPDATE ServiceJob
SET Status = 'Completed'
WHERE JobID = 1006;


-- Job 1006 should now disappear from the view.

SELECT JobID
FROM PendingJobCards;

-- Demonstration: Referential Integrity


-- VehicleID 999 does not exist in Vehicle.
-- Therefore this INSERT should fail.

INSERT INTO ServiceJob
VALUES (
    1009,
    999,
    1,
    '2026-09-30',
    500,
    'Pending'
);