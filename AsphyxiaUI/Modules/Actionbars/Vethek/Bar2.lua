---------------------------------------------------------------------------------------------
-- AddOn Name: AsphyxiaUI 6.0.0
-- License: MIT
-- Author: Sinaris @ Das Syndikat, Vaecia @ Blackmoore
-- Description: AsphyxiaUI, Editied Tukui Layout
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["global"]["globalstyle"] ~= "vethek" ) then return end

if( C["actionbar"]["enable"] ~= true ) then return end

local bar = TukuiBar2
MultiBarBottomLeft:SetParent( bar )

for i = 1, 12 do
	local b = _G["MultiBarBottomLeftButton" .. i]
	local b2 = _G["MultiBarBottomLeftButton" .. i - 1]
	b:SetSize( S.buttonsize, S.buttonsize )
	b:ClearAllPoints()
	b:SetFrameStrata("BACKGROUND")
	b:SetFrameLevel(15)
	
	if( i == 1 ) then
		b:SetPoint( "BOTTOMLEFT", bar, S.buttonspacing, S.buttonspacing)
	elseif i == 7 then
		b:SetPoint( "TOPLEFT", bar, S.buttonspacing, -S.buttonspacing)
	else
		b:SetPoint( "LEFT", b2, "RIGHT", S.buttonspacing, 0)
	end
end

for i = 7, 12 do
	local b = _G["MultiBarBottomLeftButton"..i]
	local b2 = _G["MultiBarBottomLeftButton1"]
	b:SetFrameLevel(b2:GetFrameLevel() - 2)
end

RegisterStateDriver( bar, "visibility", "[vehicleui][petbattle][overridebar] hide; show" )