---------------------------------------------------------------------------------------------
-- AsphyxiaUI
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["global"]["panellayout"] ~= "jasje" ) then return end

if( C["actionbar"]["enable"] ~= true ) then return end

------------------------------
--
------------------------------
local UpdateActionButtonFont = function( self )
	local Name = self:GetName()
	local Count = _G[Name .. "Count"]
	local Hotkey = _G[Name .. "HotKey"]

	if( Count ) then
		Count:SetFont( S.CreateFontString() )
	end

	if( Hotkey ) then
		Hotkey:SetFont( S.CreateFontString() )
	end
end

hooksecurefunc( "ActionButton_Update", UpdateActionButtonFont )

------------------------------
--
------------------------------
G.ActionBars.Shift:ClearAllPoints()
if( S.myclass == "PALADIN" ) then
	G.ActionBars.Shift:SetPoint( "TOP", G.UnitFrames.Player, "BOTTOMRIGHT", -28, -45 )
else
	G.ActionBars.Shift:SetPoint( "TOP", G.UnitFrames.Player, "BOTTOMRIGHT", -28, -45 )
end

------------------------------
--
------------------------------
MultiBarBottomLeftButton7:Kill()
MultiBarBottomLeftButton8:Kill()
MultiBarBottomLeftButton9:Kill()
MultiBarBottomLeftButton10:Kill()
MultiBarBottomLeftButton11:Kill()
MultiBarBottomLeftButton12:Kill()

MultiBarBottomRightButton7:Kill()
MultiBarBottomRightButton8:Kill()
MultiBarBottomRightButton9:Kill()
MultiBarBottomRightButton10:Kill()
MultiBarBottomRightButton11:Kill()
MultiBarBottomRightButton12:Kill()