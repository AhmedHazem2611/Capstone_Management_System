BEGIN TRANSACTION;

UPDATE ReviewerSupervisorExtension SET AssignedClassId = 1 WHERE AccountId IN (5, 35, 36, 37, 38, 39);
UPDATE ReviewerSupervisorExtension SET AssignedClassId = 2 WHERE AccountId IN (40, 41, 42, 43, 44);

INSERT INTO ReviewerSupervisorExtension (AccountId, AssignedClassId, StatusId)
SELECT Id, 1, 1 FROM Account 
WHERE Id IN (5, 35, 36, 37, 38, 39) 
AND Id NOT IN (SELECT AccountId FROM ReviewerSupervisorExtension);

INSERT INTO ReviewerSupervisorExtension (AccountId, AssignedClassId, StatusId)
SELECT Id, 2, 1 FROM Account 
WHERE Id IN (40, 41, 42, 43, 44) 
AND Id NOT IN (SELECT AccountId FROM ReviewerSupervisorExtension);

COMMIT;
