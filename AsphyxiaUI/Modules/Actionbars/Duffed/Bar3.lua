---------------------------------------------------------------------------------------------
-- AsphyxiaUI
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["global"]["panellayout"] ~= "duffed" ) then return end

if( C["actionbar"]["enable"] ~= true ) then return end

if( C["actionbar"]["duffedablayout"] ~= 1 ) then
	local barL = TukuiBar2
	local barR = TukuiBar4
	barR:SetParent( barL )
	MultiBarBottomRight:SetParent( barL )

	for i = 1, 12 do
		local b = _G["MultiBarBottomRightButton" .. i]
		local b2 = _G["MultiBarBottomRightButton" .. i - 1]
		b:SetSize( S.buttonsize, S.buttonsize )
		b:ClearAllPoints()
		b:SetFrameStrata( "BACKGROUND" )
		b:SetFrameLevel( 15 )

		if( i == 1 ) then
			b:SetPoint( "TOPLEFT", barL, S.buttonspacing, -S.buttonspacing )
		elseif( i == 4 ) then
			b:SetPoint( "BOTTOMLEFT", barL, S.buttonspacing, S.buttonspacing )
		elseif( i == 7 ) then
			b:SetPoint ( "TOPLEFT", barR, S.buttonspacing, -S.buttonspacing )
		elseif( i == 10 ) then
			b:SetPoint ( "BOTTOMLEFT", barR, S.buttonspacing, S.buttonspacing )
		else
			b:SetPoint ( "LEFT", b2, "RIGHT", S.buttonspacing, 0 )
		end
	end
else
	local bar = TukuiBar2
	if( C["actionbar"]["duffedswapbar1and3"] == true and C["actionbar"]["duffedablayout"] == 1 ) then
		bar = TukuiBar1
	end

	MultiBarBottomRight:SetParent( bar )

	for i = 1, 12 do
		local b = _G["MultiBarBottomRightButton" .. i]
		local b2 = _G["MultiBarBottomRightButton" .. i - 1]
		b:SetSize( S.buttonsize, S.buttonsize )
		b:ClearAllPoints()
		b:SetFrameStrata( "MEDIUM" )
		b:SetFrameLevel( 15 )

		if( i == 1 ) then
			b:SetPoint( "BOTTOMLEFT", bar, S.buttonspacing, S.buttonspacing )
		else
			b:SetPoint( "LEFT", b2, "RIGHT", S.buttonspacing, 0 )
		end
	end
end