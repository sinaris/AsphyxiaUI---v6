---------------------------------------------------------------------------------------------
-- AddOn Name: AsphyxiaUI 6.0.0
-- License: MIT
-- Author: Sinaris @ Das Syndikat, Vaecia @ Blackmoore
-- Description: AsphyxiaUI, Editied Tukui Layout
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["global"]["globalstyle"] ~= "asphyxia" ) then return end

------------------------------
-- Actionbars - Panels
------------------------------
G.ActionBars.Bar1:ClearAllPoints()
G.ActionBars.Bar1:Size( ( S.buttonsize * 12 ) + ( S.buttonspacing * 13 ) + 2, ( S.buttonsize * 2 ) + ( S.buttonspacing * 3 ) + 2 )
G.ActionBars.Bar1:Point( "BOTTOM", UIParent, "BOTTOM", 0, 48 )
G.ActionBars.Bar1:SetTemplate( "Transparent" )
G.ActionBars.Bar1:CreateShadow( "Default" )
G.ActionBars.Bar1:SetFrameStrata("BACKGROUND")
G.ActionBars.Bar1:SetFrameLevel( 1 )

G.ActionBars.Bar2:StripTextures()
G.ActionBars.Bar2:ClearAllPoints()
G.ActionBars.Bar2:SetAllPoints( G.ActionBars.Bar1 )

G.ActionBars.Bar3:StripTextures()
G.ActionBars.Bar3:ClearAllPoints()
G.ActionBars.Bar3:SetAllPoints( G.ActionBars.Bar1 )

G.ActionBars.Bar4:StripTextures()
G.ActionBars.Bar4:ClearAllPoints()
G.ActionBars.Bar4:SetAllPoints( G.ActionBars.Bar1 )

local AsphyxiaUISplitBarLeft = CreateFrame( "Frame", "AsphyxiaUISplitBarLeft", UIParent )
AsphyxiaUISplitBarLeft:Size( ( S.buttonsize * 3 ) + ( S.buttonspacing * 4 ) + 2, G.ActionBars.Bar1:GetHeight() )
AsphyxiaUISplitBarLeft:Point( "BOTTOMRIGHT", G.ActionBars.Bar1, "BOTTOMLEFT", -3, 0 )
AsphyxiaUISplitBarLeft:SetTemplate( "Transparent" )
AsphyxiaUISplitBarLeft:CreateShadow( "Default" )

local AsphyxiaUISplitBarRight = CreateFrame( "Frame", "AsphyxiaUISplitBarRight", UIParent )
AsphyxiaUISplitBarRight:Size( ( S.buttonsize * 3 ) + ( S.buttonspacing * 4 ) + 2, G.ActionBars.Bar1:GetHeight() )
AsphyxiaUISplitBarRight:Point( "BOTTOMLEFT", G.ActionBars.Bar1, "BOTTOMRIGHT", 3, 0 )
AsphyxiaUISplitBarRight:SetTemplate( "Transparent" )
AsphyxiaUISplitBarRight:CreateShadow( "Default" )

local AsphyxiaUIRightBar = CreateFrame( "Frame", "AsphyxiaUIRightBar", UIParent )
AsphyxiaUIRightBar:Size( ( S.buttonsize * 12 + S.buttonspacing * 13 ) + 2,  ( S.buttonsize * 12 + S.buttonspacing * 13 ) + 2 )
AsphyxiaUIRightBar:SetTemplate( "Transparent" )
AsphyxiaUIRightBar:Point( "BOTTOMRIGHT", G.Panels.RightChatBackground, "TOPRIGHT", 0, 3 )
AsphyxiaUIRightBar:CreateShadow( "Default" )
AsphyxiaUIRightBar:SetFrameStrata("BACKGROUND")
AsphyxiaUIRightBar:SetFrameLevel( 1 )

G.ActionBars.Pet:ClearAllPoints()
if( C["actionbar"]["vertical_rightbars"] == true ) then
	G.ActionBars.Pet:Size( ( S.petbuttonsize + S.buttonspacing * 2 ) + 2, ( S.petbuttonsize * NUM_PET_ACTION_SLOTS + S.buttonspacing * 11 ) + 2 )
else
	G.ActionBars.Pet:Size( ( S.petbuttonsize * NUM_PET_ACTION_SLOTS + S.buttonspacing * 11 ) + 2, ( S.petbuttonsize + S.buttonspacing * 2 ) + 2 )
end
G.ActionBars.Pet:Point( "BOTTOM", AsphyxiaUIRightBar, "TOP", 0, 3 )
G.ActionBars.Pet:SetTemplate( "Transparent" )
G.ActionBars.Pet:CreateShadow( "Default" )

------------------------------
-- Chat
------------------------------
G.Panels.LeftChatBackground:ClearAllPoints()
G.Panels.LeftChatBackground:Size( C["chat"]["width"], C["chat"]["height"] )
G.Panels.LeftChatBackground:Point( "BOTTOMLEFT", UIParent, "BOTTOMLEFT", 2, 2 )
G.Panels.LeftChatBackground:SetTemplate( "Transparent" )
G.Panels.LeftChatBackground:CreateShadow( "Default" )
G.Panels.LeftChatBackground:SetFrameLevel( 1 )
G.Panels.LeftChatBackground:SetFrameStrata( "BACKGROUND" )

G.Panels.RightChatBackground:ClearAllPoints()
G.Panels.RightChatBackground:Size( C["chat"]["width"], C["chat"]["height"] )
G.Panels.RightChatBackground:Point( "BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -2, 2 )
G.Panels.RightChatBackground:SetTemplate( "Transparent" )
G.Panels.RightChatBackground:CreateShadow( "Default" )
G.Panels.RightChatBackground:SetFrameLevel( 1 )
G.Panels.RightChatBackground:SetFrameStrata( "BACKGROUND" )

G.Panels.LeftChatTabsBackground:ClearAllPoints()
G.Panels.LeftChatTabsBackground:Size( G.Panels.LeftChatBackground:GetWidth() - 10, 23 )
G.Panels.LeftChatTabsBackground:Point( "TOP", G.Panels.LeftChatBackground, "TOP", 0, -5 )
G.Panels.LeftChatTabsBackground:SetTemplate( "Transparent" )
G.Panels.LeftChatTabsBackground:CreateOverlay( AsphyxiaUILeftChatTab )
G.Panels.LeftChatTabsBackground:SetFrameLevel( 2 )
G.Panels.LeftChatTabsBackground:SetFrameStrata( "BACKGROUND" )

G.Panels.RightChatTabsBackground:ClearAllPoints()
G.Panels.RightChatTabsBackground:Size( G.Panels.RightChatBackground:GetWidth() - 10, 23 )
G.Panels.RightChatTabsBackground:Point( "TOP", G.Panels.RightChatBackground, "TOP", 0, -5 )
G.Panels.RightChatTabsBackground:SetTemplate( "Transparent" )
G.Panels.RightChatTabsBackground:CreateOverlay( AsphyxiaUILeftChatTab )
G.Panels.RightChatTabsBackground:SetFrameLevel( 2 )
G.Panels.RightChatTabsBackground:SetFrameStrata( "BACKGROUND" )

------------------------------
-- Datatext Panels
------------------------------
G.Panels.DataTextLeft:ClearAllPoints()
G.Panels.DataTextLeft:Size( G.Panels.LeftChatBackground:GetWidth() - 10, 23 )
G.Panels.DataTextLeft:Point( "BOTTOM", G.Panels.LeftChatBackground, "BOTTOM", 0, 5 )
G.Panels.DataTextLeft:SetTemplate( "Transparent" )
G.Panels.DataTextLeft:CreateOverlay( G.Panels.DataTextLeft )

G.Panels.DataTextRight:ClearAllPoints()
G.Panels.DataTextRight:Size( G.Panels.RightChatBackground:GetWidth() - 10, 23 )
G.Panels.DataTextRight:Point( "BOTTOM", G.Panels.RightChatBackground, "BOTTOM", 0, 5 )
G.Panels.DataTextRight:SetTemplate( "Transparent" )
G.Panels.DataTextRight:CreateOverlay( G.Panels.DataTextRight )

local AsphyxiaUIInfoCenter = CreateFrame( "Frame", "AsphyxiaUIInfoCenter", G.ActionBars.Bar1 )
AsphyxiaUIInfoCenter:Size( ( S.buttonsize * 12 ) + ( S.buttonspacing * 13 ) + 2, 20 )
AsphyxiaUIInfoCenter:Point( "TOP", G.ActionBars.Bar1, "BOTTOM", 0, -3 )
AsphyxiaUIInfoCenter:SetTemplate( "Default" )
AsphyxiaUIInfoCenter:CreateShadow( "Default" )
AsphyxiaUIInfoCenter:SetFrameLevel( 2 )
AsphyxiaUIInfoCenter:SetFrameStrata( "BACKGROUND" )
AsphyxiaUIInfoCenter:CreateOverlay( AsphyxiaUIInfoCenter )

local AsphyxiaUIInfoCenterLeft = CreateFrame( "Frame", "AsphyxiaUIInfoCenterLeft", AsphyxiaUISplitBarLeft )
AsphyxiaUIInfoCenterLeft:Size( ( S.buttonsize * 3 ) + ( S.buttonspacing * 4 ) + 2, 20 )
AsphyxiaUIInfoCenterLeft:Point( "RIGHT", AsphyxiaUIInfoCenter, "LEFT", -3, 0 )
AsphyxiaUIInfoCenterLeft:SetTemplate( "Default" )
AsphyxiaUIInfoCenterLeft:CreateShadow( "Default" )
AsphyxiaUIInfoCenterLeft:SetFrameLevel( 2 )
AsphyxiaUIInfoCenterLeft:SetFrameStrata( "BACKGROUND" )
AsphyxiaUIInfoCenterLeft:CreateOverlay( AsphyxiaUIInfoCenterLeft )

local AsphyxiaUIInfoCenterRight = CreateFrame( "Frame", "AsphyxiaUIInfoCenterRight", AsphyxiaUISplitBarRight )
AsphyxiaUIInfoCenterRight:Size( ( S.buttonsize * 3 ) + ( S.buttonspacing * 4 ) + 2, 20 )
AsphyxiaUIInfoCenterRight:Point( "LEFT", AsphyxiaUIInfoCenter, "RIGHT", 3, 0 )
AsphyxiaUIInfoCenterRight:SetTemplate( "Default" )
AsphyxiaUIInfoCenterRight:CreateShadow( "Default" )
AsphyxiaUIInfoCenterRight:SetFrameLevel( 2 )
AsphyxiaUIInfoCenterRight:SetFrameStrata( "BACKGROUND" )
AsphyxiaUIInfoCenterRight:CreateOverlay( AsphyxiaUIInfoCenterRight )

local AsphyxiaUIInfoCenterToggleButton = CreateFrame( "Frame", "AsphyxiaUIInfoCenterToggleButton", TukuiChatBackgroundRight )
AsphyxiaUIInfoCenterToggleButton:Size( 30, 15 )
AsphyxiaUIInfoCenterToggleButton:SetPoint( "TOPRIGHT", TukuiChatBackgroundRight, "TOPRIGHT", -5, -68 )
AsphyxiaUIInfoCenterToggleButton:SetTemplate( "Default" )
AsphyxiaUIInfoCenterToggleButton:SetAlpha( 0 )
AsphyxiaUIInfoCenterToggleButton:SetFrameStrata( "MEDIUM" )
AsphyxiaUIInfoCenterToggleButton:SetFrameLevel( 10 )
AsphyxiaUIInfoCenterToggleButton:CreateOverlay( AsphyxiaUIInfoCenterToggleButton )
AsphyxiaUIInfoCenterToggleButton:EnableMouse( true )

AsphyxiaUIInfoCenterToggleButton.Text = AsphyxiaUIInfoCenterToggleButton:CreateFontString( nil, "OVERLAY" )
AsphyxiaUIInfoCenterToggleButton.Text:SetPoint( "CENTER" )
AsphyxiaUIInfoCenterToggleButton.Text:SetFont( unpack( S.FontTemplate.DatatextPanelsTglBtn.BuildFont ) )
AsphyxiaUIInfoCenterToggleButton.Text:SetText( "|cff9a1212-|r" )
AsphyxiaUIInfoCenterToggleButton.Text:Point( "CENTER", 0, 0 )

AsphyxiaUIInfoCenterToggleButton:SetScript( "OnMouseDown", function( self )
	ToggleFrame( AsphyxiaUIInfoCenterRight )
	ToggleFrame( AsphyxiaUIInfoCenterLeft )
	ToggleFrame( AsphyxiaUIInfoCenter )
	if( AsphyxiaUIInfoCenter:IsShown() ) then
		self.Text:SetText( "|cff9a1212-|r" )
	else
		self.Text:SetText( "|cff9a1212+|r" )
	end
end )

AsphyxiaUIInfoCenterToggleButton:SetScript( "OnEnter", function( self )
	if( InCombatLockdown() ) then return end
	AsphyxiaUIInfoCenterToggleButton:FadeIn()

	GameTooltip:ClearLines()
	GameTooltip:SetOwner( self )
	GameTooltip:AddLine( L.Gametooltip_SHOW_HIDE_DATAPANELS )
	GameTooltip:Show()
end )

AsphyxiaUIInfoCenterToggleButton:SetScript( "OnLeave", function( self )
	AsphyxiaUIInfoCenterToggleButton:FadeOut()

	GameTooltip:Hide()
end )

------------------------------
-- /resetui Button
------------------------------
local AsphyxiaUIResetUIButton = CreateFrame( "Button", "AsphyxiaUIResetUIButton", TukuiPetBattleHider, "SecureActionButtonTemplate" )
AsphyxiaUIResetUIButton:Size( 26, 20 )
AsphyxiaUIResetUIButton:Point( "BOTTOM", UIParent, "BOTTOM", -66, 2 )
AsphyxiaUIResetUIButton:SetTemplate( "Default" )
AsphyxiaUIResetUIButton:SetFrameStrata( "HIGH" )
AsphyxiaUIResetUIButton:CreateShadow( "Default" )
AsphyxiaUIResetUIButton:CreateOverlay( AsphyxiaUIResetUIButton )
AsphyxiaUIResetUIButton:SetAttribute( "type", "macro" )
AsphyxiaUIResetUIButton:SetAttribute( "macrotext", "/resetui" )

if( C["global"]["hovercp"] == true ) then
	AsphyxiaUIResetUIButton:SetAlpha( 0 )
	AsphyxiaUIResetUIButton:EnableMouse( true )
	AsphyxiaUIResetUIButton:SetScript( "OnEnter", function()
		if( InCombatLockdown() ) then return end
		AsphyxiaUIResetUIButton:FadeIn()
	end )

	AsphyxiaUIResetUIButton:SetScript( "OnLeave", function()
		AsphyxiaUIResetUIButton:FadeOut()
	end )
else
	AsphyxiaUIResetUIButton:HookScript( "OnEnter", S.SetModifiedBackdrop )
	AsphyxiaUIResetUIButton:HookScript( "OnLeave", S.SetOriginalBackdrop )
end

AsphyxiaUIResetUIButton.Text = S.SetFontString( AsphyxiaUIResetUIButton, unpack( S.FontTemplate.ButtonsResetUIBtn.BuildFont ) )
AsphyxiaUIResetUIButton.Text:Point( "CENTER", AsphyxiaUIResetUIButton, "CENTER", 0, 0 )
AsphyxiaUIResetUIButton.Text:SetText( S.RGBToHex( unpack( C["media"]["datatextcolor2"] ) ) .. "RS" )

------------------------------
-- /reloadui Button
------------------------------
local AsphyxiaUIReloadUIButton = CreateFrame( "Button", "AsphyxiaUIReloadUIButton", TukuiPetBattleHider, "SecureActionButtonTemplate" )
AsphyxiaUIReloadUIButton:Size( 26, 20 )
AsphyxiaUIReloadUIButton:Point( "BOTTOM", UIParent, "BOTTOM", 66, 2 )
AsphyxiaUIReloadUIButton:SetTemplate( "Default" )
AsphyxiaUIReloadUIButton:SetFrameStrata( "HIGH" )
AsphyxiaUIReloadUIButton:CreateShadow( "Default" )
AsphyxiaUIReloadUIButton:CreateOverlay( AsphyxiaUIReloadUIButton )
AsphyxiaUIReloadUIButton:SetAttribute( "type", "macro" )
AsphyxiaUIReloadUIButton:SetAttribute( "macrotext", "/rl" )

if( C["global"]["hovercp"] == true ) then
	AsphyxiaUIReloadUIButton:SetAlpha( 0 )
	AsphyxiaUIReloadUIButton:EnableMouse( true )
	AsphyxiaUIReloadUIButton:SetScript( "OnEnter", function()
		if( InCombatLockdown() ) then return end
		AsphyxiaUIReloadUIButton:FadeIn()
	end )

	AsphyxiaUIReloadUIButton:SetScript( "OnLeave", function()
		AsphyxiaUIReloadUIButton:FadeOut()
	end )
else
	AsphyxiaUIReloadUIButton:HookScript( "OnEnter", S.SetModifiedBackdrop )
	AsphyxiaUIReloadUIButton:HookScript( "OnLeave", S.SetOriginalBackdrop )
end

AsphyxiaUIReloadUIButton.Text = S.SetFontString( AsphyxiaUIReloadUIButton, unpack( S.FontTemplate.ButtonsReloadUIBtn.BuildFont ) )
AsphyxiaUIReloadUIButton.Text:Point( "CENTER", AsphyxiaUIReloadUIButton, "CENTER", 0, 0 )
AsphyxiaUIReloadUIButton.Text:SetText( S.RGBToHex( unpack( C["media"]["datatextcolor2"] ) ) .. "RL" )

------------------------------
-- Minimap
------------------------------
if( TukuiMinimap ) then
	local AsphyxiaUITimeWatch = CreateFrame( "Frame", "AsphyxiaUITimeWatch", Minimap )
	AsphyxiaUITimeWatch:Size( 55, 17 )
	AsphyxiaUITimeWatch:Point( "TOP", Minimap, "BOTTOM", 0, 8 )
	AsphyxiaUITimeWatch:SetTemplate( "Default" )
	AsphyxiaUITimeWatch:CreateShadow( "Default" )
	AsphyxiaUITimeWatch:CreateOverlay( AsphyxiaUITimeWatch )

	local AsphyxiaUIHelpButton = CreateFrame( "Frame", "AsphyxiaUIVersionframeButton", TukuiMinimap )
	AsphyxiaUIHelpButton:Size( 13, 17 )
	AsphyxiaUIHelpButton:SetPoint( "RIGHT", AsphyxiaUITimeWatch, "LEFT", -3, 0 )
	AsphyxiaUIHelpButton:SetTemplate( "Default" )
	AsphyxiaUIHelpButton:CreateShadow( "Default" )
	AsphyxiaUIHelpButton:CreateOverlay( AsphyxiaUIHelpButton )
	AsphyxiaUIHelpButton:SetFrameLevel( 4 )

	local AsphyxiaUIVersionframeButton = CreateFrame( "Frame", "AsphyxiaUIVersionframeButton", TukuiMinimap )
	AsphyxiaUIVersionframeButton:Size( 13, 17 )
	AsphyxiaUIVersionframeButton:SetPoint( "LEFT", AsphyxiaUITimeWatch, "RIGHT", 3, 0 )
	AsphyxiaUIVersionframeButton:SetTemplate( "Default" )
	AsphyxiaUIVersionframeButton:CreateShadow( "Default" )
	AsphyxiaUIVersionframeButton:CreateOverlay( AsphyxiaUIVersionframeButton )
	AsphyxiaUIVersionframeButton:SetFrameLevel( 4 )
end