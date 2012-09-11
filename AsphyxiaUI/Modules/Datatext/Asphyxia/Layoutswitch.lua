---------------------------------------------------------------------------------------------
-- AddOn Name: AsphyxiaUI 6.0.0
-- License: MIT
-- Author: Sinaris @ Das Syndikat, Vaecia @ Blackmoore
-- Description: AsphyxiaUI, Editied Tukui Layout
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["global"]["globalstyle"] ~= "asphyxia" ) then return end

local AsphyxiaUILayoutSwitchButton = CreateFrame( "Button", "AsphyxiaUILayoutSwitchButton", UIParent )
AsphyxiaUILayoutSwitchButton:Size( 75, G.Panels.RightChatTabsBackground:GetHeight() )
AsphyxiaUILayoutSwitchButton:Point( "RIGHT", G.Panels.RightChatTabsBackground, "RIGHT", -21, 0 )
AsphyxiaUILayoutSwitchButton:SetFrameStrata( G.Panels.RightChatTabsBackground:GetFrameStrata() )
AsphyxiaUILayoutSwitchButton:SetFrameLevel( G.Panels.RightChatTabsBackground:GetFrameLevel() + 1 )
AsphyxiaUILayoutSwitchButton:RegisterForClicks( "AnyUp" )
AsphyxiaUILayoutSwitchButton:SetScript( "OnClick", function()
	if( IsAddOnLoaded( "AsphyxiaUI_Raid" ) ) then
		DisableAddOn( "AsphyxiaUI_Raid" )
		EnableAddOn( "AsphyxiaUI_Raid_Healing" )
		ReloadUI()
	elseif( IsAddOnLoaded( "AsphyxiaUI_Raid_Healing" ) ) then
		DisableAddOn( "AsphyxiaUI_Raid_Healing" )
		EnableAddOn( "AsphyxiaUI_Raid" )
		ReloadUI()
	elseif not IsAddOnLoaded( "AsphyxiaUI_Raid_Healing" ) and not IsAddOnLoaded( "AsphyxiaUI_Raid" ) then
		EnableAddOn( "AsphyxiaUI_Raid" )
		ReloadUI()
	end
end )

AsphyxiaUILayoutSwitchButton:SetScript( "OnEnter", function( self )
	if( InCombatLockdown() ) then return end

	GameTooltip:ClearLines()
	GameTooltip:SetOwner( self )
	GameTooltip:AddLine( L.Gametooltip_SWITCH_RAIDLAYOUT )
	GameTooltip:Show()
end )

AsphyxiaUILayoutSwitchButton:SetScript( "OnLeave", function( self )
	GameTooltip:Hide()
end )

AsphyxiaUILayoutSwitchButton.Text = S.SetFontString( AsphyxiaUILayoutSwitchButton, unpack( S.FontTemplate.ChatTabText.BuildFont ) )
AsphyxiaUILayoutSwitchButton.Text:Point( "RIGHT", AsphyxiaUILayoutSwitchButton, "RIGHT", -5, 1 )
AsphyxiaUILayoutSwitchButton.Text:SetText( S.RGBToHex( unpack( C["media"]["datatextcolor2"] ) ) .. "switch layout" )

local AsphyxiaUILayoutSwitchIcon = CreateFrame( "Button", "AsphyxiaUILayoutSwitchIcon", UIParent )
AsphyxiaUILayoutSwitchIcon:Size( 19, G.Panels.RightChatTabsBackground:GetHeight() - 4 )
AsphyxiaUILayoutSwitchIcon:Point( "RIGHT", G.Panels.RightChatTabsBackground, "RIGHT", -2, 0 )
AsphyxiaUILayoutSwitchIcon:SetFrameStrata( G.Panels.RightChatTabsBackground:GetFrameStrata() )
AsphyxiaUILayoutSwitchIcon:SetFrameLevel( G.Panels.RightChatTabsBackground:GetFrameLevel() + 1 )
AsphyxiaUILayoutSwitchIcon:SetTemplate( "Default" )

AsphyxiaUILayoutSwitchIcon.Texture = AsphyxiaUILayoutSwitchIcon:CreateTexture( nil, "ARTWORK" )
AsphyxiaUILayoutSwitchIcon.Texture:Point( "TOPLEFT", 2, -2 )
AsphyxiaUILayoutSwitchIcon.Texture:Point( "BOTTOMRIGHT", -2, 2 )
AsphyxiaUILayoutSwitchIcon.Texture:SetTexCoord( 0.08, 0.92, 0.08, 0.92 )

local UpdateTexture = function( self )
	if( IsAddOnLoaded( "AsphyxiaUI_Raid" ) ) then
		newTex = C["media"]["iconlayoutdps"]
	elseif( IsAddOnLoaded( "AsphyxiaUI_Raid_Healing" ) ) then
		newTex = C["media"]["iconlayoutheal"]
	end

	self.Texture:SetTexture( newTex )
end

AsphyxiaUILayoutSwitchIcon:RegisterEvent( "PLAYER_ENTERING_WORLD" )
AsphyxiaUILayoutSwitchIcon:SetScript( "OnEvent", UpdateTexture )