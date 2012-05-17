local C = {}

C["global"] = {
	["welcomemessage"] = true,
	["unitframelayout"] = "asphyxia",
	["panellayout"] = "asphyxia",
}

C["general"] = {
	["backdropcolor"] = { 0.0, 0.0, 0.0 },
	["bordercolor"] = { 0.125, 0.125, 0.125 },
}

C["asphyxia"] = {
	["unitframes"] = {
		["classicons"] = true,
	},
	["castbar"] = {
		["classcolor"] = false,
		["castbarcolor"] = { 0.150, 0.150, 0.150, 1 },
		["nointerruptcolor"] = { 1, 0, 0, 1 },
		["ticks"] = true,
		["tickscolor"] = { 1, 0, 0, 1 },
	},
}

C["media"] = {
	["asphyxia"] = [[Interface\AddOns\AsphyxiaUI\Media\Fonts\Asphyxia.ttf]],
	["pixel_normal"] = [[Interface\AddOns\AsphyxiaUI\Media\Fonts\PixelNormal.ttf]],
	["pixel_ru"] = [[Interface\AddOns\AsphyxiaUI\Media\Fonts\PixelRu.ttf]], 

	["glamour"] =  [[Interface\AddOns\AsphyxiaUI\Media\Textures\Glamour.tga]],
	["logo"] = [[Interface\AddOns\AsphyxiaUI\Medias\Textures\Logo]],

	["bordercolor"] = C["general"].bordercolor,
	["backdropcolor"] = C["general"].backdropcolor,
	["datatextcolor1"] = { 1, 1, 1 },
	["datatextcolor2"] = { 0.4, 0.4, 0.5 },
}

TukuiEditedDefaultConfig = C