---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["intmodules"]["bnetpanel"] ~= true ) then return end

------------------------------
-- Top Bar
------------------------------
local AsphyxiaUIBNetPanel = CreateFrame( "Frame", "AsphyxiaUIBNetPanel", UIParent )
AsphyxiaUIBNetPanel:Size( 235, 23 )
AsphyxiaUIBNetPanel:Point( "TOPLEFT", UIParent, "TOPLEFT", 176, -23 )
AsphyxiaUIBNetPanel:SetTemplate( "Default" )
AsphyxiaUIBNetPanel:CreateShadow( "Default" )
AsphyxiaUIBNetPanel:SetClampedToScreen( true )
AsphyxiaUIBNetPanel:SetFrameLevel( 2 )
AsphyxiaUIBNetPanel:SetFrameStrata( "BACKGROUND" )

AsphyxiaUIBNetPanel.Texture = AsphyxiaUIBNetPanel:CreateTexture( nil, "ARTWORK" )
AsphyxiaUIBNetPanel.Texture:Point( "TOPLEFT", 2, -2 )
AsphyxiaUIBNetPanel.Texture:Point( "BOTTOMRIGHT", -2, 2 )
AsphyxiaUIBNetPanel.Texture:SetTexture( C["media"]["bnetlogolarge"] )

local AsphyxiaUIBNetPanelShowHideButton = CreateFrame( "Button", "AsphyxiaUIBNetPanelShowHideButton", UIParent )
AsphyxiaUIBNetPanelShowHideButton:Size( 50, 17 )
AsphyxiaUIBNetPanelShowHideButton:Point( "RIGHT", AsphyxiaUIBNetPanel, "RIGHT", -3, 0 )
AsphyxiaUIBNetPanelShowHideButton:SetTemplate( "Default" )
AsphyxiaUIBNetPanelShowHideButton:CreateOverlay( AsphyxiaUIBNetPanelShowHideButton )
AsphyxiaUIBNetPanelShowHideButton:HookScript( "OnEnter", S.SetModifiedBackdrop )
AsphyxiaUIBNetPanelShowHideButton:HookScript( "OnLeave", S.SetOriginalBackdrop )

AsphyxiaUIBNetPanelShowHideButton.Title = S.SetFontString( AsphyxiaUIBNetPanelShowHideButton, S.CreateFontString() )
AsphyxiaUIBNetPanelShowHideButton.Title:SetText( "Hide" )
AsphyxiaUIBNetPanelShowHideButton.Title:SetPoint( "CENTER", AsphyxiaUIBNetPanelShowHideButton, "CENTER", 1, 1 )

------------------------------
-- Logos
------------------------------
local AsphyxiaUIBNetPanelBNetLogo = CreateFrame( "Frame", "AsphyxiaUIBNetPanelBNetLogo", UIParent )
AsphyxiaUIBNetPanelBNetLogo:Size( 58, 47 )
AsphyxiaUIBNetPanelBNetLogo:Point( "TOPLEFT", AsphyxiaUIBNetPanel, "BOTTOMLEFT", 0, -3 )
AsphyxiaUIBNetPanelBNetLogo:SetTemplate( "Default" )
AsphyxiaUIBNetPanelBNetLogo:CreateShadow( "Default" )

local AsphyxiaUIBNetPanelGoldLogo = CreateFrame( "Frame", "AsphyxiaUIBNetPanelGoldLogo", UIParent )
AsphyxiaUIBNetPanelGoldLogo:Size( 58, 47 )
AsphyxiaUIBNetPanelGoldLogo:Point( "TOP", AsphyxiaUIBNetPanelBNetLogo, "BOTTOM", 0, -3 )
AsphyxiaUIBNetPanelGoldLogo:SetTemplate( "Default" )
AsphyxiaUIBNetPanelGoldLogo:CreateShadow( "Default" )

AsphyxiaUIBNetPanelBNetLogo.Texture = AsphyxiaUIBNetPanelBNetLogo:CreateTexture( nil, "ARTWORK" )
AsphyxiaUIBNetPanelBNetLogo.Texture:Point( "TOPLEFT", 2, -2 )
AsphyxiaUIBNetPanelBNetLogo.Texture:Point( "BOTTOMRIGHT", -2, 2 )
AsphyxiaUIBNetPanelBNetLogo.Texture:SetTexture( C["media"]["bnetlogo"] )

AsphyxiaUIBNetPanelGoldLogo.Texture = AsphyxiaUIBNetPanelGoldLogo:CreateTexture( nil, "ARTWORK" )
AsphyxiaUIBNetPanelGoldLogo.Texture:Point( "TOPLEFT", 2, -2 )
AsphyxiaUIBNetPanelGoldLogo.Texture:Point( "BOTTOMRIGHT", -2, 2 )
AsphyxiaUIBNetPanelGoldLogo.Texture:SetTexture( C["media"]["bnetgold"] )

------------------------------
-- Panels
------------------------------
local AsphyxiaUIBNetPanelBNetLogoTopStatPanel = CreateFrame( "Frame", "AsphyxiaUIBNetPanelBNetLogoTopStatPanel", UIParent )
AsphyxiaUIBNetPanelBNetLogoTopStatPanel:Size( 174, 22 )
AsphyxiaUIBNetPanelBNetLogoTopStatPanel:SetTemplate( "Default" )
AsphyxiaUIBNetPanelBNetLogoTopStatPanel:Point( "TOPLEFT", AsphyxiaUIBNetPanelBNetLogo, "TOPRIGHT", 3, 0 )
AsphyxiaUIBNetPanelBNetLogoTopStatPanel:CreateShadow( "Default" )
AsphyxiaUIBNetPanelBNetLogoTopStatPanel:CreateOverlay( AsphyxiaUIBNetPanelBNetLogoTopStatPanel )

local AsphyxiaUIBNetPanelBNetLogoBottomStatPanel = CreateFrame( "Frame", "AsphyxiaUIBNetPanelBNetLogoBottomStatPanel", UIParent )
AsphyxiaUIBNetPanelBNetLogoBottomStatPanel:Size( 174, 22 )
AsphyxiaUIBNetPanelBNetLogoBottomStatPanel:SetTemplate( "Default" )
AsphyxiaUIBNetPanelBNetLogoBottomStatPanel:Point( "BOTTOMLEFT", AsphyxiaUIBNetPanelBNetLogo, "BOTTOMRIGHT", 3, 0 )
AsphyxiaUIBNetPanelBNetLogoBottomStatPanel:CreateShadow( "Default" )
AsphyxiaUIBNetPanelBNetLogoBottomStatPanel:CreateOverlay( AsphyxiaUIBNetPanelBNetLogoBottomStatPanel )

local AsphyxiaUIBNetPanelGoldLogoTopStatPanel = CreateFrame( "Frame", "AsphyxiaUIBNetPanelGoldLogoTopStatPanel", UIParent )
AsphyxiaUIBNetPanelGoldLogoTopStatPanel:Size( 174, 22 )
AsphyxiaUIBNetPanelGoldLogoTopStatPanel:SetTemplate( "Default" )
AsphyxiaUIBNetPanelGoldLogoTopStatPanel:Point( "TOPLEFT", AsphyxiaUIBNetPanelGoldLogo, "TOPRIGHT", 3, 0 )
AsphyxiaUIBNetPanelGoldLogoTopStatPanel:CreateShadow( "Default" )
AsphyxiaUIBNetPanelGoldLogoTopStatPanel:CreateOverlay( AsphyxiaUIBNetPanelGoldLogoTopStatPanel )

local AsphyxiaUIBNetPanelGoldLogoBottomStatPanel = CreateFrame( "Frame", "AsphyxiaUIBNetPanelGoldLogoBottomStatPanel", UIParent )
AsphyxiaUIBNetPanelGoldLogoBottomStatPanel:Size( 174, 22 )
AsphyxiaUIBNetPanelGoldLogoBottomStatPanel:SetTemplate( "Default" )
AsphyxiaUIBNetPanelGoldLogoBottomStatPanel:Point( "BOTTOMLEFT", AsphyxiaUIBNetPanelGoldLogo, "BOTTOMRIGHT", 3, 0 )
AsphyxiaUIBNetPanelGoldLogoBottomStatPanel:CreateShadow( "Default" )
AsphyxiaUIBNetPanelGoldLogoBottomStatPanel:CreateOverlay( AsphyxiaUIBNetPanelGoldLogoBottomStatPanel )

------------------------------
-- Button Function
------------------------------
AsphyxiaUIBNetPanelShowHideButton:RegisterForClicks( "AnyUp" )
AsphyxiaUIBNetPanelShowHideButton:SetScript( "OnClick", function()
	if( AsphyxiaUIBNetPanelBNetLogo:IsShown() ) then
		AsphyxiaUIBNetPanelBNetLogo:Hide()
		AsphyxiaUIBNetPanelGoldLogo:Hide()
		AsphyxiaUIBNetPanelBNetLogoTopStatPanel:Hide()
		AsphyxiaUIBNetPanelBNetLogoBottomStatPanel:Hide()
		AsphyxiaUIBNetPanelGoldLogoTopStatPanel:Hide()
		AsphyxiaUIBNetPanelGoldLogoBottomStatPanel:Hide()

		AsphyxiaUIBNetPanelShowHideButton.Title:SetText( "Show" )
	else
		AsphyxiaUIBNetPanelBNetLogo:Show()
		AsphyxiaUIBNetPanelGoldLogo:Show()
		AsphyxiaUIBNetPanelBNetLogoTopStatPanel:Show()
		AsphyxiaUIBNetPanelBNetLogoBottomStatPanel:Show()
		AsphyxiaUIBNetPanelGoldLogoTopStatPanel:Show()
		AsphyxiaUIBNetPanelGoldLogoBottomStatPanel:Show()

		AsphyxiaUIBNetPanelShowHideButton.Title:SetText( "Hide" )
	end
end )