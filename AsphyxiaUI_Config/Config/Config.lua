local C = {}

C["global"] = {
	["welcomemessage"] = true,
	["unitframelayout"] = "asphyxia",
	["panellayout"] = "asphyxia",
}

C["general"] = {
	["backdropcolor"] = { 0.0, 0.0, 0.0 },
	["bordercolor"] = { 0.125, 0.125, 0.125 },
	["normalfont"] = false,
}

C["actionbar"] = {
	["stancebuttonsize"] = 27,
	["vertical_rightbars"] = false,
	["vertical_shapeshift"] = false,
	["mouseover_shapeshift"] = false,
	["mainswap"] = false,
	["macrotext"] = false,
	["duffedablayout"] = 1,
	["duffedswapbar1and3"] = false,
	["duffedrightbarsmouseover"] = false,
	["horizontal_petbar"] = false,
	["petbaralwaysvisible"] = true,
}

C["castbar"] = {
	["classcolor"] = true,
	["castbarcolor"] = { 0.150, 0.150, 0.150, 1 },
	["nointerruptcolor"] = { 1, 0, 0, 1 },
	["ticks"] = true,
	["tickscolor"] = { 1, 0, 0, 1 },
}

C["unitframes"] = {
	["classicons"] = true,
	["unicolor"] = true,
	["fader"] = false,
	["percenthp"] = true,
	["ColorGradient"] = false,
	["healthbarcolor"] = { 0.2, 0.2, 0.2, 1 },
	["deficitcolor"] = { 0, 0, 0 },
	["gradienthealth"] = true,
	["gradient"] = {
		4.5, 0.1, 0.1,
		0.6, 0.3, 0.3,
		0.2, 0.2, 0.2,
	},
}

C["chat"] = {
	["background"] = true,
	["width"] = 378,
	["height"] = 175,
	["justifyRight"] = true,
}

C["intmodules"] = {
	["locationpanel"] = true,
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
	["fps_ms"] = 0,
	["system"] = 0,
	["bags"] = 5,
	["gold"] = 6,
	["wowtime"] = 12,
	["guild"] = 1,
	["dur"] = 0,
	["friends"] = 2,
	["dps_text"] = 0,
	["hps_text"] = 0,
	["power"] = 7,
	["haste"] = 8,
	["crit"] = 9,
	["avd"] = 0,
	["armor"] = 0,
	["currency"] = 0,
	["hit"] = 11,
	["mastery"] = 10,
	["micromenu"] = 4,
	["regen"] = 0,
	["talent"] = 0,
	["calltoarms"] = 3,
	["expertise"] = 0,
	["profession"] = 1,

	["battleground"] = true,
	["time24"] = true,
	["localtime"] = false,
	["fontsize"] = 12,

	["classcolor"] = false,
	["enable_specswitcher"] = true,
	["bgannouncer"] = false,
}

C["media"] = {
	["asphyxia"] = [[Interface\AddOns\AsphyxiaUI\Media\Fonts\Asphyxia.ttf]],
	["pixel_normal"] = [[Interface\AddOns\AsphyxiaUI\Media\Fonts\PixelNormal.ttf]],
	["pixel_ru"] = [[Interface\AddOns\AsphyxiaUI\Media\Fonts\PixelRu.ttf]], 

	["glamour"] =  [[Interface\AddOns\AsphyxiaUI\Media\Textures\Glamour.tga]],
	["logo"] = [[Interface\AddOns\AsphyxiaUI\Medias\Textures\Logo.tga]],
	["normal"] =  [[Interface\AddOns\AsphyxiaUI\Media\Textures\Normal.tga]],

	["bordercolor"] = C["general"].bordercolor,
	["backdropcolor"] = C["general"].backdropcolor,
	["datatextcolor1"] = { 1, 1, 1 },
	["datatextcolor2"] = { 0.4, 0.4, 0.5 },
}

TukuiEditedDefaultConfig = C