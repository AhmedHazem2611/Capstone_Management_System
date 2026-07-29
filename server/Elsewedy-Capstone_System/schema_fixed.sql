CREATE TABLE [AccountRoles] (
    [ID] bigint NOT NULL IDENTITY,
    [RoleID] bigint NOT NULL,
    [AccountID] bigint NOT NULL,
    [BusinessEntityName] nvarchar(100) NOT NULL,
    CONSTRAINT [PK_AccountRoles] PRIMARY KEY ([ID])
);
GO


CREATE TABLE [Roles] (
    [Id] bigint NOT NULL IDENTITY,
    [RoleName] nvarchar(max) NOT NULL,
    [OrderNo] int NULL,
    [BusinessEntity] nvarchar(max) NULL,
    CONSTRAINT [PK_Roles] PRIMARY KEY ([Id])
);
GO


CREATE TABLE [Status] (
    [Id] bigint NOT NULL IDENTITY,
    [StatusName] nvarchar(50) NOT NULL,
    [BusinessEntity] nvarchar(50) NULL,
    [OrderNo] int NULL,
    CONSTRAINT [PK_Status] PRIMARY KEY ([Id])
);
GO


CREATE TABLE [Weeks] (
    [Id] bigint NOT NULL IDENTITY,
    [WeekTitle] nvarchar(max) NULL,
    [StartDate] date NULL,
    [EndDate] date NULL,
    [BusinessEntityName] nvarchar(max) NULL,
    CONSTRAINT [PK_Weeks] PRIMARY KEY ([Id])
);
GO


CREATE TABLE [Account] (
    [Id] bigint NOT NULL IDENTITY,
    [NationalId] nvarchar(20) NOT NULL,
    [PasswordHash] nvarchar(255) NOT NULL,
    [Email] nvarchar(100) NOT NULL,
    [Phone] nvarchar(20) NULL,
    [RoleId] bigint NOT NULL,
    [FullNameEN] nvarchar(100) NOT NULL,
    [FullNameAR] nvarchar(100) NOT NULL,
    [ResetToken] nvarchar(255) NULL,
    [ResetTokenExpiry] datetime2 NULL,
    [Created_at] datetime2 NULL DEFAULT (GETDATE()),
    [IsActive] bit NOT NULL DEFAULT CAST(1 AS bit),
    [StatusId] bigint NOT NULL,
    CONSTRAINT [PK_Account] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Account_Status_StatusId] FOREIGN KEY ([StatusId]) REFERENCES [Status] ([Id]) ON DELETE NO ACTION
);
GO


CREATE TABLE [CapstoneSupervisorExtension] (
    [AccountId] bigint NOT NULL,
    [StatusId] bigint NOT NULL,
    CONSTRAINT [PK_CapstoneSupervisorExtension] PRIMARY KEY ([AccountId]),
    CONSTRAINT [FK_CapstoneSupervisorExtension_Account_AccountId] FOREIGN KEY ([AccountId]) REFERENCES [Account] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_CapstoneSupervisorExtension_Status_StatusId] FOREIGN KEY ([StatusId]) REFERENCES [Status] ([Id]) ON DELETE NO ACTION
);
GO


CREATE TABLE [Grade] (
    [Id] bigint NOT NULL IDENTITY,
    [GradeName] nvarchar(50) NOT NULL,
    [ParentGradeId] bigint NULL,
    [AdminAccountId] bigint NULL,
    [StatusId] bigint NOT NULL,
    CONSTRAINT [PK_Grade] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Grade_Account_AdminAccountId] FOREIGN KEY ([AdminAccountId]) REFERENCES [Account] ([Id]),
    CONSTRAINT [FK_Grade_Status_StatusId] FOREIGN KEY ([StatusId]) REFERENCES [Status] ([Id]) ON DELETE NO ACTION
);
GO


CREATE TABLE [Login] (
    [Id] bigint NOT NULL IDENTITY,
    [AccountId] bigint NOT NULL,
    [Email] nvarchar(max) NOT NULL,
    [PasswordHash] nvarchar(max) NOT NULL,
    [StatusId] bigint NOT NULL,
    CONSTRAINT [PK_Login] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Login_Account] FOREIGN KEY ([AccountId]) REFERENCES [Account] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_Login_Status] FOREIGN KEY ([StatusId]) REFERENCES [Status] ([Id]) ON DELETE NO ACTION
);
GO


CREATE TABLE [Project] (
    [Id] bigint NOT NULL IDENTITY,
    [NameAR] nvarchar(200) NULL,
    [NameEN] nvarchar(200) NOT NULL,
    [CompanyName] nvarchar(200) NOT NULL,
    [AdditionalInformation] nvarchar(2000) NULL,
    [DateOfCreation] datetime2 NOT NULL DEFAULT (GETDATE()),
    [ProjectDescription] nvarchar(2000) NOT NULL,
    [StatusId] bigint NOT NULL,
    [SupervisorAccountId] bigint NOT NULL,
    CONSTRAINT [PK_Project] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Project_Account_SupervisorAccountId] FOREIGN KEY ([SupervisorAccountId]) REFERENCES [Account] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_Project_Status_StatusId] FOREIGN KEY ([StatusId]) REFERENCES [Status] ([Id]) ON DELETE NO ACTION
);
GO


CREATE TABLE [Report] (
    [Id] bigint NOT NULL IDENTITY,
    [Title] nvarchar(200) NOT NULL,
    [SubmissionDate] datetime NOT NULL DEFAULT (GETDATE()),
    [ReportMessage] nvarchar(2000) NOT NULL,
    [SubmitterAccountId] bigint NOT NULL,
    [StatusId] bigint NOT NULL,
    CONSTRAINT [PK_Report] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Report_Account_SubmitterAccountId] FOREIGN KEY ([SubmitterAccountId]) REFERENCES [Account] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_Report_Status_StatusId] FOREIGN KEY ([StatusId]) REFERENCES [Status] ([Id]) ON DELETE NO ACTION
);
GO


CREATE TABLE [SuperAdminExtension] (
    [AccountId] bigint NOT NULL,
    [StatusId] bigint NOT NULL,
    CONSTRAINT [PK_SuperAdminExtension] PRIMARY KEY ([AccountId]),
    CONSTRAINT [FK_SuperAdminExtension_Account_AccountId] FOREIGN KEY ([AccountId]) REFERENCES [Account] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_SuperAdminExtension_Status_StatusId] FOREIGN KEY ([StatusId]) REFERENCES [Status] ([Id]) ON DELETE NO ACTION
);
GO


CREATE TABLE [Tbl_Class] (
    [Id] bigint NOT NULL IDENTITY,
    [ClassName] nvarchar(100) NOT NULL,
    [GradeId] bigint NOT NULL,
    [StatusId] bigint NOT NULL,
    CONSTRAINT [PK_Tbl_Class] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Tbl_Class_Grade_GradeId] FOREIGN KEY ([GradeId]) REFERENCES [Grade] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_Tbl_Class_Status_StatusId] FOREIGN KEY ([StatusId]) REFERENCES [Status] ([Id]) ON DELETE NO ACTION
);
GO


CREATE TABLE [Tbl_Task] (
    [Id] bigint NOT NULL IDENTITY,
    [TaskName] nvarchar(100) NOT NULL,
    [TaskDescription] nvarchar(500) NULL,
    [AssignedToID] bigint NULL,
    [AssignedByID] bigint NULL,
    [DueDate] date NULL,
    [CreatedAt] date NULL,
    [TaskDeadline] datetime NOT NULL,
    [GradeId] bigint NULL,
    [AdminAccountId] bigint NULL,
    [StatusId] bigint NULL,
    [Team_Id] int NULL,
    [Class_Id] int NULL,
    [WeekID] int NOT NULL,
    CONSTRAINT [PK_Tbl_Task] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Tbl_Task_Account_AdminAccountId] FOREIGN KEY ([AdminAccountId]) REFERENCES [Account] ([Id]),
    CONSTRAINT [FK_Tbl_Task_Grade_GradeId] FOREIGN KEY ([GradeId]) REFERENCES [Grade] ([Id]),
    CONSTRAINT [FK_Tbl_Task_Status_StatusId] FOREIGN KEY ([StatusId]) REFERENCES [Status] ([Id])
);
GO


CREATE TABLE [ReviewerSupervisorExtension] (
    [AccountId] bigint NOT NULL,
    [AssignedClassId] bigint NULL,
    [StatusId] bigint NOT NULL,
    CONSTRAINT [PK_ReviewerSupervisorExtension] PRIMARY KEY ([AccountId]),
    CONSTRAINT [FK_ReviewerSupervisorExtension_Account_AccountId] FOREIGN KEY ([AccountId]) REFERENCES [Account] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_ReviewerSupervisorExtension_Status_StatusId] FOREIGN KEY ([StatusId]) REFERENCES [Status] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_ReviewerSupervisorExtension_Tbl_Class_AssignedClassId] FOREIGN KEY ([AssignedClassId]) REFERENCES [Tbl_Class] ([Id])
);
GO


CREATE TABLE [StudentExtension] (
    [AccountId] bigint NOT NULL,
    [IsLeader] bit NOT NULL,
    [ClassId] bigint NULL,
    [StatusId] bigint NOT NULL,
    CONSTRAINT [PK_StudentExtension] PRIMARY KEY ([AccountId]),
    CONSTRAINT [FK_StudentExtension_Account_AccountId] FOREIGN KEY ([AccountId]) REFERENCES [Account] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_StudentExtension_Status_StatusId] FOREIGN KEY ([StatusId]) REFERENCES [Status] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_StudentExtension_Tbl_Class_ClassId] FOREIGN KEY ([ClassId]) REFERENCES [Tbl_Class] ([Id])
);
GO


CREATE TABLE [Team] (
    [Id] bigint NOT NULL IDENTITY,
    [TeamName] nvarchar(100) NOT NULL,
    [TeamLeaderAccountId] bigint NULL,
    [ClassId] bigint NOT NULL,
    [SupervisorAccountId] bigint NULL,
    [ProjectId] bigint NULL,
    [StatusId] bigint NOT NULL,
    CONSTRAINT [PK_Team] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Team_Account_SupervisorAccountId] FOREIGN KEY ([SupervisorAccountId]) REFERENCES [Account] ([Id]),
    CONSTRAINT [FK_Team_Account_TeamLeaderAccountId] FOREIGN KEY ([TeamLeaderAccountId]) REFERENCES [Account] ([Id]),
    CONSTRAINT [FK_Team_Project_ProjectId] FOREIGN KEY ([ProjectId]) REFERENCES [Project] ([Id]),
    CONSTRAINT [FK_Team_Status_StatusId] FOREIGN KEY ([StatusId]) REFERENCES [Status] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_Team_Tbl_Class_ClassId] FOREIGN KEY ([ClassId]) REFERENCES [Tbl_Class] ([Id]) ON DELETE NO ACTION
);
GO


CREATE TABLE [StudentTask] (
    [Id] bigint NOT NULL IDENTITY,
    [StudentAccountId] bigint NOT NULL,
    [TaskId] bigint NOT NULL,
    [IsCompleted] bit NOT NULL,
    [CompletedAt] datetime NULL,
    [StatusId] bigint NOT NULL,
    CONSTRAINT [PK_StudentTask] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_StudentTask_Account_StudentAccountId] FOREIGN KEY ([StudentAccountId]) REFERENCES [Account] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_StudentTask_Status_StatusId] FOREIGN KEY ([StatusId]) REFERENCES [Status] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_StudentTask_Tbl_Task_TaskId] FOREIGN KEY ([TaskId]) REFERENCES [Tbl_Task] ([Id]) ON DELETE NO ACTION
);
GO


CREATE TABLE [TaskSubmission] (
    [TaskSubmission_ID] bigint NOT NULL IDENTITY,
    [Team_ID] bigint NOT NULL,
    [TeamLeader_ID] bigint NOT NULL,
    [Grade_ID] bigint NOT NULL,
    [Task_ID] bigint NULL,
    [GLink] nvarchar(500) NULL,
    [Note] nvarchar(1000) NULL,
    [Feedback] nvarchar(1000) NULL,
    [created_at] datetime2 NULL DEFAULT (GETDATE()),
    [updated_at] datetime2 NULL DEFAULT (GETDATE()),
    [status_id] bigint NOT NULL,
    CONSTRAINT [PK_TaskSubmission] PRIMARY KEY ([TaskSubmission_ID]),
    CONSTRAINT [FK_TaskSubmission_Account_TeamLeader_ID] FOREIGN KEY ([TeamLeader_ID]) REFERENCES [Account] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_TaskSubmission_Grade_Grade_ID] FOREIGN KEY ([Grade_ID]) REFERENCES [Grade] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_TaskSubmission_Team_Team_ID] FOREIGN KEY ([Team_ID]) REFERENCES [Team] ([Id]) ON DELETE NO ACTION
);
GO


CREATE TABLE [TeamMember] (
    [Id] bigint NOT NULL IDENTITY,
    [TeamId] bigint NOT NULL,
    [TeamMemberAccountId] bigint NOT NULL,
    [TeamMemberDescription] nvarchar(500) NULL,
    [StatusId] bigint NOT NULL,
    CONSTRAINT [PK_TeamMember] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_TeamMember_Account_TeamMemberAccountId] FOREIGN KEY ([TeamMemberAccountId]) REFERENCES [Account] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_TeamMember_Status_StatusId] FOREIGN KEY ([StatusId]) REFERENCES [Status] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_TeamMember_Team_TeamId] FOREIGN KEY ([TeamId]) REFERENCES [Team] ([Id]) ON DELETE NO ACTION
);
GO


CREATE INDEX [IX_Account_StatusId] ON [Account] ([StatusId]);
GO


CREATE UNIQUE INDEX [UQ__Account__A9D10534A971903E] ON [Account] ([Email]);
GO


CREATE UNIQUE INDEX [UQ__Account__E9AA32FA935D371E] ON [Account] ([NationalId]);
GO


CREATE INDEX [IX_CapstoneSupervisorExtension_StatusId] ON [CapstoneSupervisorExtension] ([StatusId]);
GO


CREATE INDEX [IX_Grade_AdminAccountId] ON [Grade] ([AdminAccountId]);
GO


CREATE INDEX [IX_Grade_StatusId] ON [Grade] ([StatusId]);
GO


CREATE INDEX [IX_Login_AccountId] ON [Login] ([AccountId]);
GO


CREATE INDEX [IX_Login_StatusId] ON [Login] ([StatusId]);
GO


CREATE INDEX [IX_Project_StatusId] ON [Project] ([StatusId]);
GO


CREATE INDEX [IX_Project_SupervisorAccountId] ON [Project] ([SupervisorAccountId]);
GO


CREATE INDEX [IX_Report_StatusId] ON [Report] ([StatusId]);
GO


CREATE INDEX [IX_Report_SubmitterAccountId] ON [Report] ([SubmitterAccountId]);
GO


CREATE INDEX [IX_ReviewerSupervisorExtension_AssignedClassId] ON [ReviewerSupervisorExtension] ([AssignedClassId]);
GO


CREATE INDEX [IX_ReviewerSupervisorExtension_StatusId] ON [ReviewerSupervisorExtension] ([StatusId]);
GO


CREATE INDEX [IX_StudentExtension_ClassId] ON [StudentExtension] ([ClassId]);
GO


CREATE INDEX [IX_StudentExtension_StatusId] ON [StudentExtension] ([StatusId]);
GO


CREATE INDEX [IX_StudentTask_StatusId] ON [StudentTask] ([StatusId]);
GO


CREATE INDEX [IX_StudentTask_StudentAccountId] ON [StudentTask] ([StudentAccountId]);
GO


CREATE INDEX [IX_StudentTask_TaskId] ON [StudentTask] ([TaskId]);
GO


CREATE INDEX [IX_SuperAdminExtension_StatusId] ON [SuperAdminExtension] ([StatusId]);
GO


CREATE INDEX [IX_TaskSubmission_Grade_ID] ON [TaskSubmission] ([Grade_ID]);
GO


CREATE INDEX [IX_TaskSubmission_Team_ID] ON [TaskSubmission] ([Team_ID]);
GO


CREATE INDEX [IX_TaskSubmission_TeamLeader_ID] ON [TaskSubmission] ([TeamLeader_ID]);
GO


CREATE INDEX [IX_Tbl_Class_GradeId] ON [Tbl_Class] ([GradeId]);
GO


CREATE INDEX [IX_Tbl_Class_StatusId] ON [Tbl_Class] ([StatusId]);
GO


CREATE INDEX [IX_Tbl_Task_AdminAccountId] ON [Tbl_Task] ([AdminAccountId]);
GO


CREATE INDEX [IX_Tbl_Task_GradeId] ON [Tbl_Task] ([GradeId]);
GO


CREATE INDEX [IX_Tbl_Task_StatusId] ON [Tbl_Task] ([StatusId]);
GO


CREATE INDEX [IX_Team_ClassId] ON [Team] ([ClassId]);
GO


CREATE INDEX [IX_Team_ProjectId] ON [Team] ([ProjectId]);
GO


CREATE INDEX [IX_Team_StatusId] ON [Team] ([StatusId]);
GO


CREATE INDEX [IX_Team_SupervisorAccountId] ON [Team] ([SupervisorAccountId]);
GO


CREATE INDEX [IX_Team_TeamLeaderAccountId] ON [Team] ([TeamLeaderAccountId]);
GO


CREATE INDEX [IX_TeamMember_StatusId] ON [TeamMember] ([StatusId]);
GO


CREATE INDEX [IX_TeamMember_TeamId] ON [TeamMember] ([TeamId]);
GO


CREATE INDEX [IX_TeamMember_TeamMemberAccountId] ON [TeamMember] ([TeamMemberAccountId]);
GO


