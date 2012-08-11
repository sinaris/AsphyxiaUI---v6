local C = {}

C["global"] = {
	["unitframelayout"] = "asphyxia",
	["ablayout"] = 1,
	["welcomemessage"] = true,
}

C["unitframes"] = {
	["cblatency"] = true,
	["fader"] = true,
}

C["general"] = {
	["backdropcolor"] = { 0.0, 0.0, 0.0 },
	["bordercolor"] = { 0.125, 0.125, 0.125 },
}

C["actionbar"] = {
	["vertical_rightbars"] = false,
	["vertical_shapeshift"] = false,
	["mainswap"] = false,
	["mouseover_shapeshift"] = false,
}

C["castbar"] = {
	["classcolor"] = true,
	["castbarcolor"] = { 0.150, 0.150, 0.150, 1 },
	["nointerruptcolor"] = { 1, 0, 0, 1 },
	["ticks"] = true,
	["tickscolor"] = { 1, 0, 0, 1 },
}

C["chat"] = {
	["enable"] = true,
	["whispersound"] = true,
	["background"] = true,
	["width"] = 378,
	["height"] = 175,
	["justifyRight"] = true,
}

C["databars"] = {
	["settings"] = {
		["vertical"] = false,
		["height"] = 18,
		["width"] = 100,
		["spacing"] = 3,
		["padding"] = 3,
	},
	["framerate"] = 1,
	["latency"] = 2,
	["memory"] = 3,
	["durability"] = 4,
	["currency"] = true,
	["reputation"] = true,
	["reps"] = {
		"Hellscream's Reach",
		"Therazane",
		"Dragonmaw Clan",
		"Guardians of Hyjal",
		"Systematic Chaos",
	},
}

C["datatext"] = {
	["armor"] = 0,
	["avd"] = 0,
	["bags"] = 5,
	["calltoarms"] = 3,
	["crit"] = 9,
	["currency"] = 0,
	["dps_text"] = 0,
	["dur"] = 0,
	["fps_ms"] = 0,
	["friends"] = 2,
	["gold"] = 6,
	["guild"] = 1,
	["haste"] = 8,
	["hit"] = 11,
	["hps_text"] = 0,
	["mastery"] = 10,
	["micromenu"] = 4,
	["power"] = 7,
	["regen"] = 0,
	["system"] = 0,
	["talent"] = 0,
	["wowtime"] = 12,
	["profession"] = 0,

	["battleground"] = true,
	["time24"] = true,
	["localtime"] = false,
	["fontsize"] = 12,
}

C["intmodules"] = {
	["addonmanager"] = true,
	["afkcamera"] = true,
	["alertcombat"] = true,
	["hattrick"] = true,
	["locationpanel"] = true,
	["nickalert"] = {
		["enable"] = true,
		["names"] = {
			UnitName( "player" ),
			--"OtherToonName",
		},
		["sound"] = "Sound\\Event Sounds\\Wisp\\WispPissed1.wav",
	},
	["bnetpanel"] = true,
	["itemlevelongearandslots"] = true,
	["layoutchanger"] = true,
	["micromenu"] = true,
}

C["unitframes"] = {
	["classicons"] = true,
	["unicolor"] = true,
	["fader"] = false,
	["gradienthealth"] = false,
	["gradient"] = {
		4.5, 0.1, 0.1,
		0.6, 0.3, 0.3,
		0.2, 0.2, 0.2,
	},
}

C["media"] = {
	["asphyxia"] = [[Interface\AddOns\AsphyxiaUI\Media\Fonts\Asphyxia.ttf]],
	["pixel_normal"] = [[Interface\AddOns\AsphyxiaUI\Media\Fonts\PixelNormal.ttf]],
	["pixel_ru"] = [[Interface\AddOns\AsphyxiaUI\Media\Fonts\PixelRu.ttf]], 

	["copyicon"] =  [[Interface\AddOns\AsphyxiaUI\Media\Textures\CopyIcon.tga]],
	["logo"] = [[Interface\AddOns\AsphyxiaUI\Media\Textures\Logo.tga]],
	["normTex"] =  [[Interface\AddOns\AsphyxiaUI\Media\Textures\Normal.tga]],
	["minimalist"] =  [[Interface\AddOns\AsphyxiaUI\Media\Textures\Minimalist.tga]],
	["iconlayoutdps"] = [[Interface\AddOns\AsphyxiaUI\Media\Textures\IconLayoutDPS.tga]],
	["iconlayoutheal"] = [[Interface\AddOns\AsphyxiaUI\Media\Textures\IconLayoutHeal.tga]],

	["bnetgold"] = [[Interface\AddOns\AsphyxiaUI\Media\Textures\BNetGoldTexture.tga]],
	["bnetlogo"] = [[Interface\AddOns\AsphyxiaUI\Media\Textures\BNetLogoTexture.tga]],
	["bnetlogolarge"] = [[Interface\AddOns\AsphyxiaUI\Media\Textures\BNetPanelLogoLargeTexture.tga]],

	["lfdrole_dps"] = [[Interface\AddOns\AsphyxiaUI\Media\Textures\LFDRoleDPS.tga]],
	["lfdrole_healer"] = [[Interface\AddOns\AsphyxiaUI\Media\Textures\LFDRoleHealer.tga]],
	["lfdrole_tank"] = [[Interface\AddOns\AsphyxiaUI\Media\Textures\LFDRoleTank.tga]],

	["bordercolor"] = C["general"].bordercolor,
	["backdropcolor"] = C["general"].backdropcolor,
	["datatextcolor1"] = { 1, 1, 1 },
	["datatextcolor2"] = { 0.4, 0.4, 0.5 },
}

TukuiEditedDefaultConfig = C