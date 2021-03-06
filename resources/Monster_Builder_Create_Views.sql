USE [Monster_Builder]
GO
/****** Object:  View [dbo].[get_Basic_Attack_Routine]    Script Date: 9/14/2017 8:30:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[get_Basic_Attack_Routine]
AS
SELECT TOP (1) mon.guid_Monster, mon.name_Monster AS [Monster Name], CASE WHEN floor(ov.maximum_damage / ((average_Roll * size_die_Multiplier * number_DamageDice) + value_AbilityScore_Modifier)) 
                  > 1 THEN 'Multi-Attack' ELSE 'Single Attack' END AS [Attack Routine], FLOOR(ov.maximum_damage / (d.average_Roll * swd.size_die_Multiplier * w.number_DamageDice + sc_m.value_AbilityScore_Modifier)) AS [Number of Attacks], 
                  '+' + CAST(sc_m.value_AbilityScore_Modifier AS nvarchar(2)) AS [Ability Score Modifier], w.name_weapon AS Weapon, '+' + CAST(prof.proficiency_bonus + sc_m.value_AbilityScore_Modifier AS nvarchar(2)) AS [Hit Modifier], 
                  '(' + CAST(swd.size_die_Multiplier * w.number_DamageDice AS nvarchar(2)) + d.name_Die + ' + ' + CAST(sc_m.value_AbilityScore_Modifier AS nvarchar(2)) + ')' AS Damage, dt.name_DamageType AS [Damage Type], 
                  d.average_Roll * swd.size_die_Multiplier * w.number_DamageDice + sc_m.value_AbilityScore_Modifier AS [Damage per Attack], 
                  FLOOR(ov.maximum_damage / (d.average_Roll * swd.size_die_Multiplier * w.number_DamageDice + sc_m.value_AbilityScore_Modifier)) 
                  * sc_m.value_AbilityScore_Modifier + FLOOR(ov.maximum_damage / (d.average_Roll * swd.size_die_Multiplier * w.number_DamageDice + sc_m.value_AbilityScore_Modifier)) 
                  * d.average_Roll * swd.size_die_Multiplier * w.number_DamageDice AS [Average Damage per Action]
FROM     dbo.mon_Monster AS mon INNER JOIN
                  dbo.TEMP_Monster_CR AS t_cr ON t_cr.guid_monster = mon.guid_Monster INNER JOIN
                  dbo.core_lu_Offensive_Values AS ov ON ov.guid_CR = t_cr.offensive_CR INNER JOIN
                  dbo.core_lu_CR_Proficiency AS prof ON prof.guid_CR = ov.guid_CR INNER JOIN
                  dbo.com_Size AS s ON s.guid_Size = mon.guid_Size INNER JOIN
                  dbo.mon_rl_Monster_Weapon AS mw ON mon.guid_Monster = mw.guid_Monster INNER JOIN
                  dbo.weap_Weapon AS w ON w.guid_Weapon = mw.guid_Weapon INNER JOIN
                  dbo.weap_lu_DamageType AS dt ON dt.guid_DamageType = w.guid_DamageType INNER JOIN
                  dbo.dice_Dice AS d ON d.guid_Die = w.guid_Die INNER JOIN
                  dbo.weap_lu_Size_WeaponDice AS swd ON swd.guid_Size = mon.guid_Size INNER JOIN
                  dbo.weap_rl_Weapon_AbilityScore AS was ON was.guid_Weapon = w.guid_Weapon INNER JOIN
                  dbo.com_AbilityScore AS score ON score.guid_AbilityScore = was.guid_AbilityScore INNER JOIN
                  dbo.com_rl_Monster_AbilityScore AS mas ON mas.guid_AbilityScore = score.guid_AbilityScore AND mas.guid_Monster = mw.guid_Monster INNER JOIN
                  dbo.com_rl_AbilityScore_Modifier AS sc_m ON sc_m.value_AbilityScore = mas.value_AbilityScore
ORDER BY sc_m.value_AbilityScore_Modifier DESC, mas.value_AbilityScore DESC

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[9] 2[31] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -1673
         Left = 0
      End
      Begin Tables = 
         Begin Table = "mon"
            Begin Extent = 
               Top = 88
               Left = 555
               Bottom = 251
               Right = 784
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t_cr"
            Begin Extent = 
               Top = 175
               Left = 48
               Bottom = 316
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ov"
            Begin Extent = 
               Top = 322
               Left = 48
               Bottom = 485
               Right = 270
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "prof"
            Begin Extent = 
               Top = 490
               Left = 48
               Bottom = 609
               Right = 262
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "s"
            Begin Extent = 
               Top = 609
               Left = 48
               Bottom = 750
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "mw"
            Begin Extent = 
               Top = 756
               Left = 48
               Bottom = 875
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "w"
            Begin Extent = 
               Top = 875
               Left = 48
               Bottom = 1038
               Right = 287
            End
            DisplayFlags = 280
            TopColumn = 0
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'get_Basic_Attack_Routine'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'         End
         Begin Table = "dt"
            Begin Extent = 
               Top = 1043
               Left = 48
               Bottom = 1162
               Right = 275
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "d"
            Begin Extent = 
               Top = 1162
               Left = 48
               Bottom = 1325
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "swd"
            Begin Extent = 
               Top = 1330
               Left = 48
               Bottom = 1449
               Right = 265
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "was"
            Begin Extent = 
               Top = 1449
               Left = 48
               Bottom = 1568
               Right = 259
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "score"
            Begin Extent = 
               Top = 1568
               Left = 48
               Bottom = 1687
               Right = 266
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "mas"
            Begin Extent = 
               Top = 1687
               Left = 48
               Bottom = 1828
               Right = 264
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "sc_m"
            Begin Extent = 
               Top = 1834
               Left = 48
               Bottom = 1953
               Right = 327
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'get_Basic_Attack_Routine'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'get_Basic_Attack_Routine'
GO
