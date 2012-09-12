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

		UnitframesHealth = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),
		UnitframesPower = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),
		UnitframesName = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),
		UnitframesCastbar = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),
		UnitframesDefault = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),

		MoverDefault = CreateFontTemplate( C["media"]["uffont"], 12, nil ),

		FAQTitle = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),
		FAQButtons = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),

		SkinsDefault = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),
	}
elseif( C["global"]["fonttemplate"] == "pixel" or C["global"]["fonttemplate"] == nil ) then
	local PixelFont, PixelSize

	if( C["global"]["globalstyle"] == "asphyxia" ) then
		if( S.client == "ruRU" ) then
			PixelFont = C["media"]["pixel_ru"]
			PixelSize = 12
		else
			PixelFont = C["media"]["asphyxia"]
			PixelSize = 10
		end
	elseif( C["global"]["globalstyle"] == "vethek" ) then
		if( S.client == "ruRU" ) then
			PixelFont = C["media"]["pixel_ru"]
			PixelSize = 12
		else
			PixelFont = C["media"]["pixel_normal"]
			PixelSize = 12
		end
	end

	S.FontTemplate = {
		ButtonsDefault = CreateFontTemplate( PixelFont, PixelSize, "MONOCHROMEOUTLINE" ),
		ButtonsResetUIBtn = CreateFontTemplate( PixelFont, PixelSize, "MONOCHROMEOUTLINE" ),
		ButtonsReloadUIBtn = CreateFontTemplate( PixelFont, PixelSize, "MONOCHROMEOUTLINE" ),

		InstallationTitlte = CreateFontTemplate( PixelFont, PixelSize, "MONOCHROMEOUTLINE" ),
		InstallationCopyright = CreateFontTemplate( PixelFont, PixelSize, "MONOCHROMEOUTLINE" ),

		ActionbarsHotKey = CreateFontTemplate( PixelFont, PixelSize, "MONOCHROMEOUTLINE" ),
		ActionbarsCount = CreateFontTemplate( PixelFont, PixelSize, "MONOCHROMEOUTLINE" ),
		ActionbarsMacro = CreateFontTemplate( PixelFont, PixelSize, "MONOCHROMEOUTLINE" ),
		ActionbarsCooldown = CreateFontTemplate( PixelFont, 20, "MONOCHROMEOUTLINE" ),

		BagsItemCount = CreateFontTemplate( PixelFont, PixelSize, "MONOCHROMEOUTLINE" ),
		BagsEditBox = CreateFontTemplate( PixelFont, PixelSize, "MONOCHROMEOUTLINE" ),
		BagsDetail = CreateFontTemplate( PixelFont, PixelSize, "MONOCHROMEOUTLINE" ),
		BagsGold = CreateFontTemplate( PixelFont, PixelSize, "MONOCHROMEOUTLINE" ),

		BuffsDuration = CreateFontTemplate( PixelFont, PixelSize, "MONOCHROMEOUTLINE" ),
		BuffsCount = CreateFontTemplate( PixelFont, PixelSize, "MONOCHROMEOUTLINE" ),

		ChatTabText = CreateFontTemplate( PixelFont, PixelSize, "MONOCHROMEOUTLINE" ),

		DatabarsPanels = CreateFontTemplate( PixelFont, PixelSize, "MONOCHROMEOUTLINE" ),
		DatabarsPanelsTglBtn = CreateFontTemplate( PixelFont, PixelSize, "MONOCHROMEOUTLINE" ),
		DatabarsCurrency = CreateFontTemplate( PixelFont, PixelSize, "MONOCHROMEOUTLINE" ),
		DatabarsCurrencyTglBtn = CreateFontTemplate( PixelFont, PixelSize, "MONOCHROMEOUTLINE" ),
		DatabarsReputationText = CreateFontTemplate( PixelFont, PixelSize, "MONOCHROMEOUTLINE" ),
		DatabarsReputationName = CreateFontTemplate( PixelFont, PixelSize, "MONOCHROMEOUTLINE" ),
		DatabarsReputationTglBtn = CreateFontTemplate( PixelFont, PixelSize, "MONOCHROMEOUTLINE" ),

		DatatextPanels = CreateFontTemplate( PixelFont, PixelSize, "MONOCHROMEOUTLINE" ),
		DatatextPanelsTglBtn = CreateFontTemplate( PixelFont, PixelSize, "MONOCHROMEOUTLINE" ),

		MinimapCords = CreateFontTemplate( PixelFont, PixelSize, "MONOCHROMEOUTLINE" ),
		MinimapZone = CreateFontTemplate( PixelFont, PixelSize, "MONOCHROMEOUTLINE" ),

		NameplatesCount = CreateFontTemplate( PixelFont, PixelSize, "MONOCHROMEOUTLINE" ),
		NameplatesName = CreateFontTemplate( PixelFont, PixelSize, "MONOCHROMEOUTLINE" ),
		NameplatesHealth = CreateFontTemplate( PixelFont, PixelSize, "MONOCHROMEOUTLINE" ),
		NameplatesLevel = CreateFontTemplate( PixelFont, PixelSize, "MONOCHROMEOUTLINE" ),

		PanelsDefault = CreateFontTemplate( PixelFont, PixelSize, "MONOCHROMEOUTLINE" ),

		UnitframesHealth = CreateFontTemplate( PixelFont, PixelSize, "MONOCHROMEOUTLINE" ),
		UnitframesPower = CreateFontTemplate( PixelFont, PixelSize, "MONOCHROMEOUTLINE" ),
		UnitframesName = CreateFontTemplate( PixelFont, PixelSize, "MONOCHROMEOUTLINE" ),
		UnitframesCastbar = CreateFontTemplate( PixelFont, PixelSize, "MONOCHROMEOUTLINE" ),
		UnitframesDefault = CreateFontTemplate( PixelFont, PixelSize, "MONOCHROMEOUTLINE" ),

		MoverDefault = CreateFontTemplate( C["media"]["uffont"], 12, nil ),

		FAQTitle = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),
		FAQButtons = CreateFontTemplate( C["media"]["font"], 12, "OUTLINE" ),

		SkinsDefault = CreateFontTemplate( PixelFont, PixelSize, "MONOCHROMEOUTLINE" ),
	}
end