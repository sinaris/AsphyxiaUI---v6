---------------------------------------------------------------------------------------------
-- AsphyxiaUI
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["global"]["panellayout"] ~= "duffed" ) then return end

if( C["actionbar"]["enable"] ~= true ) then return end

local bar = TukuiBar1
MultiBarBottomLeft:SetParent( bar )

for i = 1, 12 do
	local b = _G["MultiBarBottomLeftButton" .. i]
	local b2 = _G["MultiBarBottomLeftButton" .. i - 1]
	b:SetSize( S.buttonsize, S.buttonsize )
	b:ClearAllPoints()
	b:SetFrameStrata( "BACKGROUND" )
	b:SetFrameLevel( 15 )

	if( C["actionbar"]["duffedablayout"] == 2 and C["actionbar"]["duffedswapbar1and3"] == true ) then
		if( i == 1 ) then
			b:SetPoint( "BOTTOMLEFT", bar, S.buttonspacing, S.buttonspacing )
		else
			b:SetPoint( "LEFT", b2, "RIGHT", S.buttonspacing, 0 )
		end
	else
		if( i == 1 ) then
			if( C["actionbar"]["duffedablayout"] == 2 ) then
				b:SetPoint( "TOPLEFT", bar, "TOPLEFT", S.buttonspacing, -S.buttonspacing )
			else
				b:SetPoint( "BOTTOMLEFT", bar, "BOTTOM", S.buttonspacing / 2, S.buttonspacing )
			end
		else
			b:SetPoint( "LEFT", b2, "RIGHT", S.buttonspacing, 0 )
		end
	end
end