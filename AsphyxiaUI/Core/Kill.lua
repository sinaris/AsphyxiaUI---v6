---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

------------------------------
-- Not Needed
------------------------------
local KillPanels = {
	G.ActionBars.Bar5,
	G.ActionBars.Bar6,
	G.ActionBars.Bar7,

	G.ActionBars.Pet.BackgroundLink,
	G.Panels.BottomPanelOverActionBars,
	G.Panels.BottomLeftVerticalLine,
	G.Panels.BottomRightVerticalLine,
	G.Panels.BottomLeftCube,
	G.Panels.BottomRightCube,
	G.Panels.BottomLeftLine,
	G.Panels.BottomRightLine,
	G.Panels.LeftDataTextToActionBarLine,
	G.Panels.RightDataTextToActionBarLine
}

for _, Panels in pairs( KillPanels ) do
	Panels:Kill()
end

------------------------------
-- Minimap
------------------------------
if( TukuiMinimap ) then
	G.Panels.DataTextMinimapLeft:Kill()
	G.Panels.DataTextMinimapRight:Kill()
end

if( C["intmodules"]["locationpanel"] == true ) then
	if( TukuiMinimap ) then
		G.Maps.Minimap.Zone:Kill()
		G.Maps.Minimap.Coord:Kill()
	end
end