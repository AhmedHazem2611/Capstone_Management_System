SELECT COUNT(*)
FROM [Account] AS [a]
INNER JOIN [AccountRoles] AS [a0] ON [a].[Id] = [a0].[AccountID]
INNER JOIN [Roles] AS [r] ON [a0].[RoleID] = [r].[Id]
WHERE [a].[IsActive] = CAST(1 AS bit) AND [a0].[BusinessEntityName] = N'CapstoneProject' AND LOWER([r].[RoleName]) = N'engineer'
