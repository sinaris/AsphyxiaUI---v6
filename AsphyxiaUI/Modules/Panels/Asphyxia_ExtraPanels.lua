---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["global"]["panellayout"] ~= "asphyxia" ) then return end

------------------------------
-- Additional Panels
------------------------------
local AsphyxiaUIInfoCenter = CreateFrame( "Frame", "AsphyxiaUIInfoCenter", G.ActionBars.Bar1 )
AsphyxiaUIInfoCenter:CreatePanel( "Default", G.ActionBars.Bar1:GetWidth(), 20, "TOP", G.ActionBars.Bar1, "BOTTOM", 0, -3 )
AsphyxiaUIInfoCenter:CreateOverlay( AsphyxiaUIInfoCenter )
AsphyxiaUIInfoCenter:CreateShadow( "Default" )
AsphyxiaUIInfoCenter:SetFrameLevel( 2 )
AsphyxiaUIInfoCenter:SetFrameStrata( "BACKGROUND" )

local AsphyxiaUIInfoCenterLeft = CreateFrame( "Frame", "AsphyxiaUIInfoCenterLeft", TukuiSplitBarLeft )
AsphyxiaUIInfoCenterLeft:CreatePanel( "Default", TukuiSplitBarLeft:GetWidth(), 20, "TOP", TukuiSplitBarLeft, "BOTTOM", 0, -3 )
AsphyxiaUIInfoCenterLeft:CreateOverlay( AsphyxiaUIInfoCenterLeft )
AsphyxiaUIInfoCenterLeft:CreateShadow( "Default" )
AsphyxiaUIInfoCenterLeft:SetFrameLevel( 2 )
AsphyxiaUIInfoCenterLeft:SetFrameStrata( "BACKGROUND" )

local AsphyxiaUIInfoCenterRight = CreateFrame( "Frame", "AsphyxiaUIInfoCenterRight", TukuiSplitBarRight )
AsphyxiaUIInfoCenterRight:CreatePanel( "Default", TukuiSplitBarRight:GetWidth(), 20, "TOP", TukuiSplitBarRight, "BOTTOM", 0, -3 )
AsphyxiaUIInfoCenterRight:CreateOverlay( icenterright )
AsphyxiaUIInfoCenterRight:CreateShadow( "Default" )
AsphyxiaUIInfoCenterRight:SetFrameLevel( 2 )
AsphyxiaUIInfoCenterRight:SetFrameStrata( "BACKGROUND" )

local AsphyxiaUITimeWatch = CreateFrame( "Frame", "AsphyxiaUITimeWatch", Minimap )
AsphyxiaUITimeWatch:CreatePanel( "Default", 53, 17, "TOP", Minimap, "BOTTOM", S.Scale( 0 ), 8 )
AsphyxiaUITimeWatch:CreateShadow( "Default" )
AsphyxiaUITimeWatch:SetFrameStrata( "MEDIUM" )
AsphyxiaUITimeWatch:CreateOverlay( AsphyxiaUITimeWatch )
AsphyxiaUITimeWatch:SetFrameLevel( 2 )

------------------------------
-- Invisible Button
------------------------------
local AsphyxiaUIInvisButton = CreateFrame( "Frame", "AsphyxiaUIInvisButton", UIParent )
AsphyxiaUIInvisButton:CreatePanel( "Transparent", 100, 20, "BOTTOM", UIParent, "BOTTOM", 0, 2 )
AsphyxiaUIInvisButton:SetFrameLevel( 0 )
AsphyxiaUIInvisButton:SetAlpha( 0 )

------------------------------
-- FAQ Button
------------------------------
local AsphyxiaUIVersionButton = CreateFrame( "Button", "AsphyxiaUIVersionButton", UIParent, "SecureActionButtonTemplate" )
AsphyxiaUIVersionButton:CreatePanel( "Default", 26, 20, "RIGHT", AsphyxiaUIInvisButton, "LEFT", -3, 0 )
AsphyxiaUIVersionButton:CreateShadow( "Default" )
AsphyxiaUIVersionButton:CreateOverlay( AsphyxiaUIVersionButton )
AsphyxiaUIVersionButton:SetAttribute( "type", "macro" )
AsphyxiaUIVersionButton:SetAttribute( "macrotext", "/afaq" )
AsphyxiaUIVersionButton:HookScript( "OnEnter", S.SetModifiedBackdrop )
AsphyxiaUIVersionButton:HookScript( "OnLeave", S.SetOriginalBackdrop )

AsphyxiaUIVersionButton.Text = S.SetFontString( AsphyxiaUIVersionButton, S.CreateFontString() )
AsphyxiaUIVersionButton.Text:Point( "CENTER", AsphyxiaUIVersionButton, "CENTER", 1, 1 )
AsphyxiaUIVersionButton.Text:SetText( S.RGBToHex( unpack( C["media"]["datatextcolor2"] ) ) .. "FAQ" )

------------------------------
-- Help Button
------------------------------
local AsphyxiaUIHelpButton = CreateFrame( "Button", "AsphyxiaUIHelpButton", UIParent, "SecureActionButtonTemplate" )
AsphyxiaUIHelpButton:CreatePanel( "Default", 26, 20, "RIGHT", AsphyxiaUIVersionButton, "LEFT", -3, 0 )
AsphyxiaUIHelpButton:CreateShadow( "Default" )
AsphyxiaUIHelpButton:CreateOverlay( AsphyxiaUIHelpButton )
AsphyxiaUIHelpButton:SetAttribute( "type", "macro" )
AsphyxiaUIHelpButton:SetAttribute( "macrotext", "/ahelp" )
AsphyxiaUIHelpButton:HookScript( "OnEnter", S.SetModifiedBackdrop )
AsphyxiaUIHelpButton:HookScript( "OnLeave", S.SetOriginalBackdrop )

AsphyxiaUIHelpButton.Text = S.SetFontString( AsphyxiaUIHelpButton, S.CreateFontString() )
AsphyxiaUIHelpButton.Text:Point( "CENTER", AsphyxiaUIHelpButton, "CENTER", 1, 1 )
AsphyxiaUIHelpButton.Text:SetText( S.RGBToHex( unpack( C["media"]["datatextcolor2"] ) ) .. "Help" )

------------------------------
-- ReloadUI Button
------------------------------
local AsphyxiaUIReloadUIButton = CreateFrame( "Button", "AsphyxiaUIReloadUIButton", UIParent, "SecureActionButtonTemplate" )
AsphyxiaUIReloadUIButton:CreatePanel( "Default", 26, 20, "LEFT", AsphyxiaUIInvisButton, "RIGHT", 3, 0 )
AsphyxiaUIReloadUIButton:CreateShadow( "Default" )
AsphyxiaUIReloadUIButton:CreateOverlay( AsphyxiaUIReloadUIButton )
AsphyxiaUIReloadUIButton:SetAttribute( "type", "macro" )
AsphyxiaUIReloadUIButton:SetAttribute( "macrotext", "/rl" )
AsphyxiaUIReloadUIButton:HookScript( "OnEnter", S.SetModifiedBackdrop )
AsphyxiaUIReloadUIButton:HookScript( "OnLeave", S.SetOriginalBackdrop )

AsphyxiaUIReloadUIButton.Text = S.SetFontString( AsphyxiaUIReloadUIButton, S.CreateFontString() )
AsphyxiaUIReloadUIButton.Text:Point( "CENTER", AsphyxiaUIReloadUIButton, "CENTER", 1, 1 )
AsphyxiaUIReloadUIButton.Text:SetText( S.RGBToHex( unpack( C["media"]["datatextcolor2"] ) ) .. "RL" )

------------------------------
-- ResetUI Button
------------------------------
local AsphyxiaUIResetUIButton = CreateFrame( "Button", "TukuiResetUIButton", UIParent, "SecureActionButtonTemplate" )
AsphyxiaUIResetUIButton:CreatePanel( "Default", 26, 20, "LEFT", AsphyxiaUIReloadUIButton, "RIGHT", 3, 0 )
AsphyxiaUIResetUIButton:CreateShadow( "Default" )
AsphyxiaUIResetUIButton:CreateOverlay( AsphyxiaUIResetUIButton )
AsphyxiaUIResetUIButton:SetAttribute( "type", "macro" )
AsphyxiaUIResetUIButton:SetAttribute( "macrotext", "/resetui" )
AsphyxiaUIResetUIButton:HookScript( "OnEnter", S.SetModifiedBackdrop )
AsphyxiaUIResetUIButton:HookScript( "OnLeave", S.SetOriginalBackdrop )

AsphyxiaUIResetUIButton.Text = S.SetFontString( AsphyxiaUIResetUIButton, S.CreateFontString() )
AsphyxiaUIResetUIButton.Text:Point( "CENTER", AsphyxiaUIResetUIButton, "CENTER", 1, 1 )
AsphyxiaUIResetUIButton.Text:SetText( S.RGBToHex( unpack( C["media"]["datatextcolor2"] ) ) .. "RS" )

------------------------------
-- Datatext Button
------------------------------
local AsphyxiaUIInfoCenterButton = CreateFrame( "Frame", "AsphyxiaUIInfoCenterButton", TukuiChatBackgroundRight )
AsphyxiaUIInfoCenterButton:CreatePanel( nil, 30, 15, "TOPRIGHT", TukuiChatBackgroundRight, "TOPRIGHT", -5, -68 )
AsphyxiaUIInfoCenterButton:SetAlpha( 0 )
AsphyxiaUIInfoCenterButton:SetFrameStrata( "MEDIUM" )
AsphyxiaUIInfoCenterButton:SetFrameLevel( 10 )
AsphyxiaUIInfoCenterButton:CreateOverlay( AsphyxiaUIInfoCenterButton )
AsphyxiaUIInfoCenterButton:EnableMouse( true )

AsphyxiaUIInfoCenterButton.Text = S.SetFontString( AsphyxiaUIInfoCenterButton, S.CreateFontString() )
AsphyxiaUIInfoCenterButton.Text:SetPoint( "CENTER", AsphyxiaUIInfoCenterButton, "CENTER", 0, 1 )
AsphyxiaUIInfoCenterButton.Text:SetText( "|cff9a1212-|r" )

AsphyxiaUIInfoCenterButton:SetScript( "OnMouseDown", function( self )
	ToggleFrame( AsphyxiaUIInfoCenterRight )
	ToggleFrame( AsphyxiaUIInfoCenterLeft )
	ToggleFrame( AsphyxiaUIInfoCenter )
	if( AsphyxiaUIInfoCenter:IsShown() or AsphyxiaUIInfoCenterRight:IsShown() or AsphyxiaUIInfoCenterLeft:IsShown() ) then
		AsphyxiaUIInfoCenterButton.Text:SetText( "|cff9a1212-|r" )
	else
		AsphyxiaUIInfoCenterButton.Text:SetText( "|cff9a1212+|r" )
	end
end )

AsphyxiaUIInfoCenterButton:SetScript( "OnEnter", function()
	if( InCombatLockdown() ) then return end
	AsphyxiaUIInfoCenterButton:FadeIn()
end )

AsphyxiaUIInfoCenterButton:SetScript( "OnLeave", function()
	AsphyxiaUIInfoCenterButton:FadeOut()
end )