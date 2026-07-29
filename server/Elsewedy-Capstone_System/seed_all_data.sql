-- 1. Statuses
SET IDENTITY_INSERT [Status] ON;
MERGE [Status] AS target
USING (VALUES
    (1, 'Active/TaskPending/ReportSubmitted', 1, 'General'),
    (2, 'Inactive/TaskInProgress/ReportUnderReview', 2, 'General'),
    (3, 'ReportApproved', 3, 'General'),
    (4, 'ReportRejected', 4, 'General'),
    (6, 'TaskRejected', 5, 'General'),
    (10, 'TaskSubmittedOnTime', 6, 'General'),
    (11, 'TaskSubmittedLate', 7, 'General'),
    (12, 'TaskCompleted', 8, 'General'),
    (13, 'TaskCompletedLate', 9, 'General')
) AS source (Id, StatusName, OrderNo, BusinessEntity)
ON target.Id = source.Id
WHEN NOT MATCHED THEN
    INSERT (Id, StatusName, OrderNo, BusinessEntity)
    VALUES (source.Id, source.StatusName, source.OrderNo, source.BusinessEntity);
SET IDENTITY_INSERT [Status] OFF;

-- 2. Weeks
SET IDENTITY_INSERT [Weeks] ON;
MERGE [Weeks] AS target
USING (VALUES
    (1, 'CapstoneProject', '2026-07-07', '2026-07-01', 'Week 1: Proposal'),
    (2, 'CapstoneProject', '2026-07-14', '2026-07-08', 'Week 2: Requirements')
) AS source (Id, BusinessEntityName, EndDate, StartDate, WeekTitle)
ON target.Id = source.Id
WHEN NOT MATCHED THEN
    INSERT (Id, BusinessEntityName, EndDate, StartDate, WeekTitle)
    VALUES (source.Id, source.BusinessEntityName, source.EndDate, source.StartDate, source.WeekTitle);
SET IDENTITY_INSERT [Weeks] OFF;

-- 3. Tbl_Task
SET IDENTITY_INSERT [Tbl_Task] ON;
MERGE [Tbl_Task] AS target
USING (VALUES
    (1, 'Project Proposal', 'Submit the initial project proposal', NULL, 3, '2026-07-07', GETDATE(), '2026-07-07 23:59:59', 1, 1, 1, 1, 1, 1),
    (2, 'Requirements Document', 'Submit the requirements document', NULL, 13, '2026-07-14', GETDATE(), '2026-07-14 23:59:59', 2, 1, 1, 2, 2, 2)
) AS source (Id, TaskName, TaskDescription, AssignedToID, AssignedByID, DueDate, CreatedAt, TaskDeadline, GradeId, AdminAccountId, StatusId, Class_Id, Team_Id, WeekID)
ON target.Id = source.Id
WHEN NOT MATCHED THEN
    INSERT (Id, TaskName, TaskDescription, AssignedToID, AssignedByID, DueDate, CreatedAt, TaskDeadline, GradeId, AdminAccountId, StatusId, Class_Id, Team_Id, WeekID)
    VALUES (source.Id, source.TaskName, source.TaskDescription, source.AssignedToID, source.AssignedByID, source.DueDate, source.CreatedAt, source.TaskDeadline, source.GradeId, source.AdminAccountId, source.StatusId, source.Class_Id, source.Team_Id, source.WeekID);
SET IDENTITY_INSERT [Tbl_Task] OFF;

-- 4. StudentTask
SET IDENTITY_INSERT [StudentTask] ON;
MERGE [StudentTask] AS target
USING (VALUES
    (1, 8, 1, 1, GETDATE(), 12),
    (2, 9, 1, 0, NULL, 1),
    (3, 11, 2, 1, GETDATE(), 12)
) AS source (Id, StudentAccountId, TaskId, IsCompleted, CompletedAt, StatusId)
ON target.Id = source.Id
WHEN NOT MATCHED THEN
    INSERT (Id, StudentAccountId, TaskId, IsCompleted, CompletedAt, StatusId)
    VALUES (source.Id, source.StudentAccountId, source.TaskId, source.IsCompleted, source.CompletedAt, source.StatusId);
SET IDENTITY_INSERT [StudentTask] OFF;

-- 5. TaskSubmission
SET IDENTITY_INSERT [TaskSubmission] ON;
MERGE [TaskSubmission] AS target
USING (VALUES
    (1, 1, 8, 1, 1, 'https://github.com/example/repo1', 'Here is our proposal', 'Good job', GETDATE(), GETDATE(), 10),
    (2, 2, 11, 2, 2, 'https://github.com/example/repo2', 'Requirements attached', 'Needs revision', GETDATE(), GETDATE(), 6)
) AS source (TaskSubmission_ID, Team_ID, TeamLeader_ID, Grade_ID, Task_ID, GLink, Note, Feedback, created_at, updated_at, status_id)
ON target.TaskSubmission_ID = source.TaskSubmission_ID
WHEN NOT MATCHED THEN
    INSERT (TaskSubmission_ID, Team_ID, TeamLeader_ID, Grade_ID, Task_ID, GLink, Note, Feedback, created_at, updated_at, status_id)
    VALUES (source.TaskSubmission_ID, source.Team_ID, source.TeamLeader_ID, source.Grade_ID, source.Task_ID, source.GLink, source.Note, source.Feedback, source.created_at, source.updated_at, source.status_id);
SET IDENTITY_INSERT [TaskSubmission] OFF;

-- 6. Report
SET IDENTITY_INSERT [Report] ON;
MERGE [Report] AS target
USING (VALUES
    (1, 'Weekly Progress - Alpha', GETDATE(), 'We accomplished X and Y this week.', 8, 1),
    (2, 'Weekly Progress - Beta', GETDATE(), 'We had issues with Z.', 11, 2)
) AS source (Id, Title, SubmissionDate, ReportMessage, SubmitterAccountId, StatusId)
ON target.Id = source.Id
WHEN NOT MATCHED THEN
    INSERT (Id, Title, SubmissionDate, ReportMessage, SubmitterAccountId, StatusId)
    VALUES (source.Id, source.Title, source.SubmissionDate, source.ReportMessage, source.SubmitterAccountId, source.StatusId);
SET IDENTITY_INSERT [Report] OFF;

-- 7. Extensions
MERGE [SuperAdminExtension] AS target
USING (VALUES (1, 1)) AS source (AccountId, StatusId)
ON target.AccountId = source.AccountId
WHEN NOT MATCHED THEN
    INSERT (AccountId, StatusId) VALUES (source.AccountId, source.StatusId);

MERGE [ReviewerSupervisorExtension] AS target
USING (VALUES (3, 1, 1), (13, 2, 1)) AS source (AccountId, AssignedClassId, StatusId)
ON target.AccountId = source.AccountId
WHEN NOT MATCHED THEN
    INSERT (AccountId, AssignedClassId, StatusId) VALUES (source.AccountId, source.AssignedClassId, source.StatusId);

MERGE [CapstoneSupervisorExtension] AS target
USING (VALUES (7, 1)) AS source (AccountId, StatusId)
ON target.AccountId = source.AccountId
WHEN NOT MATCHED THEN
    INSERT (AccountId, StatusId) VALUES (source.AccountId, source.StatusId);
