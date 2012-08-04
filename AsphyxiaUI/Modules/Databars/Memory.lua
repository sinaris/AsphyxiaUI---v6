---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["databars"]["memory"] == 0 ) then return end

local barNum = C["databars"]["memory"]

S.databars[barNum]:Show()

local Stat = CreateFrame( "Frame", "AsphyxiaUIDataBarValueFrames", S.databars[barNum] )
Stat:EnableMouse( true )
Stat:SetFrameStrata( "BACKGROUND" )
Stat:SetFrameLevel( 4 )
Stat.tooltip = false
Stat:ClearAllPoints()
Stat:SetAllPoints( S.databars[barNum] )

local StatusBar = S.databars[barNum].statusbar
local Text = S.databars[barNum].Text

local bandwidthString = "%.2f Mbps"
local percentageString = "%.2f%%"

local kiloByteString = "%d" .. S.RGBToHex( unpack( C["media"]["datatextcolor2"] ) ) .. " kb"
local megaByteString = "%.2f" .. S.RGBToHex( unpack( C["media"]["datatextcolor2"] ) ) .. " mb"

local function formatMem( memory )
	local mult = 10^1
	if( memory > 999 ) then
		local mem = ( ( memory / 1024 ) * mult ) / mult
		return string.format( megaByteString, mem )
	else
		local mem = ( memory * mult ) / mult
		return string.format( kiloByteString, mem )
	end
end

local memoryTable = {}

local function RebuildAddonList( self )
	local addOnCount = GetNumAddOns()
	if( addOnCount == #memoryTable ) or self.tooltip == true then return end

	memoryTable = {}
	for i = 1, addOnCount do
		memoryTable[i] = { i, select( 2, GetAddOnInfo( i ) ), 0, IsAddOnLoaded( i ) }
	end
	self:SetAllPoints( S.databars[barNum] )
end

local function UpdateMemory()
	UpdateAddOnMemoryUsage()

	local addOnMem = 0
	local totalMemory = 0
	for i = 1, #memoryTable do
		addOnMem = GetAddOnMemoryUsage( memoryTable[i][1] )
		memoryTable[i][3] = addOnMem
		totalMemory = totalMemory + addOnMem
	end

	table.sort( memoryTable, function( a, b )
		if( a and b ) then
			return a[3] > b[3]
		end
	end )

	return totalMemory
end

local int = 10

local function Update( self, t )
	int = int - t

	if( int < 0 ) then
		RebuildAddonList( self )
		local total = UpdateMemory()
		Text:SetText( formatMem( total ) )
		Text:SetShadowOffset( 1.25, -1.25 )
		StatusBar:SetMinMaxValues( 0, 10000 )
		StatusBar:SetValue( total )
		StatusBar:SetStatusBarColor( 41 / 255, 79 / 255, 155 / 255 )
		int = 10
	end
end

Stat:SetScript( "OnMouseDown", function ()
	collectgarbage( "collect" )
	Update( Stat, 10 )
end )
Stat:SetScript( "OnEnter", function( self )
	if( not InCombatLockdown() ) then
		self.tooltip = true
		local bandwidth = GetAvailableBandwidth()
		local xoff, yoff = S.DataBarTooltipAnchor( barNum )
		GameTooltip:SetOwner( S.databars[barNum], "ANCHOR_BOTTOMRIGHT", xoff, yoff )
		GameTooltip:ClearLines()
		if( bandwidth ~= 0 ) then
			GameTooltip:AddDoubleLine( L.datatext_bandwidth, string.format( bandwidthString, bandwidth ), 0.69, 0.31, 0.31, 0.84, 0.75, 0.65 )
			GameTooltip:AddDoubleLine( L.datatext_download, string.format( percentageString, GetDownloadedPercentage() * 100 ), 0.69, 0.31, 0.31, 0.84, 0.75, 0.65 )
			GameTooltip:AddLine( " " )
		end

		local totalMemory = UpdateMemory()
		GameTooltip:AddDoubleLine( L.datatext_totalmemusage, formatMem( totalMemory ), 0.69, 0.31, 0.31, 0.84, 0.75, 0.65 )
		GameTooltip:AddLine( " " )
		for i = 1, #memoryTable do
			if( memoryTable[i][4] ) then
				local red = memoryTable[i][3] / totalMemory
				local green = 1 - red
				GameTooltip:AddDoubleLine( memoryTable[i][2], formatMem( memoryTable[i][3] ), 1, 1, 1, red, green + .5, 0 )
			end
		end
		GameTooltip:Show()
		GameTooltip:SetTemplate( "Transparent" )
	end
end )
Stat:SetScript( "OnLeave", function( self )
	self.tooltip = false
	GameTooltip:Hide()
end )
Stat:SetScript( "OnUpdate", Update )
Stat:SetScript( "OnEvent", function( self, event )
	collectgarbage( "collect" )
end )
Update( Stat, 10 )