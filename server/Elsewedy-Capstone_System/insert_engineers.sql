DECLARE @Now DATETIME = GETDATE();

-- Insert 10 new engineers (Ids 35 to 44)
SET IDENTITY_INSERT [Account] ON;
MERGE [Account] AS target
USING (VALUES
(35, '30000000000001', 'password123', 'engineer1@example.com', '01100000001', 5, 'Mahmoud Ali', N'محمود علي', @Now, 1, 1),
(36, '30000000000002', 'password123', 'engineer2@example.com', '01100000002', 5, 'Amr Yasser', N'عمرو ياسر', @Now, 1, 1),
(37, '30000000000003', 'password123', 'engineer3@example.com', '01100000003', 5, 'Tarek Wael', N'طارق وائل', @Now, 1, 1),
(38, '30000000000004', 'password123', 'engineer4@example.com', '01100000004', 5, 'Kareem Tarek', N'كريم طارق', @Now, 1, 1),
(39, '30000000000005', 'password123', 'engineer5@example.com', '01100000005', 5, 'Mostafa Hisham', N'مصطفى هشام', @Now, 1, 1),
(40, '30000000000006', 'password123', 'engineer6@example.com', '01100000006', 5, 'Yassin Maged', N'ياسين ماجد', @Now, 1, 1),
(41, '30000000000007', 'password123', 'engineer7@example.com', '01100000007', 5, 'Ziad Farid', N'زياد فريد', @Now, 1, 1),
(42, '30000000000008', 'password123', 'engineer8@example.com', '01100000008', 5, 'Khaled Osama', N'خالد أسامة', @Now, 1, 1),
(43, '30000000000009', 'password123', 'engineer9@example.com', '01100000009', 5, 'Ahmed Sameh', N'أحمد سامح', @Now, 1, 1),
(44, '30000000000010', 'password123', 'engineer10@example.com', '01100000010', 5, 'Youssef Nabil', N'يوسف نبيل', @Now, 1, 1)
) AS source (Id, NationalId, PasswordHash, Email, Phone, RoleId, FullNameEN, FullNameAR, Created_at, IsActive, StatusId)
ON target.Id = source.Id
WHEN NOT MATCHED THEN
    INSERT (Id, NationalId, PasswordHash, Email, Phone, RoleId, FullNameEN, FullNameAR, Created_at, IsActive, StatusId)
    VALUES (source.Id, source.NationalId, source.PasswordHash, source.Email, source.Phone, source.RoleId, source.FullNameEN, source.FullNameAR, source.Created_at, source.IsActive, source.StatusId);
SET IDENTITY_INSERT [Account] OFF;

-- Logins
MERGE [Login] AS target
USING (
    SELECT Id as AccountId, Email, PasswordHash, StatusId FROM [Account] WHERE Id BETWEEN 35 AND 44
) AS source (AccountId, Email, PasswordHash, StatusId)
ON target.AccountId = source.AccountId
WHEN NOT MATCHED THEN
    INSERT (AccountId, Email, PasswordHash, StatusId)
    VALUES (source.AccountId, source.Email, source.PasswordHash, source.StatusId);

-- AccountRoles
MERGE [AccountRoles] AS target
USING (
    SELECT Id as AccountId, RoleId, 'CapstoneProject' as BusinessEntityName FROM [Account] WHERE Id BETWEEN 35 AND 44
) AS source (AccountId, RoleId, BusinessEntityName)
ON target.AccountId = source.AccountId AND target.BusinessEntityName = source.BusinessEntityName
WHEN NOT MATCHED THEN
    INSERT (AccountID, RoleID, BusinessEntityName)
    VALUES (source.AccountId, source.RoleId, source.BusinessEntityName);
