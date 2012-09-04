---------------------------------------------------------------------------------------------
-- AddOn Name: AsphyxiaUI 6.0.0
-- License: MIT
-- Author: Sinaris @ Das Syndikat, Vaecia @ Blackmoore
-- Description: AsphyxiaUI, Editied Tukui Layout
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

S.ChannelTicks = {
	-- Druid
	[GetSpellInfo( 44203 )] = 4,
	[GetSpellInfo( 16914 )] = 10,
	[GetSpellInfo( 106996 )] = 10,

	-- Mage
	[GetSpellInfo( 5143 )] = 5,
	[GetSpellInfo( 10 )] = 8,
	[GetSpellInfo( 12051 )] = 4,

	-- Monk
	[GetSpellInfo( 115175 )] = 9,

	-- Priest
	[GetSpellInfo( 15407 )] = 3,
	[GetSpellInfo( 48045 )] = 5,
	[GetSpellInfo( 47540 )] = 2,
	[GetSpellInfo( 64901 )] = 4,
	[GetSpellInfo( 64843 )] = 4,

	-- Warlock
	[GetSpellInfo( 689 )] = 6,
	[GetSpellInfo( 108371 )] = 6,
	[GetSpellInfo( 1120 )] = 6,
	[GetSpellInfo( 755 )] = 6,
	[GetSpellInfo( 1949 )] = 15,
	[GetSpellInfo( 5740 )] = 4,
	[GetSpellInfo( 103103 )] = 3,
}

S.HastedChannelTicks = {
	[GetSpellInfo( 64901 )] = true,
	[GetSpellInfo( 64843 )] = true,
	[GetSpellInfo( 1120 )] = true,
}