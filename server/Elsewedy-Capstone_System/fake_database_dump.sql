-- Fake Database Dump exported on 2026-08-05 19:14:14
USE [ElsewedySchoolSysDB_DEV];
GO

-- Data for table Roles
SET IDENTITY_INSERT [Roles] ON;
INSERT INTO [Roles] ([Id], [RoleName], [OrderNo], [BusinessEntity]) VALUES (1, N'SuperAdmin', 1, N'System');
INSERT INTO [Roles] ([Id], [RoleName], [OrderNo], [BusinessEntity]) VALUES (2, N'StaffAdmin', 2, N'System');
INSERT INTO [Roles] ([Id], [RoleName], [OrderNo], [BusinessEntity]) VALUES (3, N'Supervisor', 3, N'Academic');
INSERT INTO [Roles] ([Id], [RoleName], [OrderNo], [BusinessEntity]) VALUES (4, N'Teacher', 4, N'Academic');
INSERT INTO [Roles] ([Id], [RoleName], [OrderNo], [BusinessEntity]) VALUES (5, N'Engineer', 5, N'Technical');
INSERT INTO [Roles] ([Id], [RoleName], [OrderNo], [BusinessEntity]) VALUES (6, N'Board', 6, N'System');
INSERT INTO [Roles] ([Id], [RoleName], [OrderNo], [BusinessEntity]) VALUES (7, N'CapstoneLead', 7, N'Academic');
INSERT INTO [Roles] ([Id], [RoleName], [OrderNo], [BusinessEntity]) VALUES (8, N'Student', 8, N'Academic');
SET IDENTITY_INSERT [Roles] OFF;
GO

-- Data for table Status
SET IDENTITY_INSERT [Status] ON;
INSERT INTO [Status] ([Id], [StatusName], [BusinessEntity], [OrderNo]) VALUES (1, N'Active', N'General', 1);
INSERT INTO [Status] ([Id], [StatusName], [BusinessEntity], [OrderNo]) VALUES (2, N'Inactive', N'General', 2);
SET IDENTITY_INSERT [Status] OFF;
GO

-- Data for table Grade
SET IDENTITY_INSERT [Grade] ON;
INSERT INTO [Grade] ([Id], [GradeName], [ParentGradeId], [AdminAccountId], [StatusId]) VALUES (1, N'Junior', NULL, 1, 1);
INSERT INTO [Grade] ([Id], [GradeName], [ParentGradeId], [AdminAccountId], [StatusId]) VALUES (2, N'Wheeler', NULL, 1, 1);
INSERT INTO [Grade] ([Id], [GradeName], [ParentGradeId], [AdminAccountId], [StatusId]) VALUES (3, N'Senior', NULL, NULL, 1);
SET IDENTITY_INSERT [Grade] OFF;
GO

-- Data for table Tbl_Class
SET IDENTITY_INSERT [Tbl_Class] ON;
INSERT INTO [Tbl_Class] ([Id], [ClassName], [GradeId], [StatusId]) VALUES (3, N'Junior 1', 1, 1);
INSERT INTO [Tbl_Class] ([Id], [ClassName], [GradeId], [StatusId]) VALUES (4, N'Junior 2', 1, 1);
INSERT INTO [Tbl_Class] ([Id], [ClassName], [GradeId], [StatusId]) VALUES (5, N'Junior 3', 1, 1);
INSERT INTO [Tbl_Class] ([Id], [ClassName], [GradeId], [StatusId]) VALUES (6, N'Junior 4', 1, 1);
INSERT INTO [Tbl_Class] ([Id], [ClassName], [GradeId], [StatusId]) VALUES (7, N'Wheeler 1', 2, 1);
INSERT INTO [Tbl_Class] ([Id], [ClassName], [GradeId], [StatusId]) VALUES (8, N'Wheeler 2', 2, 1);
INSERT INTO [Tbl_Class] ([Id], [ClassName], [GradeId], [StatusId]) VALUES (9, N'Wheeler 3', 2, 1);
INSERT INTO [Tbl_Class] ([Id], [ClassName], [GradeId], [StatusId]) VALUES (10, N'Wheeler 4', 2, 1);
INSERT INTO [Tbl_Class] ([Id], [ClassName], [GradeId], [StatusId]) VALUES (11, N'Senior 1', 3, 1);
INSERT INTO [Tbl_Class] ([Id], [ClassName], [GradeId], [StatusId]) VALUES (12, N'Senior 2', 3, 1);
INSERT INTO [Tbl_Class] ([Id], [ClassName], [GradeId], [StatusId]) VALUES (13, N'Senior 3', 3, 1);
INSERT INTO [Tbl_Class] ([Id], [ClassName], [GradeId], [StatusId]) VALUES (14, N'Senior 4', 3, 1);
SET IDENTITY_INSERT [Tbl_Class] OFF;
GO

-- Data for table Weeks
SET IDENTITY_INSERT [Weeks] ON;
INSERT INTO [Weeks] ([Id], [WeekTitle], [StartDate], [EndDate], [BusinessEntityName]) VALUES (1, N'Week 1', N'07/27/2026 00:00:00', N'08/02/2026 00:00:00', N'CapstoneProject');
INSERT INTO [Weeks] ([Id], [WeekTitle], [StartDate], [EndDate], [BusinessEntityName]) VALUES (2, N'Week 2', N'08/03/2026 00:00:00', N'08/09/2026 00:00:00', N'CapstoneProject');
INSERT INTO [Weeks] ([Id], [WeekTitle], [StartDate], [EndDate], [BusinessEntityName]) VALUES (3, N'Week 3', N'08/10/2026 00:00:00', N'08/16/2026 00:00:00', N'CapstoneProject');
INSERT INTO [Weeks] ([Id], [WeekTitle], [StartDate], [EndDate], [BusinessEntityName]) VALUES (4, N'Week 4', N'08/17/2026 00:00:00', N'08/23/2026 00:00:00', N'CapstoneProject');
INSERT INTO [Weeks] ([Id], [WeekTitle], [StartDate], [EndDate], [BusinessEntityName]) VALUES (5, N'Week 5', N'08/24/2026 00:00:00', N'08/30/2026 00:00:00', N'CapstoneProject');
INSERT INTO [Weeks] ([Id], [WeekTitle], [StartDate], [EndDate], [BusinessEntityName]) VALUES (6, N'Week 6', N'08/31/2026 00:00:00', N'09/06/2026 00:00:00', N'CapstoneProject');
INSERT INTO [Weeks] ([Id], [WeekTitle], [StartDate], [EndDate], [BusinessEntityName]) VALUES (7, N'Week 7', N'09/07/2026 00:00:00', N'09/13/2026 00:00:00', N'CapstoneProject');
INSERT INTO [Weeks] ([Id], [WeekTitle], [StartDate], [EndDate], [BusinessEntityName]) VALUES (8, N'Week 8', N'09/14/2026 00:00:00', N'09/20/2026 00:00:00', N'CapstoneProject');
INSERT INTO [Weeks] ([Id], [WeekTitle], [StartDate], [EndDate], [BusinessEntityName]) VALUES (9, N'Week 9', N'09/21/2026 00:00:00', N'09/27/2026 00:00:00', N'CapstoneProject');
INSERT INTO [Weeks] ([Id], [WeekTitle], [StartDate], [EndDate], [BusinessEntityName]) VALUES (10, N'Week 10', N'09/28/2026 00:00:00', N'10/04/2026 00:00:00', N'CapstoneProject');
INSERT INTO [Weeks] ([Id], [WeekTitle], [StartDate], [EndDate], [BusinessEntityName]) VALUES (11, N'Week 11', N'10/05/2026 00:00:00', N'10/11/2026 00:00:00', N'CapstoneProject');
INSERT INTO [Weeks] ([Id], [WeekTitle], [StartDate], [EndDate], [BusinessEntityName]) VALUES (12, N'Week 12', N'10/12/2026 00:00:00', N'10/18/2026 00:00:00', N'CapstoneProject');
SET IDENTITY_INSERT [Weeks] OFF;
GO

-- Data for table Account
SET IDENTITY_INSERT [Account] ON;
INSERT INTO [Account] ([Id], [NationalId], [PasswordHash], [Email], [Phone], [RoleId], [FullNameEN], [FullNameAR], [ResetToken], [ResetTokenExpiry], [Created_at], [IsActive], [StatusId]) VALUES (1, N'10000000000001', N'password123', N'superadmin@example.com', N'01000000001', 1, N'Super Admin', N'Super Admin', NULL, NULL, N'07/03/2026 02:29:28', NULL, 1);
INSERT INTO [Account] ([Id], [NationalId], [PasswordHash], [Email], [Phone], [RoleId], [FullNameEN], [FullNameAR], [ResetToken], [ResetTokenExpiry], [Created_at], [IsActive], [StatusId]) VALUES (2, N'10000000000002', N'password123', N'staffadmin@example.com', N'01000000002', 2, N'Staff Admin', N'Staff Admin', NULL, NULL, N'07/03/2026 02:29:28', NULL, 1);
INSERT INTO [Account] ([Id], [NationalId], [PasswordHash], [Email], [Phone], [RoleId], [FullNameEN], [FullNameAR], [ResetToken], [ResetTokenExpiry], [Created_at], [IsActive], [StatusId]) VALUES (3, N'10000000000003', N'password123', N'supervisor@example.com', N'01000000003', 3, N'Supervisor', N'Supervisor', NULL, NULL, N'07/03/2026 02:29:28', NULL, 1);
INSERT INTO [Account] ([Id], [NationalId], [PasswordHash], [Email], [Phone], [RoleId], [FullNameEN], [FullNameAR], [ResetToken], [ResetTokenExpiry], [Created_at], [IsActive], [StatusId]) VALUES (4, N'10000000000004', N'password123', N'teacher@example.com', N'01000000004', 4, N'Teacher', N'Teacher', NULL, NULL, N'07/03/2026 02:29:28', NULL, 1);
INSERT INTO [Account] ([Id], [NationalId], [PasswordHash], [Email], [Phone], [RoleId], [FullNameEN], [FullNameAR], [ResetToken], [ResetTokenExpiry], [Created_at], [IsActive], [StatusId]) VALUES (5, N'10000000000005', N'password123', N'engineer@example.com', N'01000000005', 5, N'Engineer', N'Engineer', NULL, NULL, N'07/03/2026 02:29:28', NULL, 1);
INSERT INTO [Account] ([Id], [NationalId], [PasswordHash], [Email], [Phone], [RoleId], [FullNameEN], [FullNameAR], [ResetToken], [ResetTokenExpiry], [Created_at], [IsActive], [StatusId]) VALUES (6, N'10000000000006', N'password123', N'board@example.com', N'01000000006', 6, N'Board Member', N'Board Member', NULL, NULL, N'07/03/2026 02:29:28', NULL, 1);
INSERT INTO [Account] ([Id], [NationalId], [PasswordHash], [Email], [Phone], [RoleId], [FullNameEN], [FullNameAR], [ResetToken], [ResetTokenExpiry], [Created_at], [IsActive], [StatusId]) VALUES (7, N'10000000000007', N'password123', N'capstonelead@example.com', N'01000000007', 7, N'Capstone Lead', N'Capstone Lead', NULL, NULL, N'07/03/2026 02:29:28', NULL, 1);
INSERT INTO [Account] ([Id], [NationalId], [PasswordHash], [Email], [Phone], [RoleId], [FullNameEN], [FullNameAR], [ResetToken], [ResetTokenExpiry], [Created_at], [IsActive], [StatusId]) VALUES (8, N'10000000000008', N'password123', N'student@example.com', N'01000000008', 8, N'Youssef Ahmed', N'ÙŠÙˆØ³Ù Ø£Ø­Ù…Ø¯', NULL, NULL, N'07/03/2026 02:29:28', NULL, 1);
INSERT INTO [Account] ([Id], [NationalId], [PasswordHash], [Email], [Phone], [RoleId], [FullNameEN], [FullNameAR], [ResetToken], [ResetTokenExpiry], [Created_at], [IsActive], [StatusId]) VALUES (9, N'20000000000001', N'password123', N'student2@example.com', N'01000000009', 8, N'Omar Khaled', N'Ø¹Ù…Ø± Ø®Ø§Ù„Ø¯', NULL, NULL, N'07/03/2026 02:29:28', NULL, 1);
INSERT INTO [Account] ([Id], [NationalId], [PasswordHash], [Email], [Phone], [RoleId], [FullNameEN], [FullNameAR], [ResetToken], [ResetTokenExpiry], [Created_at], [IsActive], [StatusId]) VALUES (10, N'20000000000002', N'password123', N'student3@example.com', N'01000000010', 8, N'Mahmoud Hassan', N'Ù…Ø­Ù…ÙˆØ¯ Ø­Ø³Ù†', NULL, NULL, N'07/03/2026 02:29:28', NULL, 1);
INSERT INTO [Account] ([Id], [NationalId], [PasswordHash], [Email], [Phone], [RoleId], [FullNameEN], [FullNameAR], [ResetToken], [ResetTokenExpiry], [Created_at], [IsActive], [StatusId]) VALUES (11, N'20000000000003', N'password123', N'student4@example.com', N'01000000011', 8, N'Tarek Amr', N'Ø·Ø§Ø±Ù‚ Ø¹Ù…Ø±Ùˆ', NULL, NULL, N'07/03/2026 02:29:28', NULL, 1);
INSERT INTO [Account] ([Id], [NationalId], [PasswordHash], [Email], [Phone], [RoleId], [FullNameEN], [FullNameAR], [ResetToken], [ResetTokenExpiry], [Created_at], [IsActive], [StatusId]) VALUES (12, N'20000000000004', N'password123', N'student5@example.com', N'01000000012', 8, N'Mostafa Sayed', N'Ù…ØµØ·ÙÙ‰ Ø³ÙŠØ¯', NULL, NULL, N'07/03/2026 02:29:28', NULL, 1);
INSERT INTO [Account] ([Id], [NationalId], [PasswordHash], [Email], [Phone], [RoleId], [FullNameEN], [FullNameAR], [ResetToken], [ResetTokenExpiry], [Created_at], [IsActive], [StatusId]) VALUES (13, N'20000000000005', N'password123', N'supervisor2@example.com', N'01000000013', 3, N'Supervisor Two', N'Supervisor Two', NULL, NULL, N'07/03/2026 02:29:28', NULL, 1);
INSERT INTO [Account] ([Id], [NationalId], [PasswordHash], [Email], [Phone], [RoleId], [FullNameEN], [FullNameAR], [ResetToken], [ResetTokenExpiry], [Created_at], [IsActive], [StatusId]) VALUES (20, N'20000000000006', N'password123', N'student20@example.com', N'01000000020', 8, N'Ahmed Ibrahim', N'Ø£Ø­Ù…Ø¯ Ø¥Ø¨Ø±Ø§Ù‡ÙŠÙ…', NULL, NULL, N'07/03/2026 02:29:29', NULL, 1);
INSERT INTO [Account] ([Id], [NationalId], [PasswordHash], [Email], [Phone], [RoleId], [FullNameEN], [FullNameAR], [ResetToken], [ResetTokenExpiry], [Created_at], [IsActive], [StatusId]) VALUES (21, N'20000000000007', N'password123', N'student21@example.com', N'01000000021', 8, N'Karim Ali', N'ÙƒØ±ÙŠÙ… Ø¹Ù„ÙŠ', NULL, NULL, N'07/03/2026 02:29:29', NULL, 1);
INSERT INTO [Account] ([Id], [NationalId], [PasswordHash], [Email], [Phone], [RoleId], [FullNameEN], [FullNameAR], [ResetToken], [ResetTokenExpiry], [Created_at], [IsActive], [StatusId]) VALUES (22, N'20000000000008', N'password123', N'student22@example.com', N'01000000022', 8, N'Ziad Mohamed', N'Ø²ÙŠØ§Ø¯ Ù…Ø­Ù…Ø¯', NULL, NULL, N'07/03/2026 02:29:29', NULL, 1);
INSERT INTO [Account] ([Id], [NationalId], [PasswordHash], [Email], [Phone], [RoleId], [FullNameEN], [FullNameAR], [ResetToken], [ResetTokenExpiry], [Created_at], [IsActive], [StatusId]) VALUES (23, N'20000000000009', N'password123', N'student23@example.com', N'01000000023', 8, N'Hassan Yasser', N'Ø­Ø³Ù† ÙŠØ§Ø³Ø±', NULL, NULL, N'07/03/2026 02:29:29', NULL, 1);
INSERT INTO [Account] ([Id], [NationalId], [PasswordHash], [Email], [Phone], [RoleId], [FullNameEN], [FullNameAR], [ResetToken], [ResetTokenExpiry], [Created_at], [IsActive], [StatusId]) VALUES (24, N'20000000000010', N'password123', N'student24@example.com', N'01000000024', 8, N'Hussein Osama', N'Ø­Ø³ÙŠÙ† Ø£Ø³Ø§Ù…Ø©', NULL, NULL, N'07/03/2026 02:29:29', NULL, 1);
INSERT INTO [Account] ([Id], [NationalId], [PasswordHash], [Email], [Phone], [RoleId], [FullNameEN], [FullNameAR], [ResetToken], [ResetTokenExpiry], [Created_at], [IsActive], [StatusId]) VALUES (25, N'20000000000011', N'password123', N'student25@example.com', N'01000000025', 8, N'Seif Emad', N'Ø³ÙŠÙ Ø¹Ù…Ø§Ø¯', NULL, NULL, N'07/03/2026 02:29:29', NULL, 1);
INSERT INTO [Account] ([Id], [NationalId], [PasswordHash], [Email], [Phone], [RoleId], [FullNameEN], [FullNameAR], [ResetToken], [ResetTokenExpiry], [Created_at], [IsActive], [StatusId]) VALUES (26, N'20000000000012', N'password123', N'student26@example.com', N'01000000026', 8, N'Abdelrahman Hisham', N'Ø¹Ø¨Ø¯Ø§Ù„Ø±Ø­Ù…Ù† Ù‡Ø´Ø§Ù…', NULL, NULL, N'07/03/2026 02:29:29', NULL, 1);
INSERT INTO [Account] ([Id], [NationalId], [PasswordHash], [Email], [Phone], [RoleId], [FullNameEN], [FullNameAR], [ResetToken], [ResetTokenExpiry], [Created_at], [IsActive], [StatusId]) VALUES (27, N'20000000000013', N'password123', N'student27@example.com', N'01000000027', 8, N'Marwan Tarek', N'Ù…Ø±ÙˆØ§Ù† Ø·Ø§Ø±Ù‚', NULL, NULL, N'07/03/2026 02:29:29', NULL, 1);
INSERT INTO [Account] ([Id], [NationalId], [PasswordHash], [Email], [Phone], [RoleId], [FullNameEN], [FullNameAR], [ResetToken], [ResetTokenExpiry], [Created_at], [IsActive], [StatusId]) VALUES (28, N'20000000000014', N'password123', N'student28@example.com', N'01000000028', 8, N'Adham Maged', N'Ø£Ø¯Ù‡Ù… Ù…Ø§Ø¬Ø¯', NULL, NULL, N'07/03/2026 02:29:29', NULL, 1);
INSERT INTO [Account] ([Id], [NationalId], [PasswordHash], [Email], [Phone], [RoleId], [FullNameEN], [FullNameAR], [ResetToken], [ResetTokenExpiry], [Created_at], [IsActive], [StatusId]) VALUES (29, N'20000000000015', N'password123', N'student29@example.com', N'01000000029', 8, N'Fares Essam', N'ÙØ§Ø±Ø³ Ø¹ØµØ§Ù…', NULL, NULL, N'07/03/2026 02:29:29', NULL, 1);
INSERT INTO [Account] ([Id], [NationalId], [PasswordHash], [Email], [Phone], [RoleId], [FullNameEN], [FullNameAR], [ResetToken], [ResetTokenExpiry], [Created_at], [IsActive], [StatusId]) VALUES (30, N'20000000000016', N'password123', N'student30@example.com', N'01000000030', 8, N'Nour Ayman', N'Ù†ÙˆØ± Ø£ÙŠÙ…Ù†', NULL, NULL, N'07/03/2026 02:29:29', NULL, 1);
INSERT INTO [Account] ([Id], [NationalId], [PasswordHash], [Email], [Phone], [RoleId], [FullNameEN], [FullNameAR], [ResetToken], [ResetTokenExpiry], [Created_at], [IsActive], [StatusId]) VALUES (31, N'20000000000017', N'password123', N'student31@example.com', N'01000000031', 8, N'Khaled Nabil', N'Ø®Ø§Ù„Ø¯ Ù†Ø¨ÙŠÙ„', NULL, NULL, N'07/03/2026 02:29:29', NULL, 1);
INSERT INTO [Account] ([Id], [NationalId], [PasswordHash], [Email], [Phone], [RoleId], [FullNameEN], [FullNameAR], [ResetToken], [ResetTokenExpiry], [Created_at], [IsActive], [StatusId]) VALUES (32, N'20000000000018', N'password123', N'student32@example.com', N'01000000032', 8, N'Yassin Wael', N'ÙŠØ§Ø³ÙŠÙ† ÙˆØ§Ø¦Ù„', NULL, NULL, N'07/03/2026 02:29:29', NULL, 1);
INSERT INTO [Account] ([Id], [NationalId], [PasswordHash], [Email], [Phone], [RoleId], [FullNameEN], [FullNameAR], [ResetToken], [ResetTokenExpiry], [Created_at], [IsActive], [StatusId]) VALUES (33, N'20000000000019', N'password123', N'student33@example.com', N'01000000033', 8, N'Mohamed Farid', N'Ù…Ø­Ù…Ø¯ ÙØ±ÙŠØ¯', NULL, NULL, N'07/03/2026 02:29:29', NULL, 1);
INSERT INTO [Account] ([Id], [NationalId], [PasswordHash], [Email], [Phone], [RoleId], [FullNameEN], [FullNameAR], [ResetToken], [ResetTokenExpiry], [Created_at], [IsActive], [StatusId]) VALUES (34, N'20000000000020', N'password123', N'student34@example.com', N'01000000034', 8, N'Islam Sameh', N'Ø¥Ø³Ù„Ø§Ù… Ø³Ø§Ù…Ø­', NULL, NULL, N'07/03/2026 02:29:29', NULL, 1);
INSERT INTO [Account] ([Id], [NationalId], [PasswordHash], [Email], [Phone], [RoleId], [FullNameEN], [FullNameAR], [ResetToken], [ResetTokenExpiry], [Created_at], [IsActive], [StatusId]) VALUES (35, N'30000000000001', N'password123', N'engineer1@example.com', N'01100000001', 5, N'Mahmoud Ali', N'Ù…Ø­Ù…ÙˆØ¯ Ø¹Ù„ÙŠ', NULL, NULL, N'07/03/2026 02:31:38', NULL, 1);
INSERT INTO [Account] ([Id], [NationalId], [PasswordHash], [Email], [Phone], [RoleId], [FullNameEN], [FullNameAR], [ResetToken], [ResetTokenExpiry], [Created_at], [IsActive], [StatusId]) VALUES (36, N'30000000000002', N'password123', N'engineer2@example.com', N'01100000002', 5, N'Amr Yasser', N'Ø¹Ù…Ø±Ùˆ ÙŠØ§Ø³Ø±', NULL, NULL, N'07/03/2026 02:31:38', NULL, 1);
INSERT INTO [Account] ([Id], [NationalId], [PasswordHash], [Email], [Phone], [RoleId], [FullNameEN], [FullNameAR], [ResetToken], [ResetTokenExpiry], [Created_at], [IsActive], [StatusId]) VALUES (37, N'30000000000003', N'password123', N'engineer3@example.com', N'01100000003', 5, N'Tarek Wael', N'Ø·Ø§Ø±Ù‚ ÙˆØ§Ø¦Ù„', NULL, NULL, N'07/03/2026 02:31:38', NULL, 1);
INSERT INTO [Account] ([Id], [NationalId], [PasswordHash], [Email], [Phone], [RoleId], [FullNameEN], [FullNameAR], [ResetToken], [ResetTokenExpiry], [Created_at], [IsActive], [StatusId]) VALUES (38, N'30000000000004', N'password123', N'engineer4@example.com', N'01100000004', 5, N'Kareem Tarek', N'ÙƒØ±ÙŠÙ… Ø·Ø§Ø±Ù‚', NULL, NULL, N'07/03/2026 02:31:38', NULL, 1);
INSERT INTO [Account] ([Id], [NationalId], [PasswordHash], [Email], [Phone], [RoleId], [FullNameEN], [FullNameAR], [ResetToken], [ResetTokenExpiry], [Created_at], [IsActive], [StatusId]) VALUES (39, N'30000000000005', N'password123', N'engineer5@example.com', N'01100000005', 5, N'Mostafa Hisham', N'Ù…ØµØ·ÙÙ‰ Ù‡Ø´Ø§Ù…', NULL, NULL, N'07/03/2026 02:31:38', NULL, 1);
INSERT INTO [Account] ([Id], [NationalId], [PasswordHash], [Email], [Phone], [RoleId], [FullNameEN], [FullNameAR], [ResetToken], [ResetTokenExpiry], [Created_at], [IsActive], [StatusId]) VALUES (40, N'30000000000006', N'password123', N'engineer6@example.com', N'01100000006', 5, N'Yassin Maged', N'ÙŠØ§Ø³ÙŠÙ† Ù…Ø§Ø¬Ø¯', NULL, NULL, N'07/03/2026 02:31:38', NULL, 1);
INSERT INTO [Account] ([Id], [NationalId], [PasswordHash], [Email], [Phone], [RoleId], [FullNameEN], [FullNameAR], [ResetToken], [ResetTokenExpiry], [Created_at], [IsActive], [StatusId]) VALUES (41, N'30000000000007', N'password123', N'engineer7@example.com', N'01100000007', 5, N'Ziad Farid', N'Ø²ÙŠØ§Ø¯ ÙØ±ÙŠØ¯', NULL, NULL, N'07/03/2026 02:31:38', NULL, 1);
INSERT INTO [Account] ([Id], [NationalId], [PasswordHash], [Email], [Phone], [RoleId], [FullNameEN], [FullNameAR], [ResetToken], [ResetTokenExpiry], [Created_at], [IsActive], [StatusId]) VALUES (42, N'30000000000008', N'password123', N'engineer8@example.com', N'01100000008', 5, N'Khaled Osama', N'Ø®Ø§Ù„Ø¯ Ø£Ø³Ø§Ù…Ø©', NULL, NULL, N'07/03/2026 02:31:38', NULL, 1);
INSERT INTO [Account] ([Id], [NationalId], [PasswordHash], [Email], [Phone], [RoleId], [FullNameEN], [FullNameAR], [ResetToken], [ResetTokenExpiry], [Created_at], [IsActive], [StatusId]) VALUES (43, N'30000000000009', N'password123', N'engineer9@example.com', N'01100000009', 5, N'Ahmed Sameh', N'Ø£Ø­Ù…Ø¯ Ø³Ø§Ù…Ø­', NULL, NULL, N'07/03/2026 02:31:38', NULL, 1);
INSERT INTO [Account] ([Id], [NationalId], [PasswordHash], [Email], [Phone], [RoleId], [FullNameEN], [FullNameAR], [ResetToken], [ResetTokenExpiry], [Created_at], [IsActive], [StatusId]) VALUES (44, N'30000000000010', N'password123', N'engineer10@example.com', N'01100000010', 5, N'Youssef Nabil', N'ÙŠÙˆØ³Ù Ù†Ø¨ÙŠÙ„', NULL, NULL, N'07/03/2026 02:31:38', NULL, 1);
INSERT INTO [Account] ([Id], [NationalId], [PasswordHash], [Email], [Phone], [RoleId], [FullNameEN], [FullNameAR], [ResetToken], [ResetTokenExpiry], [Created_at], [IsActive], [StatusId]) VALUES (45, N'40000000000001', N'password123', N'capstonelead1@example.com', N'01200000001', 7, N'Hassan Mostafa', N'Ø­Ø³Ù† Ù…ØµØ·ÙÙ‰', NULL, NULL, N'07/03/2026 02:32:33', NULL, 1);
INSERT INTO [Account] ([Id], [NationalId], [PasswordHash], [Email], [Phone], [RoleId], [FullNameEN], [FullNameAR], [ResetToken], [ResetTokenExpiry], [Created_at], [IsActive], [StatusId]) VALUES (46, N'40000000000002', N'password123', N'capstonelead2@example.com', N'01200000002', 7, N'Maged Sameh', N'Ù…Ø§Ø¬Ø¯ Ø³Ø§Ù…Ø­', NULL, NULL, N'07/03/2026 02:32:33', NULL, 1);
INSERT INTO [Account] ([Id], [NationalId], [PasswordHash], [Email], [Phone], [RoleId], [FullNameEN], [FullNameAR], [ResetToken], [ResetTokenExpiry], [Created_at], [IsActive], [StatusId]) VALUES (47, N'40000000000003', N'password123', N'capstonelead3@example.com', N'01200000003', 7, N'Omar Yassin', N'Ø¹Ù…Ø± ÙŠØ§Ø³ÙŠÙ†', NULL, NULL, N'07/03/2026 02:32:33', NULL, 1);
INSERT INTO [Account] ([Id], [NationalId], [PasswordHash], [Email], [Phone], [RoleId], [FullNameEN], [FullNameAR], [ResetToken], [ResetTokenExpiry], [Created_at], [IsActive], [StatusId]) VALUES (48, N'40000000000004', N'password123', N'capstonelead4@example.com', N'01200000004', 7, N'Sherif Nabil', N'Ø´Ø±ÙŠÙ Ù†Ø¨ÙŠÙ„', NULL, NULL, N'07/03/2026 02:32:33', NULL, 1);
INSERT INTO [Account] ([Id], [NationalId], [PasswordHash], [Email], [Phone], [RoleId], [FullNameEN], [FullNameAR], [ResetToken], [ResetTokenExpiry], [Created_at], [IsActive], [StatusId]) VALUES (49, N'40000000000005', N'password123', N'capstonelead5@example.com', N'01200000005', 7, N'Ayman Wael', N'Ø£ÙŠÙ…Ù† ÙˆØ§Ø¦Ù„', NULL, NULL, N'07/03/2026 02:32:33', NULL, 1);
INSERT INTO [Account] ([Id], [NationalId], [PasswordHash], [Email], [Phone], [RoleId], [FullNameEN], [FullNameAR], [ResetToken], [ResetTokenExpiry], [Created_at], [IsActive], [StatusId]) VALUES (56, N'11111111111111', N'password123', N'demo_super@example.com', N'01111111111', 1, N'Demo Super', N'Demo Super', NULL, NULL, N'07/29/2026 21:07:58', NULL, 1);
INSERT INTO [Account] ([Id], [NationalId], [PasswordHash], [Email], [Phone], [RoleId], [FullNameEN], [FullNameAR], [ResetToken], [ResetTokenExpiry], [Created_at], [IsActive], [StatusId]) VALUES (57, N'11111111111112', N'password123', N'demo_staff@example.com', N'01111111112', 2, N'Demo Staff', N'Demo Staff', NULL, NULL, N'07/29/2026 21:07:58', NULL, 1);
INSERT INTO [Account] ([Id], [NationalId], [PasswordHash], [Email], [Phone], [RoleId], [FullNameEN], [FullNameAR], [ResetToken], [ResetTokenExpiry], [Created_at], [IsActive], [StatusId]) VALUES (58, N'11111111111113', N'password123', N'demo_engineer@example.com', N'01111111113', 5, N'Demo Engineer', N'Demo Engineer', NULL, NULL, N'07/29/2026 21:07:58', NULL, 1);
INSERT INTO [Account] ([Id], [NationalId], [PasswordHash], [Email], [Phone], [RoleId], [FullNameEN], [FullNameAR], [ResetToken], [ResetTokenExpiry], [Created_at], [IsActive], [StatusId]) VALUES (59, N'11111111111114', N'password123', N'demo_board@example.com', N'01111111114', 6, N'Demo Board', N'Demo Board', NULL, NULL, N'07/29/2026 21:07:58', NULL, 1);
INSERT INTO [Account] ([Id], [NationalId], [PasswordHash], [Email], [Phone], [RoleId], [FullNameEN], [FullNameAR], [ResetToken], [ResetTokenExpiry], [Created_at], [IsActive], [StatusId]) VALUES (60, N'11111111111115', N'password123', N'demo_lead@example.com', N'01111111115', 7, N'Demo Lead', N'Demo Lead', NULL, NULL, N'07/29/2026 21:07:58', NULL, 1);
INSERT INTO [Account] ([Id], [NationalId], [PasswordHash], [Email], [Phone], [RoleId], [FullNameEN], [FullNameAR], [ResetToken], [ResetTokenExpiry], [Created_at], [IsActive], [StatusId]) VALUES (61, N'11111111111116', N'password123', N'demo_student@example.com', N'01111111116', 8, N'Demo Student', N'Demo Student', NULL, NULL, N'07/29/2026 21:07:58', NULL, 1);
SET IDENTITY_INSERT [Account] OFF;
GO

-- Data for table AccountRoles
SET IDENTITY_INSERT [AccountRoles] ON;
INSERT INTO [AccountRoles] ([ID], [RoleID], [AccountID], [BusinessEntityName]) VALUES (1, 1, 1, N'CapstoneProject');
INSERT INTO [AccountRoles] ([ID], [RoleID], [AccountID], [BusinessEntityName]) VALUES (2, 2, 2, N'CapstoneProject');
INSERT INTO [AccountRoles] ([ID], [RoleID], [AccountID], [BusinessEntityName]) VALUES (3, 3, 3, N'CapstoneProject');
INSERT INTO [AccountRoles] ([ID], [RoleID], [AccountID], [BusinessEntityName]) VALUES (4, 4, 4, N'CapstoneProject');
INSERT INTO [AccountRoles] ([ID], [RoleID], [AccountID], [BusinessEntityName]) VALUES (5, 5, 5, N'CapstoneProject');
INSERT INTO [AccountRoles] ([ID], [RoleID], [AccountID], [BusinessEntityName]) VALUES (6, 6, 6, N'CapstoneProject');
INSERT INTO [AccountRoles] ([ID], [RoleID], [AccountID], [BusinessEntityName]) VALUES (7, 7, 7, N'CapstoneProject');
INSERT INTO [AccountRoles] ([ID], [RoleID], [AccountID], [BusinessEntityName]) VALUES (8, 8, 8, N'CapstoneProject');
INSERT INTO [AccountRoles] ([ID], [RoleID], [AccountID], [BusinessEntityName]) VALUES (9, 8, 9, N'CapstoneProject');
INSERT INTO [AccountRoles] ([ID], [RoleID], [AccountID], [BusinessEntityName]) VALUES (10, 8, 10, N'CapstoneProject');
INSERT INTO [AccountRoles] ([ID], [RoleID], [AccountID], [BusinessEntityName]) VALUES (11, 8, 11, N'CapstoneProject');
INSERT INTO [AccountRoles] ([ID], [RoleID], [AccountID], [BusinessEntityName]) VALUES (12, 8, 12, N'CapstoneProject');
INSERT INTO [AccountRoles] ([ID], [RoleID], [AccountID], [BusinessEntityName]) VALUES (13, 3, 13, N'CapstoneProject');
INSERT INTO [AccountRoles] ([ID], [RoleID], [AccountID], [BusinessEntityName]) VALUES (14, 8, 20, N'CapstoneProject');
INSERT INTO [AccountRoles] ([ID], [RoleID], [AccountID], [BusinessEntityName]) VALUES (15, 8, 21, N'CapstoneProject');
INSERT INTO [AccountRoles] ([ID], [RoleID], [AccountID], [BusinessEntityName]) VALUES (16, 8, 22, N'CapstoneProject');
INSERT INTO [AccountRoles] ([ID], [RoleID], [AccountID], [BusinessEntityName]) VALUES (17, 8, 23, N'CapstoneProject');
INSERT INTO [AccountRoles] ([ID], [RoleID], [AccountID], [BusinessEntityName]) VALUES (18, 8, 24, N'CapstoneProject');
INSERT INTO [AccountRoles] ([ID], [RoleID], [AccountID], [BusinessEntityName]) VALUES (19, 8, 25, N'CapstoneProject');
INSERT INTO [AccountRoles] ([ID], [RoleID], [AccountID], [BusinessEntityName]) VALUES (20, 8, 26, N'CapstoneProject');
INSERT INTO [AccountRoles] ([ID], [RoleID], [AccountID], [BusinessEntityName]) VALUES (21, 8, 27, N'CapstoneProject');
INSERT INTO [AccountRoles] ([ID], [RoleID], [AccountID], [BusinessEntityName]) VALUES (22, 8, 28, N'CapstoneProject');
INSERT INTO [AccountRoles] ([ID], [RoleID], [AccountID], [BusinessEntityName]) VALUES (23, 8, 29, N'CapstoneProject');
INSERT INTO [AccountRoles] ([ID], [RoleID], [AccountID], [BusinessEntityName]) VALUES (24, 8, 30, N'CapstoneProject');
INSERT INTO [AccountRoles] ([ID], [RoleID], [AccountID], [BusinessEntityName]) VALUES (25, 8, 31, N'CapstoneProject');
INSERT INTO [AccountRoles] ([ID], [RoleID], [AccountID], [BusinessEntityName]) VALUES (26, 8, 32, N'CapstoneProject');
INSERT INTO [AccountRoles] ([ID], [RoleID], [AccountID], [BusinessEntityName]) VALUES (27, 8, 33, N'CapstoneProject');
INSERT INTO [AccountRoles] ([ID], [RoleID], [AccountID], [BusinessEntityName]) VALUES (28, 8, 34, N'CapstoneProject');
INSERT INTO [AccountRoles] ([ID], [RoleID], [AccountID], [BusinessEntityName]) VALUES (29, 5, 35, N'CapstoneProject');
INSERT INTO [AccountRoles] ([ID], [RoleID], [AccountID], [BusinessEntityName]) VALUES (30, 5, 36, N'CapstoneProject');
INSERT INTO [AccountRoles] ([ID], [RoleID], [AccountID], [BusinessEntityName]) VALUES (31, 5, 37, N'CapstoneProject');
INSERT INTO [AccountRoles] ([ID], [RoleID], [AccountID], [BusinessEntityName]) VALUES (32, 5, 38, N'CapstoneProject');
INSERT INTO [AccountRoles] ([ID], [RoleID], [AccountID], [BusinessEntityName]) VALUES (33, 5, 39, N'CapstoneProject');
INSERT INTO [AccountRoles] ([ID], [RoleID], [AccountID], [BusinessEntityName]) VALUES (34, 5, 40, N'CapstoneProject');
INSERT INTO [AccountRoles] ([ID], [RoleID], [AccountID], [BusinessEntityName]) VALUES (35, 5, 41, N'CapstoneProject');
INSERT INTO [AccountRoles] ([ID], [RoleID], [AccountID], [BusinessEntityName]) VALUES (36, 5, 42, N'CapstoneProject');
INSERT INTO [AccountRoles] ([ID], [RoleID], [AccountID], [BusinessEntityName]) VALUES (37, 5, 43, N'CapstoneProject');
INSERT INTO [AccountRoles] ([ID], [RoleID], [AccountID], [BusinessEntityName]) VALUES (38, 5, 44, N'CapstoneProject');
INSERT INTO [AccountRoles] ([ID], [RoleID], [AccountID], [BusinessEntityName]) VALUES (39, 7, 45, N'CapstoneProject');
INSERT INTO [AccountRoles] ([ID], [RoleID], [AccountID], [BusinessEntityName]) VALUES (40, 7, 46, N'CapstoneProject');
INSERT INTO [AccountRoles] ([ID], [RoleID], [AccountID], [BusinessEntityName]) VALUES (41, 7, 47, N'CapstoneProject');
INSERT INTO [AccountRoles] ([ID], [RoleID], [AccountID], [BusinessEntityName]) VALUES (42, 7, 48, N'CapstoneProject');
INSERT INTO [AccountRoles] ([ID], [RoleID], [AccountID], [BusinessEntityName]) VALUES (43, 7, 49, N'CapstoneProject');
INSERT INTO [AccountRoles] ([ID], [RoleID], [AccountID], [BusinessEntityName]) VALUES (44, 1, 56, N'CapstoneProject');
INSERT INTO [AccountRoles] ([ID], [RoleID], [AccountID], [BusinessEntityName]) VALUES (45, 2, 57, N'CapstoneProject');
INSERT INTO [AccountRoles] ([ID], [RoleID], [AccountID], [BusinessEntityName]) VALUES (46, 5, 58, N'CapstoneProject');
INSERT INTO [AccountRoles] ([ID], [RoleID], [AccountID], [BusinessEntityName]) VALUES (47, 6, 59, N'CapstoneProject');
INSERT INTO [AccountRoles] ([ID], [RoleID], [AccountID], [BusinessEntityName]) VALUES (48, 7, 60, N'CapstoneProject');
INSERT INTO [AccountRoles] ([ID], [RoleID], [AccountID], [BusinessEntityName]) VALUES (49, 8, 61, N'CapstoneProject');
SET IDENTITY_INSERT [AccountRoles] OFF;
GO

-- Data for table Team
SET IDENTITY_INSERT [Team] ON;
INSERT INTO [Team] ([Id], [TeamName], [TeamLeaderAccountId], [ClassId], [SupervisorAccountId], [ProjectId], [StatusId]) VALUES (1, N'ahmed', 8, 4, 35, 1, 1);
INSERT INTO [Team] ([Id], [TeamName], [TeamLeaderAccountId], [ClassId], [SupervisorAccountId], [ProjectId], [StatusId]) VALUES (2, N'Beta Team', 11, 5, 36, 2, 1);
INSERT INTO [Team] ([Id], [TeamName], [TeamLeaderAccountId], [ClassId], [SupervisorAccountId], [ProjectId], [StatusId]) VALUES (3, N'Gamma Team', 20, 6, 37, NULL, 1);
INSERT INTO [Team] ([Id], [TeamName], [TeamLeaderAccountId], [ClassId], [SupervisorAccountId], [ProjectId], [StatusId]) VALUES (4, N'Delta Team', 23, 7, 38, NULL, 1);
INSERT INTO [Team] ([Id], [TeamName], [TeamLeaderAccountId], [ClassId], [SupervisorAccountId], [ProjectId], [StatusId]) VALUES (5, N'Epsilon Team', 26, 8, 39, NULL, 1);
INSERT INTO [Team] ([Id], [TeamName], [TeamLeaderAccountId], [ClassId], [SupervisorAccountId], [ProjectId], [StatusId]) VALUES (6, N'Zeta Team', 29, 9, 40, NULL, 1);
INSERT INTO [Team] ([Id], [TeamName], [TeamLeaderAccountId], [ClassId], [SupervisorAccountId], [ProjectId], [StatusId]) VALUES (7, N'Theta Team', 32, 10, 41, NULL, 1);
INSERT INTO [Team] ([Id], [TeamName], [TeamLeaderAccountId], [ClassId], [SupervisorAccountId], [ProjectId], [StatusId]) VALUES (8, N'Deltarune', NULL, 11, NULL, NULL, 1);
SET IDENTITY_INSERT [Team] OFF;
GO

-- Data for table Project
SET IDENTITY_INSERT [Project] ON;
INSERT INTO [Project] ([Id], [NameAR], [NameEN], [CompanyName], [AdditionalInformation], [DateOfCreation], [ProjectDescription], [StatusId], [SupervisorAccountId]) VALUES (1, N'Ù…Ø´Ø±ÙˆØ¹ 1', N'ahmed', N'TechCorp', N'Additional info', N'07/03/2026 02:29:28', N'AI description', 1, 3);
INSERT INTO [Project] ([Id], [NameAR], [NameEN], [CompanyName], [AdditionalInformation], [DateOfCreation], [ProjectDescription], [StatusId], [SupervisorAccountId]) VALUES (2, N'Ù…Ø´Ø±ÙˆØ¹ 2', N'IoT Automation', N'BuildIt', N'Additional info', N'07/03/2026 02:29:28', N'IoT description', 1, 13);
SET IDENTITY_INSERT [Project] OFF;
GO

-- Data for table TeamMember
SET IDENTITY_INSERT [TeamMember] ON;
INSERT INTO [TeamMember] ([Id], [TeamId], [TeamMemberAccountId], [TeamMemberDescription], [StatusId]) VALUES (1, 1, 8, N'Leader', 1);
INSERT INTO [TeamMember] ([Id], [TeamId], [TeamMemberAccountId], [TeamMemberDescription], [StatusId]) VALUES (2, 1, 9, N'Member', 1);
INSERT INTO [TeamMember] ([Id], [TeamId], [TeamMemberAccountId], [TeamMemberDescription], [StatusId]) VALUES (3, 1, 10, N'Member', 1);
INSERT INTO [TeamMember] ([Id], [TeamId], [TeamMemberAccountId], [TeamMemberDescription], [StatusId]) VALUES (6, 3, 20, N'Leader', 1);
INSERT INTO [TeamMember] ([Id], [TeamId], [TeamMemberAccountId], [TeamMemberDescription], [StatusId]) VALUES (7, 3, 21, N'Member', 1);
INSERT INTO [TeamMember] ([Id], [TeamId], [TeamMemberAccountId], [TeamMemberDescription], [StatusId]) VALUES (8, 3, 22, N'Member', 1);
INSERT INTO [TeamMember] ([Id], [TeamId], [TeamMemberAccountId], [TeamMemberDescription], [StatusId]) VALUES (10, 4, 24, N'Member', 1);
INSERT INTO [TeamMember] ([Id], [TeamId], [TeamMemberAccountId], [TeamMemberDescription], [StatusId]) VALUES (11, 4, 25, N'Member', 1);
INSERT INTO [TeamMember] ([Id], [TeamId], [TeamMemberAccountId], [TeamMemberDescription], [StatusId]) VALUES (15, 6, 29, N'Leader', 1);
INSERT INTO [TeamMember] ([Id], [TeamId], [TeamMemberAccountId], [TeamMemberDescription], [StatusId]) VALUES (16, 6, 30, N'Member', 1);
INSERT INTO [TeamMember] ([Id], [TeamId], [TeamMemberAccountId], [TeamMemberDescription], [StatusId]) VALUES (17, 6, 31, N'Member', 1);
INSERT INTO [TeamMember] ([Id], [TeamId], [TeamMemberAccountId], [TeamMemberDescription], [StatusId]) VALUES (18, 7, 32, N'Leader', 1);
INSERT INTO [TeamMember] ([Id], [TeamId], [TeamMemberAccountId], [TeamMemberDescription], [StatusId]) VALUES (19, 7, 33, N'Member', 1);
INSERT INTO [TeamMember] ([Id], [TeamId], [TeamMemberAccountId], [TeamMemberDescription], [StatusId]) VALUES (20, 7, 34, N'Member', 1);
INSERT INTO [TeamMember] ([Id], [TeamId], [TeamMemberAccountId], [TeamMemberDescription], [StatusId]) VALUES (22, 4, 11, N'ui', 1);
INSERT INTO [TeamMember] ([Id], [TeamId], [TeamMemberAccountId], [TeamMemberDescription], [StatusId]) VALUES (23, 1, 12, N'frontend', 1);
SET IDENTITY_INSERT [TeamMember] OFF;
GO

-- Data for table Tbl_Task
SET IDENTITY_INSERT [Tbl_Task] ON;
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (1, N'Project Proposal', N'Submit the initial project proposal document', NULL, NULL, N'08/01/2026 00:00:00', N'07/03/2026 00:00:00', N'08/01/2026 23:59:00', 1, 1, 1, NULL, NULL, 1);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (2, N'Requirement Analysis', N'Submit software requirements specification', NULL, NULL, N'08/15/2026 00:00:00', N'07/03/2026 00:00:00', N'08/15/2026 23:59:00', 1, 1, 1, NULL, NULL, 2);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (3, N'System Architecture', N'Design the high level architecture', NULL, NULL, N'09/01/2026 00:00:00', N'07/03/2026 00:00:00', N'09/01/2026 23:59:00', 1, 1, 1, NULL, NULL, 3);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (4, N'Database Design', N'Submit the ERD and database schema', NULL, NULL, N'09/15/2026 00:00:00', N'07/03/2026 00:00:00', N'09/15/2026 23:59:00', 1, 1, 1, NULL, NULL, 4);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (5, N'UI/UX Mockups', N'Provide Figma or Adobe XD mockups for the core screens', NULL, NULL, N'10/01/2026 00:00:00', N'07/03/2026 00:00:00', N'10/01/2026 23:59:00', 1, 1, 1, NULL, NULL, 5);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (6, N'Frontend Prototype', N'First working prototype of the frontend', NULL, NULL, N'10/15/2026 00:00:00', N'07/03/2026 00:00:00', N'10/15/2026 23:59:00', 1, 1, 1, NULL, NULL, 6);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (7, N'Backend API Design', N'Document the REST APIs using Swagger', NULL, NULL, N'11/01/2026 00:00:00', N'07/03/2026 00:00:00', N'11/01/2026 23:59:00', 1, 1, 1, NULL, NULL, 7);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (8, N'Integration Phase 1', N'Integrate frontend with core backend APIs', NULL, NULL, N'11/15/2026 00:00:00', N'07/03/2026 00:00:00', N'11/15/2026 23:59:00', 1, 1, 1, NULL, NULL, 8);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (9, N'Testing Phase', N'Submit unit test coverage and QA report', NULL, NULL, N'12/01/2026 00:00:00', N'07/03/2026 00:00:00', N'12/01/2026 23:59:00', 1, 1, 1, NULL, NULL, 9);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (10, N'Final Presentation', N'Upload the final PPT presentation and demo video', NULL, NULL, N'12/15/2026 00:00:00', N'07/03/2026 00:00:00', N'12/15/2026 23:59:00', 1, 1, 1, NULL, NULL, 10);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (11, N'Review Team Formations', N'Review and approve all student teams for the current term. Ensure all students are assigned to a team.', NULL, NULL, N'08/01/2026 00:00:00', N'07/03/2026 00:00:00', N'08/01/2026 23:59:00', NULL, 1, 1, NULL, NULL, 1);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (12, N'Finalize Project Requirements', N'Finalize the standard project requirements and distribute them to engineers and reviewers.', NULL, NULL, N'08/08/2026 00:00:00', N'07/03/2026 00:00:00', N'08/08/2026 23:59:00', NULL, 1, 1, NULL, NULL, 2);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (13, N'Evaluate Capstone Engineers', N'Evaluate the performance of all capstone engineers for the midterm evaluation.', NULL, NULL, N'09/01/2026 00:00:00', N'07/03/2026 00:00:00', N'09/01/2026 23:59:00', NULL, 1, 1, NULL, NULL, 5);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (14, N'Prepare Final Rubrics', N'Prepare and publish the final grading rubrics for the end of year presentations.', NULL, NULL, N'09/15/2026 00:00:00', N'07/03/2026 00:00:00', N'09/15/2026 23:59:00', NULL, 1, 1, NULL, NULL, 7);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (15, N'Schedule Final Presentations', N'Coordinate with the board to schedule the final Capstone project presentations for all teams.', NULL, NULL, N'10/01/2026 00:00:00', N'07/03/2026 00:00:00', N'10/01/2026 23:59:00', NULL, 1, 1, NULL, NULL, 10);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (16, N'mmanage team', N'aaaaaaaaaaaaaaaaaaaaaa', 45, 1, NULL, N'07/03/2026 00:00:00', N'11/22/2026 01:44:00', NULL, 1, 1, NULL, NULL, 10);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (17, N'mmanage team', N'aaaaaaaaaaaaaaaaaaaaaa', 48, 1, NULL, N'07/03/2026 00:00:00', N'11/22/2026 01:44:00', NULL, 1, 1, NULL, NULL, 10);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (18, N'mmanage team', N'aaaaaaaaaaaaaaaaaaaaaa', 49, 1, NULL, N'07/03/2026 00:00:00', N'11/22/2026 01:44:00', NULL, 1, 1, NULL, NULL, 10);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (19, N'mmanage team', N'aaaaaaaaaaaaaaaaaaaaaa', 47, 1, NULL, N'07/03/2026 00:00:00', N'11/22/2026 01:44:00', NULL, 1, 1, NULL, NULL, 10);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (20, N'mmanage team', N'aaaaaaaaaaaaaaaaaaaaaa', 46, 1, NULL, N'07/03/2026 00:00:00', N'11/22/2026 01:44:00', NULL, 1, 1, NULL, NULL, 10);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (21, N'mmanage team', N'aaaaaaaaaaaaaaaaaaaaaa', 7, 1, NULL, N'07/03/2026 00:00:00', N'11/22/2026 01:44:00', NULL, 1, 1, NULL, NULL, 10);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (22, N'Review Grade 10 Project Charters', N'Check the newly submitted project charters for Grade 10.', 45, NULL, N'08/15/2026 00:00:00', N'07/03/2026 00:00:00', N'08/15/2026 23:59:00', NULL, 1, 1, NULL, NULL, 3);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (23, N'Conduct Engineer Check-ins', N'Have a 1-on-1 meeting with your assigned engineers to discuss team progress.', 45, NULL, N'08/22/2026 00:00:00', N'07/03/2026 00:00:00', N'08/22/2026 23:59:00', NULL, 1, 1, NULL, NULL, 4);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (24, N'Approve Midterm Presentations Schedule', N'Finalize the timeslots for all midterm presentations.', 46, NULL, N'09/05/2026 00:00:00', N'07/03/2026 00:00:00', N'09/05/2026 23:59:00', NULL, 1, 1, NULL, NULL, 6);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (25, N'Prepare Prototype Guidelines', N'Draft the technical requirements for the upcoming prototype submission.', 47, NULL, N'09/20/2026 00:00:00', N'07/03/2026 00:00:00', N'09/20/2026 23:59:00', NULL, 1, 1, NULL, NULL, 8);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (26, N'Audit Team Budgets', N'Review the requested component budgets from all student teams.', 47, NULL, N'09/27/2026 00:00:00', N'07/03/2026 00:00:00', N'09/27/2026 23:59:00', NULL, 1, 1, NULL, NULL, 9);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (27, N'Finalize Peer Evaluation Forms', N'Create the rubric for the peer-to-peer evaluation process.', 48, NULL, N'10/10/2026 00:00:00', N'07/03/2026 00:00:00', N'10/10/2026 23:59:00', NULL, 1, 1, NULL, NULL, 11);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (28, N'Review Final Posters', N'Approve the final design posters before printing.', 49, NULL, N'10/25/2026 00:00:00', N'07/03/2026 00:00:00', N'10/25/2026 23:59:00', NULL, 1, 1, NULL, NULL, 13);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (29, N'Plan End of Year Exhibition', N'Coordinate the logistics for the Capstone Project exhibition.', 49, NULL, N'11/01/2026 00:00:00', N'07/03/2026 00:00:00', N'11/01/2026 23:59:00', NULL, 1, 1, NULL, NULL, 14);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (30, N'Review Prototype Materials', N'Evaluate the materials requested by Alpha Team for prototype phase.', 35, NULL, N'08/10/2026 00:00:00', N'07/03/2026 00:00:00', N'08/10/2026 23:59:00', NULL, 1, 1, NULL, NULL, 2);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (31, N'Conduct Alpha Team Mentoring', N'Host a technical mentoring session for Alpha Team.', 35, NULL, N'08/25/2026 00:00:00', N'07/03/2026 00:00:00', N'08/25/2026 23:59:00', NULL, 1, 1, NULL, NULL, 5);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (32, N'Verify Beta Team Safety Protocols', N'Ensure Beta Team is following workshop safety guidelines.', 36, NULL, N'09/01/2026 00:00:00', N'07/03/2026 00:00:00', N'09/01/2026 23:59:00', NULL, 1, 1, NULL, NULL, 6);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (33, N'Audit Gamma Team Progress', N'Perform an interim check on Gamma Team code repository.', 37, NULL, N'09/15/2026 00:00:00', N'07/03/2026 00:00:00', N'09/15/2026 23:59:00', NULL, 1, 1, NULL, NULL, 8);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (34, N'Assess Technical Feasibility', N'Review the revised technical feasibility study from Gamma Team.', 37, NULL, N'10/05/2026 00:00:00', N'07/03/2026 00:00:00', N'10/05/2026 23:59:00', NULL, 1, 1, NULL, NULL, 10);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (35, N'Evaluate Delta Team Midterm Presentation', N'Provide technical scoring for Delta Team midterm.', 38, NULL, N'09/10/2026 00:00:00', N'07/03/2026 00:00:00', N'09/10/2026 23:59:00', NULL, 1, 1, NULL, NULL, 7);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (36, N'Epsilon Team Hardware Inspection', N'Inspect Epsilon Team hardware components for compliance.', 39, NULL, N'10/15/2026 00:00:00', N'07/03/2026 00:00:00', N'10/15/2026 23:59:00', NULL, 1, 1, NULL, NULL, 12);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (37, N'Zeta Team Code Review', N'Perform a comprehensive code review for Zeta Team.', 40, NULL, N'10/20/2026 00:00:00', N'07/03/2026 00:00:00', N'10/20/2026 23:59:00', NULL, 1, 1, NULL, NULL, 13);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (38, N'Theta Team Final Integration Test', N'Supervise Theta Team integration testing phase.', 41, NULL, N'10/25/2026 00:00:00', N'07/03/2026 00:00:00', N'10/25/2026 23:59:00', NULL, 1, 1, NULL, NULL, 14);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (39, N'Sign off Theta Team Final Product', N'Provide final technical sign-off for Theta Team project.', 41, NULL, N'11/05/2026 00:00:00', N'07/03/2026 00:00:00', N'11/05/2026 23:59:00', NULL, 1, 1, NULL, NULL, 15);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (40, N'Floating Engineer Support', N'Provide on-demand technical support in the main lab.', 42, NULL, N'09/22/2026 00:00:00', N'07/03/2026 00:00:00', N'09/22/2026 23:59:00', NULL, 1, 1, NULL, NULL, 9);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (41, N'Review Software Licenses', N'Check if all team software licenses are up to date.', 43, NULL, N'10/01/2026 00:00:00', N'07/03/2026 00:00:00', N'10/01/2026 23:59:00', NULL, 1, 1, NULL, NULL, 10);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (42, N'Prepare Equipment Inventory', N'Log all requested equipment from student teams.', 44, NULL, N'08/18/2026 00:00:00', N'07/03/2026 00:00:00', N'08/18/2026 23:59:00', NULL, 1, 1, NULL, NULL, 3);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (43, N'Kickoff Meeting Logistics', N'Ensure all kickoff meeting materials are printed and rooms are booked.', 45, NULL, N'08/01/2026 00:00:00', N'07/03/2026 00:00:00', N'08/01/2026 23:59:00', NULL, 1, 1, NULL, NULL, 1);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (44, N'Review Phase 1 Rubrics', N'Double-check the evaluation rubrics before publishing them to the students.', 45, NULL, N'08/20/2026 00:00:00', N'07/03/2026 00:00:00', N'08/20/2026 23:59:00', NULL, 1, 1, NULL, NULL, 4);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (45, N'Evaluate Week 7 Progress', N'Collate feedback from supervisors on team progress at the midway point.', 45, NULL, N'09/12/2026 00:00:00', N'07/03/2026 00:00:00', N'09/12/2026 23:59:00', NULL, 1, 1, NULL, NULL, 7);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (46, N'Final Review of Grade 10 Designs', N'Sign off on all design plans submitted by Junior students.', 45, NULL, N'10/18/2026 00:00:00', N'07/03/2026 00:00:00', N'10/18/2026 23:59:00', NULL, 1, 1, NULL, NULL, 12);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (47, N'Semester Wrap-up Report', N'Draft the overall capstone semester report for the board.', 45, NULL, N'11/10/2026 00:00:00', N'07/03/2026 00:00:00', N'11/10/2026 23:59:00', NULL, 1, 1, NULL, NULL, 15);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (48, N'Approve Team Rosters', N'Verify that all teams meet the 5-member minimum requirement.', 46, NULL, N'08/08/2026 00:00:00', N'07/03/2026 00:00:00', N'08/08/2026 23:59:00', NULL, 1, 1, NULL, NULL, 2);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (49, N'Publish Midterm Guidelines', N'Upload the final midterm guidelines to the portal.', 46, NULL, N'08/28/2026 00:00:00', N'07/03/2026 00:00:00', N'08/28/2026 23:59:00', NULL, 1, 1, NULL, NULL, 5);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (50, N'Review Budget Allocation', N'Ensure no team has exceeded the $500 capstone budget cap.', 46, NULL, N'09/22/2026 00:00:00', N'07/03/2026 00:00:00', N'09/22/2026 23:59:00', NULL, 1, 1, NULL, NULL, 9);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (51, N'Organize Guest Speaker Event', N'Finalize logistics for the industry guest speaker in Week 11.', 46, NULL, N'10/06/2026 00:00:00', N'07/03/2026 00:00:00', N'10/06/2026 23:59:00', NULL, 1, 1, NULL, NULL, 11);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (52, N'Verify Prototype Submissions', N'Check that all prototypes were received and safely stored in the lab.', 46, NULL, N'10/27/2026 00:00:00', N'07/03/2026 00:00:00', N'10/27/2026 23:59:00', NULL, 1, 1, NULL, NULL, 14);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (53, N'Assign Reviewers to Projects', N'Allocate academic reviewers to the newly formed student teams.', 47, NULL, N'08/14/2026 00:00:00', N'07/03/2026 00:00:00', N'08/14/2026 23:59:00', NULL, 1, 1, NULL, NULL, 3);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (54, N'Monitor Attendance Records', N'Audit the week 5 attendance sheets from all capstone classes.', 47, NULL, N'08/30/2026 00:00:00', N'07/03/2026 00:00:00', N'08/30/2026 23:59:00', NULL, 1, 1, NULL, NULL, 5);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (55, N'Prepare Midterm Examiner Feedback', N'Compile and sanitize examiner feedback to distribute to teams.', 47, NULL, N'09/15/2026 00:00:00', N'07/03/2026 00:00:00', N'09/15/2026 23:59:00', NULL, 1, 1, NULL, NULL, 8);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (56, N'Check Safety Compliance Forms', N'Ensure all students have signed the Phase 3 workshop safety waivers.', 47, NULL, N'10/01/2026 00:00:00', N'07/03/2026 00:00:00', N'10/01/2026 23:59:00', NULL, 1, 1, NULL, NULL, 10);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (57, N'Distribute Final Grade Sheets', N'Generate and send the final evaluation grade sheets to all teachers.', 47, NULL, N'11/04/2026 00:00:00', N'07/03/2026 00:00:00', N'11/04/2026 23:59:00', NULL, 1, 1, NULL, NULL, 15);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (58, N'Orientation Day Setup', N'Prepare the main hall and verify AV equipment for the student orientation.', 48, NULL, N'08/03/2026 00:00:00', N'07/03/2026 00:00:00', N'08/03/2026 23:59:00', NULL, 1, 1, NULL, NULL, 1);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (59, N'Review Phase 1 Video Submissions', N'Verify all teams uploaded working video links for Phase 1.', 48, NULL, N'08/25/2026 00:00:00', N'07/03/2026 00:00:00', N'08/25/2026 23:59:00', NULL, 1, 1, NULL, NULL, 4);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (60, N'Schedule Make-up Presentations', N'Coordinate times for students who missed the midterm with valid excuses.', 48, NULL, N'09/18/2026 00:00:00', N'07/03/2026 00:00:00', N'09/18/2026 23:59:00', NULL, 1, 1, NULL, NULL, 8);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (61, N'Draft Final Exhibition Layout', N'Draw the floor plan map for where teams will setup their prototypes.', 48, NULL, N'10/12/2026 00:00:00', N'07/03/2026 00:00:00', N'10/12/2026 23:59:00', NULL, 1, 1, NULL, NULL, 12);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (62, N'Post-Exhibition Cleanup Check', N'Verify the exhibition hall was left clean after the final day.', 48, NULL, N'11/08/2026 00:00:00', N'07/03/2026 00:00:00', N'11/08/2026 23:59:00', NULL, 1, 1, NULL, NULL, 15);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (63, N'Send Welcome Emails', N'Blast the introductory capstone email to all newly enrolled students.', 49, NULL, N'08/05/2026 00:00:00', N'07/03/2026 00:00:00', N'08/05/2026 23:59:00', NULL, 1, 1, NULL, NULL, 1);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (64, N'Audit Milestone 1 Submissions', N'Ensure the grading for Milestone 1 was fully completed by supervisors.', 49, NULL, N'08/18/2026 00:00:00', N'07/03/2026 00:00:00', N'08/18/2026 23:59:00', NULL, 1, 1, NULL, NULL, 3);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (65, N'Midterm Refreshments Order', N'Place catering order for the reviewers during midterm week.', 49, NULL, N'09/08/2026 00:00:00', N'07/03/2026 00:00:00', N'09/08/2026 23:59:00', NULL, 1, 1, NULL, NULL, 6);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (66, N'Approve Poster Printing Vendor', N'Select and finalize the print shop for the final team posters.', 49, NULL, N'09/28/2026 00:00:00', N'07/03/2026 00:00:00', N'09/28/2026 23:59:00', NULL, 1, 1, NULL, NULL, 9);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (67, N'Finalize Certificate Names', N'Ensure all student names are spelled correctly for the graduation certificates.', 49, NULL, N'10/22/2026 00:00:00', N'07/03/2026 00:00:00', N'10/22/2026 23:59:00', NULL, 1, 1, NULL, NULL, 13);
INSERT INTO [Tbl_Task] ([Id], [TaskName], [TaskDescription], [AssignedToID], [AssignedByID], [DueDate], [CreatedAt], [TaskDeadline], [GradeId], [AdminAccountId], [StatusId], [Team_Id], [Class_Id], [WeekID]) VALUES (68, N'Create frontend', N';;;', NULL, NULL, NULL, N'07/04/2026 00:00:00', N'02/22/2026 11:11:00', 1, 5, 1, NULL, 1, 1);
SET IDENTITY_INSERT [Tbl_Task] OFF;
GO

-- Data for table TaskSubmission
SET IDENTITY_INSERT [TaskSubmission] ON;
INSERT INTO [TaskSubmission] ([TaskSubmission_ID], [Team_ID], [TeamLeader_ID], [Grade_ID], [Task_ID], [GLink], [Note], [Feedback], [created_at], [updated_at], [status_id]) VALUES (1, 1, 8, 1, 68, N'dfgegerrg', N'ggfdffg', N'aaa', N'07/04/2026 16:57:57', N'07/04/2026 17:01:27', 11);
SET IDENTITY_INSERT [TaskSubmission] OFF;
GO

-- Data for table Report
SET IDENTITY_INSERT [Report] ON;
INSERT INTO [Report] ([Id], [Title], [SubmissionDate], [ReportMessage], [SubmitterAccountId], [StatusId]) VALUES (1, N'test', N'07/04/2026 16:08:01', N'text', 8, 1);
INSERT INTO [Report] ([Id], [Title], [SubmissionDate], [ReportMessage], [SubmitterAccountId], [StatusId]) VALUES (2, N'team does not work', N'07/04/2026 17:02:06', N'adasddas', 8, 1);
SET IDENTITY_INSERT [Report] OFF;
GO

-- Data for table ReviewerSupervisorExtension
SET IDENTITY_INSERT [ReviewerSupervisorExtension] ON;
INSERT INTO [ReviewerSupervisorExtension] ([AccountId], [AssignedClassId], [StatusId]) VALUES (5, 4, 1);
INSERT INTO [ReviewerSupervisorExtension] ([AccountId], [AssignedClassId], [StatusId]) VALUES (35, 5, 1);
INSERT INTO [ReviewerSupervisorExtension] ([AccountId], [AssignedClassId], [StatusId]) VALUES (36, 6, 1);
INSERT INTO [ReviewerSupervisorExtension] ([AccountId], [AssignedClassId], [StatusId]) VALUES (37, 7, 1);
INSERT INTO [ReviewerSupervisorExtension] ([AccountId], [AssignedClassId], [StatusId]) VALUES (38, 8, 1);
INSERT INTO [ReviewerSupervisorExtension] ([AccountId], [AssignedClassId], [StatusId]) VALUES (39, 9, 1);
INSERT INTO [ReviewerSupervisorExtension] ([AccountId], [AssignedClassId], [StatusId]) VALUES (40, 10, 1);
INSERT INTO [ReviewerSupervisorExtension] ([AccountId], [AssignedClassId], [StatusId]) VALUES (41, 11, 1);
INSERT INTO [ReviewerSupervisorExtension] ([AccountId], [AssignedClassId], [StatusId]) VALUES (42, 12, 1);
INSERT INTO [ReviewerSupervisorExtension] ([AccountId], [AssignedClassId], [StatusId]) VALUES (43, 13, 1);
INSERT INTO [ReviewerSupervisorExtension] ([AccountId], [AssignedClassId], [StatusId]) VALUES (44, 14, 1);
SET IDENTITY_INSERT [ReviewerSupervisorExtension] OFF;
GO

-- Data for table StudentExtension
SET IDENTITY_INSERT [StudentExtension] ON;
INSERT INTO [StudentExtension] ([AccountId], [IsLeader], [ClassId], [StatusId]) VALUES (8, NULL, 4, 1);
INSERT INTO [StudentExtension] ([AccountId], [IsLeader], [ClassId], [StatusId]) VALUES (9, 0, 4, 1);
INSERT INTO [StudentExtension] ([AccountId], [IsLeader], [ClassId], [StatusId]) VALUES (10, 0, 4, 1);
INSERT INTO [StudentExtension] ([AccountId], [IsLeader], [ClassId], [StatusId]) VALUES (11, NULL, 7, 1);
INSERT INTO [StudentExtension] ([AccountId], [IsLeader], [ClassId], [StatusId]) VALUES (12, 0, 4, 1);
INSERT INTO [StudentExtension] ([AccountId], [IsLeader], [ClassId], [StatusId]) VALUES (20, NULL, 6, 1);
INSERT INTO [StudentExtension] ([AccountId], [IsLeader], [ClassId], [StatusId]) VALUES (21, 0, 6, 1);
INSERT INTO [StudentExtension] ([AccountId], [IsLeader], [ClassId], [StatusId]) VALUES (22, 0, 6, 1);
INSERT INTO [StudentExtension] ([AccountId], [IsLeader], [ClassId], [StatusId]) VALUES (23, NULL, 5, 1);
INSERT INTO [StudentExtension] ([AccountId], [IsLeader], [ClassId], [StatusId]) VALUES (24, 0, 7, 1);
INSERT INTO [StudentExtension] ([AccountId], [IsLeader], [ClassId], [StatusId]) VALUES (25, 0, 7, 1);
INSERT INTO [StudentExtension] ([AccountId], [IsLeader], [ClassId], [StatusId]) VALUES (26, NULL, 6, 1);
INSERT INTO [StudentExtension] ([AccountId], [IsLeader], [ClassId], [StatusId]) VALUES (27, 0, 7, 1);
INSERT INTO [StudentExtension] ([AccountId], [IsLeader], [ClassId], [StatusId]) VALUES (28, 0, 8, 1);
INSERT INTO [StudentExtension] ([AccountId], [IsLeader], [ClassId], [StatusId]) VALUES (29, NULL, 9, 1);
INSERT INTO [StudentExtension] ([AccountId], [IsLeader], [ClassId], [StatusId]) VALUES (30, 0, 9, 1);
INSERT INTO [StudentExtension] ([AccountId], [IsLeader], [ClassId], [StatusId]) VALUES (31, 0, 9, 1);
INSERT INTO [StudentExtension] ([AccountId], [IsLeader], [ClassId], [StatusId]) VALUES (32, NULL, 10, 1);
INSERT INTO [StudentExtension] ([AccountId], [IsLeader], [ClassId], [StatusId]) VALUES (33, 0, 10, 1);
INSERT INTO [StudentExtension] ([AccountId], [IsLeader], [ClassId], [StatusId]) VALUES (34, 0, 10, 1);
SET IDENTITY_INSERT [StudentExtension] OFF;
GO

-- Data for table Login
SET IDENTITY_INSERT [Login] ON;
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (1, 1, N'superadmin@example.com', N'password123', 1);
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (2, 2, N'staffadmin@example.com', N'password123', 1);
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (3, 3, N'supervisor@example.com', N'password123', 1);
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (4, 4, N'teacher@example.com', N'password123', 1);
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (5, 5, N'engineer@example.com', N'password123', 1);
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (6, 6, N'board@example.com', N'password123', 1);
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (7, 7, N'capstonelead@example.com', N'password123', 1);
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (8, 8, N'student@example.com', N'password123', 1);
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (9, 9, N'student2@example.com', N'password123', 1);
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (10, 10, N'student3@example.com', N'password123', 1);
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (11, 11, N'student4@example.com', N'password123', 1);
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (12, 12, N'student5@example.com', N'password123', 1);
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (13, 13, N'supervisor2@example.com', N'password123', 1);
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (14, 20, N'student20@example.com', N'password123', 1);
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (15, 21, N'student21@example.com', N'password123', 1);
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (16, 22, N'student22@example.com', N'password123', 1);
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (17, 23, N'student23@example.com', N'password123', 1);
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (18, 24, N'student24@example.com', N'password123', 1);
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (19, 25, N'student25@example.com', N'password123', 1);
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (20, 26, N'student26@example.com', N'password123', 1);
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (21, 27, N'student27@example.com', N'password123', 1);
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (22, 28, N'student28@example.com', N'password123', 1);
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (23, 29, N'student29@example.com', N'password123', 1);
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (24, 30, N'student30@example.com', N'password123', 1);
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (25, 31, N'student31@example.com', N'password123', 1);
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (26, 32, N'student32@example.com', N'password123', 1);
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (27, 33, N'student33@example.com', N'password123', 1);
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (28, 34, N'student34@example.com', N'password123', 1);
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (29, 35, N'engineer1@example.com', N'password123', 1);
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (30, 36, N'engineer2@example.com', N'password123', 1);
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (31, 37, N'engineer3@example.com', N'password123', 1);
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (32, 38, N'engineer4@example.com', N'password123', 1);
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (33, 39, N'engineer5@example.com', N'password123', 1);
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (34, 40, N'engineer6@example.com', N'password123', 1);
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (35, 41, N'engineer7@example.com', N'password123', 1);
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (36, 42, N'engineer8@example.com', N'password123', 1);
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (37, 43, N'engineer9@example.com', N'password123', 1);
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (38, 44, N'engineer10@example.com', N'password123', 1);
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (39, 45, N'capstonelead1@example.com', N'password123', 1);
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (40, 46, N'capstonelead2@example.com', N'password123', 1);
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (41, 47, N'capstonelead3@example.com', N'password123', 1);
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (42, 48, N'capstonelead4@example.com', N'password123', 1);
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (43, 49, N'capstonelead5@example.com', N'password123', 1);
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (44, 56, N'demo_super@example.com', N'password123', 1);
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (45, 57, N'demo_staff@example.com', N'password123', 1);
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (46, 58, N'demo_engineer@example.com', N'password123', 1);
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (47, 59, N'demo_board@example.com', N'password123', 1);
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (48, 60, N'demo_lead@example.com', N'password123', 1);
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (49, 61, N'demo_student@example.com', N'password123', 1);
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (52, 8, N'I.H.Ibrahim@sewedy.com', N'Itsoma12345', 1);
INSERT INTO [Login] ([Id], [AccountId], [Email], [PasswordHash], [StatusId]) VALUES (53, 5, N'AlaaAbdelrahman@sewedy.com', N'password123', 1);
SET IDENTITY_INSERT [Login] OFF;
GO

