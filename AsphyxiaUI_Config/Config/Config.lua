local C = {}

C["global"] = {
	["welcomemessage"] = true,
}

C["general"] = {
	["backdropcolor"] = { 0.0, 0.0, 0.0 },
	["bordercolor"] = { 0.125, 0.125, 0.125 },
	["normalfont"] = false,
}

C["chat"] = {
	["enable"] = true,
	["whispersound"] = true,
	["background"] = true,
	["width"] = 378,
	["height"] = 175,
	["justifyRight"] = true,
}

C["media"] = {
	["asphyxia"] = [[Interface\AddOns\AsphyxiaUI\Media\Fonts\Asphyxia.ttf]],
	["pixel_normal"] = [[Interface\AddOns\AsphyxiaUI\Media\Fonts\PixelNormal.ttf]],
	["pixel_ru"] = [[Interface\AddOns\AsphyxiaUI\Media\Fonts\PixelRu.ttf]], 

	["copyicon"] =  [[Interface\AddOns\AsphyxiaUI\Media\Textures\CopyIcon.tga]],
	["logo"] = [[Interface\AddOns\AsphyxiaUI\Media\Textures\Logo.tga]],
	["normTex"] =  [[Interface\AddOns\AsphyxiaUI\Media\Textures\Normal.tga]],
	["iconlayoutdps"] = [[Interface\AddOns\AsphyxiaUI\Media\Textures\IconLayoutDPS.tga]],
	["iconlayoutheal"] = [[Interface\AddOns\AsphyxiaUI\Media\Textures\IconLayoutHeal.tga]],

	["bordercolor"] = C["general"].bordercolor,
	["backdropcolor"] = C["general"].backdropcolor,
	["datatextcolor1"] = { 1, 1, 1 },
	["datatextcolor2"] = { 0.4, 0.4, 0.5 },
}

TukuiEditedDefaultConfig = C