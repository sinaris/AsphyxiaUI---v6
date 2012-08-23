---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

------------------------------
-- Actionbar Config
------------------------------
local AsphyxiaUIControlPanelActionbarBackground = CreateFrame( "Frame", "AsphyxiaUIControlPanelActionbarBackground", UIParent )
AsphyxiaUIControlPanelActionbarBackground:Size( 150, 80 )
AsphyxiaUIControlPanelActionbarBackground:Point( "CENTER", UIParent, "CENTER", 0, 25 )
AsphyxiaUIControlPanelActionbarBackground:SetTemplate( "Transparent" )
AsphyxiaUIControlPanelActionbarBackground:CreateShadow( "Default" )
AsphyxiaUIControlPanelActionbarBackground:SetFrameLevel( 15 )
AsphyxiaUIControlPanelActionbarBackground:Hide()

local AsphyxiaUIControlPanelActionbarBackgroundHeader = CreateFrame( "Frame", "AsphyxiaUIControlPanelActionbarBackgroundHeader", AsphyxiaUIControlPanelActionbarBackground )
AsphyxiaUIControlPanelActionbarBackgroundHeader:Size( AsphyxiaUIControlPanelActionbarBackground:GetWidth(), 20 )
AsphyxiaUIControlPanelActionbarBackgroundHeader:Point( "BOTTOM", AsphyxiaUIControlPanelActionbarBackground, "TOP", 0, 3 )
AsphyxiaUIControlPanelActionbarBackgroundHeader:SetTemplate( "Default" )
AsphyxiaUIControlPanelActionbarBackgroundHeader:CreateShadow( "Default" )

AsphyxiaUIControlPanelActionbarBackgroundHeader.Text = S.SetFontString( AsphyxiaUIControlPanelActionbarBackgroundHeader, S.CreateFontString() )
AsphyxiaUIControlPanelActionbarBackgroundHeader.Text:Point( "CENTER", AsphyxiaUIControlPanelActionbarBackgroundHeader, "CENTER", 0, 1 )
AsphyxiaUIControlPanelActionbarBackgroundHeader.Text:SetText( S.RGBToHex( unpack( C["media"]["datatextcolor2"] ) ) .. "Actionbar" )

------------------------------
-- Extra Config
------------------------------
local AsphyxiaUIControlPanelExtraBackground = CreateFrame( "Frame", "AsphyxiaUIControlPanelExtraBackground", UIParent )
AsphyxiaUIControlPanelExtraBackground:Size( 150, 186 )
AsphyxiaUIControlPanelExtraBackground:Point( "CENTER", UIParent, "CENTER", 0, 25 )
AsphyxiaUIControlPanelExtraBackground:SetTemplate( "Transparent" )
AsphyxiaUIControlPanelExtraBackground:CreateShadow( "Default" )
AsphyxiaUIControlPanelExtraBackground:SetFrameLevel( 15 )
AsphyxiaUIControlPanelExtraBackground:Hide()

local AsphyxiaUIControlPanelExtraBackgroundHeader = CreateFrame( "Frame", "AsphyxiaUIControlPanelExtraBackgroundHeader", AsphyxiaUIControlPanelExtraBackground )
AsphyxiaUIControlPanelExtraBackgroundHeader:Size( AsphyxiaUIControlPanelExtraBackground:GetWidth(), 20 )
AsphyxiaUIControlPanelExtraBackgroundHeader:Point( "BOTTOM", AsphyxiaUIControlPanelExtraBackground, "TOP", 0, 3 )
AsphyxiaUIControlPanelExtraBackgroundHeader:SetTemplate( "Default" )
AsphyxiaUIControlPanelExtraBackgroundHeader:CreateShadow( "Default" )

AsphyxiaUIControlPanelExtraBackgroundHeader.Text = S.SetFontString( AsphyxiaUIControlPanelExtraBackgroundHeader, S.CreateFontString() )
AsphyxiaUIControlPanelExtraBackgroundHeader.Text:Point( "CENTER", AsphyxiaUIControlPanelExtraBackgroundHeader, "CENTER", 0, 1 )
AsphyxiaUIControlPanelExtraBackgroundHeader.Text:SetText( S.RGBToHex( unpack( C["media"]["datatextcolor2"] ) ) .. "Control Panel" )

------------------------------
-- Actionbar Config Close Btn
------------------------------
local AsphyxiaUIControlPanelActionbarBackgroundCloseButton = CreateFrame( "Frame", "AsphyxiaUIControlPanelActionbarBackgroundCloseButton", AsphyxiaUIControlPanelActionbarBackground )
AsphyxiaUIControlPanelActionbarBackgroundCloseButton:Size( AsphyxiaUIControlPanelActionbarBackground:GetWidth() - 8, 15 )
AsphyxiaUIControlPanelActionbarBackgroundCloseButton:Point( "BOTTOM", AsphyxiaUIControlPanelActionbarBackground, "BOTTOM", 0, 4 )
AsphyxiaUIControlPanelActionbarBackgroundCloseButton:SetTemplate( "Default" )
AsphyxiaUIControlPanelActionbarBackgroundCloseButton:SetFrameLevel( AsphyxiaUIControlPanelActionbarBackground:GetFrameLevel() + 1 )
AsphyxiaUIControlPanelActionbarBackgroundCloseButton:HookScript( "OnEnter", S.SetModifiedBackdrop )
AsphyxiaUIControlPanelActionbarBackgroundCloseButton:HookScript( "OnLeave", S.SetOriginalBackdrop )

AsphyxiaUIControlPanelActionbarBackgroundCloseButton.Text = S.SetFontString( AsphyxiaUIControlPanelActionbarBackgroundCloseButton, S.CreateFontString() )
AsphyxiaUIControlPanelActionbarBackgroundCloseButton.Text:Point( "CENTER", AsphyxiaUIControlPanelActionbarBackgroundCloseButton, "CENTER", 0, 1 )
AsphyxiaUIControlPanelActionbarBackgroundCloseButton.Text:SetText( S.RGBToHex( unpack( C["media"]["datatextcolor2"] ) ) .. CLOSE )
AsphyxiaUIControlPanelActionbarBackgroundCloseButton:CreateOverlay( AsphyxiaUIControlPanelActionbarBackgroundCloseButton )
AsphyxiaUIControlPanelActionbarBackgroundCloseButton:SetScript( "OnMouseDown", function()
	AsphyxiaUIControlPanelActionbarBackground:Hide()
	AsphyxiaUIControlPanelExtraBackground:Show()
end )

------------------------------
-- Control Panel Buttons
------------------------------
local AsphyxiaUIControlPanelButtons = {
	[1] = { "/ab" },
	[2] = { "/am" },
	[3] = { "/tc" },
	[4] = { "/mtukui" },
	[5] = { "/acl" },
	[6] = { "/afaq" },
}

------------------------------
-- Control Panel Buttons Text
------------------------------
local AsphyxiaUIControlPanelButtonsTexts = {
	[1] = { S.RGBToHex( unpack( C["media"]["datatextcolor2"] ) ) .. "Actionbars" },
	[2] = { S.RGBToHex( unpack( C["media"]["datatextcolor2"] ) ) .. "AddOns" },
	[3] = { S.RGBToHex( unpack( C["media"]["datatextcolor2"] ) ) .. "Tukui" },
	[4] = { S.RGBToHex( unpack( C["media"]["datatextcolor2"] ) ) .. "MoveUI" },
	[5] = { "Changelog" },
	[6] = { "F.A.Q." },
}

local AsphyxiaUIControlPanelButtonsButtons = CreateFrame( "Button", "AsphyxiaUIControlPanelButtonsButtons", AsphyxiaUIControlPanelExtraBackground )
for i = 1, getn( AsphyxiaUIControlPanelButtons ) do
	AsphyxiaUIControlPanelButtonsButtons[i] = CreateFrame( "Button", "AsphyxiaUIControlPanelButtonsButtons" .. i, AsphyxiaUIControlPanelExtraBackground, "SecureActionButtonTemplate" )
	AsphyxiaUIControlPanelButtonsButtons[i]:Size( AsphyxiaUIControlPanelExtraBackground:GetWidth() - 8, 24 )
	AsphyxiaUIControlPanelButtonsButtons[i]:Point( "TOP", AsphyxiaUIControlPanelExtraBackground, "TOP", 0, -4 )
	AsphyxiaUIControlPanelButtonsButtons[i]:SetTemplate( "Default" )
	AsphyxiaUIControlPanelButtonsButtons[i]:SetFrameLevel( AsphyxiaUIControlPanelExtraBackground:GetFrameLevel() + 2 )

	AsphyxiaUIControlPanelButtonsButtons[i].Text = S.SetFontString( AsphyxiaUIControlPanelButtonsButtons[i], S.CreateFontString() )
	AsphyxiaUIControlPanelButtonsButtons[i].Text:Point( "CENTER", AsphyxiaUIControlPanelButtonsButtons[i], "CENTER", 0, 1 )
	AsphyxiaUIControlPanelButtonsButtons[i].Text:SetText( unpack( AsphyxiaUIControlPanelButtonsTexts[i] ) )

	if( i == 1 ) then
		AsphyxiaUIControlPanelButtonsButtons[i]:ClearAllPoints()
		AsphyxiaUIControlPanelButtonsButtons[i]:Point( "TOP", AsphyxiaUIControlPanelExtraBackground, "TOP", 0, -5 )
	else
		AsphyxiaUIControlPanelButtonsButtons[i]:ClearAllPoints()
		AsphyxiaUIControlPanelButtonsButtons[i]:Point( "TOP", AsphyxiaUIControlPanelButtonsButtons[i - 1], "BOTTOM", 0, -3 )
	end
	AsphyxiaUIControlPanelButtonsButtons[i]:SetAttribute( "type", "macro" )
	AsphyxiaUIControlPanelButtonsButtons[i]:SetAttribute( "macrotext", unpack( AsphyxiaUIControlPanelButtons[i] ) )
	--AsphyxiaUIControlPanelButtonsButtons[i]:SetFrameStrata( "BACKGROUND" )
	AsphyxiaUIControlPanelButtonsButtons[i]:CreateOverlay( AsphyxiaUIControlPanelButtonsButtons[i] )
	AsphyxiaUIControlPanelButtonsButtons[i]:HookScript( "OnEnter", S.SetModifiedBackdrop )
	AsphyxiaUIControlPanelButtonsButtons[i]:HookScript( "OnLeave", S.SetOriginalBackdrop )
end

local AsphyxiaUIControlPanelExtraBackgroundCloseButton = CreateFrame( "Frame", "AsphyxiaUIControlPanelExtraBackgroundCloseButton", AsphyxiaUIControlPanelExtraBackground )
AsphyxiaUIControlPanelExtraBackgroundCloseButton:Size( AsphyxiaUIControlPanelExtraBackground:GetWidth() - 8, 15 )
AsphyxiaUIControlPanelExtraBackgroundCloseButton:Point( "TOP", AsphyxiaUIControlPanelButtonsButtons[6], "BOTTOM", 0, -3 )
AsphyxiaUIControlPanelExtraBackgroundCloseButton:SetTemplate( "Default" )
AsphyxiaUIControlPanelExtraBackgroundCloseButton:SetFrameLevel( AsphyxiaUIControlPanelExtraBackground:GetFrameLevel() + 1 )
AsphyxiaUIControlPanelExtraBackgroundCloseButton:HookScript( "OnEnter", S.SetModifiedBackdrop )
AsphyxiaUIControlPanelExtraBackgroundCloseButton:HookScript( "OnLeave", S.SetOriginalBackdrop )

AsphyxiaUIControlPanelExtraBackgroundCloseButton.Text = S.SetFontString( AsphyxiaUIControlPanelExtraBackgroundCloseButton, S.CreateFontString() )
AsphyxiaUIControlPanelExtraBackgroundCloseButton.Text:Point( "CENTER", AsphyxiaUIControlPanelExtraBackgroundCloseButton, "CENTER", 0, 1 )
AsphyxiaUIControlPanelExtraBackgroundCloseButton.Text:SetText( S.RGBToHex( unpack( C["media"]["datatextcolor2"] ) ) .. CLOSE )
AsphyxiaUIControlPanelExtraBackgroundCloseButton:CreateOverlay( AsphyxiaUIControlPanelExtraBackgroundCloseButton )
AsphyxiaUIControlPanelExtraBackgroundCloseButton:SetScript( "OnMouseDown", function()
	AsphyxiaUIControlPanelExtraBackground:Hide()
end )

------------------------------
-- Control Panel Button
------------------------------
local AsphyxiaUIControlPanelButton = CreateFrame( "Frame", "AsphyxiaUIControlPanelButton", TukuiPetBattleHider )
AsphyxiaUIControlPanelButton:Size( 100, 20 )
AsphyxiaUIControlPanelButton:Point( "BOTTOM", UIParent, "BOTTOM", 0, 2 )
AsphyxiaUIControlPanelButton:SetTemplate( "Default" )
AsphyxiaUIControlPanelButton:SetFrameLevel( 2 )
AsphyxiaUIControlPanelButton:SetFrameStrata( "LOW" )
AsphyxiaUIControlPanelButton:CreateShadow( "Default" )
AsphyxiaUIControlPanelButton:CreateOverlay( AsphyxiaUIControlPanelButton )

AsphyxiaUIControlPanelButton.Text = S.SetFontString( AsphyxiaUIControlPanelButton, S.CreateFontString() )
AsphyxiaUIControlPanelButton.Text:Point( "CENTER", AsphyxiaUIControlPanelButton, "CENTER", 0, 1 )
AsphyxiaUIControlPanelButton.Text:SetText( S.RGBToHex( unpack( C["media"].datatextcolor2 ) ) .. "Control Panel" )

AsphyxiaUIControlPanelButton:HookScript( "OnEnter", S.SetModifiedBackdrop )
AsphyxiaUIControlPanelButton:HookScript( "OnLeave", S.SetOriginalBackdrop )

AsphyxiaUIControlPanelButton:SetScript( "OnMouseDown", function( self )
	if( InCombatLockdown() ) then print( ERR_NOT_IN_COMBAT ) return end
	if not AsphyxiaUIControlPanelExtraBackground:IsShown() then
		AsphyxiaUIControlPanelExtraBackground:Show()
		AsphyxiaUIControlPanelActionbarBackground:Hide()
	else
		AsphyxiaUIControlPanelExtraBackground:Hide()
	end
end )

------------------------------
-- slash command to open up actionbar config
------------------------------
function SlashCmdList.ActionbarControlPanel()
	if( AsphyxiaUIControlPanelExtraBackground:IsShown() ) then
		AsphyxiaUIControlPanelActionbarBackground:Show()
		AsphyxiaUIControlPanelExtraBackground:Hide()
	else
		AsphyxiaUIControlPanelActionbarBackground:Show()
	end
end
SLASH_ActionbarControlPanel1 = "/ab"