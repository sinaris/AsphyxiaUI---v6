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
			FontStyle or DefaultFontTemplate.FontStyle,
		},
	}
	return BuildResultString
end

if( C["global"]["fonttemplate"] == "default" ) then
	S.FontTemplate = {
		ButtonsDefault = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),
		ButtonsResetUIBtn = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),
		ButtonsReloadUIBtn = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),

		InstallationTitlte = CreateFontTemplate( C["media"]["font"], 14, "OUTLINE" ),
		InstallationCopyright = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),

		ActionbarsHotKey = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),
		ActionbarsCount = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),
		ActionbarsMacro = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),
		ActionbarsCooldown = CreateFontTemplate( C["media"]["font"], 20, "OUTLINE" ),

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

		DatatextPanels = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),
		DatatextPanelsTglBtn = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),

		MinimapCords = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),
		MinimapZone = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),

		NameplatesCount = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),
		NameplatesName = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),
		NameplatesHealth = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),
		NameplatesLevel = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),

		PanelsDefault = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),

		UFFontString = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),
		UnitframesHealth = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),
		UnitframesPower = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),
		UnitframesName = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),
		UnitframesCastbar = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),
		UnitframesDefault = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),

		MoverDefault = CreateFontTemplate( C["media"]["uffont"], 12, nil ),

		FAQTitle = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),
		FAQButtons = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),
	}
elseif( C["global"]["fonttemplate"] == "pixel" or C["global"]["fonttemplate"] == nil ) then
	local PixelFont

	if( S.client == "ruRU" ) then
		PixelFont = C["media"]["pixel_ru"]
	else
		PixelFont = C["media"]["asphyxia"]
	end

	S.FontTemplate = {
		ButtonsDefault = CreateFontTemplate( PixelFont, 10, "MONOCHROMEOUTLINE" ),
		ButtonsResetUIBtn = CreateFontTemplate( PixelFont, 10, "MONOCHROMEOUTLINE" ),
		ButtonsReloadUIBtn = CreateFontTemplate( PixelFont, 10, "MONOCHROMEOUTLINE" ),

		InstallationTitlte = CreateFontTemplate( PixelFont, 10, "MONOCHROMEOUTLINE" ),
		InstallationCopyright = CreateFontTemplate( PixelFont, 10, "MONOCHROMEOUTLINE" ),

		ActionbarsHotKey = CreateFontTemplate( PixelFont, 10, "MONOCHROMEOUTLINE" ),
		ActionbarsCount = CreateFontTemplate( PixelFont, 10, "MONOCHROMEOUTLINE" ),
		ActionbarsMacro = CreateFontTemplate( PixelFont, 10, "MONOCHROMEOUTLINE" ),
		ActionbarsCooldown = CreateFontTemplate( PixelFont, 20, "MONOCHROMEOUTLINE" ),

		BagsItemCount = CreateFontTemplate( PixelFont, 10, "MONOCHROMEOUTLINE" ),
		BagsEditBox = CreateFontTemplate( PixelFont, 10, "MONOCHROMEOUTLINE" ),
		BagsDetail = CreateFontTemplate( PixelFont, 10, "MONOCHROMEOUTLINE" ),
		BagsGold = CreateFontTemplate( PixelFont, 10, "MONOCHROMEOUTLINE" ),

		BuffsDuration = CreateFontTemplate( PixelFont, 10, "MONOCHROMEOUTLINE" ),
		BuffsCount = CreateFontTemplate( PixelFont, 10, "MONOCHROMEOUTLINE" ),

		ChatTabText = CreateFontTemplate( PixelFont, 10, "MONOCHROMEOUTLINE" ),

		DatabarsPanels = CreateFontTemplate( PixelFont, 10, "MONOCHROMEOUTLINE" ),
		DatabarsPanelsTglBtn = CreateFontTemplate( PixelFont, 10, "MONOCHROMEOUTLINE" ),
		DatabarsCurrency = CreateFontTemplate( PixelFont, 10, "MONOCHROMEOUTLINE" ),
		DatabarsCurrencyTglBtn = CreateFontTemplate( PixelFont, 10, "MONOCHROMEOUTLINE" ),
		DatabarsReputationText = CreateFontTemplate( PixelFont, 10, "MONOCHROMEOUTLINE" ),
		DatabarsReputationName = CreateFontTemplate( PixelFont, 10, "MONOCHROMEOUTLINE" ),
		DatabarsReputationTglBtn = CreateFontTemplate( PixelFont, 10, "MONOCHROMEOUTLINE" ),

		DatatextPanels = CreateFontTemplate( PixelFont, 10, "MONOCHROMEOUTLINE" ),
		DatatextPanelsTglBtn = CreateFontTemplate( PixelFont, 10, "MONOCHROMEOUTLINE" ),

		MinimapCords = CreateFontTemplate( PixelFont, 10, "MONOCHROMEOUTLINE" ),
		MinimapZone = CreateFontTemplate( PixelFont, 10, "MONOCHROMEOUTLINE" ),

		NameplatesCount = CreateFontTemplate( PixelFont, 10, "MONOCHROMEOUTLINE" ),
		NameplatesName = CreateFontTemplate( PixelFont, 10, "MONOCHROMEOUTLINE" ),
		NameplatesHealth = CreateFontTemplate( PixelFont, 10, "MONOCHROMEOUTLINE" ),
		NameplatesLevel = CreateFontTemplate( PixelFont, 10, "MONOCHROMEOUTLINE" ),

		PanelsDefault = CreateFontTemplate( PixelFont, 10, "MONOCHROMEOUTLINE" ),

		UnitframesHealth = CreateFontTemplate( PixelFont, 10, "MONOCHROMEOUTLINE" ),
		UnitframesPower = CreateFontTemplate( PixelFont, 10, "MONOCHROMEOUTLINE" ),
		UnitframesName = CreateFontTemplate( PixelFont, 10, "MONOCHROMEOUTLINE" ),
		UnitframesCastbar = CreateFontTemplate( PixelFont, 10, "MONOCHROMEOUTLINE" ),
		UnitframesDefault = CreateFontTemplate( PixelFont, 10, "MONOCHROMEOUTLINE" ),

		MoverDefault = CreateFontTemplate( C["media"]["uffont"], 12, nil ),

		FAQTitle = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),
		FAQButtons = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),
	}
end