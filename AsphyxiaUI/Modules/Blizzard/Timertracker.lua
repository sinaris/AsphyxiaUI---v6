---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

local function SkinIt( bar )
	local _, originalPoint, _, _, _ = bar:GetPoint()

	for i = 1, bar:GetNumRegions() do
		local region = select( i, bar:GetRegions() )
		if( region:GetObjectType() == "FontString" ) then
			region:SetFont( S.CreateFontString() )
		end
	end

	bar.backdrop:SetTemplate( "Transparent" )
	bar.backdrop:CreateShadow( "Default" )
end

local function SkinBlizzTimer( self, event )
	for _, b in pairs( TimerTracker.timerList ) do
		if( b["bar"]["skinned"] ) then
			SkinIt( b["bar"] )
		end
	end
end

local load = CreateFrame( "Frame" )
load:RegisterEvent( "START_TIMER" )
load:SetScript( "OnEvent", SkinBlizzTimer )