---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["actionbar"]["enable"] ~= true ) then return end

local bar = TukuiBar3
MultiBarBottomRight:SetParent( bar )

for i = 1, 12 do
	local b = _G["MultiBarLeftButton" .. i]
	local b2 = _G["MultiBarLeftButton" .. i - 1]
	b:Size( S.buttonsize, S.buttonsize )
	b:ClearAllPoints()
	b:SetFrameStrata( "BACKGROUND" )
	b:SetFrameLevel( 15 )
end

RegisterStateDriver( bar, "visibility", "[vehicleui][petbattle][overridebar] hide; show" )