---------------------------------------------------------------------------------------------
-- AsphyxiaUI
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

local function SpellName( id )
	local name, _, _, _, _, _, _, _, _ = GetSpellInfo( id )
	if( not name ) then
		print( 'SpellID is not valid!' )
		return 'Impale'
	else
		return name
	end
end

S.ChannelTicks = {
	--Warlock
	[SpellName( 1120 )] = 5, --"Drain Soul"
	[SpellName( 689 )] = 3, -- "Drain Life"
	[SpellName( 5740 )] = 4, -- "Rain of Fire"
	[SpellName( 755 )] = 3, -- Health Funnel
	--Druid
	[SpellName( 44203 )] = 4, -- "Tranquility"
	[SpellName( 16914 )] = 10, -- "Hurricane"
	--Priest
	[SpellName( 15407 )] = 3, -- "Mind Flay"
	[SpellName( 48045 )] = 5, -- "Mind Sear"
	[SpellName( 47540 )] = 2, -- "Penance"
	[SpellName( 64901 )] = 4, -- Hymn of Hope
	[SpellName( 64843 )] = 4, -- Divine Hymn
	--Mage
	[SpellName( 5143 )] = 5, -- "Arcane Missiles"
	[SpellName( 10 )] = 5, -- "Blizzard"
	[SpellName( 12051 )] = 4, -- "Evocation"
}

--Spells Effected By Haste
S.HastedChannelTicks = {
	[SpellName( 64901 )] = true, -- Hymn of Hope
	[SpellName( 64843 )] = true, -- Divine Hymn
	[SpellName( 1120 )] = true, -- Drain Soul
}