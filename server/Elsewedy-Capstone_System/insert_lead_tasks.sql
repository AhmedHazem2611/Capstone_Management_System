DECLARE @Now DATETIME = GETDATE();

INSERT INTO [Tbl_Task] (TaskName, TaskDescription, DueDate, CreatedAt, TaskDeadline, GradeId, AdminAccountId, StatusId, WeekID, AssignedToId) VALUES
('Review Team Formations', 'Review and approve all student teams for the current term. Ensure all students are assigned to a team.', '2026-08-01', @Now, '2026-08-01 23:59:00', NULL, 1, 1, 1, NULL),
('Finalize Project Requirements', 'Finalize the standard project requirements and distribute them to engineers and reviewers.', '2026-08-08', @Now, '2026-08-08 23:59:00', NULL, 1, 1, 2, NULL),
('Evaluate Capstone Engineers', 'Evaluate the performance of all capstone engineers for the midterm evaluation.', '2026-09-01', @Now, '2026-09-01 23:59:00', NULL, 1, 1, 5, NULL),
('Prepare Final Rubrics', 'Prepare and publish the final grading rubrics for the end of year presentations.', '2026-09-15', @Now, '2026-09-15 23:59:00', NULL, 1, 1, 7, NULL),
('Schedule Final Presentations', 'Coordinate with the board to schedule the final Capstone project presentations for all teams.', '2026-10-01', @Now, '2026-10-01 23:59:00', NULL, 1, 1, 10, NULL);
