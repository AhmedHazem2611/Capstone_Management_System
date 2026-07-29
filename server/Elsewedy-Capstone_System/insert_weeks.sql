DECLARE @Now DATETIME = GETDATE();

SET IDENTITY_INSERT [Weeks] ON;
MERGE [Weeks] AS target
USING (VALUES
(1, 'Week 1', '2026-07-27', '2026-08-02', 'CapstoneProject'),
(2, 'Week 2', '2026-08-03', '2026-08-09', 'CapstoneProject'),
(3, 'Week 3', '2026-08-10', '2026-08-16', 'CapstoneProject'),
(4, 'Week 4', '2026-08-17', '2026-08-23', 'CapstoneProject'),
(5, 'Week 5', '2026-08-24', '2026-08-30', 'CapstoneProject'),
(6, 'Week 6', '2026-08-31', '2026-09-06', 'CapstoneProject'),
(7, 'Week 7', '2026-09-07', '2026-09-13', 'CapstoneProject'),
(8, 'Week 8', '2026-09-14', '2026-09-20', 'CapstoneProject'),
(9, 'Week 9', '2026-09-21', '2026-09-27', 'CapstoneProject'),
(10, 'Week 10', '2026-09-28', '2026-10-04', 'CapstoneProject'),
(11, 'Week 11', '2026-10-05', '2026-10-11', 'CapstoneProject'),
(12, 'Week 12', '2026-10-12', '2026-10-18', 'CapstoneProject')
) AS source (Id, WeekTitle, StartDate, EndDate, BusinessEntityName)
ON target.Id = source.Id
WHEN NOT MATCHED THEN
    INSERT (Id, WeekTitle, StartDate, EndDate, BusinessEntityName)
    VALUES (source.Id, source.WeekTitle, source.StartDate, source.EndDate, source.BusinessEntityName);
SET IDENTITY_INSERT [Weeks] OFF;
