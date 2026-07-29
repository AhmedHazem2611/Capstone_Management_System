DECLARE @Now DATETIME = GETDATE();

-- 1. Create Grades
SET IDENTITY_INSERT [Grade] ON;
MERGE [Grade] AS target
USING (VALUES
    (1, 'Grade 10', NULL, 1, 1),
    (2, 'Grade 11', NULL, 1, 1)
) AS source (Id, GradeName, ParentGradeId, AdminAccountId, StatusId)
ON target.Id = source.Id
WHEN NOT MATCHED THEN
    INSERT (Id, GradeName, ParentGradeId, AdminAccountId, StatusId)
    VALUES (source.Id, source.GradeName, source.ParentGradeId, source.AdminAccountId, source.StatusId);
SET IDENTITY_INSERT [Grade] OFF;

-- 2. Create Classes
SET IDENTITY_INSERT [Tbl_Class] ON;
MERGE [Tbl_Class] AS target
USING (VALUES
    (1, '10-A', 1, 1),
    (2, '11-B', 2, 1)
) AS source (Id, ClassName, GradeId, StatusId)
ON target.Id = source.Id
WHEN NOT MATCHED THEN
    INSERT (Id, ClassName, GradeId, StatusId)
    VALUES (source.Id, source.ClassName, source.GradeId, source.StatusId);
SET IDENTITY_INSERT [Tbl_Class] OFF;

-- 3. Create Additional Accounts (Students 2-5, Supervisors 2)
MERGE [Account] AS target
USING (VALUES
    (9, '20000000000001', 'password123', 'student2@example.com', '01000000009', 8, 'Student Two', 'Student Two', @Now, 1, 1),
    (10, '20000000000002', 'password123', 'student3@example.com', '01000000010', 8, 'Student Three', 'Student Three', @Now, 1, 1),
    (11, '20000000000003', 'password123', 'student4@example.com', '01000000011', 8, 'Student Four', 'Student Four', @Now, 1, 1),
    (12, '20000000000004', 'password123', 'student5@example.com', '01000000012', 8, 'Student Five', 'Student Five', @Now, 1, 1),
    (13, '20000000000005', 'password123', 'supervisor2@example.com', '01000000013', 3, 'Supervisor Two', 'Supervisor Two', @Now, 1, 1)
) AS source (Id, NationalId, PasswordHash, Email, Phone, RoleId, FullNameEn, FullNameAr, CreatedAt, IsActive, StatusId)
ON target.Email = source.Email
WHEN NOT MATCHED THEN
    INSERT (NationalId, PasswordHash, Email, Phone, RoleId, FullNameEN, FullNameAR, Created_at, IsActive, StatusId)
    VALUES (source.NationalId, source.PasswordHash, source.Email, source.Phone, source.RoleId, source.FullNameEn, source.FullNameAr, source.CreatedAt, source.IsActive, source.StatusId);

-- Populate Login
MERGE [Login] AS target
USING (
    SELECT Id as AccountId, Email, PasswordHash, StatusId FROM [Account] WHERE Email LIKE 'student%@example.com' OR Email LIKE 'supervisor2%@example.com'
) AS source (AccountId, Email, PasswordHash, StatusId)
ON target.AccountId = source.AccountId
WHEN NOT MATCHED THEN
    INSERT (AccountId, Email, PasswordHash, StatusId)
    VALUES (source.AccountId, source.Email, source.PasswordHash, source.StatusId);

-- Populate AccountRoles
MERGE [AccountRoles] AS target
USING (
    SELECT Id as AccountId, RoleId, 'CapstoneProject' as BusinessEntityName FROM [Account] WHERE Email LIKE 'student%@example.com' OR Email LIKE 'supervisor2%@example.com'
) AS source (AccountId, RoleId, BusinessEntityName)
ON target.AccountId = source.AccountId AND target.BusinessEntityName = source.BusinessEntityName
WHEN NOT MATCHED THEN
    INSERT (AccountID, RoleID, BusinessEntityName)
    VALUES (source.AccountId, source.RoleId, source.BusinessEntityName);

-- Populate StudentExtensions (for the students we just created + the original student (Id=8))
MERGE [StudentExtension] AS target
USING (
    SELECT Id as AccountId, 0 as IsLeader, 1 as ClassId, 1 as StatusId FROM [Account] WHERE Email LIKE 'student%@example.com'
) AS source (AccountId, IsLeader, ClassId, StatusId)
ON target.AccountId = source.AccountId
WHEN NOT MATCHED THEN
    INSERT (AccountId, IsLeader, ClassId, StatusId)
    VALUES (source.AccountId, source.IsLeader, source.ClassId, source.StatusId);

-- Update one student to be a leader in their extension
UPDATE [StudentExtension] SET IsLeader = 1 WHERE AccountId = 8;
UPDATE [StudentExtension] SET IsLeader = 1 WHERE AccountId = 11;

-- Create Projects
SET IDENTITY_INSERT [Project] ON;
MERGE [Project] AS target
USING (VALUES
    (1, 'مشروع 1', 'AI Smart System', 'TechCorp', 'Additional info', @Now, 'AI description', 1, 3), -- Supervisor 1
    (2, 'مشروع 2', 'IoT Automation', 'BuildIt', 'Additional info', @Now, 'IoT description', 1, 13) -- Supervisor 2
) AS source (Id, NameAR, NameEN, CompanyName, AdditionalInformation, DateOfCreation, ProjectDescription, StatusId, SupervisorAccountId)
ON target.Id = source.Id
WHEN NOT MATCHED THEN
    INSERT (Id, NameAR, NameEN, CompanyName, AdditionalInformation, DateOfCreation, ProjectDescription, StatusId, SupervisorAccountId)
    VALUES (source.Id, source.NameAR, source.NameEN, source.CompanyName, source.AdditionalInformation, source.DateOfCreation, source.ProjectDescription, source.StatusId, source.SupervisorAccountId);
SET IDENTITY_INSERT [Project] OFF;

-- Create Teams
SET IDENTITY_INSERT [Team] ON;
MERGE [Team] AS target
USING (VALUES
    (1, 'Alpha Team', 8, 1, 3, 1, 1), -- Leader: Student1 (id 8), Supervisor 1 (id 3)
    (2, 'Beta Team', 11, 2, 13, 2, 1) -- Leader: Student4 (id 11), Supervisor 2 (id 13)
) AS source (Id, TeamName, TeamLeaderAccountId, ClassId, SupervisorAccountId, ProjectId, StatusId)
ON target.Id = source.Id
WHEN NOT MATCHED THEN
    INSERT (Id, TeamName, TeamLeaderAccountId, ClassId, SupervisorAccountId, ProjectId, StatusId)
    VALUES (source.Id, source.TeamName, source.TeamLeaderAccountId, source.ClassId, source.SupervisorAccountId, source.ProjectId, source.StatusId);
SET IDENTITY_INSERT [Team] OFF;

-- Create Team Members
MERGE [TeamMember] AS target
USING (VALUES
    (1, 8, 'Leader', 1),   -- Alpha Team
    (1, 9, 'Member', 1),   -- Alpha Team
    (1, 10, 'Member', 1),  -- Alpha Team
    (2, 11, 'Leader', 1),  -- Beta Team
    (2, 12, 'Member', 1)   -- Beta Team
) AS source (TeamId, TeamMemberAccountId, TeamMemberDescription, StatusId)
ON target.TeamMemberAccountId = source.TeamMemberAccountId
WHEN NOT MATCHED THEN
    INSERT (TeamId, TeamMemberAccountId, TeamMemberDescription, StatusId)
    VALUES (source.TeamId, source.TeamMemberAccountId, source.TeamMemberDescription, source.StatusId);
