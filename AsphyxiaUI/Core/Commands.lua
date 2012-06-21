---------------------------------------------------------------------------------------------
-- AsphyxiaUI
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

SlashCmdList.ASPHYXIAUIHEALINGLAYOUT = function()
	DisableAddOn( "AsphyxiaUI_Raid" )
	EnableAddOn( "AsphyxiaUI_Raid_Healing" )
	ReloadUI()
end
SLASH_ASPHYXIAUIHEALINGLAYOUT1 = "/aheal"

SlashCmdList.ASPHYXIAUIDPSLAYOUT = function()
	DisableAddOn( "AsphyxiaUI_Raid_Healing" )
	EnableAddOn( "AsphyxiaUI_Raid" )
	ReloadUI()
end
SLASH_ASPHYXIAUIDPSLAYOUT1 = "/adps"