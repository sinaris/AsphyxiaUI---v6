---------------------------------------------------------------------------------------------
-- AddOn Name: AsphyxiaUI 6.0.0
-- License: MIT
-- Author: Sinaris @ Das Syndikat, Vaecia @ Blackmoore
-- Description: AsphyxiaUI, Editied Tukui Layout
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["databars"]["enable"] ~= true ) then return end

if( C["databars"]["reputation"] ~= true ) then return end

local RepData = {}
local db = C["databars"]["reps"]

local standing = {
	[-6000] = { 0.8, 0.3, 0.22 },
	[-3000] = { 0.8, 0.3, 0.22 },
	[0] =     { 0.75, 0.27, 0 },
	[3000] =  { 0.9, 0.7, 0 },
	[9000] =  { 0, 0.6, 0.1 },
	[21000] = { 0, 0.6, 0.1 },
	[42000] = { 0, 0.6, 0.1 },
	[43000] = { 0, 0.6, 0.1 },
}

for i = 1, GetNumFactions() do
	local name, _, _, bottomValue, topValue, earnedValue, _, _, _, _, _, _, _ = GetFactionInfo( i )
	local min, max = earnedValue - bottomValue, topValue - bottomValue

	if( name == db[1] or name == db[2] or name == db[3] or name == db[4] or name == db[5] ) then
		local AsphyxiaUIReputationData = CreateFrame( "Frame", "AsphyxiaUIReputationData" .. i, UIParent )
		AsphyxiaUIReputationData:Size( 153, 18 )
		AsphyxiaUIReputationData:SetPoint( "CENTER", UIParent, "CENTER", 0, 0 )
		AsphyxiaUIReputationData:SetTemplate( "Transparent" )
		AsphyxiaUIReputationData:EnableMouse( true )
		AsphyxiaUIReputationData:Animate( 160, 0, 0.4 )
		AsphyxiaUIReputationData:Hide()

		AsphyxiaUIReputationData.Status = CreateFrame( "StatusBar", "RepDataStatus" .. i, AsphyxiaUIReputationData )
		AsphyxiaUIReputationData.Status:SetFrameLevel( 12 )
		AsphyxiaUIReputationData.Status:SetStatusBarTexture( C["media"]["normTex"] )
		AsphyxiaUIReputationData.Status:SetMinMaxValues( 0, max )
		AsphyxiaUIReputationData.Status:SetValue( min )
		AsphyxiaUIReputationData.Status:SetStatusBarColor( unpack( standing[topValue] ) )
		AsphyxiaUIReputationData.Status:Point( "TOPLEFT", AsphyxiaUIReputationData, "TOPLEFT", 2, -2 )
		AsphyxiaUIReputationData.Status:Point( "BOTTOMRIGHT", AsphyxiaUIReputationData, "BOTTOMRIGHT", -2, 2 )

		AsphyxiaUIReputationData.Text = AsphyxiaUIReputationData.Status:CreateFontString( nil, "OVERLAY" )
		AsphyxiaUIReputationData.Text:SetFont( unpack( S.FontTemplate.DatabarsReputationText.BuildFont ) )
		AsphyxiaUIReputationData.Text:Point( "LEFT", AsphyxiaUIReputationData, "LEFT", 6, 0 )
		AsphyxiaUIReputationData.Text:SetShadowColor( 0, 0, 0 )
		AsphyxiaUIReputationData.Text:SetShadowOffset( 1.25, -1.25 )
		AsphyxiaUIReputationData.Text:SetText( format( "%s / %s", min, max ) )
		AsphyxiaUIReputationData.Text:Hide()

		AsphyxiaUIReputationData.Name = AsphyxiaUIReputationData.Status:CreateFontString( nil, "OVERLAY" )
		AsphyxiaUIReputationData.Name:SetFont( unpack( S.FontTemplate.DatabarsReputationName.BuildFont ) )
		AsphyxiaUIReputationData.Name:Point( "LEFT", AsphyxiaUIReputationData, "LEFT", 6, 0 )
		AsphyxiaUIReputationData.Name:SetShadowColor( 0, 0, 0 )
		AsphyxiaUIReputationData.Name:SetShadowOffset( 1.25, -1.25 )
		AsphyxiaUIReputationData.Name:SetText( name )

		AsphyxiaUIReputationData:SetScript( "OnEnter", function( self )
			self.Name:Hide()
			self.Text:Show()
		end )

		AsphyxiaUIReputationData:SetScript( "OnLeave", function( self )
			self.Name:Show()
			self.Text:Hide()
		end )

		AsphyxiaUIReputationData.id = i
		AsphyxiaUIReputationData.Status = AsphyxiaUIReputationData.Status
		AsphyxiaUIReputationData.Text = AsphyxiaUIReputationData.Text

		tinsert( RepData, AsphyxiaUIReputationData )
	end
end

for key, frame in ipairs( RepData ) do
	frame:ClearAllPoints()
	if( key == 1 ) then
		frame:Point( "TOP", TukuiMinimap, "BOTTOM", 0, -3 )
	else
		frame:Point( "TOP", RepData[key - 1], "BOTTOM", 0, -3 )
	end
end

local update = function()
	for _, frame in ipairs(RepData) do
		local name, _, _, bottomValue, topValue, earnedValue, _, _, _, _, _, _, _ = GetFactionInfo( frame.id )
		local min, max = earnedValue - bottomValue, topValue - bottomValue

		frame.Status:SetValue( min )
		frame.Text:SetText( format("%s / %s", min, max ) )
	end
end

local AsphyxiaUIReputationToggleButton = CreateFrame( "Frame", "AsphyxiaUIReputationToggleButton", G.Panels.RightChatBackground )
AsphyxiaUIReputationToggleButton:Size( 30, 15 )
AsphyxiaUIReputationToggleButton:Point( "TOPRIGHT", G.Panels.RightChatBackground, "TOPRIGHT", -5, -52 )
AsphyxiaUIReputationToggleButton:SetTemplate( "Default" )
AsphyxiaUIReputationToggleButton:EnableMouse( true )
AsphyxiaUIReputationToggleButton:SetFrameStrata( "MEDIUM" )
AsphyxiaUIReputationToggleButton:SetFrameLevel( 10 )
AsphyxiaUIReputationToggleButton:CreateShadow( "Default" )
AsphyxiaUIReputationToggleButton:CreateOverlay( AsphyxiaUIReputationToggleButton )
AsphyxiaUIReputationToggleButton:SetAlpha( 0 )
AsphyxiaUIReputationToggleButton:HookScript( "OnEnter", S.SetModifiedBackdrop )
AsphyxiaUIReputationToggleButton:HookScript( "OnLeave", S.SetOriginalBackdrop )
AsphyxiaUIReputationToggleButton:SetScript( "OnEnter", function( self )
	if( InCombatLockdown() ) then
		print( ERR_NOT_IN_COMBAT )
		return
	end

	AsphyxiaUIReputationToggleButton:FadeIn()

	GameTooltip:ClearLines()
	GameTooltip:SetOwner( self )
	GameTooltip:AddLine( L.Gametooltip_SHOW_HIDE_REPUTATION )
	GameTooltip:Show()
end )

AsphyxiaUIReputationToggleButton:SetScript( "OnLeave", function( self )
	AsphyxiaUIReputationToggleButton:FadeOut()

	GameTooltip:Hide()
end )

AsphyxiaUIReputationToggleButton.Text = AsphyxiaUIReputationToggleButton:CreateFontString( nil, "OVERLAY" )
AsphyxiaUIReputationToggleButton.Text:SetFont( unpack( S.FontTemplate.DatabarsReputationTglBtn.BuildFont ) )
AsphyxiaUIReputationToggleButton.Text:Point( "CENTER", AsphyxiaUIReputationToggleButton, "CENTER", 0, 0 )
AsphyxiaUIReputationToggleButton.Text:SetText( S.RGBToHex( unpack( C["media"]["datatextcolor2"] ) ) .. "R" )
AsphyxiaUIReputationToggleButton:SetScript( "OnMouseUp", function( self )
	for _, frame in pairs( RepData ) do
		if( frame and frame:IsVisible() ) then
			frame:SlideOut()
		else
			frame:SlideIn()
		end
	end
end )

local updater = CreateFrame( "Frame" )
updater:RegisterEvent( "PLAYER_ENTERING_WORLD" )
updater:RegisterEvent( "UPDATE_FACTION" )
updater:SetScript( "OnEvent", update )