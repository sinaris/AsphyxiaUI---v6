---------------------------------------------------------------------------------------------
-- AsphyxiaUI
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["unitframes"]["enable"] ~= true ) then return end

oUFTukui.TagEvents["Tukui:perchp"] = "UNIT_HEALTH"
oUFTukui.Tags["Tukui:perchp"] = function( unit )
	local m = UnitHealthMax( unit )
	if( m == 0 ) then
		return 0
	else
		return S.panelcolor .. math.floor( UnitHealth( unit ) / m * 100 + 0.5 ) .. "%"
	end
end