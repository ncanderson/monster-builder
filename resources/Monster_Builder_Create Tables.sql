USE [Monster_Builder]
GO
/****** Object:  Table [dbo].[arm_Armor]    Script Date: 9/13/2017 7:17:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[arm_Armor](
	[guid_Armor] [uniqueidentifier] NOT NULL,
	[guid_ArmorType] [uniqueidentifier] NOT NULL,
	[name_Armor] [varchar](40) NOT NULL,
	[armor_Class] [int] NOT NULL,
	[has_StealthDisadvantage] [bit] NOT NULL,
 CONSTRAINT [PK__arm_Armo__34A2D127F5BABA27] PRIMARY KEY CLUSTERED 
(
	[guid_Armor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[arm_lu_ArmorType]    Script Date: 9/13/2017 7:17:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[arm_lu_ArmorType](
	[guid_ArmorType] [uniqueidentifier] NOT NULL,
	[name_ArmorType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_arm_lu_ArmorType] PRIMARY KEY CLUSTERED 
(
	[guid_ArmorType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[arm_rl_ACModifier]    Script Date: 9/13/2017 7:17:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[arm_rl_ACModifier](
	[guid_Armor] [uniqueidentifier] NOT NULL,
	[max_Modifier] [int] NOT NULL,
	[guid_AbilityScore] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[guid_Armor] ASC,
	[guid_AbilityScore] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[arm_rl_Monster_Armor]    Script Date: 9/13/2017 7:17:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[arm_rl_Monster_Armor](
	[guid_Monster] [uniqueidentifier] NOT NULL,
	[guid_Shield] [uniqueidentifier] NOT NULL,
	[guid_Armor] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[guid_Monster] ASC,
	[guid_Shield] ASC,
	[guid_Armor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[arm_Shield]    Script Date: 9/13/2017 7:17:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[arm_Shield](
	[guid_Shield] [uniqueidentifier] NOT NULL,
	[name_Shield] [varchar](20) NOT NULL,
	[armor_Class] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[guid_Shield] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[com_AbilityScore]    Script Date: 9/13/2017 7:17:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[com_AbilityScore](
	[guid_AbilityScore] [uniqueidentifier] NOT NULL,
	[name_AbilityScore] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__com_Abil__83EC500F6E24C5D9] PRIMARY KEY CLUSTERED 
(
	[guid_AbilityScore] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[com_CR]    Script Date: 9/13/2017 7:17:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[com_CR](
	[guid_CR] [uniqueidentifier] NOT NULL,
	[rank_CR] [int] NOT NULL,
	[name_CR] [varchar](3) NOT NULL,
	[experience_Points] [int] NOT NULL,
 CONSTRAINT [PK__com_CR__A73FE9A72590B126] PRIMARY KEY CLUSTERED 
(
	[guid_CR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[com_Language]    Script Date: 9/13/2017 7:17:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[com_Language](
	[guid_Language] [uniqueidentifier] NOT NULL,
	[name_Language] [varchar](30) NOT NULL,
	[name_Script] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[guid_Language] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[com_lu_ArmorClass]    Script Date: 9/13/2017 7:17:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[com_lu_ArmorClass](
	[armor_class] [int] NOT NULL,
	[guid_CR] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[guid_CR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[com_lu_Movement]    Script Date: 9/13/2017 7:17:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[com_lu_Movement](
	[guid_Movement] [uniqueidentifier] NOT NULL,
	[name_Movement] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[guid_Movement] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[com_lu_Senses]    Script Date: 9/13/2017 7:17:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[com_lu_Senses](
	[guid_Sense] [uniqueidentifier] NOT NULL,
	[name_Sense] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[guid_Sense] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[com_lu_Skill]    Script Date: 9/13/2017 7:17:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[com_lu_Skill](
	[guid_skill] [uniqueidentifier] NOT NULL,
	[name_Skill] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[guid_skill] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[com_ProtectionFromDamage]    Script Date: 9/13/2017 7:17:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[com_ProtectionFromDamage](
	[guid_Protection] [uniqueidentifier] NOT NULL,
	[name_Protection] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[guid_Protection] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[com_rl_AbilityScore_Modifier]    Script Date: 9/13/2017 7:17:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[com_rl_AbilityScore_Modifier](
	[value_AbilityScore] [int] NOT NULL,
	[value_AbilityScore_Modifier] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[value_AbilityScore] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[com_rl_AbilityScore_Skill]    Script Date: 9/13/2017 7:17:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[com_rl_AbilityScore_Skill](
	[guid_AbilityScore] [uniqueidentifier] NOT NULL,
	[guid_skill] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[guid_AbilityScore] ASC,
	[guid_skill] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[com_rl_Monster_AbilityScore]    Script Date: 9/13/2017 7:17:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[com_rl_Monster_AbilityScore](
	[guid_Monster] [uniqueidentifier] NOT NULL,
	[guid_AbilityScore] [uniqueidentifier] NOT NULL,
	[value_AbilityScore] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[guid_Monster] ASC,
	[guid_AbilityScore] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[com_rl_Monster_Language]    Script Date: 9/13/2017 7:17:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[com_rl_Monster_Language](
	[guid_Monster] [uniqueidentifier] NOT NULL,
	[guid_Language] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[guid_Monster] ASC,
	[guid_Language] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[com_Size]    Script Date: 9/13/2017 7:17:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[com_Size](
	[guid_Size] [uniqueidentifier] NOT NULL,
	[name_Size] [varchar](15) NOT NULL,
	[guid_Die] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[guid_Size] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[core_lu_CR_Proficiency]    Script Date: 9/13/2017 7:17:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[core_lu_CR_Proficiency](
	[proficiency_bonus] [int] NOT NULL,
	[guid_CR] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[guid_CR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[core_lu_Defensive_Values]    Script Date: 9/13/2017 7:17:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[core_lu_Defensive_Values](
	[guid_CR] [uniqueidentifier] NOT NULL,
	[AC] [int] NOT NULL,
	[minimum_HP] [int] NOT NULL,
	[maximum_HP] [int] NOT NULL,
 CONSTRAINT [PK__core_lu___A73FE9A76C95E6E3] PRIMARY KEY CLUSTERED 
(
	[guid_CR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[core_lu_Offensive_Values]    Script Date: 9/13/2017 7:17:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[core_lu_Offensive_Values](
	[guid_CR] [uniqueidentifier] NOT NULL,
	[attack_bonus] [int] NOT NULL,
	[save_DC] [int] NOT NULL,
	[minimum_damage] [int] NOT NULL,
	[maximum_damage] [int] NOT NULL,
 CONSTRAINT [PK__core_lu___A73FE9A7FFDD80E9] PRIMARY KEY CLUSTERED 
(
	[guid_CR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[custom_Attack_Dice]    Script Date: 9/13/2017 7:17:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[custom_Attack_Dice](
	[number_Dice] [int] NOT NULL,
	[guid_Die] [uniqueidentifier] NOT NULL,
	[guid_Custom_Attack] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[guid_Die] ASC,
	[guid_Custom_Attack] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[custom_Weapon_Attack]    Script Date: 9/13/2017 7:17:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[custom_Weapon_Attack](
	[guid_Custom_Attack] [uniqueidentifier] NOT NULL,
	[name_Custom_Attack] [varchar](50) NOT NULL,
	[guid_DamageType] [uniqueidentifier] NOT NULL,
	[guid_AbilityScore] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[guid_Custom_Attack] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dice_Dice]    Script Date: 9/13/2017 7:17:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dice_Dice](
	[guid_Die] [uniqueidentifier] NOT NULL,
	[min_Roll] [int] NOT NULL,
	[max_Roll] [int] NOT NULL,
	[average_Roll] [float] NOT NULL,
	[name_Die] [varchar](3) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[guid_Die] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[name_Die] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[feature_lu_Feature]    Script Date: 9/13/2017 7:17:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[feature_lu_Feature](
	[guid_feature] [uniqueidentifier] NOT NULL,
	[name_Feature] [varchar](30) NOT NULL,
	[stat_modifier] [varchar](max) NULL,
	[description_Feature] [varchar](max) NULL,
 CONSTRAINT [PK__feature___3BCC02F9BA89BB70] PRIMARY KEY CLUSTERED 
(
	[guid_feature] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[feature_rl_Monster_Feature]    Script Date: 9/13/2017 7:17:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[feature_rl_Monster_Feature](
	[guid_Monster] [uniqueidentifier] NOT NULL,
	[guid_Feature] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[guid_Monster] ASC,
	[guid_Feature] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[hp_Protection_CR_Modifier]    Script Date: 9/13/2017 7:17:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hp_Protection_CR_Modifier](
	[effective_HPModifier] [float] NOT NULL,
	[guid_CR] [uniqueidentifier] NOT NULL,
	[guid_Protection] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[guid_CR] ASC,
	[guid_Protection] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mon_lu_Goodness]    Script Date: 9/13/2017 7:17:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mon_lu_Goodness](
	[guid_Goodness] [uniqueidentifier] NOT NULL,
	[name_Morality] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[guid_Goodness] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mon_lu_Lawfulness]    Script Date: 9/13/2017 7:17:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mon_lu_Lawfulness](
	[guid_Lawfulness] [uniqueidentifier] NOT NULL,
	[name_Lawfulness] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[guid_Lawfulness] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mon_lu_Type]    Script Date: 9/13/2017 7:17:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mon_lu_Type](
	[guid_Type] [uniqueidentifier] NOT NULL,
	[name_Type] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[guid_Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mon_Monster]    Script Date: 9/13/2017 7:17:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mon_Monster](
	[guid_Monster] [uniqueidentifier] NOT NULL,
	[name_Monster] [nvarchar](50) NULL,
	[description_Monster] [nvarchar](max) NULL,
	[guid_Size] [uniqueidentifier] NULL,
	[guid_Alignment] [uniqueidentifier] NULL,
	[guid_Type] [uniqueidentifier] NULL,
	[guid_CR] [uniqueidentifier] NULL,
 CONSTRAINT [PK__mon_Mons__3C3D085FED6554FE] PRIMARY KEY CLUSTERED 
(
	[guid_Monster] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mon_rl_Alignment]    Script Date: 9/13/2017 7:17:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mon_rl_Alignment](
	[guid_Alignment] [uniqueidentifier] NOT NULL,
	[name_alignment] [varchar](50) NOT NULL,
	[guid_Lawfulness] [uniqueidentifier] NOT NULL,
	[guid_Goodness] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[guid_Alignment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mon_rl_Monster_Movement]    Script Date: 9/13/2017 7:17:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mon_rl_Monster_Movement](
	[guid_monster] [uniqueidentifier] NOT NULL,
	[guid_Movement] [uniqueidentifier] NOT NULL,
	[speed_Movement] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[guid_monster] ASC,
	[guid_Movement] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mon_rl_Monster_Senses]    Script Date: 9/13/2017 7:17:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mon_rl_Monster_Senses](
	[guid_monster] [uniqueidentifier] NOT NULL,
	[guid_Sense] [uniqueidentifier] NOT NULL,
	[distance_sense] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[guid_monster] ASC,
	[guid_Sense] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mon_rl_Monster_Skill]    Script Date: 9/13/2017 7:17:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mon_rl_Monster_Skill](
	[guid_Monster] [uniqueidentifier] NOT NULL,
	[guid_skill] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[guid_Monster] ASC,
	[guid_skill] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mon_rl_Monster_Weapon]    Script Date: 9/13/2017 7:17:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mon_rl_Monster_Weapon](
	[guid_Monster] [uniqueidentifier] NOT NULL,
	[guid_Weapon] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[guid_Monster] ASC,
	[guid_Weapon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mon_rl_Protection]    Script Date: 9/13/2017 7:17:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mon_rl_Protection](
	[guid_DamageType] [uniqueidentifier] NOT NULL,
	[guid_Monster] [uniqueidentifier] NOT NULL,
	[guid_Protection] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[guid_DamageType] ASC,
	[guid_Monster] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[weap_lu_DamageType]    Script Date: 9/13/2017 7:17:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[weap_lu_DamageType](
	[guid_DamageType] [uniqueidentifier] NOT NULL,
	[name_DamageType] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[guid_DamageType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[weap_lu_Size_WeaponDice]    Script Date: 9/13/2017 7:17:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[weap_lu_Size_WeaponDice](
	[die_Multiplier] [int] NOT NULL,
	[guid_Size] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[guid_Size] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[weap_lu_SkillRequired]    Script Date: 9/13/2017 7:17:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[weap_lu_SkillRequired](
	[guid_Skill] [uniqueidentifier] NOT NULL,
	[name_SkillLevel] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[guid_Skill] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[weap_lu_WeaponReach]    Script Date: 9/13/2017 7:17:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[weap_lu_WeaponReach](
	[guid_Reach] [uniqueidentifier] NOT NULL,
	[name_Reach] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[guid_Reach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[weap_lu_WeaponTrait]    Script Date: 9/13/2017 7:17:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[weap_lu_WeaponTrait](
	[guid_Trait] [uniqueidentifier] NOT NULL,
	[name_Trait] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[guid_Trait] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[weap_lu_WeaponType]    Script Date: 9/13/2017 7:17:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[weap_lu_WeaponType](
	[guid_WeaponType] [uniqueidentifier] NOT NULL,
	[guid_Skill] [uniqueidentifier] NULL,
	[guid_Reach] [uniqueidentifier] NULL,
	[name_weaponType] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK__weap_lu___16C9DC1B61B3AA5B] PRIMARY KEY CLUSTERED 
(
	[guid_WeaponType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[weap_rl_Weapon_AbilityScore]    Script Date: 9/13/2017 7:17:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[weap_rl_Weapon_AbilityScore](
	[guid_AbilityScore] [uniqueidentifier] NOT NULL,
	[guid_Weapon] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[guid_AbilityScore] ASC,
	[guid_Weapon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[weap_rl_Weapon_WeaponTrait]    Script Date: 9/13/2017 7:17:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[weap_rl_Weapon_WeaponTrait](
	[guid_Trait] [uniqueidentifier] NOT NULL,
	[guid_Weapon] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[guid_Trait] ASC,
	[guid_Weapon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[weap_Weapon]    Script Date: 9/13/2017 7:17:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[weap_Weapon](
	[guid_Weapon] [uniqueidentifier] NOT NULL,
	[guid_Die] [uniqueidentifier] NULL,
	[guid_DamageType] [uniqueidentifier] NULL,
	[guid_WeaponType] [uniqueidentifier] NOT NULL,
	[number_DamageDice] [int] NOT NULL,
	[name_weapon] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__weap_Wea__EDC313E3A6EF0B17] PRIMARY KEY CLUSTERED 
(
	[guid_Weapon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[arm_Armor]  WITH CHECK ADD  CONSTRAINT [FK_arm_Armor_arm_lu_ArmorType] FOREIGN KEY([guid_ArmorType])
REFERENCES [dbo].[arm_lu_ArmorType] ([guid_ArmorType])
GO
ALTER TABLE [dbo].[arm_Armor] CHECK CONSTRAINT [FK_arm_Armor_arm_lu_ArmorType]
GO
ALTER TABLE [dbo].[arm_rl_ACModifier]  WITH CHECK ADD  CONSTRAINT [FK__arm_rl_AC__guid___54CB950F] FOREIGN KEY([guid_AbilityScore])
REFERENCES [dbo].[com_AbilityScore] ([guid_AbilityScore])
GO
ALTER TABLE [dbo].[arm_rl_ACModifier] CHECK CONSTRAINT [FK__arm_rl_AC__guid___54CB950F]
GO
ALTER TABLE [dbo].[arm_rl_ACModifier]  WITH CHECK ADD  CONSTRAINT [FK__arm_rl_AC__guid___55BFB948] FOREIGN KEY([guid_Armor])
REFERENCES [dbo].[arm_Armor] ([guid_Armor])
GO
ALTER TABLE [dbo].[arm_rl_ACModifier] CHECK CONSTRAINT [FK__arm_rl_AC__guid___55BFB948]
GO
ALTER TABLE [dbo].[arm_rl_Monster_Armor]  WITH CHECK ADD  CONSTRAINT [FK__arm_rl_Mo__guid___1209AD79] FOREIGN KEY([guid_Monster])
REFERENCES [dbo].[mon_Monster] ([guid_Monster])
GO
ALTER TABLE [dbo].[arm_rl_Monster_Armor] CHECK CONSTRAINT [FK__arm_rl_Mo__guid___1209AD79]
GO
ALTER TABLE [dbo].[arm_rl_Monster_Armor]  WITH CHECK ADD FOREIGN KEY([guid_Shield])
REFERENCES [dbo].[arm_Shield] ([guid_Shield])
GO
ALTER TABLE [dbo].[arm_rl_Monster_Armor]  WITH CHECK ADD  CONSTRAINT [FK__arm_rl_Mo__guid___13F1F5EB] FOREIGN KEY([guid_Armor])
REFERENCES [dbo].[arm_Armor] ([guid_Armor])
GO
ALTER TABLE [dbo].[arm_rl_Monster_Armor] CHECK CONSTRAINT [FK__arm_rl_Mo__guid___13F1F5EB]
GO
ALTER TABLE [dbo].[com_lu_ArmorClass]  WITH CHECK ADD  CONSTRAINT [FK__com_lu_Ar__guid___56E8E7AB] FOREIGN KEY([guid_CR])
REFERENCES [dbo].[com_CR] ([guid_CR])
GO
ALTER TABLE [dbo].[com_lu_ArmorClass] CHECK CONSTRAINT [FK__com_lu_Ar__guid___56E8E7AB]
GO
ALTER TABLE [dbo].[com_rl_AbilityScore_Skill]  WITH CHECK ADD  CONSTRAINT [FK__com_rl_Ab__guid___6CD828CA] FOREIGN KEY([guid_AbilityScore])
REFERENCES [dbo].[com_AbilityScore] ([guid_AbilityScore])
GO
ALTER TABLE [dbo].[com_rl_AbilityScore_Skill] CHECK CONSTRAINT [FK__com_rl_Ab__guid___6CD828CA]
GO
ALTER TABLE [dbo].[com_rl_AbilityScore_Skill]  WITH CHECK ADD FOREIGN KEY([guid_skill])
REFERENCES [dbo].[com_lu_Skill] ([guid_skill])
GO
ALTER TABLE [dbo].[com_rl_Monster_AbilityScore]  WITH CHECK ADD  CONSTRAINT [FK__com_rl_Mo__guid___05A3D694] FOREIGN KEY([guid_Monster])
REFERENCES [dbo].[mon_Monster] ([guid_Monster])
GO
ALTER TABLE [dbo].[com_rl_Monster_AbilityScore] CHECK CONSTRAINT [FK__com_rl_Mo__guid___05A3D694]
GO
ALTER TABLE [dbo].[com_rl_Monster_AbilityScore]  WITH CHECK ADD  CONSTRAINT [FK__com_rl_Mo__guid___0697FACD] FOREIGN KEY([guid_AbilityScore])
REFERENCES [dbo].[com_AbilityScore] ([guid_AbilityScore])
GO
ALTER TABLE [dbo].[com_rl_Monster_AbilityScore] CHECK CONSTRAINT [FK__com_rl_Mo__guid___0697FACD]
GO
ALTER TABLE [dbo].[com_rl_Monster_AbilityScore]  WITH CHECK ADD FOREIGN KEY([value_AbilityScore])
REFERENCES [dbo].[com_rl_AbilityScore_Modifier] ([value_AbilityScore])
GO
ALTER TABLE [dbo].[com_rl_Monster_Language]  WITH CHECK ADD  CONSTRAINT [FK__com_rl_Mo__guid___0E391C95] FOREIGN KEY([guid_Monster])
REFERENCES [dbo].[mon_Monster] ([guid_Monster])
GO
ALTER TABLE [dbo].[com_rl_Monster_Language] CHECK CONSTRAINT [FK__com_rl_Mo__guid___0E391C95]
GO
ALTER TABLE [dbo].[com_rl_Monster_Language]  WITH CHECK ADD FOREIGN KEY([guid_Language])
REFERENCES [dbo].[com_Language] ([guid_Language])
GO
ALTER TABLE [dbo].[com_Size]  WITH CHECK ADD FOREIGN KEY([guid_Die])
REFERENCES [dbo].[dice_Dice] ([guid_Die])
GO
ALTER TABLE [dbo].[core_lu_CR_Proficiency]  WITH CHECK ADD  CONSTRAINT [FK__core_lu_C__guid___5F7E2DAC] FOREIGN KEY([guid_CR])
REFERENCES [dbo].[com_CR] ([guid_CR])
GO
ALTER TABLE [dbo].[core_lu_CR_Proficiency] CHECK CONSTRAINT [FK__core_lu_C__guid___5F7E2DAC]
GO
ALTER TABLE [dbo].[core_lu_Defensive_Values]  WITH CHECK ADD  CONSTRAINT [FK__core_lu_D__guid___59C55456] FOREIGN KEY([guid_CR])
REFERENCES [dbo].[com_CR] ([guid_CR])
GO
ALTER TABLE [dbo].[core_lu_Defensive_Values] CHECK CONSTRAINT [FK__core_lu_D__guid___59C55456]
GO
ALTER TABLE [dbo].[core_lu_Offensive_Values]  WITH CHECK ADD  CONSTRAINT [FK__core_lu_O__guid___5CA1C101] FOREIGN KEY([guid_CR])
REFERENCES [dbo].[com_CR] ([guid_CR])
GO
ALTER TABLE [dbo].[core_lu_Offensive_Values] CHECK CONSTRAINT [FK__core_lu_O__guid___5CA1C101]
GO
ALTER TABLE [dbo].[custom_Attack_Dice]  WITH CHECK ADD FOREIGN KEY([guid_Die])
REFERENCES [dbo].[dice_Dice] ([guid_Die])
GO
ALTER TABLE [dbo].[custom_Attack_Dice]  WITH CHECK ADD FOREIGN KEY([guid_Custom_Attack])
REFERENCES [dbo].[custom_Weapon_Attack] ([guid_Custom_Attack])
GO
ALTER TABLE [dbo].[custom_Weapon_Attack]  WITH CHECK ADD FOREIGN KEY([guid_DamageType])
REFERENCES [dbo].[weap_lu_DamageType] ([guid_DamageType])
GO
ALTER TABLE [dbo].[custom_Weapon_Attack]  WITH CHECK ADD  CONSTRAINT [FK__custom_We__guid___634EBE90] FOREIGN KEY([guid_AbilityScore])
REFERENCES [dbo].[com_AbilityScore] ([guid_AbilityScore])
GO
ALTER TABLE [dbo].[custom_Weapon_Attack] CHECK CONSTRAINT [FK__custom_We__guid___634EBE90]
GO
ALTER TABLE [dbo].[feature_rl_Monster_Feature]  WITH CHECK ADD  CONSTRAINT [FK__feature_r__guid___0A688BB1] FOREIGN KEY([guid_Monster])
REFERENCES [dbo].[mon_Monster] ([guid_Monster])
GO
ALTER TABLE [dbo].[feature_rl_Monster_Feature] CHECK CONSTRAINT [FK__feature_r__guid___0A688BB1]
GO
ALTER TABLE [dbo].[feature_rl_Monster_Feature]  WITH CHECK ADD  CONSTRAINT [FK__feature_r__guid___0B5CAFEA] FOREIGN KEY([guid_Feature])
REFERENCES [dbo].[feature_lu_Feature] ([guid_feature])
GO
ALTER TABLE [dbo].[feature_rl_Monster_Feature] CHECK CONSTRAINT [FK__feature_r__guid___0B5CAFEA]
GO
ALTER TABLE [dbo].[hp_Protection_CR_Modifier]  WITH CHECK ADD  CONSTRAINT [FK__hp_Protec__guid___498EEC8D] FOREIGN KEY([guid_CR])
REFERENCES [dbo].[com_CR] ([guid_CR])
GO
ALTER TABLE [dbo].[hp_Protection_CR_Modifier] CHECK CONSTRAINT [FK__hp_Protec__guid___498EEC8D]
GO
ALTER TABLE [dbo].[hp_Protection_CR_Modifier]  WITH CHECK ADD FOREIGN KEY([guid_Protection])
REFERENCES [dbo].[com_ProtectionFromDamage] ([guid_Protection])
GO
ALTER TABLE [dbo].[mon_Monster]  WITH CHECK ADD  CONSTRAINT [FK__mon_Monst__guid___00DF2177] FOREIGN KEY([guid_Alignment])
REFERENCES [dbo].[mon_rl_Alignment] ([guid_Alignment])
GO
ALTER TABLE [dbo].[mon_Monster] CHECK CONSTRAINT [FK__mon_Monst__guid___00DF2177]
GO
ALTER TABLE [dbo].[mon_Monster]  WITH CHECK ADD  CONSTRAINT [FK__mon_Monst__guid___01D345B0] FOREIGN KEY([guid_Type])
REFERENCES [dbo].[mon_lu_Type] ([guid_Type])
GO
ALTER TABLE [dbo].[mon_Monster] CHECK CONSTRAINT [FK__mon_Monst__guid___01D345B0]
GO
ALTER TABLE [dbo].[mon_Monster]  WITH CHECK ADD  CONSTRAINT [FK__mon_Monst__guid___02C769E9] FOREIGN KEY([guid_CR])
REFERENCES [dbo].[com_CR] ([guid_CR])
GO
ALTER TABLE [dbo].[mon_Monster] CHECK CONSTRAINT [FK__mon_Monst__guid___02C769E9]
GO
ALTER TABLE [dbo].[mon_Monster]  WITH CHECK ADD  CONSTRAINT [FK__mon_Monst__guid___7FEAFD3E] FOREIGN KEY([guid_Size])
REFERENCES [dbo].[com_Size] ([guid_Size])
GO
ALTER TABLE [dbo].[mon_Monster] CHECK CONSTRAINT [FK__mon_Monst__guid___7FEAFD3E]
GO
ALTER TABLE [dbo].[mon_rl_Alignment]  WITH CHECK ADD FOREIGN KEY([guid_Lawfulness])
REFERENCES [dbo].[mon_lu_Lawfulness] ([guid_Lawfulness])
GO
ALTER TABLE [dbo].[mon_rl_Alignment]  WITH CHECK ADD FOREIGN KEY([guid_Goodness])
REFERENCES [dbo].[mon_lu_Goodness] ([guid_Goodness])
GO
ALTER TABLE [dbo].[mon_rl_Monster_Movement]  WITH CHECK ADD  CONSTRAINT [FK__mon_rl_Mo__guid___1975C517] FOREIGN KEY([guid_monster])
REFERENCES [dbo].[mon_Monster] ([guid_Monster])
GO
ALTER TABLE [dbo].[mon_rl_Monster_Movement] CHECK CONSTRAINT [FK__mon_rl_Mo__guid___1975C517]
GO
ALTER TABLE [dbo].[mon_rl_Monster_Movement]  WITH CHECK ADD FOREIGN KEY([guid_Movement])
REFERENCES [dbo].[com_lu_Movement] ([guid_Movement])
GO
ALTER TABLE [dbo].[mon_rl_Monster_Senses]  WITH CHECK ADD  CONSTRAINT [FK__mon_rl_Mo__guid___15A53433] FOREIGN KEY([guid_monster])
REFERENCES [dbo].[mon_Monster] ([guid_Monster])
GO
ALTER TABLE [dbo].[mon_rl_Monster_Senses] CHECK CONSTRAINT [FK__mon_rl_Mo__guid___15A53433]
GO
ALTER TABLE [dbo].[mon_rl_Monster_Senses]  WITH CHECK ADD FOREIGN KEY([guid_Sense])
REFERENCES [dbo].[com_lu_Senses] ([guid_Sense])
GO
ALTER TABLE [dbo].[mon_rl_Monster_Skill]  WITH CHECK ADD  CONSTRAINT [FK__mon_rl_Mo__guid___1F63A897] FOREIGN KEY([guid_Monster])
REFERENCES [dbo].[mon_Monster] ([guid_Monster])
GO
ALTER TABLE [dbo].[mon_rl_Monster_Skill] CHECK CONSTRAINT [FK__mon_rl_Mo__guid___1F63A897]
GO
ALTER TABLE [dbo].[mon_rl_Monster_Skill]  WITH CHECK ADD FOREIGN KEY([guid_skill])
REFERENCES [dbo].[com_lu_Skill] ([guid_skill])
GO
ALTER TABLE [dbo].[mon_rl_Monster_Weapon]  WITH CHECK ADD  CONSTRAINT [FK__mon_rl_Mo__guid___1B9317B3] FOREIGN KEY([guid_Monster])
REFERENCES [dbo].[mon_Monster] ([guid_Monster])
GO
ALTER TABLE [dbo].[mon_rl_Monster_Weapon] CHECK CONSTRAINT [FK__mon_rl_Mo__guid___1B9317B3]
GO
ALTER TABLE [dbo].[mon_rl_Monster_Weapon]  WITH CHECK ADD  CONSTRAINT [FK__mon_rl_Mo__guid___1C873BEC] FOREIGN KEY([guid_Weapon])
REFERENCES [dbo].[weap_Weapon] ([guid_Weapon])
GO
ALTER TABLE [dbo].[mon_rl_Monster_Weapon] CHECK CONSTRAINT [FK__mon_rl_Mo__guid___1C873BEC]
GO
ALTER TABLE [dbo].[mon_rl_Protection]  WITH CHECK ADD FOREIGN KEY([guid_DamageType])
REFERENCES [dbo].[weap_lu_DamageType] ([guid_DamageType])
GO
ALTER TABLE [dbo].[mon_rl_Protection]  WITH CHECK ADD  CONSTRAINT [FK__mon_rl_Pr__guid___17C286CF] FOREIGN KEY([guid_Monster])
REFERENCES [dbo].[mon_Monster] ([guid_Monster])
GO
ALTER TABLE [dbo].[mon_rl_Protection] CHECK CONSTRAINT [FK__mon_rl_Pr__guid___17C286CF]
GO
ALTER TABLE [dbo].[mon_rl_Protection]  WITH CHECK ADD FOREIGN KEY([guid_Protection])
REFERENCES [dbo].[com_ProtectionFromDamage] ([guid_Protection])
GO
ALTER TABLE [dbo].[weap_lu_Size_WeaponDice]  WITH CHECK ADD FOREIGN KEY([guid_Size])
REFERENCES [dbo].[com_Size] ([guid_Size])
GO
ALTER TABLE [dbo].[weap_lu_WeaponType]  WITH CHECK ADD  CONSTRAINT [FK__weap_lu_W__guid___51300E55] FOREIGN KEY([guid_Skill])
REFERENCES [dbo].[weap_lu_SkillRequired] ([guid_Skill])
GO
ALTER TABLE [dbo].[weap_lu_WeaponType] CHECK CONSTRAINT [FK__weap_lu_W__guid___51300E55]
GO
ALTER TABLE [dbo].[weap_lu_WeaponType]  WITH CHECK ADD  CONSTRAINT [FK__weap_lu_W__guid___5224328E] FOREIGN KEY([guid_Reach])
REFERENCES [dbo].[weap_lu_WeaponReach] ([guid_Reach])
GO
ALTER TABLE [dbo].[weap_lu_WeaponType] CHECK CONSTRAINT [FK__weap_lu_W__guid___5224328E]
GO
ALTER TABLE [dbo].[weap_rl_Weapon_AbilityScore]  WITH CHECK ADD  CONSTRAINT [FK__weap_rl_W__guid___793DFFAF] FOREIGN KEY([guid_AbilityScore])
REFERENCES [dbo].[com_AbilityScore] ([guid_AbilityScore])
GO
ALTER TABLE [dbo].[weap_rl_Weapon_AbilityScore] CHECK CONSTRAINT [FK__weap_rl_W__guid___793DFFAF]
GO
ALTER TABLE [dbo].[weap_rl_Weapon_AbilityScore]  WITH CHECK ADD  CONSTRAINT [FK__weap_rl_W__guid___7A3223E8] FOREIGN KEY([guid_Weapon])
REFERENCES [dbo].[weap_Weapon] ([guid_Weapon])
GO
ALTER TABLE [dbo].[weap_rl_Weapon_AbilityScore] CHECK CONSTRAINT [FK__weap_rl_W__guid___7A3223E8]
GO
ALTER TABLE [dbo].[weap_rl_Weapon_WeaponTrait]  WITH CHECK ADD FOREIGN KEY([guid_Trait])
REFERENCES [dbo].[weap_lu_WeaponTrait] ([guid_Trait])
GO
ALTER TABLE [dbo].[weap_rl_Weapon_WeaponTrait]  WITH CHECK ADD  CONSTRAINT [FK__weap_rl_W__guid___76619304] FOREIGN KEY([guid_Weapon])
REFERENCES [dbo].[weap_Weapon] ([guid_Weapon])
GO
ALTER TABLE [dbo].[weap_rl_Weapon_WeaponTrait] CHECK CONSTRAINT [FK__weap_rl_W__guid___76619304]
GO
ALTER TABLE [dbo].[weap_Weapon]  WITH CHECK ADD  CONSTRAINT [FK__weap_Weap__guid___70A8B9AE] FOREIGN KEY([guid_Die])
REFERENCES [dbo].[dice_Dice] ([guid_Die])
GO
ALTER TABLE [dbo].[weap_Weapon] CHECK CONSTRAINT [FK__weap_Weap__guid___70A8B9AE]
GO
ALTER TABLE [dbo].[weap_Weapon]  WITH CHECK ADD  CONSTRAINT [FK__weap_Weap__guid___719CDDE7] FOREIGN KEY([guid_DamageType])
REFERENCES [dbo].[weap_lu_DamageType] ([guid_DamageType])
GO
ALTER TABLE [dbo].[weap_Weapon] CHECK CONSTRAINT [FK__weap_Weap__guid___719CDDE7]
GO
ALTER TABLE [dbo].[weap_Weapon]  WITH CHECK ADD  CONSTRAINT [FK__weap_Weap__guid___72910220] FOREIGN KEY([guid_WeaponType])
REFERENCES [dbo].[weap_lu_WeaponType] ([guid_WeaponType])
GO
ALTER TABLE [dbo].[weap_Weapon] CHECK CONSTRAINT [FK__weap_Weap__guid___72910220]
GO
