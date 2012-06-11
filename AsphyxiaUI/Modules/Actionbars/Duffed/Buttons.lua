---------------------------------------------------------------------------------------------
-- AsphyxiaUI
---------------------------------------------------------------------------------------------

local T, C, L, G = unpack( Tukui )

if( C["global"]["panellayout"] ~= "duffed" ) then return end

if( C["actionbar"]["enable"] ~= true ) then return end

local cp = "|cff319f1b" -- +
local cm = "|cff9a1212" -- -

G.ActionBars.Bar2.ShowHideButton:ClearAllPoints()
TukuiBar2Button:SetScript( "OnClick", function( self, btn )
	if btn == "RightButton" then
		if TukuiInfoLeftBattleGround and UnitInBattleground("player") then
			ToggleFrame(TukuiInfoLeftBattleGround)
		end
	else
		UpdateBar(self, TukuiBar2)
	end
end)

if C["actionbar"].duffedablayout == 2 then
	G.ActionBars.Bar2.ShowHideButton:Size(TukuiInfoLeft:GetHeight())
	G.ActionBars.Bar2.ShowHideButton:Point("LEFT", TukuiInfoLeft, "RIGHT", 2, 0)
	G.ActionBars.Bar2.ShowHideButton.text:Point("CENTER", 1, 0)
else
	G.ActionBars.Bar2.ShowHideButton:Point("TOPLEFT", TukuiInfoLeft, "TOPRIGHT", 2, 0)
	G.ActionBars.Bar2.ShowHideButton:Point("BOTTOMRIGHT", TukuiInfoRight, "BOTTOMLEFT", -2, 0)
	G.ActionBars.Bar2.ShowHideButton.text:Point("CENTER", 0, 0)
end

G.ActionBars.Bar2.ShowHideButton:SetScript("OnEnter", function(self)
	self:SetAlpha( 1 )
	self:SetBackdropBorderColor(unpack(C["media"].datatextcolor1))
end)
G.ActionBars.Bar2.ShowHideButton:SetScript("OnLeave", function(self)
	self:SetAlpha(0)
	self:SetBackdropBorderColor(unpack(C["media"].bordercolor))
end)
G.ActionBars.Bar2.ShowHideButton.text:SetText(cm.."-|r")