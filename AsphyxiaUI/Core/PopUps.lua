---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
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
		EnableAddOn( "AsphyxiaUI_Raid_Healing" )
		DisableAddOn( "AsphyxiaUI_Raid" )
		ReloadUI()
	end,
	timeout = 0,
	whileDead = 1,
	preferredIndex = 3,
}

StaticPopupDialogs["ASPHYXIAUI_ENABLE_CHAT_BACKGROUND"] = {
	text = "You don't have chatbackgrounds enabled, do you wish to enable them? If you don't choose to do so, this edit will not work!",
	button1 = ACCEPT,
	button2 = CANCEL,
	OnAccept = function()
		if( IsAddOnLoaded( "Tukui_ConfigUI" ) ) then
			if( not ( TukuiConfigPublic["chat"] ) ) then TukuiConfigPublic["chat"] = {} end
			TukuiConfigPublic["chat"]["background"] = true
		end
		ReloadUI()
	end,
	timeout = 0,
	whileDead = 1,
	preferredIndex = 3,
}