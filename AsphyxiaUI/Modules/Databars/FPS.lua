---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["databars"]["framerate"] == 0 ) then return end

local barNum = C["databars"]["framerate"]

S.databars[barNum]:Show()

local Stat = CreateFrame( "Frame", "AsphyxiaUIDataBarValueFrames", S.databars[barNum] )
Stat:EnableMouse( true )
Stat:SetFrameStrata( "BACKGROUND" )
Stat:SetFrameLevel( 4 )

local StatusBar = S.databars[barNum].statusbar
local Text = S.databars[barNum].Text

local int = 1
local function Update( self, t )
	int = int - t
	if( int < 0 ) then
		local fps = floor( GetFramerate() )
		Text:SetText( fps .. S.RGBToHex( unpack( C["media"]["datatextcolor2"] ) ) .. " FPS" )
		Text:SetShadowOffset( 1.25, -1.25 )
		StatusBar:SetMinMaxValues( 0, GetCVar( "maxFPS" ) )
		StatusBar:SetValue( fps )
		self:SetAllPoints( S.databars[barNum] )
		if( fps > 50 ) then
			StatusBar:SetStatusBarColor( 30 / 255, 1, 30 / 255, 0.8 )
		elseif fps > 45 then
			StatusBar:SetStatusBarColor( 1, 180 / 255, 0, 0.8 )
		else
			StatusBar:SetStatusBarColor( 1, 75 / 255, 75 / 255, 0.5, 0.8 )
		end
		int = 1
	end	
end
Stat:SetScript( "OnUpdate", Update )
Update( Stat, 10 )