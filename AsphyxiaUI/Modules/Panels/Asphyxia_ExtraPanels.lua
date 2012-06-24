---------------------------------------------------------------------------------------------
-- AsphyxiaUI
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["global"]["panellayout"] ~= "asphyxia" ) then return end

---------------------------------------------------------------------------------------------
-- additional (Asphyxia) panels
---------------------------------------------------------------------------------------------
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

---------------------------------------------------------------------------------------------
-- invisbutton, another thing :O
---------------------------------------------------------------------------------------------
local invisButton = CreateFrame( "Frame", "invisButton", UIParent )
invisButton:CreatePanel( "Transparent", 100, 20, "BOTTOM", UIParent, "BOTTOM", 0, 2, true )
invisButton:SetFrameLevel( 0 )
invisButton:SetAlpha( 0 )

---------------------------------------------------------------------------------------------
-- version button
---------------------------------------------------------------------------------------------
local verbutton = CreateFrame( "Button", "TukuiVersionButton", UIParent, "SecureActionButtonTemplate" )
verbutton:CreatePanel( "Default", 26, 20, "RIGHT", invisButton, "LEFT", -3, 0 )
verbutton:CreateShadow( "Default" )
verbutton:CreateOverlay( verbutton )
verbutton:SetAttribute( "type", "macro" )
verbutton:SetAttribute( "macrotext", "/afaq" )
verbutton:HookScript( "OnEnter", S.SetModifiedBackdrop )
verbutton:HookScript( "OnLeave", S.SetOriginalBackdrop )

verbutton.Text = S.SetFontString( verbutton, S.CreateFontString() )
verbutton.Text:Point( "CENTER", verbutton, "CENTER", 1, 1 )
verbutton.Text:SetText( S.RGBToHex( unpack( C["media"]["datatextcolor2"] ) ) .. "FAQ" )

---------------------------------------------------------------------------------------------
-- help button
---------------------------------------------------------------------------------------------
local helpbutton = CreateFrame( "Button", "TukuiHelpButton", UIParent, "SecureActionButtonTemplate" )
helpbutton:CreatePanel( "Default", 26, 20, "RIGHT", verbutton, "LEFT", -3, 0 )
helpbutton:CreateShadow( "Default" )
helpbutton:CreateOverlay( helpbutton )
helpbutton:SetAttribute( "type", "macro" )
helpbutton:SetAttribute( "macrotext", "/ahelp" )
helpbutton:HookScript( "OnEnter", S.SetModifiedBackdrop )
helpbutton:HookScript( "OnLeave", S.SetOriginalBackdrop )

helpbutton.Text = S.SetFontString( helpbutton, S.CreateFontString() )
helpbutton.Text:Point( "CENTER", helpbutton, "CENTER", 1, 1 )
helpbutton.Text:SetText( S.RGBToHex( unpack( C["media"]["datatextcolor2"] ) ) .. "Help" )

---------------------------------------------------------------------------------------------
-- /reloadui button
---------------------------------------------------------------------------------------------
local rluibutton = CreateFrame( "Button", "TukuiReloadUIButton", UIParent, "SecureActionButtonTemplate" )
rluibutton:CreatePanel( "Default", 26, 20, "LEFT", invisButton, "RIGHT", 3, 0 )
rluibutton:CreateShadow( "Default" )
rluibutton:CreateOverlay( rluibutton )
rluibutton:SetAttribute( "type", "macro" )
rluibutton:SetAttribute( "macrotext", "/rl" )
rluibutton:HookScript( "OnEnter", S.SetModifiedBackdrop )
rluibutton:HookScript( "OnLeave", S.SetOriginalBackdrop )

rluibutton.Text = S.SetFontString( rluibutton, S.CreateFontString() )
rluibutton.Text:Point( "CENTER", rluibutton, "CENTER", 1, 1 )
rluibutton.Text:SetText( S.RGBToHex( unpack( C["media"]["datatextcolor2"] ) ) .. "RL" )

---------------------------------------------------------------------------------------------
-- /resetui button
---------------------------------------------------------------------------------------------
local resetuibutton = CreateFrame( "Button", "TukuiResetUIButton", UIParent, "SecureActionButtonTemplate" )
resetuibutton:CreatePanel( "Default", 26, 20, "LEFT", rluibutton, "RIGHT", 3, 0 )
resetuibutton:CreateShadow( "Default" )
resetuibutton:CreateOverlay( resetuibutton )
resetuibutton:SetAttribute( "type", "macro" )
resetuibutton:SetAttribute( "macrotext", "/resetui" )
resetuibutton:HookScript( "OnEnter", S.SetModifiedBackdrop )
resetuibutton:HookScript( "OnLeave", S.SetOriginalBackdrop )

resetuibutton.Text = S.SetFontString( resetuibutton, S.CreateFontString() )
resetuibutton.Text:Point( "CENTER", resetuibutton, "CENTER", 1, 1 )
resetuibutton.Text:SetText( S.RGBToHex( unpack( C["media"]["datatextcolor2"] ) ) .. "RS" )

---------------------------------------------------------------------------------------------
-- datatext panel toggle (button)
---------------------------------------------------------------------------------------------
local icb = CreateFrame( "Frame", "InfoCenterButton", TukuiChatBackgroundRight )
icb:CreatePanel( nil, 30, 15, "TOPRIGHT", TukuiChatBackgroundRight, "TOPRIGHT", -5, -68 )
icb:SetAlpha( 0 )
icb:SetFrameStrata( "MEDIUM" )
icb:SetFrameLevel( 10 )
icb:CreateOverlay( icb )
icb:EnableMouse( true )
icb.f = icb:CreateFontString( nil, overlay )
icb.f:SetPoint( "CENTER" )
icb.f:SetFont( S.CreateFontString() )
icb.f:SetText( "|cff9a1212-|r" )
icb.f:Point( "CENTER", 1, 0 )
icb:SetScript( "OnMouseDown", function( self )
	ToggleFrame( AsphyxiaUIInfoCenterRight )
	ToggleFrame( AsphyxiaUIInfoCenterLeft )
	ToggleFrame( AsphyxiaUIInfoCenter )
	if( AsphyxiaUIInfoCenter:IsShown() or AsphyxiaUIInfoCenterRight:IsShown() or AsphyxiaUIInfoCenterLeft:IsShown() ) then
		self.f:SetText( "|cff9a1212-|r" )
	else
		self.f:SetText( "|cff9a1212+|r" )
	end
end )

icb:SetScript( "OnEnter", function()
	if( InCombatLockdown() ) then return end
	icb:FadeIn()
end )

icb:SetScript( "OnLeave", function()
	icb:FadeOut()
end )