---------------------------------------------------------------------------------------------
-- AddOn Name: AsphyxiaUI 6.0.0
-- License: MIT
-- Author: Sinaris @ Das Syndikat, Vaecia @ Blackmoore
-- Description: AsphyxiaUI, Editied Tukui Layout
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

------------------------------
-- Font Templates
------------------------------
local DefaultFontTemplate = {
	FontFamily = C["media"]["font"],
	FontSize = 12,
	FontStyle = "NONE",
}

local function CreateFontTemplate( FontFamily, FontSize, FontStyle )
	local BuildResultString = {
		BuildFont = {
			FontFamily or DefaultFontTemplate.FontFamily,
			FontSize or DefaultFontTemplate.FontSize,
			FontStyle or DefaultFontTemplate.FontStyle
		},
	}
	return BuildResultString
end

if( C["global"]["fonttemplate"] == "default" ) then
	S.FontTemplate = {
		-- Installation
		ITFontString = CreateFontTemplate( C["media"]["font"], 14, "OUTLINE" ), -- title
		ICFontString = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ), -- copyright

		-- Actionbars
		ABHFontString = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ), -- Button HotKey Text
		ABCFontString = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ), -- Button Count
		ABMFontString = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ), -- Macro Text
		ABCDFontString = CreateFontTemplate( C["media"]["font"], 20, "OUTLINE" ), -- Cooldown Text

		-- Unitframes
		UFFontString = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),
	}
elseif( C["global"]["fonttemplate"] == "pixel" or C["global"]["fonttemplate"] == nil ) then
	local PixelFont

	if( S.client == "ruRU" ) then
		PixelFont = C["media"]["pixel_ru"]
	else
		PixelFont = C["media"]["asphyxia"]
	end

	S.FontTemplate = {
		-- Installation
		ITFontString = CreateFontTemplate( PixelFont, 10, "MONOCHROMEOUTLINE" ), -- title
		ICFontString = CreateFontTemplate( PixelFont, 10, "MONOCHROMEOUTLINE" ), -- copyright

		-- Actionbars
		ABHFontString = CreateFontTemplate( PixelFont, 10, "MONOCHROMEOUTLINE" ), -- Button HotKey Text
		ABCFontString = CreateFontTemplate( PixelFont, 10, "MONOCHROMEOUTLINE" ), -- Button Count
		ABMFontString = CreateFontTemplate( PixelFont, 10, "MONOCHROMEOUTLINE" ), -- Macro Text
		ABCDFontString = CreateFontTemplate( PixelFont, 20, "MONOCHROMEOUTLINE" ), -- Cooldown Text

		-- Unitframes
		UFFontString = CreateFontTemplate( PixelFont, 10, "MONOCHROMEOUTLINE" ),
	}
end

------------------------------
-- Positions
------------------------------
S.SetFramePosition = {
	["Installation"] = {
		["LeftIcon"] = { "BOTTOMLEFT", G.Install.Frame, "TOPLEFT", 0, 3 },
		["RightIcon"] = { "BOTTOMRIGHT", G.Install.Frame, "TOPRIGHT", 0, 3 },
		["Title"] = { "BOTTOM", G.Install.Frame, "TOP", 0, 3 },
		["Copyright"] = { "TOP", G.Install.Frame, "BOTTOM", 0, -3 },
	}
}