---------------------------------------------------------------------------------------------
-- AddOn Name: AsphyxiaUI 6.0.0
-- License: MIT
-- Author: Sinaris @ Das Syndikat, Vaecia @ Blackmoore
-- Description: AsphyxiaUI, Editied Tukui Layout
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["global"]["globalstyle"] ~= "vethek" ) then return end

local bar = TukuiBar1
local ButtonSize = 38
local ButtonSpacing = 2

bar:HookScript( "OnEvent", function( self, event, unit )
	if( event == "PLAYER_ENTERING_WORLD" ) then
		local button
		
		for i = 1, 12 do
			button = _G["ActionButton" .. i]
			button:SetSize( ButtonSize, ButtonSize )
			button:ClearAllPoints()
			button:SetParent( bar )
			button:SetFrameStrata( "BACKGROUND" )
			button:SetFrameLevel( 15 )

			if( i == 1 ) then
				button:SetPoint( "TOPLEFT", ButtonSpacing, -ButtonSpacing )
			elseif( i == 7 ) then
				button:SetPoint( "BOTTOMLEFT", ButtonSpacing, ButtonSpacing )
			else
				local previous = _G["ActionButton" .. i - 1]
				button:SetPoint( "LEFT", previous, "RIGHT", ButtonSpacing, 0 )
			end
		end
	end
end )