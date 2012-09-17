---------------------------------------------------------------------------------------------
-- AddOn Name: AsphyxiaUI 6.0.0
-- License: MIT
-- Author: Sinaris @ Das Syndikat, Vaecia @ Blackmoore
-- Description: AsphyxiaUI, Editied Tukui Layout
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

S.CreatePopup["ASPHYXIAUI_ENABLE_CHAT_BACKGROUND"] = {
	question = L.Popups_ENABLE_CHAT_BACKGROUNDS,
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

S.CreatePopup["ASPHYXIAUI_DISABLED_TUKUI_NAMEPLATES"] = {
	question = L.Popups_DISABLED_TUKUI_NAMEPLATES,
	answer1 = ACCEPT,
	answer2 = CANCEL,
	function1 = function()
		if( IsAddOnLoaded( "Tukui_ConfigUI" ) ) then
			if( not ( TukuiConfigPublic["nameplate"] ) ) then
				TukuiConfigPublic["nameplate"] = {}
			end
			TukuiConfigPublic["nameplate"]["enable"] = false
			TukuiConfigPublic["nameplate"]["asphyxia"] = true
		end
		ReloadUI()
	end,
}

S.CreatePopup["ASPHYXIAUI_SELECT_RAID_LAYOUT"] = {
	question = L.Popups_SELECT_RAID_LAYOUT,
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

S.CreatePopup["ASPHYXIAUI_DIFFERENT_ADDONSKINS_DETECTED"] = {
	question = L.Popups_ADDONSKINS,
	answer1 = ACCEPT,
	answer2 = CANCEL,
	function1 = function()
		if( IsAddOnLoaded( "Tukui_ConfigUI" ) ) then
			if( not ( TukuiConfigPublic["addonskins"] ) ) then
				TukuiConfigPublic["addonskins"] = {}
			end
			TukuiConfigPublic["addonskins"]["enable"] = false
		end
		ReloadUI()
	end,
	function2 = function()
		if( IsAddOnLoaded( "Tukui_ElvUI_Skins" ) ) then
			DisableAddOn( "Tukui_ElvUI_Skins" )
		end
		ReloadUI()
	end,
}

S.CreatePopup["ASPHYXIAUI_ENABLE_HIGHONLOWRESO"] = {
	question = L.Popups_LOWRESOLUTION_OVERRIDE,
	answer1 = ACCEPT,
	answer2 = CANCEL,
	function1 = function()
		if( IsAddOnLoaded( "Tukui_ConfigUI" ) ) then
			if( not ( TukuiConfigPublic["general"] ) ) then
				TukuiConfigPublic["general"] = {}
			end
			TukuiConfigPublic["general"]["overridelowtohigh "] = true
		end
		ReloadUI()
	end,
}