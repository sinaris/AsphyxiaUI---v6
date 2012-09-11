---------------------------------------------------------------------------------------------
-- AddOn Name: AsphyxiaUI 6.0.0
-- License: MIT
-- Author: Sinaris @ Das Syndikat, Vaecia @ Blackmoore
-- Description: AsphyxiaUI, Editied Tukui Layout
---------------------------------------------------------------------------------------------

local C = {}

C["addonskins"] = {
	["embedright"] = "omen",
	["background"] = true,
	["combattoggle"] = true,
	["bigwigs"] = true,
	["dbm"] = true,
	["omen"] = true,
	["tinydps"] = true,
}

C["global"] = {
	["unitframelayout"] = "asphyxia",
	["fonttemplate"] = "default",
}

C["unitframes"] = {
	["cblatency"] = true,
	["fader"] = true,
	["druidmana"] = true,
}

C["raidcooldowns"] = {
	["enable"] = true,
	["showinparty"] = true,
	["showinraid"] = true,
	["showinarena"] = true,
}

C["general"] = {
	["backdropcolor"] = { 0.0, 0.0, 0.0 },
	["bordercolor"] = { 0.125, 0.125, 0.125 },
}

C["actionbar"] = {
	["vertical_rightbars"] = false,
	["vertical_shapeshift"] = false,
	["mainswap"] = false,
}

C["castbar"] = {
	["classcolor"] = true,
	["castbarcolor"] = { 0.150, 0.150, 0.150, 1 },
	["nointerruptcolor"] = { 1, 0, 0, 1 },
	["ticks"] = true,
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
	["enable"] = true,
	["vertical"] = false,
	["height"] = 18,
	["width"] = 100,
	["spacing"] = 3,
	["padding"] = 3,
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

C["tooltip"] = {
	["enable"] = true,
	["icon"] = true,
	["itemlevel"] = true,
	["spellitemids"] = true,
	["talents"] = true,
	["symbiosis"] = true,
	["reforge"] = true,
	["role"] = true,
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
	["achscreen"] = true,
	["minimapbuttons"] = true,
	["micromenu"] = true,
	["mail"] = true,
	["clickcast"] = true,
	["spells"] = true,
	["interrupts"] = true,
	["autorole"] = true,
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

C["combattext"] = {
	["enable"] = true,
	["blizzheadnumbers"] = false,
	["damagestyle"] = true,
	["damage"] = true,
	["healing"] = true,
	["showhots"] = true,
	["showoverhealing"] = true,
	["petdamage"] = true,
	["dotdamage"] = true,
	["damagecolor"] = true,
	["critprefix"] = "*",
	["critpostfix"] = "*",
	["icons"] = true,
	["iconsize"] = 16,
	["treshold"] = 1,
	["healtreshold"] = 1,
	["scrollable"] = false,
	["maxlines"] = 15,
	["timevisible"] = 3,
	["stopvespam"] = false,
	["dkrunes"] = true,
	["killingblow"] = false,
	["mergeaoespam"] = true,
	["mergeaoespamtime"] = 3,
	["dispel"] = true,
	["interrupt"] = true,
	["direction"] = "bottom",
}

C["nameplate"] = {
	["enable"] = false,
	["debuffs"] = false,
	["asphyxia"] = true,
	["height"] = 12,
	["width"] = 115,
	["combat"] = false,
	["showhealth"] = false,
	["showcastbarname"] = false,
	["nameabbrev"] = false,
	["aurassize"] = 25,
}

C["media"] = {
	["asphyxia"] = [[Interface\AddOns\AsphyxiaUI\Media\Fonts\Asphyxia.ttf]],
	["pixel_normal"] = [[Interface\AddOns\AsphyxiaUI\Media\Fonts\PixelNormal.ttf]],
	["pixel_ru"] = [[Interface\AddOns\AsphyxiaUI\Media\Fonts\PixelRu.ttf]], 

	["copyicon"] =  [[Interface\AddOns\AsphyxiaUI\Media\Textures\CopyIcon.tga]],
	["logo"] = [[Interface\AddOns\AsphyxiaUI\Media\Textures\Logo.tga]],
	["normTex"] =  [[Interface\AddOns\AsphyxiaUI\Media\Textures\Normal.tga]],
	["minimalist"] =  [[Interface\AddOns\AsphyxiaUI\Media\Textures\Minimalist.tga]],
	["glamour"] =  [[Interface\AddOns\AsphyxiaUI\Media\Textures\Glamour.tga]],
	["iconlayoutdps"] = [[Interface\AddOns\AsphyxiaUI\Media\Textures\IconLayoutDPS.tga]],
	["iconlayoutheal"] = [[Interface\AddOns\AsphyxiaUI\Media\Textures\IconLayoutHeal.tga]],
	["addonstoggle"] = [[Interface\AddOns\AsphyxiaUI\Media\Textures\AddOnsToggle.tga]],

	["bnetgold"] = [[Interface\AddOns\AsphyxiaUI\Media\Textures\BNetGoldTexture.tga]],
	["bnetlogo"] = [[Interface\AddOns\AsphyxiaUI\Media\Textures\BNetLogoTexture.tga]],
	["bnetlogolarge"] = [[Interface\AddOns\AsphyxiaUI\Media\Textures\BNetPanelLogoLargeTexture.tga]],

	["lfdrole_dps"] = [[Interface\AddOns\AsphyxiaUI\Media\Textures\LFDRoleDPS.tga]],
	["lfdrole_healer"] = [[Interface\AddOns\AsphyxiaUI\Media\Textures\LFDRoleHealer.tga]],
	["lfdrole_tank"] = [[Interface\AddOns\AsphyxiaUI\Media\Textures\LFDRoleTank.tga]],

	["combattextfont"] = [[Interface\Addons\Tukui\medias\fonts\normal_font.ttf]],
	["combattextfontsize"] = 20,
	["combattextfontstyle"] = "OUTLINE",
	["combattextfontshadow"] = false,

	["bordercolor"] = C["general"].bordercolor,
	["backdropcolor"] = C["general"].backdropcolor,
	["datatextcolor1"] = { 1, 1, 1 },
	["datatextcolor2"] = { 0.4, 0.4, 0.5 },
}

TukuiEditedDefaultConfig = C