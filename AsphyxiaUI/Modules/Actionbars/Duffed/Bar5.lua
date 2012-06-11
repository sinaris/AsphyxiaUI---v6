---------------------------------------------------------------------------------------------
-- AsphyxiaUI
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["global"]["panellayout"] ~= "duffed" ) then return end

if( C["actionbar"]["enable"] ~= true ) then return end

local bar = TukuiBar3
MultiBarRight:SetParent( bar )

for i = 1, 12 do
	local b = _G["MultiBarRightButton" .. i]
	local b2 = _G["MultiBarRightButton" .. i - 1]
	b:SetSize( S.buttonsize, S.buttonsize )
	b:ClearAllPoints()
	b:SetFrameStrata( "MEDIUM" )
	b:SetFrameLevel( 13 )

	if( i == 1 ) then
		b:SetPoint( "TOPRIGHT", bar, -S.buttonspacing, -S.buttonspacing )
	else
		b:SetPoint( "TOP", b2, "BOTTOM", 0, -S.buttonspacing )
	end
end