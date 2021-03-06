USE [Monster_Builder]
GO
/****** Object:  StoredProcedure [dbo].[create_New_Monster]    Script Date: 9/13/2017 7:33:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Azgara Shathur
-- Create date: 20170901
-- Description:	Create new monster
-- =============================================
CREATE PROCEDURE [dbo].[create_New_Monster]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    --declare @sid_member table (sid_member uniqueidentifier)

	insert into mon_Monster (
		guid_Monster
	)
	output inserted.guid_Monster
	select 
		newid()
		

END

GO
/****** Object:  StoredProcedure [dbo].[delete_Monster_Feature]    Script Date: 9/13/2017 7:33:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nate Anderson
-- Create date: 20170911
-- Description:	Remove a monster's feature
-- =============================================
CREATE PROCEDURE [dbo].[delete_Monster_Feature]
	-- Add the parameters for the stored procedure here
	@guid_monster uniqueidentifier,
	@guid_feature uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete rmf
	from feature_rl_Monster_Feature rmf
	where guid_Monster = @guid_monster
		and guid_Feature = @guid_feature

	select 
		name_Feature,
		description_Feature,
		stat_modifier
	from feature_lu_Feature f
	join feature_rl_Monster_Feature rmf
		on f.guid_feature = rmf.guid_Feature
		and rmf.guid_Feature = @guid_feature
	where guid_Monster = @guid_monster
		
END

GO
/****** Object:  StoredProcedure [dbo].[get_Adjacent_CR_Values]    Script Date: 9/13/2017 7:33:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nate Anderson	
-- Create date: 20170913
-- Description:	Return all CR data for levels above and below given CR
-- =============================================
CREATE PROCEDURE [dbo].[get_Adjacent_CR_Values]
	-- Add the parameters for the stored procedure here
	@guid_CR uniqueidentifier,
	@number_adjacent_CR int = 5
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @rank_cr int = (
		select 
			rank_cr
		from com_CR
		where guid_CR = @guid_cr
	)

	select *
	from com_CR cr
	where rank_cr >= @rank_cr - @number_adjacent_CR
		and rank_cr <= @rank_cr + @number_adjacent_CR
	order by rank_cr

END

GO
/****** Object:  StoredProcedure [dbo].[get_CR_data]    Script Date: 9/13/2017 7:33:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nate Anderson
-- Create date: 20170913
-- Description:	Gets CR data to populate drop-down menu
-- =============================================
CREATE PROCEDURE [dbo].[get_CR_data]
	-- None
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	select 
		guid_CR,
		name_CR,
		experience_Points
	from com_CR
	order by rank_CR

END

GO
/****** Object:  StoredProcedure [dbo].[update_mon_Monster_Table]    Script Date: 9/13/2017 7:33:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Nate Anderson
-- Create date: 20170908
-- Description:	Update monster information
-- =============================================
CREATE PROCEDURE [dbo].[update_mon_Monster_Table]
	-- Add the parameters for the stored procedure here
	@guid_monster uniqueidentifier,

	@name_monster nvarchar(max) = null,
	@description_monster nvarchar(max) = null,
	@guid_alignment uniqueidentifier = null,
	@guid_type uniqueidentifier = null,
	@guid_CR uniqueidentifier = null,
	@guid_size uniqueidentifier = null

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	update mm
		set name_monster = @name_monster,
			description_monster = @description_monster,
			guid_alignment = @guid_alignment,
			guid_type = @guid_type,
			guid_CR = @guid_CR,
			guid_size = @guid_size
	from mon_Monster mm
	where guid_monster = @guid_monster

	select @guid_monster

END


GO
/****** Object:  StoredProcedure [dbo].[update_Monster_Ability_Scores]    Script Date: 9/13/2017 7:33:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nate Anderson
-- Create date: 20170911
-- Description:	Update ability scores, return ability score modifiers
-- =============================================
CREATE PROCEDURE [dbo].[update_Monster_Ability_Scores]
	-- Add the parameters for the stored procedure here
	@guid_monster uniqueidentifier,
	@guid_AbilityScore uniqueidentifier,
	@value_abilityScore int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    if exists (
			select top 1 
				*
			from com_rl_Monster_AbilityScore
			where guid_Monster = @guid_monster
				and guid_AbilityScore = @guid_AbilityScore
		)
		begin

			update com_rl_Monster_AbilityScore
				set value_AbilityScore = @value_abilityScore
			where guid_Monster = @guid_monster
					and guid_AbilityScore = @guid_AbilityScore

		end


	else
		begin

			insert into com_rl_Monster_AbilityScore (
				guid_Monster,
				guid_AbilityScore,
				value_AbilityScore
			)
			select 
				@guid_monster,
				@guid_AbilityScore,
				@value_abilityScore

		end

	select top 1
		abl.name_AbilityScore,
		asm.value_AbilityScore_Modifier
	from com_rl_Monster_AbilityScore mas
	join com_rl_AbilityScore_Modifier asm
		on mas.value_AbilityScore = asm.value_AbilityScore
	join com_AbilityScore abl
		on abl.guid_AbilityScore = mas.guid_AbilityScore
	where mas.guid_Monster = @guid_monster
		and mas.guid_AbilityScore = @guid_AbilityScore

END

GO
/****** Object:  StoredProcedure [dbo].[update_Monster_Feature]    Script Date: 9/13/2017 7:33:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nate Anderson
-- Create date: 20170911
-- Description:	Add new monster features, return the feature details
-- =============================================
CREATE PROCEDURE [dbo].[update_Monster_Feature]
	-- Add the parameters for the stored procedure here
	@guid_monster uniqueidentifier,
	@guid_feature uniqueidentifier

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	declare @new_feature table
	(
		guid_monster uniqueidentifier,
		guid_feature uniqueidentifier
	)

	insert into feature_rl_Monster_Feature (
		guid_monster,
		guid_Feature
	)
	select 
		nf.guid_monster,
		nf.guid_feature
	from @new_feature nf
	left join feature_rl_Monster_Feature rmf
		on nf.guid_monster = rmf.guid_Monster
		and nf.guid_feature = rmf.guid_Feature
	where rmf.guid_Monster is null
		and rmf.guid_Feature is null

	select *
	from feature_rl_Monster_Feature
	where guid_Monster = @guid_monster
		and guid_Feature = @guid_feature

END

GO
