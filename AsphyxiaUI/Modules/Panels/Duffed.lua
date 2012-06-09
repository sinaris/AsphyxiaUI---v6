---------------------------------------------------------------------------------------------
-- AsphyxiaUI
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["global"]["panellayout"] ~= "duffed" ) then return end

print( "panel: duffed" )

------------------------------
-- not needed
------------------------------
local panelsToKill = {  }

for _, panels in pairs( panelsToKill ) do
	panels:Kill()
end

------------------------------
-- actionbars
------------------------------
G.ActionBars.Bar1:ClearAllPoints()
if( C["actionbar"]["duffedablayout"] == 1 ) then
	G.ActionBars.Bar1:SetPoint( "BOTTOM", UIParent, "BOTTOM", 0, 26 )
	G.ActionBars.Bar1:Size( ( S.buttonsize * 24 ) + ( S.buttonspacing * 25 ), ( S.buttonsize * 1 ) + ( S.buttonspacing * 2 ) )
else
	G.ActionBars.Bar1:SetPoint( "BOTTOM", UIParent, "BOTTOM", 0, 67 )
	G.ActionBars.Bar1:Size( ( S.buttonsize * 12 ) + ( S.buttonspacing * 13 ), ( S.buttonsize * 2 ) + ( S.buttonspacing * 3 ) )
end




--G.ActionBars.Bar1:CreateShadow( "Default" )
--G.ActionBars.Bar1:SetTemplate( "Transparent" )