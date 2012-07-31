---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["actionbar"]["enable"] ~= true ) then return end

local bar = TukuiBar4
MultiBarBottomRight:SetParent( bar )

for i = 1, 12 do
	local b = _G["MultiBarBottomRightButton" .. i]
	local b2 = _G["MultiBarBottomRightButton" .. i - 1]
	b:Size( S.buttonsize, S.buttonsize )
	b:ClearAllPoints()
	b:SetFrameStrata( "BACKGROUND" )
	b:SetFrameLevel( 15 )

	if( i == 1 ) then
		if( C["actionbar"]["vertical_rightbars"] == true ) then
			b:Point( "TOPRIGHT", _G["MultiBarRightButton1"], "TOPLEFT", -S.buttonspacing, 0 )
		else
			b:Point( "BOTTOMLEFT", _G["MultiBarRightButton1"], "TOPLEFT", 0, S.buttonspacing )
		end
	else
		if( C["actionbar"]["vertical_rightbars"] == true ) then
			b:Point( "TOP", b2, "BOTTOM", 0, -S.buttonspacing )
		else
			b:Point( "LEFT", b2, "RIGHT", S.buttonspacing, 0 )
		end
	end
end