DECLARE @Now DATETIME = GETDATE();

-- Assign Engineers (IDs 35 to 41) to Teams (IDs 1 to 7)
UPDATE Team SET SupervisorAccountId = 35 WHERE Id = 1;
UPDATE Team SET SupervisorAccountId = 36 WHERE Id = 2;
UPDATE Team SET SupervisorAccountId = 37 WHERE Id = 3;
UPDATE Team SET SupervisorAccountId = 38 WHERE Id = 4;
UPDATE Team SET SupervisorAccountId = 39 WHERE Id = 5;
UPDATE Team SET SupervisorAccountId = 40 WHERE Id = 6;
UPDATE Team SET SupervisorAccountId = 41 WHERE Id = 7;

-- Generate explicit Tasks for individual Capstone Leads across different weeks

-- Assign to Hassan Mostafa (45)
INSERT INTO [Tbl_Task] (TaskName, TaskDescription, DueDate, CreatedAt, TaskDeadline, GradeId, AdminAccountId, StatusId, WeekID, AssignedToId) VALUES
('Review Grade 10 Project Charters', 'Check the newly submitted project charters for Grade 10.', '2026-08-15', @Now, '2026-08-15 23:59:00', NULL, 1, 1, 3, 45),
('Conduct Engineer Check-ins', 'Have a 1-on-1 meeting with your assigned engineers to discuss team progress.', '2026-08-22', @Now, '2026-08-22 23:59:00', NULL, 1, 1, 4, 45);

-- Assign to Maged Sameh (46)
INSERT INTO [Tbl_Task] (TaskName, TaskDescription, DueDate, CreatedAt, TaskDeadline, GradeId, AdminAccountId, StatusId, WeekID, AssignedToId) VALUES
('Approve Midterm Presentations Schedule', 'Finalize the timeslots for all midterm presentations.', '2026-09-05', @Now, '2026-09-05 23:59:00', NULL, 1, 1, 6, 46);

-- Assign to Omar Yassin (47)
INSERT INTO [Tbl_Task] (TaskName, TaskDescription, DueDate, CreatedAt, TaskDeadline, GradeId, AdminAccountId, StatusId, WeekID, AssignedToId) VALUES
('Prepare Prototype Guidelines', 'Draft the technical requirements for the upcoming prototype submission.', '2026-09-20', @Now, '2026-09-20 23:59:00', NULL, 1, 1, 8, 47),
('Audit Team Budgets', 'Review the requested component budgets from all student teams.', '2026-09-27', @Now, '2026-09-27 23:59:00', NULL, 1, 1, 9, 47);

-- Assign to Sherif Nabil (48)
INSERT INTO [Tbl_Task] (TaskName, TaskDescription, DueDate, CreatedAt, TaskDeadline, GradeId, AdminAccountId, StatusId, WeekID, AssignedToId) VALUES
('Finalize Peer Evaluation Forms', 'Create the rubric for the peer-to-peer evaluation process.', '2026-10-10', @Now, '2026-10-10 23:59:00', NULL, 1, 1, 11, 48);

-- Assign to Ayman Wael (49)
INSERT INTO [Tbl_Task] (TaskName, TaskDescription, DueDate, CreatedAt, TaskDeadline, GradeId, AdminAccountId, StatusId, WeekID, AssignedToId) VALUES
('Review Final Posters', 'Approve the final design posters before printing.', '2026-10-25', @Now, '2026-10-25 23:59:00', NULL, 1, 1, 13, 49),
('Plan End of Year Exhibition', 'Coordinate the logistics for the Capstone Project exhibition.', '2026-11-01', @Now, '2026-11-01 23:59:00', NULL, 1, 1, 14, 49);
