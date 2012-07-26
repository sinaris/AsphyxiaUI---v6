---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

S.CreatePopup["ASPHYXIAUI_ENABLE_CHAT_BACKGROUND"] = {
	question = "L.PopUps_ENABLE_CHAT_BACKGROUNDS",
	answer1 = ACCEPT,
	answer2 = CANCEL,
	function1 = function()
		if( IsAddOnLoaded( "Tukui_ConfigUI" ) ) then
			if( not ( TukuiConfigPublic["chat"] ) ) then
				TukuiConfigPublic["chat"] = {}
			end
			TukuiConfigPublic["chat"]["background"] = true
		end
		ReloadUI()
	end,
}

S.CreatePopup["ASPHYXIAUI_SELECT_RAID_LAYOUT"] = {
	question = "L.PopUps_SELECT_RAID_LAYOUT",
	answer1 = "DPS, Tank",
	answer2 = "Healing",
	function1 = function()
		DisableAddOn( "AsphyxiaUI_Raid_Healing" )
		EnableAddOn( "AsphyxiaUI_Raid" )
		ReloadUI()
	end,
	function2 = function()
		EnableAddOn( "AsphyxiaUI_Raid_Healing" )
		DisableAddOn( "AsphyxiaUI_Raid" )
		ReloadUI()
	end,
}