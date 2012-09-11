---------------------------------------------------------------------------------------------
-- AddOn Name: AsphyxiaUI 6.0.0
-- License: MIT
-- Author: Sinaris @ Das Syndikat, Vaecia @ Blackmoore
-- Description: AsphyxiaUI, Editied Tukui Layout
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["global"]["globalstyle"] ~= "asphyxia" ) then return end

if( C["actionbar"]["enable"] ~= true ) then return end

local bar = TukuiBar2
MultiBarBottomLeft:SetParent( bar )

for i = 1, 12 do
	local b = _G["MultiBarBottomLeftButton" .. i]
	local b2 = _G["MultiBarBottomLeftButton" .. i - 1]
	b:SetSize( S.buttonsize, S.buttonsize )
	b:ClearAllPoints()
	b:SetFrameStrata( "BACKGROUND" )
	b:SetFrameLevel( 15 )

	if( C["actionbar"]["mainswap"] == true ) then
		if( i == 1 ) then
			b:Point( "TOP", ActionButton1, "BOTTOM", 0, -S.buttonspacing )
		else
			b:Point( "LEFT", b2, "RIGHT", S.buttonspacing, 0 )
		end
	else
		if( i == 1 ) then
			b:Point( "BOTTOM", ActionButton1, "TOP", 0, S.buttonspacing )
		else
			b:Point( "LEFT", b2, "RIGHT", S.buttonspacing, 0 )
		end
	end
end

RegisterStateDriver( bar, "visibility", "[vehicleui][petbattle][overridebar] hide; show" )