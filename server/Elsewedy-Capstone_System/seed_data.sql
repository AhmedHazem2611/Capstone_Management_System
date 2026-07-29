-- Insert Statuses if they don't exist
IF NOT EXISTS (SELECT 1 FROM [Status] WHERE Id = 1)
BEGIN
    SET IDENTITY_INSERT [Status] ON;
    INSERT INTO [Status] (Id, StatusName, OrderNo, BusinessEntity) VALUES (1, 'Active', 1, 'General');
    INSERT INTO [Status] (Id, StatusName, OrderNo, BusinessEntity) VALUES (2, 'Inactive', 2, 'General');
    SET IDENTITY_INSERT [Status] OFF;
END

-- Insert Roles
SET IDENTITY_INSERT [Roles] ON;
MERGE [Roles] AS target
USING (VALUES 
    (1, 'SuperAdmin', 1, 'System'),
    (2, 'StaffAdmin', 2, 'System'),
    (3, 'Supervisor', 3, 'Academic'),
    (4, 'Teacher', 4, 'Academic'),
    (5, 'Engineer', 5, 'Technical'),
    (6, 'Board', 6, 'System'),
    (7, 'CapstoneLead', 7, 'Academic'),
    (8, 'Student', 8, 'Academic')
) AS source (Id, RoleName, OrderNo, BusinessEntity)
ON target.Id = source.Id
WHEN NOT MATCHED THEN
    INSERT (Id, RoleName, OrderNo, BusinessEntity)
    VALUES (source.Id, source.RoleName, source.OrderNo, source.BusinessEntity);
SET IDENTITY_INSERT [Roles] OFF;

-- Insert Accounts for each role
-- Password is 'password123' (will be hashed when changed, but login accepts plaintext temporarily as seen in AccountService)
DECLARE @Now DATETIME = GETDATE();

MERGE [Account] AS target
USING (VALUES
    (1, '10000000000001', 'password123', 'superadmin@example.com', '01000000001', 1, 'Super Admin', 'Super Admin', @Now, 1, 1),
    (2, '10000000000002', 'password123', 'staffadmin@example.com', '01000000002', 2, 'Staff Admin', 'Staff Admin', @Now, 1, 1),
    (3, '10000000000003', 'password123', 'supervisor@example.com', '01000000003', 3, 'Supervisor', 'Supervisor', @Now, 1, 1),
    (4, '10000000000004', 'password123', 'teacher@example.com', '01000000004', 4, 'Teacher', 'Teacher', @Now, 1, 1),
    (5, '10000000000005', 'password123', 'engineer@example.com', '01000000005', 5, 'Engineer', 'Engineer', @Now, 1, 1),
    (6, '10000000000006', 'password123', 'board@example.com', '01000000006', 6, 'Board Member', 'Board Member', @Now, 1, 1),
    (7, '10000000000007', 'password123', 'capstonelead@example.com', '01000000007', 7, 'Capstone Lead', 'Capstone Lead', @Now, 1, 1),
    (8, '10000000000008', 'password123', 'student@example.com', '01000000008', 8, 'Student', 'Student', @Now, 1, 1)
) AS source (Id, NationalId, PasswordHash, Email, Phone, RoleId, FullNameEn, FullNameAr, CreatedAt, IsActive, StatusId)
ON target.Email = source.Email
WHEN NOT MATCHED THEN
    INSERT (NationalId, PasswordHash, Email, Phone, RoleId, FullNameEN, FullNameAR, Created_at, IsActive, StatusId)
    VALUES (source.NationalId, source.PasswordHash, source.Email, source.Phone, source.RoleId, source.FullNameEn, source.FullNameAr, source.CreatedAt, source.IsActive, source.StatusId);

-- Also populate the Login table for these accounts
MERGE [Login] AS target
USING (
    SELECT Id as AccountId, Email, PasswordHash, StatusId FROM [Account] WHERE Email LIKE '%@example.com'
) AS source (AccountId, Email, PasswordHash, StatusId)
ON target.AccountId = source.AccountId
WHEN NOT MATCHED THEN
    INSERT (AccountId, Email, PasswordHash, StatusId)
    VALUES (source.AccountId, source.Email, source.PasswordHash, source.StatusId);

-- Populate AccountRoles table
MERGE [AccountRoles] AS target
USING (
    SELECT Id as AccountId, RoleId, 'CapstoneProject' as BusinessEntityName FROM [Account] WHERE Email LIKE '%@example.com'
) AS source (AccountId, RoleId, BusinessEntityName)
ON target.AccountId = source.AccountId AND target.BusinessEntityName = source.BusinessEntityName
WHEN NOT MATCHED THEN
    INSERT (AccountID, RoleID, BusinessEntityName)
    VALUES (source.AccountId, source.RoleId, source.BusinessEntityName);