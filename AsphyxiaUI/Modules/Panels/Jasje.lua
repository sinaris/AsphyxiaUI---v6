---------------------------------------------------------------------------------------------
-- AsphyxiaUI
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["global"]["panellayout"] ~= "jasje" ) then return end

print( "panel: jasje" )

------------------------------
-- not needed
------------------------------
local panelsToKill = { G.Panels.BottomLeftVerticalLine, G.Panels.BottomRightVerticalLine, G.Panels.BottomLeftCube, G.Panels.BottomRightCube, G.Panels.BottomLeftLine, G.Panels.BottomRightLine, G.Panels.LeftDataTextToActionBarLine, G.Panels.RightDataTextToActionBarLine }

for _, panels in pairs( panelsToKill ) do
	if( panels ) then
		panels:Kill()
	end
end

------------------------------
-- actionbars
------------------------------
G.ActionBars.Bar1:ClearAllPoints()
G.ActionBars.Bar1:SetPoint( "BOTTOM", 0, 7 )

G.ActionBars.Bar2:Height( ( S.buttonsize * 1 ) + ( S.buttonspacing * 2 ) )

G.ActionBars.Bar3:Height( ( S.buttonsize * 1 ) + ( S.buttonspacing * 2 ) )

G.ActionBars.Bar4:ClearAllPoints()
G.ActionBars.Bar4:SetPoint( "BOTTOMLEFT", G.ActionBars.Bar1, 0, 0 )

G.ActionBars.Bar5:ClearAllPoints()
G.ActionBars.Bar5:Point( "RIGHT", UIParent, "RIGHT", -10, -50 )

------------------------------
-- datatext panels
------------------------------
G.Panels.DataTextLeft:ClearAllPoints()
G.Panels.DataTextLeft:Size( S.InfoLeftRightWidth, 20 )
G.Panels.DataTextLeft:SetPoint( "BOTTOMLEFT", UIParent, 10, 7 )

G.Panels.DataTextRight:ClearAllPoints()
G.Panels.DataTextRight:Size( S.InfoLeftRightWidth, 20 )
G.Panels.DataTextRight:SetPoint( "BOTTOMRIGHT", UIParent, -10, 7 )

if( TukuiMinimap ) then
	G.Panels.DataTextMinimapLeft:Kill()
	G.Panels.DataTextMinimapRight:Kill()
end

------------------------------
-- bottompanel
------------------------------
local JasjaBottomPanel = CreateFrame( "Frame", "JasjaBottomPanel", UIParent )
JasjaBottomPanel:CreatePanel( "Default", S.screenwidth + 6, 20, "BOTTOM", UIParent, "BOTTOM", 0, -2 )
JasjaBottomPanel:SetFrameStrata( "BACKGROUND" )
JasjaBottomPanel:SetFrameLevel( 0 )
JasjaBottomPanel:SetAlpha( 0.9 )
JasjaBottomPanel:CreateShadow( "Default" )