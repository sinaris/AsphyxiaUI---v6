---------------------------------------------------------------------------------------------
-- AddOn Name: AsphyxiaUI 6.0.0
-- License: MIT
-- Author: Sinaris @ Das Syndikat, Vaecia @ Blackmoore
-- Credits: All credits goes to the original Author: Allez
-- Description: AsphyxiaUI, Editied Tukui Layout
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["raidcooldowns"]["enable"] ~= true ) then return end

local spells = {
	[20484] = 600,
	[740] = 180,
	[64843] = 180,
	[20707] = 900,
	[64901] = 360,
	[29166] = 180,
	[31821] = 120,
	[47788] = 180,
	[33206] = 180,
	[61999] = 600,
	[16190] = 180,
	[98008] = 180,
	[115176] = 180,
}

local show = {
	party = C["raidcooldowns"]["showinparty"],
	raid = C["raidcooldowns"]["showinraid"],
	arena = C["raidcooldowns"]["showinarena"],
}

local filter = COMBATLOG_OBJECT_AFFILIATION_RAID + COMBATLOG_OBJECT_AFFILIATION_PARTY + COMBATLOG_OBJECT_AFFILIATION_MINE
local band = bit.band
local sformat = string.format
local floor = math.floor
local timer = 0

local backdrop = {
	bgFile = C["media"]["normTex"],
	edgeFile = C["media"]["blank"],
	tile = false,
	tileSize = 0,
	edgeSize = 1,
	insets = {
		top = 0,
		left = 0,
		bottom = 0,
		right = 0
	},
}

local bars = {}

local anchorframe = CreateFrame( "Frame", "RaidCD", UIParent )
anchorframe:SetSize( 200, 20 )
anchorframe:SetPoint( "LEFT", UIParent, "LEFT", 300, 200 )
anchorframe:SetTemplate( "Default" )
anchorframe:SetMovable( true )
anchorframe:SetBackdropBorderColor( 1, 0, 0 )
anchorframe.text = S.SetFontString( anchorframe, unpack( S.FontTemplate.MoverDefault.BuildFont ) )
anchorframe.text:SetPoint( "CENTER" )
anchorframe.text:SetText( "Move RaidCD" )
anchorframe:SetFrameLevel( 10 )
anchorframe:Hide()
tinsert( S.AllowFrameMoving, anchorframe )

local FormatTime = function( time )
	if( time >= 60 ) then
		return sformat( "%.2d:%.2d", floor( time / 60 ), time % 60 )
	else
		return sformat( "%.2d", time )
	end
end

local CreateFS = function( frame, fsize, fstyle )
	local fstring = frame:CreateFontString( nil, "OVERLAY" )
	fstring:SetFont( unpack( S.FontTemplate.SkinsDefault.BuildFont ) )
	fstring:SetShadowOffset( 1.25, -1.25 )
	return fstring
end

local UpdatePositions = function()
	for i = 1, #bars do
		bars[i]:ClearAllPoints()
		if( i == 1 ) then
			bars[i]:Point( "TOPLEFT", anchorframe, "BOTTOMLEFT", -2, -5 )
		else
			bars[i]:Point( "TOPLEFT", bars[i - 1], "BOTTOMLEFT", 0, -7 )
		end
		bars[i].id = i
	end
end

local StopTimer = function( bar )
	bar:SetScript( "OnUpdate", nil )
	bar:Hide()
	tremove( bars, bar.id )
	UpdatePositions()
end

local BarUpdate = function( self, elapsed )
	local curTime = GetTime()
	if( self.endTime < curTime ) then
		StopTimer( self )
		return
	end
	self.status:SetValue( 100 - ( curTime - self.startTime ) / ( self.endTime - self.startTime ) * 100 )
	self.right:SetText( FormatTime( self.endTime - curTime ) )
end

local OnEnter = function( self )
	GameTooltip:SetOwner( self, "ANCHOR_RIGHT" )
	GameTooltip:AddDoubleLine( self.spell, self.right:GetText() )
	GameTooltip:SetClampedToScreen( true )
	GameTooltip:Show()
end

local OnLeave = function( self )
	GameTooltip:Hide()
end

local OnMouseDown = function( self, button )
	if( button == "LeftButton" ) then
		if( IsInRaid() ) then
			SendChatMessage( sformat( "Cooldown - %s [%s] %s", self.left:GetText(), self.spell, self.right:GetText() ), "RAID" )
		elseif( IsInGroup() ) then
			SendChatMessage( sformat( "Cooldown - %s [%s] %s", self.left:GetText(), self.spell, self.right:GetText() ), "PARTY" )
		else
			SendChatMessage( sformat( "Cooldown - %s [%s] %s", self.left:GetText(), self.spell, self.right:GetText() ), "SAY" )
		end
	elseif( button == "RightButton" ) then
		StopTimer( self )
	end
end

local CreateBar = function()
	local bar = CreateFrame( "Statusbar", nil, UIParent )
	bar:SetSize( 200, 20 )
	bar:SetFrameStrata( "LOW" )

	bar.bg = bar:CreateTexture( nil, "BACKGROUND" )
	bar.bg:SetAllPoints( bar )
	bar.bg:SetTexture( C["media"]["normTex"] )

	bar.icon = CreateFrame( "Button", nil, bar )
	bar.icon:Size( 20 )
	bar.icon:SetPoint( "BOTTOMRIGHT", bar, "BOTTOMLEFT", 0, 0 )
	bar.icon:CreateBackdrop( "Default" )
	bar.icon.backdrop:CreateShadow( "Default" )

	bar.status = CreateFrame( "Statusbar", nil, bar )
	bar.status:SetPoint( "BOTTOMLEFT", bar.icon, "BOTTOMRIGHT", 7, 0 )

	bar.status:SetPoint( "BOTTOMRIGHT", 0, 0 )
	bar.status:SetHeight( 20 )
	bar.status:SetStatusBarTexture( C["media"]["normTex"] )
	bar.status:SetMinMaxValues( 0, 100 )
	bar.status:SetFrameLevel( bar:GetFrameLevel() - 1 )
	bar.status:CreateBackdrop( "Default" )
	bar.status.backdrop:CreateShadow( "Default" )

	bar.left = CreateFS( bar )
	bar.left:SetPoint( "LEFT", bar.status, 3, 0 )
	bar.left:SetJustifyH( "LEFT" )

	bar.right = CreateFS( bar )
	bar.right:SetPoint( "RIGHT", bar.status, -2, 0 )
	bar.right:SetJustifyH( "RIGHT" )

	return bar
end	

local StartTimer = function( name, spellId )
	local spell, rank, icon = GetSpellInfo( spellId )
	for _, v in pairs( bars ) do
		if( v.name == name and v.spell == spell ) then
			return
		end
	end
	local bar = CreateBar()
	bar.endTime = GetTime() + spells[spellId]
	bar.startTime = GetTime()
	bar.left:SetText( name )
	bar.name = name
	bar.right:SetText( FormatTime( spells[spellId] ) )

	if( icon and bar.icon ) then
		bar.icon:SetNormalTexture( icon )
		bar.icon:GetNormalTexture():SetTexCoord( 0.1, 0.9, 0.1, 0.9 )
	end
	bar.spell = spell
	bar:Show()

	local color = RAID_CLASS_COLORS[select( 2, UnitClass( name ) )]
	bar.status:SetStatusBarColor( color.r, color.g, color.b )
	bar:SetStatusBarColor( color.r, color.g, color.b )
	bar.bg:SetVertexColor( 0.15, 0.15, 0.15, 0.25 )

	bar:EnableMouse( true )
	bar:SetScript( "OnUpdate", BarUpdate )
	bar:SetScript( "OnEnter", OnEnter )
	bar:SetScript( "OnLeave", OnLeave )
	bar:SetScript( "OnMouseDown", OnMouseDown )
	tinsert( bars, bar )
	UpdatePositions()
end

local OnEvent = function( self, event, ... )
	if( event == "COMBAT_LOG_EVENT_UNFILTERED" ) then
		local timestamp, eventType, _, sourceGUID, sourceName, sourceFlags = ...
		if( band( sourceFlags, filter ) == 0 ) then return end
		if( eventType == "SPELL_RESURRECT" or eventType == "SPELL_CAST_SUCCESS" or eventType == "SPELL_AURA_APPLIED" ) then
			local spellId = select( 12, ... )

			if( spells[spellId] and show[select( 2, IsInInstance() )] ) then
				StartTimer(sourceName, spellId)
			end
		end
	elseif( event == "ZONE_CHANGED_NEW_AREA" and select( 2, IsInInstance()) == "arena" ) then
		for k, v in pairs( bars ) do
			StopTimer( v )
		end
	end
end

local addon = CreateFrame( "frame" )
addon:SetScript( "OnEvent", OnEvent )
addon:RegisterEvent( "COMBAT_LOG_EVENT_UNFILTERED" )
addon:RegisterEvent( "ZONE_CHANGED_NEW_AREA" )

SlashCmdList["RaidCD"] = function( msg ) 
	StartTimer( UnitName( "player" ), 20484 )
	StartTimer( UnitName( "player" ), 20707 )
	StartTimer( UnitName( "player" ), 29166 )
	StartTimer( UnitName( "player" ), 115176 )
end
SLASH_RaidCD1 = "/raidcd"