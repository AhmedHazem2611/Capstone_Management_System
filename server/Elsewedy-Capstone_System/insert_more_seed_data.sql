DECLARE @Now DATETIME = GETDATE();

-- 1. Update existing students to unique names (Id 8 to 12 are known students from seed_teams.sql)
UPDATE [Account] SET FullNameEN = 'Youssef Ahmed', FullNameAR = N'يوسف أحمد' WHERE Id = 8;
UPDATE [Account] SET FullNameEN = 'Omar Khaled', FullNameAR = N'عمر خالد' WHERE Id = 9;
UPDATE [Account] SET FullNameEN = 'Mahmoud Hassan', FullNameAR = N'محمود حسن' WHERE Id = 10;
UPDATE [Account] SET FullNameEN = 'Tarek Amr', FullNameAR = N'طارق عمرو' WHERE Id = 11;
UPDATE [Account] SET FullNameEN = 'Mostafa Sayed', FullNameAR = N'مصطفى سيد' WHERE Id = 12;

-- 2. Insert 15 new students (Ids 20 to 34)
SET IDENTITY_INSERT [Account] ON;
MERGE [Account] AS target
USING (VALUES
(20, '20000000000006', 'password123', 'student20@example.com', '01000000020', 8, 'Ahmed Ibrahim', N'أحمد إبراهيم', @Now, 1, 1),
(21, '20000000000007', 'password123', 'student21@example.com', '01000000021', 8, 'Karim Ali', N'كريم علي', @Now, 1, 1),
(22, '20000000000008', 'password123', 'student22@example.com', '01000000022', 8, 'Ziad Mohamed', N'زياد محمد', @Now, 1, 1),
(23, '20000000000009', 'password123', 'student23@example.com', '01000000023', 8, 'Hassan Yasser', N'حسن ياسر', @Now, 1, 1),
(24, '20000000000010', 'password123', 'student24@example.com', '01000000024', 8, 'Hussein Osama', N'حسين أسامة', @Now, 1, 1),
(25, '20000000000011', 'password123', 'student25@example.com', '01000000025', 8, 'Seif Emad', N'سيف عماد', @Now, 1, 1),
(26, '20000000000012', 'password123', 'student26@example.com', '01000000026', 8, 'Abdelrahman Hisham', N'عبدالرحمن هشام', @Now, 1, 1),
(27, '20000000000013', 'password123', 'student27@example.com', '01000000027', 8, 'Marwan Tarek', N'مروان طارق', @Now, 1, 1),
(28, '20000000000014', 'password123', 'student28@example.com', '01000000028', 8, 'Adham Maged', N'أدهم ماجد', @Now, 1, 1),
(29, '20000000000015', 'password123', 'student29@example.com', '01000000029', 8, 'Fares Essam', N'فارس عصام', @Now, 1, 1),
(30, '20000000000016', 'password123', 'student30@example.com', '01000000030', 8, 'Nour Ayman', N'نور أيمن', @Now, 1, 1),
(31, '20000000000017', 'password123', 'student31@example.com', '01000000031', 8, 'Khaled Nabil', N'خالد نبيل', @Now, 1, 1),
(32, '20000000000018', 'password123', 'student32@example.com', '01000000032', 8, 'Yassin Wael', N'ياسين وائل', @Now, 1, 1),
(33, '20000000000019', 'password123', 'student33@example.com', '01000000033', 8, 'Mohamed Farid', N'محمد فريد', @Now, 1, 1),
(34, '20000000000020', 'password123', 'student34@example.com', '01000000034', 8, 'Islam Sameh', N'إسلام سامح', @Now, 1, 1)
) AS source (Id, NationalId, PasswordHash, Email, Phone, RoleId, FullNameEN, FullNameAR, Created_at, IsActive, StatusId)
ON target.Id = source.Id
WHEN NOT MATCHED THEN
    INSERT (Id, NationalId, PasswordHash, Email, Phone, RoleId, FullNameEN, FullNameAR, Created_at, IsActive, StatusId)
    VALUES (source.Id, source.NationalId, source.PasswordHash, source.Email, source.Phone, source.RoleId, source.FullNameEN, source.FullNameAR, source.Created_at, source.IsActive, source.StatusId);
SET IDENTITY_INSERT [Account] OFF;

-- 3. Logins
MERGE [Login] AS target
USING (
    SELECT Id as AccountId, Email, PasswordHash, StatusId FROM [Account] WHERE Id BETWEEN 20 AND 34
) AS source (AccountId, Email, PasswordHash, StatusId)
ON target.AccountId = source.AccountId
WHEN NOT MATCHED THEN
    INSERT (AccountId, Email, PasswordHash, StatusId)
    VALUES (source.AccountId, source.Email, source.PasswordHash, source.StatusId);

-- 4. AccountRoles
MERGE [AccountRoles] AS target
USING (
    SELECT Id as AccountId, RoleId, 'CapstoneProject' as BusinessEntityName FROM [Account] WHERE Id BETWEEN 20 AND 34
) AS source (AccountId, RoleId, BusinessEntityName)
ON target.AccountId = source.AccountId AND target.BusinessEntityName = source.BusinessEntityName
WHEN NOT MATCHED THEN
    INSERT (AccountID, RoleID, BusinessEntityName)
    VALUES (source.AccountId, source.RoleId, source.BusinessEntityName);

-- 5. StudentExtension
MERGE [StudentExtension] AS target
USING (
    SELECT Id as AccountId, 0 as IsLeader, 1 as ClassId, 1 as StatusId FROM [Account] WHERE Id BETWEEN 20 AND 34
) AS source (AccountId, IsLeader, ClassId, StatusId)
ON target.AccountId = source.AccountId
WHEN NOT MATCHED THEN
    INSERT (AccountId, IsLeader, ClassId, StatusId)
    VALUES (source.AccountId, source.IsLeader, source.ClassId, source.StatusId);

-- Update Leaders
UPDATE [StudentExtension] SET IsLeader = 1 WHERE AccountId IN (20, 23, 26, 29, 32);

-- 6. Insert 5 New Teams
SET IDENTITY_INSERT [Team] ON;
MERGE [Team] AS target
USING (VALUES
(3, 'Gamma Team', 20, 1, 3, NULL, 1),
(4, 'Delta Team', 23, 1, 3, NULL, 1),
(5, 'Epsilon Team', 26, 1, 3, NULL, 1),
(6, 'Zeta Team', 29, 1, 13, NULL, 1),
(7, 'Theta Team', 32, 1, 13, NULL, 1)
) AS source (Id, TeamName, TeamLeaderAccountId, ClassId, SupervisorAccountId, ProjectId, StatusId)
ON target.Id = source.Id
WHEN NOT MATCHED THEN
    INSERT (Id, TeamName, TeamLeaderAccountId, ClassId, SupervisorAccountId, ProjectId, StatusId)
    VALUES (source.Id, source.TeamName, source.TeamLeaderAccountId, source.ClassId, source.SupervisorAccountId, source.ProjectId, source.StatusId);
SET IDENTITY_INSERT [Team] OFF;

-- 7. Insert Team Members
MERGE [TeamMember] AS target
USING (VALUES
(3, 20, 'Leader', 1), (3, 21, 'Member', 1), (3, 22, 'Member', 1),
(4, 23, 'Leader', 1), (4, 24, 'Member', 1), (4, 25, 'Member', 1),
(5, 26, 'Leader', 1), (5, 27, 'Member', 1), (5, 28, 'Member', 1),
(6, 29, 'Leader', 1), (6, 30, 'Member', 1), (6, 31, 'Member', 1),
(7, 32, 'Leader', 1), (7, 33, 'Member', 1), (7, 34, 'Member', 1)
) AS source (TeamId, TeamMemberAccountId, TeamMemberDescription, StatusId)
ON target.TeamMemberAccountId = source.TeamMemberAccountId
WHEN NOT MATCHED THEN
    INSERT (TeamId, TeamMemberAccountId, TeamMemberDescription, StatusId)
    VALUES (source.TeamId, source.TeamMemberAccountId, source.TeamMemberDescription, source.StatusId);

-- 8. Insert 10 Tasks
SET IDENTITY_INSERT [Tbl_Task] ON;
MERGE [Tbl_Task] AS target
USING (VALUES
(1, 'Project Proposal', 'Submit the initial project proposal document', '2026-08-01', @Now, '2026-08-01 23:59:00', 1, 1, 1, 1),
(2, 'Requirement Analysis', 'Submit software requirements specification', '2026-08-15', @Now, '2026-08-15 23:59:00', 1, 1, 1, 2),
(3, 'System Architecture', 'Design the high level architecture', '2026-09-01', @Now, '2026-09-01 23:59:00', 1, 1, 1, 3),
(4, 'Database Design', 'Submit the ERD and database schema', '2026-09-15', @Now, '2026-09-15 23:59:00', 1, 1, 1, 4),
(5, 'UI/UX Mockups', 'Provide Figma or Adobe XD mockups for the core screens', '2026-10-01', @Now, '2026-10-01 23:59:00', 1, 1, 1, 5),
(6, 'Frontend Prototype', 'First working prototype of the frontend', '2026-10-15', @Now, '2026-10-15 23:59:00', 1, 1, 1, 6),
(7, 'Backend API Design', 'Document the REST APIs using Swagger', '2026-11-01', @Now, '2026-11-01 23:59:00', 1, 1, 1, 7),
(8, 'Integration Phase 1', 'Integrate frontend with core backend APIs', '2026-11-15', @Now, '2026-11-15 23:59:00', 1, 1, 1, 8),
(9, 'Testing Phase', 'Submit unit test coverage and QA report', '2026-12-01', @Now, '2026-12-01 23:59:00', 1, 1, 1, 9),
(10, 'Final Presentation', 'Upload the final PPT presentation and demo video', '2026-12-15', @Now, '2026-12-15 23:59:00', 1, 1, 1, 10)
) AS source (Id, TaskName, TaskDescription, DueDate, CreatedAt, TaskDeadline, GradeId, AdminAccountId, StatusId, WeekID)
ON target.Id = source.Id
WHEN NOT MATCHED THEN
    INSERT (Id, TaskName, TaskDescription, DueDate, CreatedAt, TaskDeadline, GradeId, AdminAccountId, StatusId, WeekID)
    VALUES (source.Id, source.TaskName, source.TaskDescription, source.DueDate, source.CreatedAt, source.TaskDeadline, source.GradeId, source.AdminAccountId, source.StatusId, source.WeekID);
SET IDENTITY_INSERT [Tbl_Task] OFF;
