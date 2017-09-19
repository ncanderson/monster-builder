use Monster_Builder
go

begin transaction

				declare @new_monster table
				(
					guid_monster uniqueidentifier
				)

-- create new Monster
insert into @new_monster
exec create_New_Monster

				declare @guid_monster uniqueidentifier = (
						select top 1
							guid_monster
						from @new_monster
					)
	
				declare @guid_alignment uniqueidentifier = (
						select top 1
							guid_Alignment
						from mon_rl_Alignment
						where name_alignment = 'Lawful Neutral'
					)

				declare @guid_type uniqueidentifier = (
						select top 1
							guid_Type
						from mon_lu_Type
						where name_Type = 'Humanoid'
					)

				declare @guid_CR uniqueidentifier = (
						select top 1
							guid_CR
						from com_CR
						where name_CR = '3'
					)

				declare @guid_size uniqueidentifier = (
						select top 1
							guid_Size
						from com_Size
						where name_Size = 'Medium'
					)


exec update_mon_Monster_Table
	@guid_monster = @guid_monster,
	@name_monster = 'Wizard Assassin',
	@description_monster = 'This monster is blah blah blah...',
	@guid_alignment = @guid_alignment,
	@guid_type = @guid_type,
	@guid_CR = @guid_CR,
	@guid_size = @guid_size
	
				declare @str uniqueidentifier = (
					select 
						guid_AbilityScore
					from com_AbilityScore
					where name_AbilityScore = 'Strength'
				)

				declare @dex uniqueidentifier = (
					select 
						guid_AbilityScore
					from com_AbilityScore
					where name_AbilityScore = 'Dexterity'
				)

				declare @con uniqueidentifier = (
					select 
						guid_AbilityScore
					from com_AbilityScore
					where name_AbilityScore = 'Constitution'
				)

				declare @int uniqueidentifier = (
					select 
						guid_AbilityScore
					from com_AbilityScore
					where name_AbilityScore = 'Intelligence'
				)

				declare @wis uniqueidentifier = (
					select 
						guid_AbilityScore
					from com_AbilityScore
					where name_AbilityScore = 'Wisdom'
				)

				declare @cha uniqueidentifier = (
					select 
						guid_AbilityScore
					from com_AbilityScore
					where name_AbilityScore = 'Charisma'
				)

--Str
exec update_Monster_Ability_Scores
	@guid_monster = @guid_monster,	
	@guid_abilityScore = @str,
	@value_abilityScore = 10

--Dex
exec update_Monster_Ability_Scores
	@guid_monster = @guid_monster,	
	@guid_abilityScore = @dex,
	@value_abilityScore = 16

--Con
exec update_Monster_Ability_Scores
	@guid_monster = @guid_monster,	
	@guid_abilityScore = @con,
	@value_abilityScore = 12

--Int
exec update_Monster_Ability_Scores
	@guid_monster = @guid_monster,	
	@guid_abilityScore = @int,
	@value_abilityScore = 18

--Wis
exec update_Monster_Ability_Scores
	@guid_monster = @guid_monster,	
	@guid_abilityScore = @wis,
	@value_abilityScore = 14

--Cha
exec update_Monster_Ability_Scores
	@guid_monster = @guid_monster,	
	@guid_abilityScore = @cha,
	@value_abilityScore = 14

				declare @feature_1 uniqueidentifier = (
					select 
						guid_feature
					from feature_lu_Feature f
					where name_Feature = 'Spellcasting'
				)

				declare @feature_2 uniqueidentifier = (
					select 
						guid_feature
					from feature_lu_Feature f
					where name_Feature = 'Avoidance'
				)

				declare @feature_3 uniqueidentifier = (
					select 
						guid_feature
					from feature_lu_Feature f
					where name_Feature = 'Standing Leap'
				)
-- Features
exec [dbo].[update_Monster_Feature]
	@guid_monster = @guid_monster,
	@guid_feature = @feature_1
					
exec [dbo].[update_Monster_Feature]
	@guid_monster = @guid_monster,
	@guid_feature = @feature_2

exec [dbo].[update_Monster_Feature]
	@guid_monster = @guid_monster,
	@guid_feature = @feature_3

-- Get Stats by CR
exec get_Stats_By_CR	
	@guid_CR = @guid_CR

-- Populate temp table with guid_CR's for chosen CR targets

				declare @test_guid_CR uniqueidentifier = (
						select top 1
							guid_cr
						from com_CR 
						where name_CR = '5'
					)

exec update_Temp_Monster_CR
	@guid_monster = @guid_monster,
	@offensive_CR = @guid_CR

-- Start weapon stuff
-- Still need to implement custom attack routines and stat mods from feature
				declare @guid_weapon uniqueidentifier = (
						select top 1
							guid_weapon
						from weap_Weapon
						where name_weapon = 'Rapier'
					)

-- Also calls [dbo].[get_Best_AbilityScore_By_Weapon], which ranks weapon by score					
exec [dbo].[update_Monster_Weapon]
	@guid_monster = @guid_monster,
	@guid_weapon = @guid_weapon

--select *
--from get_basic_attack_routine mon
--where mon.guid_Monster = @guid_monster

-- Start armor stuff
				declare @guid_armor uniqueidentifier = (
						select top 1
							guid_armor
						from arm_Armor
						where name_Armor = 'Leather'
					)

				declare @guid_shield uniqueidentifier = (
						select top 1
							guid_shield
						from arm_Shield
						where name_Shield = 'shield'
					)


exec [dbo].[update_Monster_Armor]
	@guid_monster = @guid_monster,
	@guid_armor = @guid_armor,
	@guid_shield = @guid_shield

-- Defensive values
exec update_Temp_Monster_CR
	@guid_monster = @guid_monster,
	@defensive_cr = @guid_CR

select 
	m.guid_monster,
	m.name_Monster as [Monster Name],
	s.name_Size as Size,
	d.name_Die as [Hit Die],
	(dv.minimum_HP + dv.maximum_HP) / 2 as [Average HP],
	'+' + cast(asm.value_AbilityScore_Modifier as nvarchar(2)) as [Con Modifier],
	floor(dv.maximum_HP / (d.average_roll + asm.value_AbilityScore_Modifier)) as [HP Units],
	(d.average_roll + asm.value_AbilityScore_Modifier) * 
		floor(dv.maximum_HP / (d.average_roll + asm.value_AbilityScore_Modifier)) as [HP Average],
	'(' + cast(floor(dv.maximum_HP / (d.average_roll + asm.value_AbilityScore_Modifier)) as nvarchar(3)) 
		+ d.name_Die + ' + ' + cast(floor(dv.maximum_HP / (d.average_roll + asm.value_AbilityScore_Modifier)) * asm.value_AbilityScore_Modifier as nvarchar(3)) + ')' as [Concat String]
from mon_Monster m
join com_Size s
	on m.guid_Size = s.guid_Size
join dice_Dice d
	on d.guid_Die = s.guid_Die
join com_rl_Monster_AbilityScore mas
	on mas.guid_Monster = m.guid_Monster
join com_AbilityScore score
	on score.guid_AbilityScore = mas.guid_AbilityScore
join com_rl_AbilityScore_Modifier asm
	on asm.value_AbilityScore = mas.value_AbilityScore
join TEMP_Monster_CR t_mcr
	on t_mcr.guid_monster = m.guid_Monster
join core_lu_Defensive_Values dv
	on dv.guid_CR = t_mcr.defensive_CR
where m.guid_monster = @guid_monster	
	and score.name_AbilityScore = 'Constitution'


rollback transaction
