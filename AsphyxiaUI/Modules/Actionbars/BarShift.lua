---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

TukuiStance:ClearAllPoints()
if( C["actionbar"].vertical_shapeshift == true ) then
	TukuiStance:Point( "TOPLEFT", TukuiChatBackgroundLeft, "TOPRIGHT", 2, 0 )
else
	TukuiStance:Point( "BOTTOMLEFT", TukuiChatBackgroundLeft, "BOTTOMRIGHT", 2, -1 )
end

local AsphyxiaUIStancebarBorder = CreateFrame( "Frame", "AsphyxiaUIStancebarBorder", UIParent )
AsphyxiaUIStancebarBorder:SetTemplate( "Transparent" )
AsphyxiaUIStancebarBorder:SetFrameLevel( 1 )
AsphyxiaUIStancebarBorder:SetFrameStrata( "BACKGROUND" )

AsphyxiaUIStancebarBorder:RegisterEvent("PLAYER_LOGIN")
AsphyxiaUIStancebarBorder:RegisterEvent("PLAYER_ENTERING_WORLD")
AsphyxiaUIStancebarBorder:RegisterEvent("UPDATE_SHAPESHIFT_FORMS")
AsphyxiaUIStancebarBorder:RegisterEvent("UPDATE_SHAPESHIFT_FORM")
AsphyxiaUIStancebarBorder:SetScript("OnEvent", function(self, event, ...)
local forms = GetNumShapeshiftForms()
	if forms > 0 then
		if C.actionbar.vertical_shapeshift == true then
			--AsphyxiaUIStancebarBorder:Width(S.buttonsize)
			--AsphyxiaUIStancebarBorder:Height((S.buttonsize * forms) + ((S.buttonspacing * forms) - 3 ))
			--AsphyxiaUIStancebarBorder:Point("TOPLEFT", _G["StanceButton1"], "TOPLEFT")
		else
			--AsphyxiaUIStancebarBorder:Width( ( ( S.buttonsize + S.buttonspacing ) * forms ) + ( S.buttonspacing * 2 ) )
			--AsphyxiaUIStancebarBorder:Height(S.buttonsize + ( S.buttonspacing * 2 ) )
			--AsphyxiaUIStancebarBorder:Point("TOPLEFT", _G["StanceButton1"], "TOPLEFT", -2, -2)
		end
	end
end)