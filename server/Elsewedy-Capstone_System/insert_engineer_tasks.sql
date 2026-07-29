DECLARE @Now DATETIME = GETDATE();

-- Generate explicit Tasks for individual Engineers across different weeks

-- Assign to Mahmoud Ali (35)
INSERT INTO [Tbl_Task] (TaskName, TaskDescription, DueDate, CreatedAt, TaskDeadline, GradeId, AdminAccountId, StatusId, WeekID, AssignedToId) VALUES
('Review Prototype Materials', 'Evaluate the materials requested by Alpha Team for prototype phase.', '2026-08-10', @Now, '2026-08-10 23:59:00', NULL, 1, 1, 2, 35),
('Conduct Alpha Team Mentoring', 'Host a technical mentoring session for Alpha Team.', '2026-08-25', @Now, '2026-08-25 23:59:00', NULL, 1, 1, 5, 35);

-- Assign to Amr Yasser (36)
INSERT INTO [Tbl_Task] (TaskName, TaskDescription, DueDate, CreatedAt, TaskDeadline, GradeId, AdminAccountId, StatusId, WeekID, AssignedToId) VALUES
('Verify Beta Team Safety Protocols', 'Ensure Beta Team is following workshop safety guidelines.', '2026-09-01', @Now, '2026-09-01 23:59:00', NULL, 1, 1, 6, 36);

-- Assign to Tarek Wael (37)
INSERT INTO [Tbl_Task] (TaskName, TaskDescription, DueDate, CreatedAt, TaskDeadline, GradeId, AdminAccountId, StatusId, WeekID, AssignedToId) VALUES
('Audit Gamma Team Progress', 'Perform an interim check on Gamma Team code repository.', '2026-09-15', @Now, '2026-09-15 23:59:00', NULL, 1, 1, 8, 37),
('Assess Technical Feasibility', 'Review the revised technical feasibility study from Gamma Team.', '2026-10-05', @Now, '2026-10-05 23:59:00', NULL, 1, 1, 10, 37);

-- Assign to Kareem Tarek (38)
INSERT INTO [Tbl_Task] (TaskName, TaskDescription, DueDate, CreatedAt, TaskDeadline, GradeId, AdminAccountId, StatusId, WeekID, AssignedToId) VALUES
('Evaluate Delta Team Midterm Presentation', 'Provide technical scoring for Delta Team midterm.', '2026-09-10', @Now, '2026-09-10 23:59:00', NULL, 1, 1, 7, 38);

-- Assign to Mostafa Hisham (39)
INSERT INTO [Tbl_Task] (TaskName, TaskDescription, DueDate, CreatedAt, TaskDeadline, GradeId, AdminAccountId, StatusId, WeekID, AssignedToId) VALUES
('Epsilon Team Hardware Inspection', 'Inspect Epsilon Team hardware components for compliance.', '2026-10-15', @Now, '2026-10-15 23:59:00', NULL, 1, 1, 12, 39);

-- Assign to Yassin Maged (40)
INSERT INTO [Tbl_Task] (TaskName, TaskDescription, DueDate, CreatedAt, TaskDeadline, GradeId, AdminAccountId, StatusId, WeekID, AssignedToId) VALUES
('Zeta Team Code Review', 'Perform a comprehensive code review for Zeta Team.', '2026-10-20', @Now, '2026-10-20 23:59:00', NULL, 1, 1, 13, 40);

-- Assign to Ziad Farid (41)
INSERT INTO [Tbl_Task] (TaskName, TaskDescription, DueDate, CreatedAt, TaskDeadline, GradeId, AdminAccountId, StatusId, WeekID, AssignedToId) VALUES
('Theta Team Final Integration Test', 'Supervise Theta Team integration testing phase.', '2026-10-25', @Now, '2026-10-25 23:59:00', NULL, 1, 1, 14, 41),
('Sign off Theta Team Final Product', 'Provide final technical sign-off for Theta Team project.', '2026-11-05', @Now, '2026-11-05 23:59:00', NULL, 1, 1, 15, 41);

-- Assign to Khaled Osama (42)
INSERT INTO [Tbl_Task] (TaskName, TaskDescription, DueDate, CreatedAt, TaskDeadline, GradeId, AdminAccountId, StatusId, WeekID, AssignedToId) VALUES
('Floating Engineer Support', 'Provide on-demand technical support in the main lab.', '2026-09-22', @Now, '2026-09-22 23:59:00', NULL, 1, 1, 9, 42);

-- Assign to Ahmed Sameh (43)
INSERT INTO [Tbl_Task] (TaskName, TaskDescription, DueDate, CreatedAt, TaskDeadline, GradeId, AdminAccountId, StatusId, WeekID, AssignedToId) VALUES
('Review Software Licenses', 'Check if all team software licenses are up to date.', '2026-10-01', @Now, '2026-10-01 23:59:00', NULL, 1, 1, 10, 43);

-- Assign to Youssef Nabil (44)
INSERT INTO [Tbl_Task] (TaskName, TaskDescription, DueDate, CreatedAt, TaskDeadline, GradeId, AdminAccountId, StatusId, WeekID, AssignedToId) VALUES
('Prepare Equipment Inventory', 'Log all requested equipment from student teams.', '2026-08-18', @Now, '2026-08-18 23:59:00', NULL, 1, 1, 3, 44);
