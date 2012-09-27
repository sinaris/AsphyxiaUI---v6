---------------------------------------------------------------------------------------------
-- AddOn Name: AsphyxiaUI 6.0.0
-- License: MIT
-- Author: Sinaris @ Das Syndikat, Vaecia @ Blackmoore
-- Description: AsphyxiaUI, Editied Tukui Layout
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["global"]["globalstyle"] ~= "asphyxia" ) then return end

G.Maps.Minimap:ClearAllPoints()

G.Maps.Minimap.Zone.Text:SetFont( unpack( S.FontTemplate.MinimapCords.BuildFont ) )
G.Maps.Minimap.Coord.Text:SetFont( unpack( S.FontTemplate.MinimapCords.BuildFont ) )

G.Maps.Minimap:Size( 153 )
G.Maps.Minimap:Size( 153 )
G.Maps.Minimap:Point( "TOPRIGHT", UIParent, "TOPRIGHT", -34, -2 )
G.Maps.Minimap:CreateShadow( "Default" )

Minimap:Size( 153 )

local AsphyxiaUIMinimapToggleButton = CreateFrame( "Button", "AsphyxiaUIMinimapToggleButton", UIParent )
AsphyxiaUIMinimapToggleButton:Size( 11, 30 )
AsphyxiaUIMinimapToggleButton:SetPoint( "TOPLEFT", TukuiAurasPlayerBuffs, "TOPRIGHT", 3, 0 )
AsphyxiaUIMinimapToggleButton:SetTemplate("Default")
AsphyxiaUIMinimapToggleButton:CreateShadow( "Default" )
AsphyxiaUIMinimapToggleButton:CreateOverlay( AsphyxiaUIMinimapToggleButton )
AsphyxiaUIMinimapToggleButton:FadeOut()

AsphyxiaUIMinimapToggleButton.Text = S.SetFontString( AsphyxiaUIMinimapToggleButton, unpack( S.FontTemplate.ButtonsDefault.BuildFont ) )
AsphyxiaUIMinimapToggleButton.Text:Point( "CENTER", AsphyxiaUIMinimapToggleButton, "CENTER", 0, 0 )
AsphyxiaUIMinimapToggleButton.Text:SetText( "|cffFF0000-|r" )

AsphyxiaUIMinimapToggleButton:SetScript( "OnMouseDown", function()
	if( TukuiMinimap:IsVisible() ) then
		TukuiMinimap:Hide()
		TukuiAurasPlayerBuffs:ClearAllPoints()
		TukuiAurasPlayerBuffs:Point( "TOPRIGHT", -16, -2 )
		TukuiAurasPlayerDebuffs:Point( "TOPRIGHT", -16, -142 )
		AsphyxiaUIMinimapToggleButton.Text:SetText( "|cff00FF00+|r" )
	else
		TukuiMinimap:Show()
		TukuiAurasPlayerBuffs:ClearAllPoints()
		TukuiAurasPlayerBuffs:Point( "TOPRIGHT", UIParent, -204, -2 )
		TukuiAurasPlayerDebuffs:Point( "TOPRIGHT", UIParent, -204, -137 )
		AsphyxiaUIMinimapToggleButton.Text:SetText( "|cffFF0000-|r" )
	end
end )

AsphyxiaUIMinimapToggleButton:SetScript( "OnEnter", function( self )
	if( InCombatLockdown() ) then return end
	AsphyxiaUIMinimapToggleButton:FadeIn()

	GameTooltip:ClearLines()
	GameTooltip:SetOwner( self )
	GameTooltip:AddLine( L.Gametooltip_SHOW_HIDE_MINIMAP )
	GameTooltip:Show()
end )

AsphyxiaUIMinimapToggleButton:SetScript( "OnLeave", function( self )
	AsphyxiaUIMinimapToggleButton:FadeOut()

	GameTooltip:Hide()
end )