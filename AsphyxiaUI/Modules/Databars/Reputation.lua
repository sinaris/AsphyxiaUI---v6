---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["databars"]["reputation"] ~= true ) then return end

local RepData = {}
local db = C["databars"]["reps"]

local standing = {
	[-6000] = { 255 / 255, 0, 51 / 255 },			-- Hated :(
	[-3000] = { 255 / 255, 0, 51 / 255 },			-- Hostile
	[0] =     { 255 / 255, 0, 51 / 255 },			-- Unfriendly
	[3000] =  { 255 / 255, 204 / 255, 102 / 255 },	-- Neutral
	[9000] =  { 75 / 255, 175 / 255, 76 / 255 },	-- Friendly
	[21000] = { 75 / 255, 175 / 255, 76 / 255 },	-- Honored
	[42000] = { 75 / 255, 175 / 255, 76 / 255 },	-- Revered
	[43000] = { 75 / 255, 175 / 255, 76 / 255 },	-- Exalted
}

for i = 1, GetNumFactions() do
	local name, _, _, bottomValue, topValue, earnedValue, _, _, _, _, _, _, _ = GetFactionInfo( i )
	local min, max = earnedValue - bottomValue, topValue - bottomValue

	if( name == db[1] or name == db[2] or name == db[3] or name == db[4] or name == db[5] ) then
		local frame = CreateFrame( "Frame", "RepData" .. i, UIParent )
		frame:Size( 153, 18 )
		frame:Point( "CENTER", UIParent, "CENTER", 0, 0 )
		frame:SetTemplate( "Transparent" )
		frame:CreateShadow( "Default" )
		frame:EnableMouse( true )
		frame:Animate( 160, 0, 0.4 )
		frame:Hide()

		frame.Status = CreateFrame( "StatusBar", "RepDataStatus" .. i, frame )
		frame.Status:SetFrameLevel( 12 )
		frame.Status:SetStatusBarTexture( C["media"]["normTex"] )
		frame.Status:SetMinMaxValues( 0, max )
		frame.Status:SetValue( min )
		frame.Status:SetStatusBarColor( unpack( standing[topValue] ) )
		frame.Status:Point( "TOPLEFT", frame, "TOPLEFT", 2, -2 )
		frame.Status:Point( "BOTTOMRIGHT", frame, "BOTTOMRIGHT", -2, 2 )

		frame.Text = frame.Status:CreateFontString( nil, "OVERLAY" )
		frame.Text:SetFont( S.CreateFontString() )
		frame.Text:Point( "LEFT", frame, "LEFT", 6, 1 )
		frame.Text:SetShadowColor( 0, 0, 0 )
		frame.Text:SetShadowOffset( 1.25, -1.25 )
		frame.Text:SetText( format( "%s / %s", min, max ) )
		frame.Text:Hide()

		frame.Name = frame.Status:CreateFontString( nil, "OVERLAY" )
		frame.Name:SetFont( S.CreateFontString() )
		frame.Name:Point( "LEFT", frame, "LEFT", 6, 1 )
		frame.Name:SetShadowColor( 0, 0, 0 )
		frame.Name:SetShadowOffset( 1.25, -1.25 )
		frame.Name:SetText( name )

		frame:SetScript( "OnEnter", function( self )
			self.Name:Hide()
			self.Text:Show()
		end )

		frame:SetScript( "OnLeave", function( self )
			self.Name:Show()
			self.Text:Hide()
		end )

		frame.id = i
		frame.Status = frame.Status
		frame.Text = frame.Text

		tinsert( RepData, frame )
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

local toggle = CreateFrame( "Frame", "RepToggle", UIParent )
toggle:Size( 30, 15 )
toggle:Point( "TOPRIGHT", AsphyxiaUIRightChatBackground, "TOPRIGHT", -5, -52 )
toggle:SetTemplate( "Default" )
toggle:EnableMouse( true )
toggle:SetFrameStrata( "MEDIUM" )
toggle:SetFrameLevel( 10 )
toggle:CreateShadow( "Default" )
toggle:CreateOverlay( toggle )
toggle:SetAlpha( 0 )
toggle:HookScript( "OnEnter", S.SetModifiedBackdrop )
toggle:HookScript( "OnLeave", S.SetOriginalBackdrop )
toggle:SetScript( "OnEnter", function()
	if( InCombatLockdown() ) then return end
	toggle:FadeIn()
end )

toggle:SetScript( "OnLeave", function()
	toggle:FadeOut()
end )

toggle.Text = toggle:CreateFontString( nil, "OVERLAY" )
toggle.Text:SetFont( S.CreateFontString() )
toggle.Text:Point( "CENTER", toggle, "CENTER", 1, 1 )
toggle.Text:SetText( S.RGBToHex( unpack( C["media"]["datatextcolor2"] ) ) .. "R" )
toggle:SetScript( "OnMouseUp", function( self )
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