DECLARE @Now DATETIME = GETDATE();

-- Insert 5 new Capstone Leads (Ids 45 to 49)
SET IDENTITY_INSERT [Account] ON;
MERGE [Account] AS target
USING (VALUES
(45, '40000000000001', 'password123', 'capstonelead1@example.com', '01200000001', 7, 'Hassan Mostafa', N'حسن مصطفى', @Now, 1, 1),
(46, '40000000000002', 'password123', 'capstonelead2@example.com', '01200000002', 7, 'Maged Sameh', N'ماجد سامح', @Now, 1, 1),
(47, '40000000000003', 'password123', 'capstonelead3@example.com', '01200000003', 7, 'Omar Yassin', N'عمر ياسين', @Now, 1, 1),
(48, '40000000000004', 'password123', 'capstonelead4@example.com', '01200000004', 7, 'Sherif Nabil', N'شريف نبيل', @Now, 1, 1),
(49, '40000000000005', 'password123', 'capstonelead5@example.com', '01200000005', 7, 'Ayman Wael', N'أيمن وائل', @Now, 1, 1)
) AS source (Id, NationalId, PasswordHash, Email, Phone, RoleId, FullNameEN, FullNameAR, Created_at, IsActive, StatusId)
ON target.Id = source.Id
WHEN NOT MATCHED THEN
    INSERT (Id, NationalId, PasswordHash, Email, Phone, RoleId, FullNameEN, FullNameAR, Created_at, IsActive, StatusId)
    VALUES (source.Id, source.NationalId, source.PasswordHash, source.Email, source.Phone, source.RoleId, source.FullNameEN, source.FullNameAR, source.Created_at, source.IsActive, source.StatusId);
SET IDENTITY_INSERT [Account] OFF;

-- Logins
MERGE [Login] AS target
USING (
    SELECT Id as AccountId, Email, PasswordHash, StatusId FROM [Account] WHERE Id BETWEEN 45 AND 49
) AS source (AccountId, Email, PasswordHash, StatusId)
ON target.AccountId = source.AccountId
WHEN NOT MATCHED THEN
    INSERT (AccountId, Email, PasswordHash, StatusId)
    VALUES (source.AccountId, source.Email, source.PasswordHash, source.StatusId);

-- AccountRoles
MERGE [AccountRoles] AS target
USING (
    SELECT Id as AccountId, RoleId, 'CapstoneProject' as BusinessEntityName FROM [Account] WHERE Id BETWEEN 45 AND 49
) AS source (AccountId, RoleId, BusinessEntityName)
ON target.AccountId = source.AccountId AND target.BusinessEntityName = source.BusinessEntityName
WHEN NOT MATCHED THEN
    INSERT (AccountID, RoleID, BusinessEntityName)
    VALUES (source.AccountId, source.RoleId, source.BusinessEntityName);
