---------------------------------------------------------------------------------------------
-- AsphyxiaUI
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["databars"]["latency"] == 0 ) then return end

local barNum = C["databars"]["latency"]

S.databars[barNum]:Show()

local Stat = CreateFrame( "Frame", nil, S.databars[barNum] )
Stat:EnableMouse( true )
Stat:SetFrameStrata( "BACKGROUND" )
Stat:SetFrameLevel( 4 )

local StatusBar = S.databars[barNum].statusbar
local Text = S.databars[barNum].Text

local int = 1
local function Update( self, t )
	int = int - t
	if( int < 0 ) then
		local ms = select( 3, GetNetStats() )
		local max = 400
		Text:SetText( ms .. S.RGBToHex( unpack( C["media"]["datatextcolor2"] ) ) .. " MS" )
		Text:SetShadowOffset( 1.25, -1.25 )
		StatusBar:SetMinMaxValues( 0, 400 )
		StatusBar:SetValue( ms )
		self:SetAllPoints( S.databars[barNum] )	

		if( ms * 100 / max <= 35 ) then
			StatusBar:SetStatusBarColor( 30 / 255, 1, 30 / 255, 0.8 )
		elseif( ms * 100 / max > 35 and ms * 100 / max < 75 ) then
			StatusBar:SetStatusBarColor( 1, 180 / 255, 0, 0.8 )
		else
			StatusBar:SetStatusBarColor( 1, 75 / 255, 75 / 255, 0.5, 0.8 )
		end

		int = 1
	end	
end
Stat:SetScript( "OnUpdate", Update )
Update( Stat, 10 )

Stat:SetScript("OnEnter", function(self)
	if not InCombatLockdown() then
		local xoff, yoff = S.DataBarTooltipAnchor( barNum )
		GameTooltip:SetOwner( S.databars[barNum], "ANCHOR_BOTTOMRIGHT", xoff, yoff )

		local _, _, latencyHome, latencyWorld = GetNetStats()
		local latency = format( MAINMENUBAR_LATENCY_LABEL, latencyHome, latencyWorld )
		GameTooltip:ClearLines()
		GameTooltip:AddLine( latency )
		GameTooltip:Show()
		GameTooltip:SetTemplate( "Transparent" )
	end
end )
Stat:SetScript( "OnLeave", function() GameTooltip:Hide() end )