use Monster_Builder
go

begin transaction

-- Clear out previous data - disable all constraints, then re-enable after delete
exec sys.sp_msforeachtable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL'

exec sys.sp_msforeachtable 'DELETE FROM ?'

exec sys.sp_MSForEachTable 'ALTER TABLE ? CHECK CONSTRAINT ALL'
print 'End of delete'

-- Re-insert
insert into com_CR (
	guid_cr,
	rank_cr,
	name_cr,
	experience_Points
)
values 
	(newid(),1,'0',0),
	(newid(),2,'1/8',25),
	(newid(),3,'1/4',50),
	(newid(),4,'1/2',100),
	(newid(),5,'1',200),
	(newid(),6,'2',450),
	(newid(),7,'3',700),
	(newid(),8,'4',1100),
	(newid(),9,'5',1800),
	(newid(),10,'6',2300),
	(newid(),11,'7',2900),
	(newid(),12,'8',3900),
	(newid(),13,'9',5000),
	(newid(),14,'10',5900),
	(newid(),15, '11',7200),
	(newid(),16,'12',8400),
	(newid(),17,'13',10000),
	(newid(),18,'14',11500),
	(newid(),19,'15',13000),
	(newid(),20,'16',15000),
	(newid(),21,'17',18000),
	(newid(),22,'18',20000),
	(newid(),23,'19',22000),
	(newid(),24,'20',25000),
	(newid(),25,'21',33000),
	(newid(),26,'22',41000),
	(newid(),27,'23',50000),
	(newid(),28,'24',62000),
	(newid(),29,'25',75000),
	(newid(),30,'26',90000),
	(newid(),31,'27',105000),
	(newid(),32,'28',120000),
	(newid(),33,'29',135000),
	(newid(),34,'30',155000)

-- Damage Types
insert into weap_lu_DamageType (
	guid_DamageType,
	name_DamageType
)
values 
	(newid(),'Acid'),
	(newid(),'Bludgeoning'),
	(newid(),'Cold'),
	(newid(),'Fire'),
	(newid(),'Force'),
	(newid(),'Lightning'),
	(newid(),'Necrotic'),
	(newid(),'Piercing'),
	(newid(),'Poison'),
	(newid(),'Psychic'),
	(newid(),'Radiant'),
	(newid(),'Slashing'),
	(newid(),'Thunder')

-- Ability Score
insert into com_AbilityScore (
	guid_AbilityScore,
	name_AbilityScore
)	
values 
	(newid(),'Strength'),
	(newid(),'Dexterity'),
	(newid(),'Constitution'),
	(newid(),'Wisdom'),
	(newid(),'Intelligence'),
	(newid(),'Charisma')

insert into com_rl_AbilityScore_Modifier (
	value_AbilityScore,
	value_AbilityScore_Modifier
)
values
	(1,-5),
	(2,-4),
	(3,-4),
	(4,-3),
	(5,-3),
	(6,-2),
	(7,-2),
	(8,-1),
	(9,-1),
	(10,0),
	(11,0),
	(12,1),
	(13,1),
	(14,2),
	(15,2),
	(16,3),
	(17,3),
	(18,4),
	(19,4),
	(20,5),
	(21,5),
	(22,6),
	(23,6),
	(24,7),
	(25,7),
	(26,8),
	(27,8),
	(28,9),
	(29,9),
	(30,10)

insert into mon_lu_Type (
	guid_Type,
	name_Type
)
values
	(newid(),'Aberration'),
	(newid(),'Beast'),
	(newid(),'Celestial'),
	(newid(),'Construct'),
	(newid(),'Dragon'),
	(newid(),'Elemental'),
	(newid(),'Fey'),
	(newid(),'Fiend'),
	(newid(),'Giant'),
	(newid(),'Humanoid'),
	(newid(),'Monstrosity'),
	(newid(),'Ooze'),
	(newid(),'Plant'),
	(newid(),'Undead')

insert into mon_lu_Goodness (
	guid_Goodness,
	name_Morality
)
values 
	(newid(), 'Good'),
	(newid(), 'Neutral'),
	(newid(), 'Evil')

insert into mon_lu_Lawfulness (
	guid_Lawfulness,
	name_Lawfulness
)
values 
	(newid(), 'Chaotic'),
	(newid(), 'Neutral'),
	(newid(), 'Lawful')

insert into mon_rl_Alignment (
	guid_Alignment,
	name_alignment,
	guid_Goodness,
	guid_Lawfulness
)
select
	newid(),
	case
		when l.name_Lawfulness + ' ' + g.name_Morality = 'Neutral Neutral' then 'True Neutral'
		else l.name_Lawfulness + ' ' + g.name_Morality
	end as name_alignment,
	g.guid_Goodness,
	l.guid_Lawfulness
from mon_lu_Goodness g
join mon_lu_Lawfulness l
	on 1 = 1

insert into com_Language (
	guid_Language,
	name_Language,
	name_Script
)
values 
	(newid(),'Abyssal','Infernal'),
	(newid(),'Celestial','Celestial'),
	(newid(),'Common','Common'),
	(newid(),'Deep Speech','None'),
	(newid(),'Draconic','Draconic'),
	(newid(),'Dwarvish','Dwarvish'),
	(newid(),'Elvish','Elvish'),
	(newid(),'Giant','Dwarvish'),
	(newid(),'Gnomish','Dwarvish'),
	(newid(),'Goblin','Dwarvish'),
	(newid(),'Halfling','Common'),
	(newid(),'Infernal','Infernal'),
	(newid(),'Orc','Dwarvish'),
	(newid(),'Primordial','Dwarvish'),
	(newid(),'Sylvan','Elvish'),
	(newid(),'Undercommon','Underscript')

insert into com_lu_Skill (
	guid_skill,
	name_Skill
)
values
	(newid(),'Athletics'),
	(newid(),'Acrobatics'),
	(newid(),'Sleight of Hand'),
	(newid(),'Stealth'),
	(newid(),'Arcana'),
	(newid(),'History'),
	(newid(),'Investigation'),
	(newid(),'Nature'),
	(newid(),'Religion'),
	(newid(),'Animal Handling'),
	(newid(),'Insight'),
	(newid(),'Medicine'),
	(newid(),'Perception'),
	(newid(),'Survival'),
	(newid(),'Deception'),
	(newid(),'Intimidation'),
	(newid(),'Performance'),
	(newid(),'Persuasion')

insert into dice_Dice (
	guid_Die,
	name_Die,
	min_Roll,
	max_Roll,
	average_Roll
)
values
	(newid(),'d1',1,1,1),
	(newid(),'d4',1,4,2.5),
	(newid(),'d6',1,6,3.5),
	(newid(),'d8',1,8,4.5),
	(newid(),'d10',1,10,5.5),
	(newid(),'d12',1,12,6.5),
	(newid(),'d20',1,20,10.5)

insert into arm_Shield (
	guid_shield,
	name_Shield,
	armor_class
)
values (newid(), 'Shield', 2)

declare @armor table
(
	guid_armor uniqueidentifier,
	name_armor nvarchar(max),
	ac int,
	modifier nvarchar(max),
	max_mod int,
	stealth nvarchar(max),
	name_armorType nvarchar(max)
)
	
insert into @armor 
values
	(newid(),'Breastplate',14,'Dexterity',2,'', 'Medium'),
	(newid(),'Chain Mail',16,'',0,'Disadvantage','Heavy'),
	(newid(),'Chain Shirt',13,'Dexterity',2,'', 'Medium'),
	(newid(),'Half Plate',15,'Dexterity',2,'Disadvantage', 'Medium'),
	(newid(),'Hide',12,'Dexterity',2,'', 'Medium'),
	(newid(),'Leather',11,'Dexterity',0,'', 'Light'),
	(newid(),'Natural Armor',0,'',0,'','Natural'),
	(newid(),'Padded',11,'Dexterity',0,'Disadvantage', 'Light'),
	(newid(),'Plate',18,'',0,'Disadvantage','Heavy'),
	(newid(),'Ring Mail',14,'',0,'Disadvantage','Heavy'),
	(newid(),'Scale Mail',14,'Dexterity',2,'Disadvantage', 'Medium'),
	(newid(),'Splint',17,'',0,'Disadvantage','Heavy'),
	(newid(),'Studded leather',12,'Dexterity',0,'', 'Light')

insert into arm_lu_ArmorType (
	guid_ArmorType,
	name_ArmorType
)
values 
	(newid(), 'Light'),
	(newid(), 'Medium'),
	(newid(), 'Heavy'),
	(newid(), 'Natural')


insert into arm_Armor (
	guid_Armor,
	guid_armorType,
	name_Armor,
	armor_Class,
	has_StealthDisadvantage
)
select 
	a.guid_armor,
	typ.guid_ArmorType,
	a.name_armor,
	a.ac,
	case 
		when a.stealth = 'Disadvantage' then 1
		else 0
	end as has_StealthDisadvantage
from @armor a
join arm_lu_ArmorType typ
	on a.name_armorType = typ.name_ArmorType
	
insert into arm_rl_ACModifier (
	guid_AbilityScore,
	guid_Armor,
	max_Modifier
)
select 
	score.guid_AbilityScore,
	a.guid_armor,
	a.max_mod
from @armor a
join com_AbilityScore score
	on score.name_AbilityScore = a.modifier

insert into feature_lu_Feature (
	guid_feature,
	name_Feature,
	stat_modifier,
	description_Feature
)
values
	(newid(),'Aggressive','Increase the monster''s effective per-round damage output by 2','As a bonus action, the monster can move up to its speed toward a hostile creature that it can see.'),
	(newid(),'Ambusher','Increase the monster''s effective attack bonus by 1','The monster has advantage on attack rolls against any creature it has surprised.'),
	(newid(),'Amorphous','','The monster can move through a space as narrow as 1 inch wide without squeezing.'),
	(newid(),'Angelic Weapons','Increase the monster''s effective per-round damage by the amount noted in the trait','The monster''s weapon attacks are magical. When the monster hits with any weapon, the weapon deals an extra amount of damage.'),
	(newid(),'Antimagic Susceptibility','','The monster is incapacitated while in the area of an anti-magic field. If targeted by dispel magic, the monster must succeed on a Constitution saving throw against the caster''s spell save DC or fall unconscious for 1 minute.'),
	(newid(),'Avoidance','Increase the monster''s effective AC by 1','If the monster is subjected to an effect that allows it to make a saving throw to take only half damage, it instead takes no damage if it succeeds on the saving throw, and only half damage if it fails.'),
	(newid(),'Blind Senses','','The monster can sense without the usual equipment to do so.'),
	(newid(),'Blood Frenzy','Increase the monster''s effective attack bonus by 4','The monster has advantage on melee attack rolls against any creature that doesn''t have all its hit points.'),
	(newid(),'Breath Weapon','For the purpose of determining effective damage output, assume the breath weapon hits two targets and that each target fails its saving throw','Varies'),
	(newid(),'Brute','Increase the monster''s effective per-round damage by the amount noted in the trait','A melee weapon deals one extra die of its damage when the monster hits with it.'),
	(newid(),'Chameleon Skin','','The monster has advantage on Dexterity (Stealth) checks made to hide'),
	(newid(),'Change Shape ','','The monster magically polymorphs into a humanoid or beast that has a challenge rating no higher than its own, or back into its true form. It reverts to its true form if it dies. Any equipment it is wearing or carrying is absorbed or borne by the new form (the monster''s choice). In a new form, the monster retains its alignment, hit points, Hit Dice, ability to speak, proficiencies, Legendary Resistance (if any), lair actions (if any), and Intelligence, Wisdom, and Charisma scores, as well as this action. Its statistics and capabilities are otherwise replaced by those of the new form, except any class features or legendary actions of that form.'),
	(newid(),'Charge','Increase the monster''s damage on one attack by the amount noted in the trait','If the monster moves at least 30 feet straight toward a target and then hits it with a weapon attack on the same turn, the target takes an extra amount of damage.'),
	(newid(),'Charm','','The monster targets one humanoid it can see within 30 feet of it. If the target can see the monster, the target must succeed on a Wisdom saving throw against this magic or be charmed by the monster. The charmed target regards the monster as a trusted friend to be heeded and protected. Although the target isn''t under the monster''s control, it takes the monster''s requests or actions in the most favorable way it can, and it is a willing target for some attacks. Each time the monster or the monster''s companions do anything harmful to the target, it can repeat the saving throw, ending the effect on itself on a success. Otherwise, the effect lasts 24 hours or until the monster is destroyed , is on a different plane of existence than the target, or takes a bonus action to end the effect.'),
	(newid(),'Constrict','Increase the monster''s effective AC by 1','Melee weapon attack, reach 5 ft., one creature the same size or smaller as the monster. The target is grappled if the monster isn''t already constricting a creature, and the target is restrained until this grapple ends.'),
	(newid(),'Damage Absorption','','Whenever the monster is subjected to elemental or other damage, it takes no damage and instead regains a number of hit poin ts equal to the damage damage dealt'),
	(newid(),'Damage Transfer','Double the monster''s effective hit points. Add one-third of the monster''s hit points to its per-round damage','While attached to a creature, the monster takes only half the damage dealt to it (rounded down) and that creature takes the other half.'),
	(newid(),'Death Burst','Increase the monster''s effective damage output for 1 round by the amount noted in the trait and assume it affects two creatures','When the monster dies, it explodes in a burst. Each creature within 10 feet of it must make a DC 11 Dexterity saving throw, taking damage on a failed save, or half as much damage on a successful one. '),
	(newid(),'Devil Sight','','Magical darkness doesn''t impede the darkvision .'),
	(newid(),'Dive','Increase the monster''s effective per-round damage by the amount noted in the trait','If the monster is flying and dives at least 30 feet straight toward a target and then hits it with a melee weapon attack, the attack deals extra damage to the target.'),
	(newid(),'Echolocation','','Counts as blindsight, but the monster can''t use its blindsight while deafened.'),
	(newid(),'Elemental Body','Increase the monster''s effective per-round damage by the amount noted in the trait','A creature that touchers the monster or hits it with a melee attack while within 5 feet of it takes damage.'),
	(newid(),'Enlarge','Increase the monster''s effective per-round damage by the amount noted in the trait','Recharges after a Short or Long Rest. For 1 minute, the monster magically increases in size, along with anything it is wearing or carrying. While enlarged, the monster is Large, doubles its damage dice on Strength-based weapon attacks, and makes Strength checks and Strength saving throws with advantage. If the monster lacks the room to become Large, it attains the maximum size possible in the space available .'),
	(newid(),'Etherealness','','The monster enters the Ethereal Plane from the Material Plane, or vice versa. It is visible on the Material Plane while it is in the Border Ethereal, and viae versa, yet it can''t affect or be affected by anything on the other plane.'),
	(newid(),'False Appearance','','While the monster remains motion less, it is indistinguishable from an inanimate statue.'),
	(newid(),'Fey Ancestry','','The monster has advantage on saving throws against being charmed, and magic can''t put the monster to sleep'),
	(newid(),'Fiendish Blessing','Apply the monster''s Charisma modifier to its actual AC','The AC of the monster includes its Charisma bonus'),
	(newid(),'Flyby','','The monster doesn''t provoke an opportunity attack when it flies out of an enemy''s reach.'),
	(newid(),'Frightful Presence','Increase the monster''s effective hit points by 25% if the monster is meant to face characters of 10th level or higher','Each creature of the monster''s choice that is within 120 feet of the monster and aware of it must succeed on a DC 18 Wisdom saving throw or become frightened for 1 minute. A creature can repeat the saving throw at the end of each of its turns, ending the effect on itself on a success. If a creature''s saving throw is successful or the effect ends for it, the creature is immune to the monster''s Frightful Presence for the next 24 hours.'),
	(newid(),'Grappler','','The monster has advantage on attack rolls against any creature grappled by it.'),
	(newid(),'Hold Breath ','','The monster can hold its breath for 15 minutes'),
	(newid(),'Horrifying Visage','Increase the monster''s effective hit points by 25% if the monster is meant to face characters of 10th level or higher','Each non-undead creature within 60 feet of the monster that can see her must succeed on a DC 13 Wisdom saving throw or be frightened for 1 minute. A frightened target can repeat the saving throw at the end of each of its turns, with disadvantage if the monster is within line of sight, ending the effect on itself on a success. If a target''s saving throw is successful or the effect ends for it, the target is immune to the monster''s Horrifying Visage for the next 24 hours.'),
	(newid(),'Illumination','','The monster emits either dim light in a 15-foot radius, or bright light in a 15-foot radius and dim light for an additionnal 15 feet. It can switch between the options as an action'),
	(newid(),'Illusory Appearance','','The monster covers itself and anything it is wearing or carrying with a magical illusion that makes her look like another creature of its general size and humanoid shape. The illusion ends if the hag takes a bonus action to end it or if it dies. The changes wrought by this effect fail to hold up to physical inspection. For example, the monster could appear to have smooth skin, but someone touching it would feel its rough flesh. Otherwise, a creature must take an action to visually inspect the illusion and succeed on a DC 20 Intelligence (Investigation) check to discern that the monster is disguised.'),
	(newid(),'Immutable Form','','The monster is immune to any spell or effect that would alter its form.'),
	(newid(),'Incorporeal Movement','','The monster can move through other creatures and objects as if they were difficult terrain. It takes 5 (1d10) force damage if it ends its turn inside an object.'),
	(newid(),'Innate Spellcasting','It''s complicated','Varies'),
	(newid(),'Inscrutable','','The monster is immune to any effect that would sense its emotions or read its thoughts, as well as any divination spell that it refuses. Wisdom (Insight) checks made to ascertain the monster''s intentions or sincerity have disadvantage.'),
	(newid(),'Invisibility','','The monster magically turns invisible until it attacks or uses offensive abilities or until its concentration ends (as if concentrating on a spell) . Any equipment the monster wears or carries is invisible with it'),
	(newid(),'Keen Senses','','The monster has advantage on Wisdom (Perception) checks that rely on the chosen sense.'),
	(newid(),'Labyrinthine Recall','','The monster can perfectly recall any path it has traveled.'),
	(newid(),'Leadership','','For 1 minute, the monster can utter a special command or warning whenever a nonhostile creature that it can see within 30 feet of it makes an attack roll or a saving throw. The creature can add a d4 to its roll provided it can hear and understand the monster. A creature can benefit from only one Leadership die at a time. This effect ends if the monster is incapacitated'),
	(newid(),'Legendary Resistance','Each per-day use of this trait increases the monster''s effective hit points based on the expected challenge rating: 1-4, 10 hp; 5-10, 20 hp; 11 or higher, 30 hp','If the monster fails a saving throw, it can choose to succeed instead.'),
	(newid(),'Life Drain','','The target must succeed on a Constitution saving throw or its hit point maximum is reduced by an amount equal to the damage taken. This reduction lasts until the target finishes a long rest. The target dies if this effect reduces its hit point maximum to 0. A humanoid slain by this attack rises 24 hours later as a zombie under the monster''s control, unless the humanoid is restored to life or its body is destroyed. The monster can have no more than twelve zombies under its control at one time.'),
	(newid(),'Light Sensitivity','','While in bright light, the monster has disadvantage on attack rolls, as well as on Wisdom (Perception) checks that rely on sight.'),
	(newid(),'Magic Resistance','Increase the monster''s effective AC by 2','The monster has advantage on saving throws against spells and other magical effects.'),
	(newid(),'Magic Weapons','','The monster''s weapons are magical'),
	(newid(),'Martial Advantage','Increase the effective damage of one attack per round by the amount gained from this trait','Once per turn, the monster can deal an extra 10 (3d6) damage to a creature it hits with a weapon attack if that creature is with in 5 feet of an ally of the monster that isn''t incapacitated.'),
	(newid(),'Mimicry','','The monster has advantage on attack rolls against any creature it has surprised.'),
	(newid(),'Nimble Escape','Increase the monster''s effective AC and effective attack bonus by 4 ( assuming the monster hits every round)','The monster can take the Disengage or Hide action as a bonus action on each of its turns.'),
	(newid(),'Otherworldly Perception','','The monster can sense the presence of any creature within 30 feet of it that is invisible or on the Ethereal Plane. It can pinpoint such a creature that is moving. '),
	(newid(),'Pack Tactics','Increase the monster''s effective attack bonus by 1','The monster has advantage on an attack roll against a creature if at least one of the monster''s allies is within 5 feet of the creature and the ally isn''t incapacitated.'),
	(newid(),'Parry','Increase the monster''s effective AC by 1','The monster adds 6 to its AC against one melee attack that would hit it. To do so, the monster must see the attacker and be wield ing a melee weapon.'),
	(newid(),'Possession','Double the monster''s effective hit points.','Recharge 6. One humanoid that the monster can see within 5 feet of it must succeed on a Charisma saving throw or be possessed by the monster; the monster then disappears, and the target is incapacitated and loses control of its body. The monster now controls the body but doesn''t deprive the target of awareness. The monster can''t be targeted by any attack, spell, or other effect, except ones that turn undead, and it retains its alignment, Intelligence, Wisdom, Charisma, and immunities and resistances. It otherwise uses the possessed target''s statistics, but doesn''t gain access to the target''s knowledge, class features, or proficiencies. The possession lasts until the body drops to 0 hit points, the monster ends it as a bonus action, or the monster is turned or forced out by an effect like the dispel evil and good spell. When the possession ends, the monster reappears in an unoccupied space within 5 feet of the body. The target is immune to this monster''s Possession for 24 hours after succeeding on the saving throw or after the possession ends.'),
	(newid(),'Pounce','Increase the monster''s effective damage for 1 round by the amount it deals with the bonus action gained from this trait','If the monster moves at least 30 feet straight toward a creature and then hits it with a hand attack on the same turn, that target must succeed on a Strength saving throw or be knocked prone. If the target is prone, the monster can make one bite attack against it as a bonus action.'),
	(newid(),'Psychic Defense','Apply the monster''s Wisdom modifier to its actual AC if the monsterits wearing armor or wielding a shield','While the monster is wearing no armor and wielding no shield , its AC includes its Wisdom modifier.'),
	(newid(),'Rampage','Incrase the monster effective per-round damage by 2','When the monster reduces a creature to 0 hit points with a melee attack on its turn , the monster can take a bonus action to move up to half its speed and make a bite attack.'),
	(newid(),'Reactive ','','The monster can take one reaction on every turn in a combat.'),
	(newid(),'Read Thoughts','','The monster magically reads the surface thoughts of one creature within 60 feet of it. The effect can penetrate barriers, but 3 feet of wood or dirt, 2 feet of stone, 2 inches of metal, or a thin layer of lead blocks it. While the target is in range, the monster can continue reading its thoughts, as long as the monster''s concentration isn''t broken (as if concentrating on a spell). While reading the target''s mind, the monster has advantage on Wisdom (Insight) and Charisma (Deception, Intimidation, and Persuasion) checks against the target.'),
	(newid(),'Reckless','','At the start of its turn, the monster can gain advantage on all melee weapon attack rolls it makes during that turn, but attack rolls against it have advantage until the start of its next turn.'),
	(newid(),'Redirect Attack','','When a creature the monster can see targets it with an attack, the monster chooses an ally within 5 feet of it. The two monster swap places, and the chosen monster becomes the target instead.'),
	(newid(),'Reel','','The monster pulls each creature grappled by it up to 25 feet straight toward it.'),
	(newid(),'Regeneration','Increase the monster''s effective hit points by 3x the number of hit points the monster regenerates each round','The monster regains 10 hit points at the start of its turn if it has at least 1 hit point'),
	(newid(),'Rejuvenation','','If it has a phylactery, the destroyed monster gains a new body in 1d10 days, regaining all its hit points and becoming active again . The new body appears within 5 feet of the phylactery.'),
	(newid(),'Relentless','Increase the monster''s effective hit points based on the expected challenge rating: 1-4, 7 hp; 5-10, 14 hp; 11-16, 21 hp; 17 or higher, 28 hp','If the monster takes 14 damage or less that would reduce it to 0 hit points, it is reduced to 1 hit point instead.'),
	(newid(),'Shadow Stealth','Incrase the monster''s effective AC by 4','While in dim light or darkness, the monster can take the Hide action as a bonus action.'),
	(newid(),'Shapechanger','','The monster can use its action to polymorph into a beast form that resembles a bat (speed 10ft. fly 40ft.), a centipede (40ft., climb 40ft.), or a toad (40ft., swi m 40ft.), or back into its true form. Its statistics are the same in each form, except for the speed changes noted. Any equipment it is wearing or carrying transforms along with it.'),
	(newid(),'Siege Monster','','The monster deals double damage to objects and structures.'),
	(newid(),'Slippery','','The monster has advantage on ability checks and saving throws made to escape a grapple.'),
	(newid(),'Spellcasting','It''s complicated','Varies'),
	(newid(),'Spider Climb','','The monster can climb difficult surfaces, including upside down on ceilings, without needing to make an ability check.'),
	(newid(),'Standing Leap','','The monster''s long jump is up to 20 feet and its high jump is up to 10 feet, with or without a running start.'),
	(newid(),'Steadfast','','The monster can''t be frightened while it can see an allied creature within 30 feet of it.'),
	(newid(),'Stench','Increase the monster''s effective AC by 1','Any creature that starts its turn within 10 feet of the monster must succeed on a Constitution saving throw or be poisoned until the start of its next turn. On a successful saving throw, the creature is immune to the monster''s stench for 24 hours'),
	(newid(),'Sunlight Sensitivity','','While in sunlight, the monster has disadvantage on attack rolls, as well as on Wisdom (Perception) checks that rely on sight.'),
	(newid(),'Superior Invisibility','Increase the monster''s effective AC by 2','As a bonus action, the monster can magically turn invisible until its concentration ends (as if concentrating on a spell). Any equipment the monster wears or carries is invisible with it.'),
	(newid(),'Sure-Footed','','The monster has advantage on Strength and Dexterity saving throws made against effects that would knock it prone.'),
	(newid(),'Surprise Attack','Increase the monster''s effective damage for 1 round by the amount noted in the trait','If the monster surprises a creature and hits it with an attack during the first round of combat, the target takes extra damage from the attack.'),
	(newid(),'Swallow ','Assume the monster swallows one creature and deals 2 rounds of acid damage to it','The monster makes one bite attack against a Medium or smaller target it is grappling. If the attack hits, the target is also swallowed, and the grapple ends. While swallowed, the target is blinded and restrained, it has total cover against attacks and other effects outside the behir, and it takes acid damage at the start of each of the monster''s turns. A monster can have only one creature swallowed at a time. If the monster takes 30 damage or more on a single turn from the swallowed creature, the monster must succeed on a Constitution saving throw at the end of that turn or regurgitate the creature, which falls prone in a space within 10 feet of the monster. If the monster dies, a swallowed creature is no longer restrained by it and can escape from the corpse by using 15 feet of movement, exiting prone.'),
	(newid(),'Teleport','','The monster magically teleports, along with any equipment it is wearing or carrying, up to 120 feet to an unoccupied space it can see.'),
	(newid(),'Terrain Camouflage','','The monster has advantage on Dexterity (Stealth) checks made to hide in native terrain.'),
	(newid(),'Tunneler','','The monster can burrow through solid rock at half its burrowing speed and leaves a tunnel in its wake.'),
	(newid(),'Turn Immunity','','The monster is immune to effects that turn undead.'),
	(newid(),'Turn Resistance','','The monster has advantage on saving throws against any effect that turns undead.'),
	(newid(),'Two Heads','','The monster has advantage on Wisdom (Perception) checks and on saving throws against being blinded, charmed, deafened, frightened, stunned, and knocked unconscious.'),
	(newid(),'Undead Fortitude','Increase the monster''s effective hit points based on the expected challenge rating: 1-4, 7 hp; 5-10, 14 hp; 11-16, 21 hp; 17 or higher, 28 hp','If damage reduces the monster to 0 hit points, it must make a Constitution saving throw with a DC of 5 +the damage taken, unless the damage is radiant or from a critical hit. On a success, the monster drops to 1 hit point instead.'),
	(newid(),'Web','Increase the monster''s effective AC by 1','Recharge 5-6. Ranged Weapon Attack: +5 to hit, range 30 ft. to 60 ft., one creature. Hit: The target is restrained by webbing. As an action, the restrained target can make a Strength check, bursting the webbing on a success. The webbing can also be attacked and destroyed (AC 10; hp 5; vulnerability to fire damage; immunity to bludgeoning, poison, and psychic damage).'),
	(newid(),'Web Sense','','While in contact with a web, the monster knows the exact location of any other creature in contact with the same web.'),
	(newid(),'Web Walker','','The monster ignores movement restrictions caused by webbing.'),
	(newid(),'Wounded Fury','Increase the monster''s damager for 1 round by the amount noted in the trait','While it has 10 hit points or fewer, the monster has advantage on attack rolls. In addition, it deals extra damage to any target it hits with a melee attack.')

declare @size_dice table
(
	name_size nvarchar(max),
	die nvarchar(max)
)

insert into @size_dice (
	name_size,
	die
)
values
	('Tiny','d4'),
	('Small','d6'),
	('Medium','d8'),
	('Large','d10'),
	('Huge','d12'),
	('Gargantuan','d20')
	
insert into com_Size (
	guid_Size,
	name_Size,
	guid_Die
)
select 
	newid(),
	sd.name_size,
	dd.guid_Die
from dice_Dice dd
join @size_dice sd
	on dd.name_Die = sd.die

-- Damage Resistance/Immunity	
insert into com_ProtectionFromDamage (
	guid_Protection,
	name_Protection
)
values 
	(newid(),'Resistance'),
	(newid(), 'Immunity')

declare @temp_res_immune table
(
	cr nvarchar(3),
	modifier float,
	res_type nvarchar(max)
)

insert into @temp_res_immune (
	cr,
	modifier,
	res_type
)
values
	('1/8',2,'Resistance'),
	('1/4',2,'Resistance'),
	('1/2',2,'Resistance'),
	('1',2,'Resistance'),
	('2',2,'Resistance'),
	('3',2,'Resistance'),
	('4',2,'Resistance'),
	('5',1.5,'Resistance'),
	('6',1.5,'Resistance'),
	('7',1.5,'Resistance'),
	('8',1.5,'Resistance'),
	('9',1.5,'Resistance'),
	('10',1.5,'Resistance'),
	('11',1.25,'Resistance'),
	('12',1.25,'Resistance'),
	('13',1.25,'Resistance'),
	('14',1.25,'Resistance'),
	('15',1.25,'Resistance'),
	('16',1.25,'Resistance'),
	('17',1,'Resistance'),
	('18',1,'Resistance'),
	('19',1,'Resistance'),
	('20',1,'Resistance'),
	('21',1,'Resistance'),
	('22',1,'Resistance'),
	('23',1,'Resistance'),
	('24',1,'Resistance'),
	('25',1,'Resistance'),
	('26',1,'Resistance'),
	('27',1,'Resistance'),
	('28',1,'Resistance'),
	('29',1,'Resistance'),
	('30',1,'Resistance'),
	('1/8',2,'Immunity'),
	('1/4',2,'Immunity'),
	('1/2',2,'Immunity'),
	('1',2,'Immunity'),
	('2',2,'Immunity'),
	('3',2,'Immunity'),
	('4',2,'Immunity'),
	('5',2,'Immunity'),
	('6',2,'Immunity'),
	('7',2,'Immunity'),
	('8',2,'Immunity'),
	('9',2,'Immunity'),
	('10',2,'Immunity'),
	('11',1.5,'Immunity'),
	('12',1.5,'Immunity'),
	('13',1.5,'Immunity'),
	('14',1.5,'Immunity'),
	('15',1.5,'Immunity'),
	('16',1.5,'Immunity'),
	('17',1.25,'Immunity'),
	('18',1.25,'Immunity'),
	('19',1.25,'Immunity'),
	('20',1.25,'Immunity'),
	('21',1.25,'Immunity'),
	('22',1.25,'Immunity'),
	('23',1.25,'Immunity'),
	('24',1.25,'Immunity'),
	('25',1.25,'Immunity'),
	('26',1.25,'Immunity'),
	('27',1.25,'Immunity'),
	('28',1.25,'Immunity'),
	('29',1.25,'Immunity'),
	('30',1.25,'Immunity')

insert into hp_Protection_CR_Modifier (
	guid_CR,
	guid_Protection,
	effective_HPModifier
)
select 
	cr.guid_CR,
	prot.guid_Protection,
	res.modifier
from @temp_res_immune res
join com_CR cr
	on res.cr = cr.name_CR
join com_ProtectionFromDamage prot
	on prot.name_Protection = res.res_type

--stats by CR
declare @stats_by_CR table (	
	cr nvarchar(5),
	prof int,
	ac int,
	min_hp int,
	max_hp int,
	attack int,
	save_dc int,
	min_damage int,
	max_damage int
)

insert into @stats_by_CR (
	cr,
	prof,
	ac,
	min_hp,
	max_hp,
	attack,
	save_dc,
	min_damage,
	max_damage
)
values
	('0',2,13,1,6,3,13,0,1),
	('1/8',2,13,7,36,3,13,2,3),
	('1/4',2,13,36,49,3,13,4,5),
	('1/2',2,13,50,70,3,13,6,8),
	('1',2,13,71,85,3,13,9,14),
	('2',2,13,86,100,3,13,15,20),
	('3',2,13,101,115,4,13,21,26),
	('4',2,14,116,130,5,14,27,32),
	('5',3,15,131,145,6,15,33,38),
	('6',3,15,146,160,6,15,39,44),
	('7',3,15,161,175,6,15,45,50),
	('8',3,16,176,190,7,16,51,56),
	('9',4,16,191,205,7,16,57,62),
	('10',4,17,206,220,7,17,63,68),
	('11',4,17,221,235,8,17,69,74),
	('12',4,17,236,250,8,17,75,80),
	('13',5,18,251,265,8,18,81,86),
	('14',5,18,266,280,8,18,87,92),
	('15',5,18,281,295,8,18,93,98),
	('16',5,18,296,310,9,18,99,04),
	('17',6,19,311,325,10,19,105,110),
	('18',6,19,326,340,10,19,111,116),
	('19',6,19,341,355,10,19,117,122),
	('20',6,19,356,400,10,19,123,140),
	('21',7,19,401,445,11,20,141,158),
	('22',7,19,446,490,11,20,159,176),
	('23',7,19,491,535,11,20,177,194),
	('24',7,19,536,580,12,21,195,212),
	('25',8,19,581,625,12,21,213,230),
	('26',8,19,626,670,12,21,231,248),
	('27',8,19,671,715,13,22,249,266),
	('28',8,19,716,760,13,22,267,284),
	('29',9,19,761,805,13,22,285,302),
	('30',9,19,806,860,14,23,303,320)

insert into core_lu_CR_Proficiency (
	guid_CR,
	proficiency_bonus
)
select 
	cr.guid_CR,
	temp_cr.prof
from @stats_by_CR temp_cr
join com_CR cr 
	on temp_cr.cr = cr.name_CR

insert into core_lu_Defensive_Values (
	guid_CR,
	AC, 
	minimum_HP, 
	maximum_HP
)
select 
	cr.guid_CR,
	temp_cr.ac,
	temp_cr.min_hp,
	temp_cr.max_hp
from @stats_by_CR temp_cr
join com_CR cr 
	on temp_cr.cr = cr.name_CR

insert into core_lu_Offensive_Values (
	guid_CR, 
	attack_bonus, 
	save_DC, 
	minimum_damage, 
	maximum_damage
)
select 
	cr.guid_CR,
	temp_cr.attack,
	temp_cr.save_dc,
	temp_cr.min_damage,
	temp_cr.max_damage
from @stats_by_CR temp_cr
join com_CR cr 
	on temp_cr.cr = cr.name_CR

print 'Weapons'

insert into weap_lu_SkillRequired (
	guid_Skill,
	name_SkillLevel
)
values 
	(newid(), 'Simple'),
	(newid(), 'Martial') 

insert into weap_lu_WeaponReach (
	guid_Reach,
	name_Reach
)
values 
	(newid(), 'Melee'),
	(newid(), 'Ranged') 

insert into weap_lu_WeaponType (
	guid_WeaponType,
	guid_Reach,
	guid_Skill,
	name_weaponType
)
select 
	newid(),
	reach.guid_Reach,
	skill.guid_Skill,
	skill.name_SkillLevel + ' ' + reach.name_Reach
from weap_lu_WeaponReach reach
join weap_lu_SkillRequired skill
	on 1 = 1

-- All the weapons
declare @weapons table
(
	guid_weapon uniqueidentifier,
	name_weapon nvarchar(max),
	damage_Type nvarchar(max),
	weapon_type nvarchar(max),
	Traits nvarchar(max),
	die nvarchar(max),
	number_of_dice nvarchar(max)
)

insert into @weapons (
	guid_weapon,
	name_weapon,
	damage_Type,
	weapon_type,
	Traits,
	die,
	number_of_dice
)
values
	(newid(),'Battleaxe','slashing','Martial Melee','Versitile (1d10)','d8', 1),
	(newid(),'Flail','bludgeoning','Martial Melee',null,'d8', 1),
	(newid(),'Glaive','slashing','Martial Melee','Heavy, Reach, Two-handed','d10', 1),
	(newid(),'Greataxe','slashing','Martial Melee','Heavy, Two-handed','d12', 1),
	(newid(),'Greatsword','slashing','Martial Melee','Heavy, Two-handed','d6', 2),
	(newid(),'Halberd','slashing','Martial Melee','Heavy, Reach, Two-handed','d10', 1),
	(newid(),'Lance','piercing','Martial Melee','Reach, Special','d12', 1),
	(newid(),'Longsword','slashing','Martial Melee','Versitile (1d10)','d8', 1),
	(newid(),'Maul','bludgeoning','Martial Melee','Heavy, Two-handed','d6', 2),
	(newid(),'Morningstar','piercing','Martial Melee',null,'d8', 1),
	(newid(),'Pike','piercing','Martial Melee','Heavy, Reach, Two-handed','d10', 1),
	(newid(),'Rapier','piercing','Martial Melee','Finesse','d8', 1),
	(newid(),'Scimitar','slashing','Martial Melee','Finesse, Light','d6', 1),
	(newid(),'Shortsword','piercing','Martial Melee','Finesse, Light','d6', 1),
	(newid(),'Trident','piercing','Martial Melee','Thrown (range 20/60), Versitile (1d8)','d6', 1),
	(newid(),'War Pick','piercing','Martial Melee',null,'d8', 1),
	(newid(),'Warhammer','bludgeoning','Martial Melee','Versitile (1d10)','d8', 1),
	(newid(),'Whip','slashing','Martial Melee','Finesse, Reach','d4', 1),
	(newid(),'Blowgun','piercing','Martial ranged','Ammunition (range 25/100), Loading','d1', 1),
	(newid(),'Crossbow, hand','piercing','Martial ranged','Ammunition (range 30/120), Light, Loading','d6', 1),
	(newid(),'Crossbow, heavy','piercing','Martial ranged','Ammunition (range 100/400), heavy, Loading, Two-handed','d10', 1),
	(newid(),'Longbow','piercing','Martial ranged','Ammunition (range 150/600), heavy, Two-handed','d8', 1),
	(newid(),'Net','0','Martial ranged','Special, Thrown (range 5/15)','d0', 0),
	(newid(),'Club','bludgeoning','Simple Melee','Light','d4', 1),
	(newid(),'Dagger','piercing','Simple Melee','Finesse, Light, Thrown (range 20/60)','d4', 1),
	(newid(),'Greatclub','bludgeoning','Simple Melee','Two-handed','d8', 1),
	(newid(),'Handaxe','slashing','Simple Melee','Light, Thrown (range 20/60)','d6', 1),
	(newid(),'Javelin','piercing','Simple Melee','Thrown (range 30/120)','d6', 1),
	(newid(),'Light Hammer','bludgeoning','Simple Melee','Light, Thrown (range 20/60)','d4', 1),
	(newid(),'Mace','bludgeoning','Simple Melee',null,'d6', 1),
	(newid(),'Quarterstaff','bludgeoning','Simple Melee','Versitile (1d8)','d6', 1),
	(newid(),'Sickle','slashing','Simple Melee','Light','d4', 1),
	(newid(),'Spear','piercing','Simple Melee','Thrown (range 20/60), Versitile (1d8)','d6', 1),
	(newid(),'Crossbow, Light','piercing','Simple ranged','Ammunition (range 80/320), Loading, Two-handed','d8', 1),
	(newid(),'Dart','piercing','Simple ranged','Finesse, Thrown (range 20/60)','d4', 1),
	(newid(),'Shortbow','piercing','Simple ranged','Ammunition (range 80/320), Two-handed','d6', 1),
	(newid(),'Sling','bludgeoning','Simple ranged','Ammunition (range 30/120)','d4', 1)


declare @weapon_abilityScores table
(
	guid_abilityScore uniqueidentifier,
	name_abilityScore nvarchar(max)
)	

insert into @weapon_abilityScores (
	guid_abilityScore,
	name_abilityScore
)
select 
	guid_AbilityScore,
	name_AbilityScore
from com_AbilityScore
where name_AbilityScore in ('Strength', 'Dexterity')

while (select count(*) from @weapons) > 0
begin

	declare @current_weapon nvarchar(max) = (
		select top 1
			name_weapon
		from @weapons
	)

	declare @weapon_traits table 
	(
		guid_trait uniqueidentifier,
		name_trait nvarchar(50)
	)

	insert into @weapon_traits (
		name_trait
	)
	select rtrim(ltrim(value))
	from string_split (
		(
			select 
				Traits
			from @weapons
			where name_weapon = @current_weapon
		), ','
	)

	update t_wt
		set guid_trait = case
							when wt.guid_trait is null then newid()
							else wt.guid_Trait
						 end
	from @weapon_traits t_wt
	left join weap_lu_WeaponTrait wt
		on t_wt.name_trait = wt.name_Trait

	insert into weap_lu_WeaponTrait (
		guid_Trait,
		name_Trait
	)
	select 
		t_wt.guid_trait,
		t_wt.name_trait
	from @weapon_traits t_wt
	left join weap_lu_WeaponTrait wt
		on t_wt.guid_trait = wt.guid_Trait
	where wt.guid_Trait is null

	insert into weap_Weapon (
		guid_Weapon,
		name_weapon, 
		number_DamageDice, 
		guid_Die, 
		guid_DamageType, 
		guid_WeaponType
	)
	select
		w.guid_weapon,
		w.name_weapon,
		w.number_of_dice,
		d.guid_Die,
		dt.guid_DamageType,
		wt.guid_WeaponType
	from @weapons w
	left join weap_lu_DamageType dt
		on w.damage_Type = dt.name_DamageType
	join weap_lu_WeaponType wt
		on wt.name_weaponType = w.weapon_type
	left join dice_Dice d
		on d.name_Die = w.die
	where w.name_weapon = @current_weapon

	insert into weap_rl_Weapon_WeaponTrait (
		guid_Weapon,
		guid_Trait
	)
	select
		w.guid_weapon,
		wt.guid_trait
	from @weapons w
	join @weapon_traits wt
		on 1 = 1
	where w.name_weapon = @current_weapon
		and w.Traits is not null

	if exists (
		select top 1
			name_trait
		from @weapon_traits
		where name_trait like 'Ammunition%'
			or name_trait = 'Finesse'
	)
	begin
	
		insert into weap_rl_weapon_abilityScore (
			guid_weapon,
			guid_abilityScore
		)
		select
			w.guid_weapon,
			wab.guid_abilityScore
		from weap_Weapon w		
		join @weapon_abilityScores wab
			on 1 = 1
		where w.name_weapon = @current_weapon
			and wab.name_abilityScore = 'Dexterity'

	end

	if not exists (
		select top 1
			name_trait
		from @weapon_traits
		where name_trait like 'Ammunition%'
	)
	begin
	
		insert into weap_rl_weapon_abilityScore (
			guid_weapon,
			guid_abilityScore
		)
		select
			w.guid_weapon,
			wab.guid_abilityScore
		from weap_Weapon w		
		join @weapon_abilityScores wab
			on 1 = 1
		where w.name_weapon = @current_weapon
			and wab.name_abilityScore = 'Strength'

	end

	delete from @weapons 
	where name_weapon = @current_weapon

	delete @weapon_traits

end
print 'End of Weapon loop'

insert into weap_lu_Size_WeaponDice (
	guid_Size,
	die_Multiplier
)
select 
	guid_size,
	case 
		when name_size in ('Tiny','Small','Medium') then 1
		when name_size = 'Large' then 2
		when name_size = 'Huge' then 3
		when name_size = 'Gargantuan' then 4
	end as die_multiplier
from com_Size

declare @skill_abl table
(
	name_skill nvarchar(max),
	name_ability nvarchar(max)
)

insert into @skill_abl (
	name_ability,
	name_skill
	
)
values
	('Strength','Athletics'),
	('Dexterity','Acrobatics'),
	('Dexterity','Sleight of Hand'),
	('Dexterity','Stealth'),
	('Intelligence','Arcana'),
	('Intelligence','History'),
	('Intelligence','Investigation'),
	('Intelligence','Nature'),
	('Intelligence','Religion'),
	('Wisdom','Animal Handling'),
	('Wisdom','Insight'),
	('Wisdom','Medicine'),
	('Wisdom','Perception'),
	('Wisdom','Survival'),
	('Charisma','Deception'),
	('Charisma','Intimidation'),
	('Charisma','Performance'),
	('Charisma','Persuasion')

insert into com_rl_AbilityScore_Skill (
	guid_AbilityScore,
	guid_skill
)
select 
	abl.guid_AbilityScore,
	sk.guid_skill
from com_AbilityScore abl
join @skill_abl sabl
	on sabl.name_ability = abl.name_AbilityScore
join com_lu_Skill sk
	on sabl.name_skill = sk.name_Skill

insert into com_lu_movement (
	guid_movement,
	name_movement
)
values
	(newid(),'Walking'),
	(newid(),'Swimming'),
	(newid(),'Flying'),
	(newid(),'Climbing'),
	(newid(),'Burrowing')

insert into com_lu_Senses (
	guid_Sense,
	name_Sense
)
values
	(newid(),'Blindsight'),
	(newid(),'Darkvision'),
	(newid(),'Tremorsense'),
	(newid(),'Truesight')


rollback transaction	