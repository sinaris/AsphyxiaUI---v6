---------------------------------------------------------------------------------------------
-- AsphyxiaUI
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

StaticPopupDialogs["ASPHYXIAUI_CHANGE_RAID_LAYOUT"] = {
	text = L.popup_2raidactive,
	button1 = "DPS - TANK",
	button2 = "HEAL",
	OnAccept = function()
		DisableAddOn( "AsphyxiaUI_Raid_Healing" )
		EnableAddOn( "AsphyxiaUI_Raid" )
		ReloadUI()
	end,
	OnCancel = function()
		EnableAddOn( "Tukui_Raid_Healing" )
		DisableAddOn( "Tukui_Raid" )
		ReloadUI()
	end,
	timeout = 0,
	whileDead = 1,
	preferredIndex = 3,
}