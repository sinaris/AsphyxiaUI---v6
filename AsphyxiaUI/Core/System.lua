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

	StringFAnchor = "",
	StringParent = "",
	StringLAnchor = "",
	StringYOffset = "",
	StringXOffset = "",
}

local function CreateFontTemplate( FontFamily, FontSize, FontStyle, StringFAnchor, StringParent, StringLAnchor, StringYOffset, StringXOffset )
	local BuildResultString = {
		BuildFont = {
			FontFamily or DefaultFontTemplate.FontFamily,
			FontSize or DefaultFontTemplate.FontSize,
			FontStyle or DefaultFontTemplate.FontStyle,
		},

		BuildStringValues = {
			StringFAnchor or DefaultFontTemplate.StringFAnchor,
			StringParent or DefaultFontTemplate.StringParent,
			StringLAnchor or DefaultFontTemplate.StringLAnchor,
			StringYOffset or DefaultFontTemplate.StringYOffset,
			StringXOffset or DefaultFontTemplate.StringXOffset,
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

		BagsItemCount = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),
		BagsEditBox = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),
		BagsDetail = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),
		BagsGold = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),

		BuffsDuration = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),
		BuffsCount = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),

		ChatTabText = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),

		DatabarsPanels = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),
		DatabarsPanelsTglBtn = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),
		DatabarsCurrency = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),
		DatabarsCurrencyTglBtn = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),
		DatabarsReputationText = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),
		DatabarsReputationName = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),
		DatabarsReputationTglBtn = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),

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
	["panels"] = {
		["actionbars"] = {
			["bar1"] = { "BOTTOM", UIParent, "BOTTOM", 0, 48 },
			["splitleft"] = { "BOTTOMRIGHT", G.ActionBars.Bar1, "BOTTOMLEFT", -3, 0 },
			["splitright"] = { "BOTTOMLEFT", G.ActionBars.Bar1, "BOTTOMRIGHT", 3, 0 },
			["rightbar"] = { "BOTTOMRIGHT", G.Panels.RightChatBackground, "TOPRIGHT", 0, 3 },
			["petbar"] = { "BOTTOM", AsphyxiaUIRightBar, "TOP", 0, 3 },
		},
		["chat"] = {
			["leftbg"] = { "BOTTOMLEFT", UIParent, "BOTTOMLEFT", 2, 2 },
			["rightbg"] = { "BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -2, 2 },
		},
		["datatext"] = {
			["infoleft"] = { "BOTTOM", G.Panels.LeftChatBackground, "BOTTOM", 0, 5 },
			["inforight"] = { "BOTTOM", G.Panels.RightChatBackground, "BOTTOM", 0, 5 },
		},
	},
	["bags"] = {
		["bank"] = { "BOTTOMLEFT", G.Panels.LeftChatBackground, "TOPLEFT", 0, 3 },
	},



	["maps"] = {
		["minimap"] = {},
	},
	["unitframes"] = {
	
	}
}