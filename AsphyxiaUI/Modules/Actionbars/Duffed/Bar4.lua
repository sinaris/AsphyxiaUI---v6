---------------------------------------------------------------------------------------------
-- AsphyxiaUI
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["global"]["panellayout"] ~= "duffed" ) then return end

if( C["actionbar"]["enable"] ~= true ) then return end

local bar = TukuiBar3
MultiBarLeft:SetParent( bar )

for i = 1, 12 do
	local b = _G["MultiBarLeftButton" .. i]
	local b2 = _G["MultiBarLeftButton" .. i - 1]
	b:SetSize( S.buttonsize, S.buttonsize )
	b:ClearAllPoints()
	b:SetFrameStrata( "BACKGROUND" )
	b:SetFrameLevel( 15 )

	if( i == 1 ) then
		b:SetPoint( "TOPLEFT", bar, S.buttonspacing, -S.buttonspacing )
	else
		b:SetPoint( "TOP", b2, "BOTTOM", 0, -S.buttonspacing )
	end
end