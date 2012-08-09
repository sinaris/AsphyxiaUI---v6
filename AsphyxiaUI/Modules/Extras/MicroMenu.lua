---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["intmodules"]["micromenu"] ~= true ) then return end

local microbuttons = {
	"CharacterMicroButton",
	"SpellbookMicroButton",
	"TalentMicroButton",
	"AchievementMicroButton",
	"QuestLogMicroButton",
	"GuildMicroButton",
	"PVPMicroButton",
	"LFDMicroButton",
	"EJMicroButton",
	"CompanionsMicroButton",
	"MainMenuMicroButton",
	"HelpMicroButton",
}

local f = CreateFrame( "Frame", "MicroParent", UIParent )
MicroParent.shown = false
f:SetAlpha( 0 )

UpdateMicroButtonsParent( f )

local function CheckFade( self, elapsed )
	local mouseactive
	for i, button in pairs( microbuttons ) do
		local b = _G[button]
		if( b.mouseover == true ) then
			mouseactive = true
		end
	end

	if( MicroParent.mouseover == true ) then
		mouseactive = true
		if( GameTooltip:IsShown() ) then
			GameTooltip:Hide()
		end
	end

	if( mouseactive == true ) then
		if( MicroParent.shown ~= true ) then
			UIFrameFadeIn( MicroParent, 0.2 )
			MicroParent.shown = true
		end
	else
		if( MicroParent.shown == true ) then
			UIFrameFadeOut(MicroParent, 0.2)
			MicroParent.shown = false
		end
	end
end
f:SetScript( "OnUpdate", CheckFade )

for i, button in pairs( microbuttons ) do
	local m = _G[button]
	local pushed = m:GetPushedTexture()
	local normal = m:GetNormalTexture()
	local disabled = m:GetDisabledTexture()

	m:SetParent( MicroParent )
	m.SetParent = S.dummy
	_G[button .. "Flash"]:SetTexture( "" )
	m:SetHighlightTexture( "" )
	m.SetHighlightTexture = S.dummy

	local f = CreateFrame( "Frame", nil, m )
	f:SetFrameLevel( 1 )
	f:SetFrameStrata( "BACKGROUND" )
	f:SetPoint( "BOTTOMLEFT", m, "BOTTOMLEFT", 2, 0 )
	f:SetPoint( "TOPRIGHT", m, "TOPRIGHT", -2, -28 )
	m.frame = f

	pushed:SetTexCoord( 0.17, 0.87, 0.5, 0.908 )
	pushed:ClearAllPoints()
	pushed:SetPoint( "TOPLEFT", m.frame, "TOPLEFT", 2, -2 )
	pushed:SetPoint( "BOTTOMRIGHT", m.frame, "BOTTOMRIGHT", -2, 2 )

	normal:SetTexCoord( 0.17, 0.87, 0.5, 0.908 )
	normal:ClearAllPoints()
	normal:SetPoint( "TOPLEFT", m.frame, "TOPLEFT", 2, -2 )
	normal:SetPoint( "BOTTOMRIGHT", m.frame, "BOTTOMRIGHT", -2, 2 )

	if( disabled ) then
		disabled:SetTexCoord( 0.17, 0.87, 0.5, 0.908 )
		disabled:ClearAllPoints()
		disabled:SetPoint( "TOPLEFT", m.frame, "TOPLEFT", 2, -2 )
		disabled:SetPoint( "BOTTOMRIGHT", m.frame, "BOTTOMRIGHT", -2, 2 )
	end

	m.mouseover = false
	m:HookScript( "OnEnter", function( self ) self.mouseover = true end )
	m:HookScript( "OnLeave", function( self ) self.mouseover = false end )
end

do
	MicroButtonPortrait:ClearAllPoints()
	MicroButtonPortrait:SetPoint( "TOPLEFT", CharacterMicroButton.frame, "TOPLEFT", 2, -2 )
	MicroButtonPortrait:SetPoint( "BOTTOMRIGHT", CharacterMicroButton.frame, "BOTTOMRIGHT", -2, 2 )

	GuildMicroButtonTabard:ClearAllPoints()
	GuildMicroButtonTabard:SetPoint( "TOP", GuildMicroButton.frame, "TOP", 0, 25 )
	GuildMicroButtonTabard.SetPoint = S.dummy
	GuildMicroButtonTabard.ClearAllPoints = S.dummy
end

MicroParent:SetPoint( "TOP", UIParent, "TOP", 0, -40 )
MicroParent:SetWidth( ( ( CharacterMicroButton:GetWidth() + 4 ) * 9 ) + 12 )
MicroParent:SetHeight( CharacterMicroButton:GetHeight() - 28 )

CharacterMicroButton:ClearAllPoints()
CharacterMicroButton:SetPoint( "BOTTOMLEFT", MicroParent, "BOTTOMLEFT", -2,  0 )
CharacterMicroButton.SetPoint = S.dummy
CharacterMicroButton.ClearAllPoints = S.dummy

local bg = CreateFrame( "Frame", "TukuiMicrobarBG", MicroParent )
bg:Size( MicroParent:GetWidth() + 9, MicroParent:GetHeight() + 10 )
bg:SetPoint( "CENTER", MicroParent, "CENTER", 0, 0 )
bg:SetTemplate( "Default" )