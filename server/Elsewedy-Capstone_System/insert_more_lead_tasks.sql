DECLARE @Now DATETIME = GETDATE();

-- Generate 4 to 5 multiple tasks explicitly for ALL Capstone Leads

-- Hassan Mostafa (45)
INSERT INTO [Tbl_Task] (TaskName, TaskDescription, DueDate, CreatedAt, TaskDeadline, GradeId, AdminAccountId, StatusId, WeekID, AssignedToId) VALUES
('Kickoff Meeting Logistics', 'Ensure all kickoff meeting materials are printed and rooms are booked.', '2026-08-01', @Now, '2026-08-01 23:59:00', NULL, 1, 1, 1, 45),
('Review Phase 1 Rubrics', 'Double-check the evaluation rubrics before publishing them to the students.', '2026-08-20', @Now, '2026-08-20 23:59:00', NULL, 1, 1, 4, 45),
('Evaluate Week 7 Progress', 'Collate feedback from supervisors on team progress at the midway point.', '2026-09-12', @Now, '2026-09-12 23:59:00', NULL, 1, 1, 7, 45),
('Final Review of Grade 10 Designs', 'Sign off on all design plans submitted by Junior students.', '2026-10-18', @Now, '2026-10-18 23:59:00', NULL, 1, 1, 12, 45),
('Semester Wrap-up Report', 'Draft the overall capstone semester report for the board.', '2026-11-10', @Now, '2026-11-10 23:59:00', NULL, 1, 1, 15, 45);

-- Maged Sameh (46)
INSERT INTO [Tbl_Task] (TaskName, TaskDescription, DueDate, CreatedAt, TaskDeadline, GradeId, AdminAccountId, StatusId, WeekID, AssignedToId) VALUES
('Approve Team Rosters', 'Verify that all teams meet the 5-member minimum requirement.', '2026-08-08', @Now, '2026-08-08 23:59:00', NULL, 1, 1, 2, 46),
('Publish Midterm Guidelines', 'Upload the final midterm guidelines to the portal.', '2026-08-28', @Now, '2026-08-28 23:59:00', NULL, 1, 1, 5, 46),
('Review Budget Allocation', 'Ensure no team has exceeded the $500 capstone budget cap.', '2026-09-22', @Now, '2026-09-22 23:59:00', NULL, 1, 1, 9, 46),
('Organize Guest Speaker Event', 'Finalize logistics for the industry guest speaker in Week 11.', '2026-10-06', @Now, '2026-10-06 23:59:00', NULL, 1, 1, 11, 46),
('Verify Prototype Submissions', 'Check that all prototypes were received and safely stored in the lab.', '2026-10-27', @Now, '2026-10-27 23:59:00', NULL, 1, 1, 14, 46);

-- Omar Yassin (47)
INSERT INTO [Tbl_Task] (TaskName, TaskDescription, DueDate, CreatedAt, TaskDeadline, GradeId, AdminAccountId, StatusId, WeekID, AssignedToId) VALUES
('Assign Reviewers to Projects', 'Allocate academic reviewers to the newly formed student teams.', '2026-08-14', @Now, '2026-08-14 23:59:00', NULL, 1, 1, 3, 47),
('Monitor Attendance Records', 'Audit the week 5 attendance sheets from all capstone classes.', '2026-08-30', @Now, '2026-08-30 23:59:00', NULL, 1, 1, 5, 47),
('Prepare Midterm Examiner Feedback', 'Compile and sanitize examiner feedback to distribute to teams.', '2026-09-15', @Now, '2026-09-15 23:59:00', NULL, 1, 1, 8, 47),
('Check Safety Compliance Forms', 'Ensure all students have signed the Phase 3 workshop safety waivers.', '2026-10-01', @Now, '2026-10-01 23:59:00', NULL, 1, 1, 10, 47),
('Distribute Final Grade Sheets', 'Generate and send the final evaluation grade sheets to all teachers.', '2026-11-04', @Now, '2026-11-04 23:59:00', NULL, 1, 1, 15, 47);

-- Sherif Nabil (48)
INSERT INTO [Tbl_Task] (TaskName, TaskDescription, DueDate, CreatedAt, TaskDeadline, GradeId, AdminAccountId, StatusId, WeekID, AssignedToId) VALUES
('Orientation Day Setup', 'Prepare the main hall and verify AV equipment for the student orientation.', '2026-08-03', @Now, '2026-08-03 23:59:00', NULL, 1, 1, 1, 48),
('Review Phase 1 Video Submissions', 'Verify all teams uploaded working video links for Phase 1.', '2026-08-25', @Now, '2026-08-25 23:59:00', NULL, 1, 1, 4, 48),
('Schedule Make-up Presentations', 'Coordinate times for students who missed the midterm with valid excuses.', '2026-09-18', @Now, '2026-09-18 23:59:00', NULL, 1, 1, 8, 48),
('Draft Final Exhibition Layout', 'Draw the floor plan map for where teams will setup their prototypes.', '2026-10-12', @Now, '2026-10-12 23:59:00', NULL, 1, 1, 12, 48),
('Post-Exhibition Cleanup Check', 'Verify the exhibition hall was left clean after the final day.', '2026-11-08', @Now, '2026-11-08 23:59:00', NULL, 1, 1, 15, 48);

-- Ayman Wael (49)
INSERT INTO [Tbl_Task] (TaskName, TaskDescription, DueDate, CreatedAt, TaskDeadline, GradeId, AdminAccountId, StatusId, WeekID, AssignedToId) VALUES
('Send Welcome Emails', 'Blast the introductory capstone email to all newly enrolled students.', '2026-08-05', @Now, '2026-08-05 23:59:00', NULL, 1, 1, 1, 49),
('Audit Milestone 1 Submissions', 'Ensure the grading for Milestone 1 was fully completed by supervisors.', '2026-08-18', @Now, '2026-08-18 23:59:00', NULL, 1, 1, 3, 49),
('Midterm Refreshments Order', 'Place catering order for the reviewers during midterm week.', '2026-09-08', @Now, '2026-09-08 23:59:00', NULL, 1, 1, 6, 49),
('Approve Poster Printing Vendor', 'Select and finalize the print shop for the final team posters.', '2026-09-28', @Now, '2026-09-28 23:59:00', NULL, 1, 1, 9, 49),
('Finalize Certificate Names', 'Ensure all student names are spelled correctly for the graduation certificates.', '2026-10-22', @Now, '2026-10-22 23:59:00', NULL, 1, 1, 13, 49);
