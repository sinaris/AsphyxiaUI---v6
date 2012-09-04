---------------------------------------------------------------------------------------------
-- AddOn Name: AsphyxiaUI 6.0.0
-- License: MIT
-- Author: Sinaris @ Das Syndikat, Vaecia @ Blackmoore
-- Description: AsphyxiaUI, Editied Tukui Layout
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

local function SetCasterOnlyBuffs()
	Spell1Buff = {
		77747,
		109773,
		1459,
	}
	Spell2Buff = {
		24907,
		51470,
		49868,
	}
	Spell3Buff = {
		117667,
		1126,
		20217,
	}
	Spell4Buff = {
		469,
		6307,
		21562,
	}
	Spell5Buff = {
		116956,
		19740,
	}
	Spell6Buff = {
		1459,
		24932,
		116781,
	}
end

local function SetBuffs()
	Spell1Buff = {
		30809,
		113742,
		55610,
	}
	Spell2Buff = {
		1459,
		24932,
		116781,
	}
	Spell3Buff = {
		1126,
		20217,
		117667,
	}
	Spell4Buff = {
		469,
		6307,
		21562,
	}
	Spell5Buff = {
		116956,
		19740,
	}
	Spell6Buff = {
		19506,
		6673,
		57330,
	}
end

local function OnAuraChange( self, event, arg1, unit )
	if( event == "UNIT_AURA" and arg1 ~= "player" ) then 
		return
	end

	if( S.Role == "Caster" or S.Role == "Healer" ) then 
		SetCasterOnlyBuffs()
	else
		SetBuffs()
	end

	for i, Spell1Buff in pairs( Spell1Buff ) do
		local spellname = select(1, GetSpellInfo(Spell1Buff))
		if( UnitAura( "player", spellname ) ) then
			Spell1Frame:SetAlpha( 1 )
			Spell1Frame.t:SetTexture( select( 3, GetSpellInfo( Spell1Buff ) ) )
			Spell1Frame.id = Spell1Buff
			break
		else
			Spell1Frame:SetAlpha( 0.2 )
			Spell1Frame.t:SetTexture( select( 3, GetSpellInfo( Spell1Buff ) ) )
		end
		Spell1Frame.id = Spell1Buff
	end

	for i, Spell2Buff in pairs( Spell2Buff ) do
		local spellname = select( 1, GetSpellInfo( Spell2Buff ) )
		if( UnitAura( "player", spellname ) ) then
			Spell2Frame:SetAlpha( 1 )
			Spell2Frame.t:SetTexture( select( 3, GetSpellInfo( Spell2Buff ) ) )
			Spell2Frame.id = Spell2Buff
			break
		else
			Spell2Frame:SetAlpha( 0.2 )
			Spell2Frame.t:SetTexture( select( 3, GetSpellInfo( Spell2Buff ) ) )
		end
		Spell2Frame.id = Spell2Buff
	end

	for i, Spell3Buff in pairs( Spell3Buff ) do
		local spellname = select( 1, GetSpellInfo( Spell3Buff ) )
		if( UnitAura( "player", spellname ) ) then
			Spell3Frame:SetAlpha( 1 )
			Spell3Frame.t:SetTexture( select( 3, GetSpellInfo( Spell3Buff ) ) )
			Spell3Frame.id = Spell3Buff
			break
		else
			Spell3Frame:SetAlpha( 0.2 )
			Spell3Frame.t:SetTexture( select( 3, GetSpellInfo( Spell3Buff ) ) )
		end
		Spell3Frame.id = Spell3Buff
	end

	for i, Spell4Buff in pairs( Spell4Buff ) do
		local spellname = select( 1, GetSpellInfo( Spell4Buff ) )
		if( UnitAura( "player", spellname ) ) then
			Spell4Frame:SetAlpha( 1 )
			Spell4Frame.t:SetTexture( select( 3, GetSpellInfo( Spell4Buff ) ) )
			Spell4Frame.id = Spell4Buff
			break
		else
			Spell4Frame:SetAlpha( 0.2 )
			Spell4Frame.t:SetTexture( select( 3, GetSpellInfo( Spell4Buff ) ) )
			Spell4Frame.id = Spell4Buff
		end
	end

	for i, Spell5Buff in pairs( Spell5Buff ) do
		local spellname = select( 1, GetSpellInfo( Spell5Buff ) )
		if( UnitAura( "player", spellname ) ) then
			Spell5Frame:SetAlpha( 1 )
			Spell5Frame.t:SetTexture( select( 3, GetSpellInfo( Spell5Buff ) ) )
			Spell5Frame.id = Spell5Buff
			break
		else
			Spell5Frame:SetAlpha( 0.2 )
			Spell5Frame.t:SetTexture( select( 3, GetSpellInfo( Spell5Buff ) ) )
		end
		Spell5Frame.id = Spell5Buff
	end

	for i, Spell6Buff in pairs( Spell6Buff ) do
		local spellname = select( 1, GetSpellInfo( Spell6Buff ) )
		if( UnitAura( "player", spellname ) ) then
			Spell6Frame:SetAlpha( 1 )
			Spell6Frame.t:SetTexture( select( 3, GetSpellInfo( Spell6Buff ) ) )
			Spell6Frame.id = Spell6Buff
			break
		else
			Spell6Frame:SetAlpha( 0.2 )
			Spell6Frame.t:SetTexture( select( 3, GetSpellInfo( Spell6Buff ) ) )
		end
		Spell6Frame.id = Spell6Buff
	end
end

local RBRWidth = ( ( TukuiMinimap:GetWidth() - 6 ) / 6 ) + 4

local raidbuff_reminder = CreateFrame( "Frame", "RaidBuffReminder", Minimap )
raidbuff_reminder:SetTemplate( "TRansparent" )
raidbuff_reminder:Width( RBRWidth )
raidbuff_reminder:Point( "TOPLEFT", TukuiMinimap, "TOPRIGHT", 4, 0 )
raidbuff_reminder:Point( "BOTTOMLEFT", TukuiMinimap, "BOTTOMRIGHT", 4, 0 )
raidbuff_reminder:CreateShadow( "Default" )

raidbuff_reminder:RegisterEvent( "ACTIVE_TALENT_GROUP_CHANGED" )
raidbuff_reminder:RegisterEvent( "UNIT_INVENTORY_CHANGED" )
raidbuff_reminder:RegisterEvent( "UNIT_AURA" )
raidbuff_reminder:RegisterEvent( "PLAYER_REGEN_ENABLED" )
raidbuff_reminder:RegisterEvent( "PLAYER_REGEN_DISABLED" )
raidbuff_reminder:RegisterEvent( "PLAYER_ENTERING_WORLD" )
raidbuff_reminder:RegisterEvent( "UPDATE_BONUS_ACTIONBAR" )
raidbuff_reminder:RegisterEvent( "CHARACTER_POINTS_CHANGED" )
raidbuff_reminder:RegisterEvent( "ZONE_CHANGED_NEW_AREA" )
raidbuff_reminder:SetScript( "OnEvent", OnAuraChange )
raidbuff_reminder:SetScript( "OnMouseUp", microMenuGenerator )

local function CreateButton( name, relativeTo, firstbutton, lastbutton )
	local button = CreateFrame( "Button", name, RaidBuffReminder )
	button:SetTemplate( "Default" )
	button:Size( RBRWidth - 3 )
	if( firstbutton == true ) then
		button:Point( "TOP", relativeTo, "TOP", 0, -2 )
	else
		button:Point( "TOP", relativeTo, "BOTTOM", 0, -1 )
	end

	if( lastbutton == true ) then
		button:Point( "BOTTOM", RaidBuffReminder, "BOTTOM", 0, 2 )
	end

	button.t = button:CreateTexture( name .. ".t", "OVERLAY" )
	button.t:SetTexCoord( 0.08, 0.92, 0.08, 0.92 )
	button.t:Point( "TOPLEFT", 2, -2 )
	button.t:Point( "BOTTOMRIGHT", -2, 2 )
	button:SetScript( "OnMouseUp", microMenuGenerator )

	return button
end

do
	CreateButton( "Spell1Frame", RaidBuffReminder, true )
	CreateButton( "Spell2Frame", Spell1Frame, false )
	CreateButton( "Spell3Frame", Spell2Frame, false )
	CreateButton( "Spell4Frame", Spell3Frame, false )
	CreateButton( "Spell5Frame", Spell4Frame, false )
	CreateButton( "Spell6Frame", Spell5Frame, false, true )
end