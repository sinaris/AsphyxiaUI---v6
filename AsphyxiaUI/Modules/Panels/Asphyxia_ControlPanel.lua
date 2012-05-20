---------------------------------------------------------------------------------------------
-- AsphyxiaUI
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["global"]["panellayout"] ~= "asphyxia" ) then return end

print( "panel: asphyxia" )

---------------------------------------------------------------------------------------------
-- background for actionbar config
---------------------------------------------------------------------------------------------
local actionBarBG = CreateFrame( "Frame", "actionBarBG", UIParent )
actionBarBG:CreatePanel( "Default", 150, 61, "CENTER", UIParent, "CENTER", 0, 25 )
actionBarBG:Height( 80 )
actionBarBG:SetFrameLevel( 15 )
actionBarBG:Hide()
S.fadeIn( actionBarBG )

local abHeader = CreateFrame( "Frame", "abHeader", actionBarBG )
abHeader:CreatePanel( "Transparent", actionBarBG:GetWidth(), 20, "BOTTOM", actionBarBG, "TOP", 0, 2, true )
abHeader.Text = S.SetFontString( abHeader, S.CreateFontString() )
abHeader.Text:Point( "CENTER", abHeader, "CENTER", 0, 1 )
abHeader.Text:SetText( S.RGBToHex( unpack( C["media"].datatextcolor2 ) ) .. L.core_controlpanel_abconfigmenu_header )

---------------------------------------------------------------------------------------------
-- background for control panel
---------------------------------------------------------------------------------------------
local extrasBG = CreateFrame( "Frame", "extrasBG", UIParent )
extrasBG:CreatePanel( "Default", 152, 132 , "CENTER", UIParent, "CENTER", 0, 25 )
extrasBG:SetFrameLevel( 10 )
extrasBG:SetFrameStrata( "BACKGROUND" )
extrasBG:Hide()
S.fadeIn( extrasBG )

local extraHeader = CreateFrame( "Frame", "extraHeader", extrasBG )
extraHeader:CreatePanel( "Transparent", extrasBG:GetWidth(), 20, "BOTTOM", extrasBG, "TOP", 0, 2, true )
extraHeader.Text = S.SetFontString( extraHeader, S.CreateFontString() )
extraHeader.Text:Point( "CENTER", extraHeader, "CENTER", 0, 1 )
extraHeader.Text:SetText( S.RGBToHex( unpack( C["media"].datatextcolor2 ) ) .. L.core_controlpanel_controlpanel_header )

---------------------------------------------------------------------------------------------
-- close button inside actionbar config
---------------------------------------------------------------------------------------------
local closeAB = CreateFrame( "Frame", "closeAB", actionBarBG )
closeAB:CreatePanel( "Default", actionBarBG:GetWidth() - 8, 15, "BOTTOM", actionBarBG, "BOTTOM", 0, 4, true )
closeAB:SetFrameLevel( actionBarBG:GetFrameLevel() + 1 )
closeAB:HookScript( "OnEnter", S.SetModifiedBackdrop )
closeAB:HookScript( "OnLeave", S.SetOriginalBackdrop )

closeAB.Text = S.SetFontString( closeAB, S.CreateFontString() )
closeAB.Text:Point( "CENTER", closeAB, "CENTER", 0, 1 )
closeAB.Text:SetText( S.RGBToHex( unpack( C["media"].datatextcolor2 ) ) .. CLOSE )
closeAB:CreateOverlay( closeAB )
closeAB:SetScript( "OnMouseDown", function()
	S.fadeOut( actionBarBG )
	extrasBG:Show()
end )

---------------------------------------------------------------------------------------------
-- slash command to open up actionbar config
---------------------------------------------------------------------------------------------
function SlashCmdList.AB()
	if( extrasBG:IsShown() ) then
		actionBarBG:Show()
		S.fadeOut( extrasBG )
	else
		actionBarBG:Show()
	end
end
SLASH_AB1 = "/ab"

---------------------------------------------------------------------------------------------
-- setup config button slash commands
---------------------------------------------------------------------------------------------
local buttons = {
	[1] = { "/ab" },
	[2] = { "/am" },
	[3] = { "/tc" },
	[4] = { "/mtukui" },
}

---------------------------------------------------------------------------------------------
-- setup text in each button
---------------------------------------------------------------------------------------------
local texts = {
	[1] = { S.RGBToHex( unpack( C["media"].datatextcolor2 ) ) .. L.core_controlpanel_controlpanel_abconfig },
	[2] = { S.RGBToHex( unpack( C["media"].datatextcolor2 ) ) .. ADDONS },
	[3] = { S.RGBToHex( unpack( C["media"].datatextcolor2 ) ) .. L.core_controlpanel_controlpanel_configui },
	[4] = { S.RGBToHex( unpack( C["media"].datatextcolor2 ) ) .. L.core_controlpanel_controlpanel_moveui },
}

---------------------------------------------------------------------------------------------
-- create the config buttons
---------------------------------------------------------------------------------------------
local button = CreateFrame( "Button", "button", extrasBG )
for i = 1, getn( buttons ) do
	button[i] = CreateFrame( "Button", "button" .. i, extrasBG, "SecureActionButtonTemplate" )
	button[i]:CreatePanel( "Default", extrasBG:GetWidth() - 8, 24, "TOP", extrasBG, "TOP", 0, -4, true )
	button[i]:SetFrameLevel( extrasBG:GetFrameLevel() + 1 )
	button[i].Text = S.SetFontString( button[i], S.CreateFontString() )
	button[i].Text:Point( "CENTER", button[i], "CENTER", 0, 1 )
	button[i].Text:SetText( unpack( texts[i] ) )

	if( i == 1 ) then
		button[i]:Point( "TOP", extrasBG, "TOP", 0, -5 )
	else
		button[i]:Point( "TOP", button[i - 1], "BOTTOM", 0, -3 )
	end
	button[i]:SetAttribute( "type", "macro" )
	button[i]:SetAttribute( "macrotext", unpack( buttons[i] ) )
	button[i]:SetFrameStrata( "BACKGROUND" )
	button[i]:CreateOverlay( button[i] )
	button[i]:HookScript( "OnEnter", S.SetModifiedBackdrop )
	button[i]:HookScript( "OnLeave", S.SetOriginalBackdrop )
end

local close = CreateFrame( "Frame", "close", extrasBG )
close:CreatePanel( "Default", extrasBG:GetWidth() - 8, 15, "TOP", button[4], "BOTTOM", 0, -3, true )
close:SetFrameLevel( extrasBG:GetFrameLevel() + 1 )
close:HookScript( "OnEnter", S.SetModifiedBackdrop )
close:HookScript( "OnLeave", S.SetOriginalBackdrop )
close.Text = S.SetFontString( close, S.CreateFontString() )
close.Text:Point( "CENTER", close, "CENTER", 0, 1 )
close.Text:SetText( S.RGBToHex( unpack( C["media"].datatextcolor2 ) ) .. CLOSE )
close:CreateOverlay( close )
close:SetScript( "OnMouseDown", function()
	S.fadeOut( extrasBG )
end )

local extraToggle = CreateFrame( "Frame", "extraToggle", UIParent )
extraToggle:CreatePanel( "Default", 100, 20, "BOTTOM", UIParent, "BOTTOM", 0, 2, true )
extraToggle:SetFrameLevel( 2 )
extraToggle:SetFrameStrata( "LOW" )
extraToggle:CreateShadow( "Default" )
extraToggle:CreateOverlay( extraToggle )
extraToggle.Text = S.SetFontString( extraToggle, S.CreateFontString() )
extraToggle.Text:Point( "CENTER", extraToggle, "CENTER", 0, 1 )
extraToggle.Text:SetText( S.RGBToHex( unpack( C["media"].datatextcolor2 ) ) .. "Control Panel" )

extraToggle:HookScript( "OnEnter", S.SetModifiedBackdrop )
extraToggle:HookScript( "OnLeave", S.SetOriginalBackdrop )

extraToggle:SetScript( "OnMouseDown", function( self )
	if( InCombatLockdown() ) then print( ERR_NOT_IN_COMBAT ) return end
	if not extrasBG:IsShown() then
		extrasBG:Show()
		S.fadeOut( actionBarBG )
	else
		S.fadeOut( extrasBG )
	end
end )