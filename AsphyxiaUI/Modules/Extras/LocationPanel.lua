---------------------------------------------------------------------------------------------
-- AddOn Name: AsphyxiaUI 6.0.0
-- License: MIT
-- Author: Sinaris @ Das Syndikat, Vaecia @ Blackmoore
-- Description: AsphyxiaUI, Editied Tukui Layout
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["intmodules"]["locationpanel"] ~= true ) then return end

local AsphyxiaUILocationPanelZoneText = CreateFrame( "Frame", "AsphyxiaUILocationPanelZoneText", TukuiPetBattleHider )
AsphyxiaUILocationPanelZoneText:Size( 70, 23 )
AsphyxiaUILocationPanelZoneText:Point( "TOP", UIParent, "TOP", 0, -2 )
AsphyxiaUILocationPanelZoneText:SetTemplate( "Default" )
AsphyxiaUILocationPanelZoneText:CreateShadow( "Default" )
AsphyxiaUILocationPanelZoneText:CreateOverlay( AsphyxiaUILocationPanelZoneText )
AsphyxiaUILocationPanelZoneText:SetFrameLevel( 4 )
AsphyxiaUILocationPanelZoneText:EnableMouse( true )

local AsphyxiaUILocationPanelXCoords = CreateFrame( "Frame", "TukuiXCoordsPanel", AsphyxiaUILocationPanelZoneText )
AsphyxiaUILocationPanelXCoords:Size( 35, 19 )
AsphyxiaUILocationPanelXCoords:Point( "RIGHT", AsphyxiaUILocationPanelZoneText, "LEFT", 1, 0 )
AsphyxiaUILocationPanelXCoords:SetTemplate( "Default" )
AsphyxiaUILocationPanelXCoords:CreateShadow( "Default" )
AsphyxiaUILocationPanelXCoords:CreateOverlay( AsphyxiaUILocationPanelXCoords )
AsphyxiaUILocationPanelXCoords:SetFrameLevel( 2 )

local AsphyxiaUILocationPanelYCoords = CreateFrame( "Frame", "TukuiYCoordsPanel", AsphyxiaUILocationPanelZoneText )
AsphyxiaUILocationPanelYCoords:Size( 35, 19 )
AsphyxiaUILocationPanelYCoords:Point( "LEFT", AsphyxiaUILocationPanelZoneText, "RIGHT", -1, 0 )
AsphyxiaUILocationPanelYCoords:SetTemplate( "Default" )
AsphyxiaUILocationPanelYCoords:CreateShadow( "Default" )
AsphyxiaUILocationPanelYCoords:CreateOverlay( AsphyxiaUILocationPanelYCoords )
AsphyxiaUILocationPanelYCoords:SetFrameLevel( 2 )

local AsphyxiaUILocationPanelZoneTextFontString = AsphyxiaUILocationPanelZoneText:CreateFontString( nil, "OVERLAY" )
AsphyxiaUILocationPanelZoneTextFontString:SetFont( S.CreateFontString() )

local AsphyxiaUILocationPanelXCoordsFontString = AsphyxiaUILocationPanelXCoords:CreateFontString( nil, "OVERLAY" )
AsphyxiaUILocationPanelXCoordsFontString:SetFont( S.CreateFontString() )

local AsphyxiaUILocationPanelYCoordsFontString = AsphyxiaUILocationPanelYCoords:CreateFontString( nil, "OVERLAY" )
AsphyxiaUILocationPanelYCoordsFontString:SetFont( S.CreateFontString() )

local function SetLocColor( frame, pvpT )
	if( pvpT == "arena" or pvpT == "combat" ) then
		frame:SetTextColor( 1, 0, 0 )
	elseif( pvpT == "friendly" ) then
		frame:SetTextColor( 0, 1, 0 )
	elseif( pvpT == "contested" ) then
		frame:SetTextColor( 1, 1, 0 )
	elseif( pvpT == "hostile" ) then
		frame:SetTextColor( 1, 0, 0 )
	elseif( pvpT == "sanctuary" ) then
		frame:SetTextColor( 0, .9, .9 )
	else
		frame:SetTextColor( 0, 1, 0 )
	end
end

local function OnEvent()
	location = GetMinimapZoneText()
	pvpType = GetZonePVPInfo()
	AsphyxiaUILocationPanelZoneTextFontString:SetText( location )
	AsphyxiaUILocationPanelZoneText:SetWidth( AsphyxiaUILocationPanelZoneTextFontString:GetStringWidth() + 40 )
	SetLocColor( AsphyxiaUILocationPanelZoneTextFontString, pvpType )
	AsphyxiaUILocationPanelZoneTextFontString:SetPoint( "CENTER", AsphyxiaUILocationPanelZoneText, "CENTER", 1, 1 )
	AsphyxiaUILocationPanelZoneTextFontString:SetJustifyH( "CENTER" )
end

local function xUpdate()
	posX, posY = GetPlayerMapPosition( "player" )
	posX = math.floor( 100 * posX )
	AsphyxiaUILocationPanelXCoordsFontString:SetText( S.RGBToHex( unpack( C["media"]["datatextcolor2"] ) ) .. posX )
	AsphyxiaUILocationPanelXCoordsFontString:SetPoint( "CENTER", AsphyxiaUILocationPanelXCoords, "CENTER", 1, 1 )
end

local function yUpdate()
	posX, posY = GetPlayerMapPosition( "player" )
	posY = math.floor( 100 * posY )
	AsphyxiaUILocationPanelYCoordsFontString:SetText( S.RGBToHex( unpack( C["media"]["datatextcolor2"] ) ) .. posY )
	AsphyxiaUILocationPanelYCoordsFontString:SetPoint( "CENTER", AsphyxiaUILocationPanelYCoords, "CENTER", 1, 1 )
end

AsphyxiaUILocationPanelZoneText:SetScript( "OnMouseDown", function()
	if( WorldMapFrame:IsShown() ) then
		WorldMapFrame:Hide()
	else
		WorldMapFrame:Show()
	end
end )

AsphyxiaUILocationPanelZoneText:SetScript( "OnEnter", function()
	AsphyxiaUILocationPanelZoneTextFontString:SetTextColor( 1, 1, 1 )
end )

AsphyxiaUILocationPanelZoneText:SetScript( "OnLeave", function()
	pvpType = GetZonePVPInfo()
	SetLocColor( AsphyxiaUILocationPanelZoneTextFontString, pvpType )
end )

AsphyxiaUILocationPanelZoneText:RegisterEvent( "ZONE_CHANGED" )
AsphyxiaUILocationPanelZoneText:RegisterEvent( "PLAYER_ENTERING_WORLD" )
AsphyxiaUILocationPanelZoneText:RegisterEvent( "ZONE_CHANGED_INDOORS" )
AsphyxiaUILocationPanelZoneText:RegisterEvent( "ZONE_CHANGED_NEW_AREA" )
AsphyxiaUILocationPanelZoneText:SetScript( "OnEvent", OnEvent )
AsphyxiaUILocationPanelXCoords:SetScript( "OnUpdate", xUpdate )
AsphyxiaUILocationPanelYCoords:SetScript( "OnUpdate", yUpdate )