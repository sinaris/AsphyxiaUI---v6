---------------------------------------------------------------------------------------------
-- AddOn Name: AsphyxiaUI 6.0.0
-- License: MIT
-- Author: Sinaris @ Das Syndikat, Vaecia @ Blackmoore
-- Description: AsphyxiaUI, Editied Tukui Layout
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( not IsAddOnLoaded( "BigWigs" ) or C["addonskins"]["bigwigs"] ~= true ) then return end

local classcolor = true
local drawshadow = true
local skinrange = true
local transparent = true
local disablescaling = true
local freebg = {}

local barcolor = classcolor and RAID_CLASS_COLORS[S.myclass]
local buttonsize

if( C["actionbar"]["buttonsize"] and type( C["actionbar"]["buttonsize"] )=="number" ) then
	buttonsize = S.Scale( C["actionbar"]["buttonsize"] - 2 )
else
	buttonsize = 30
end

local createbg = function()
	local bg = CreateFrame( "Frame" )
	if( transparent ) then
		bg:SetTemplate( "Transparent" )
	else
		bg:SetTemplate( "Default" )
	end
	if( drawshadow ) then
		bg:CreateShadow( "Default" )
	end
	return bg
end

local function freestyle( bar )
	local bg = bar:Get( "bigwigs:tukui_bigwigs:bg" )
	if( bg ) then
		bg:ClearAllPoints()
		bg:SetParent( UIParent )
		bg:Hide()
		freebg[#freebg + 1] = bg
	end

	local ibg = bar:Get( "bigwigs:tukui_bigwigs:ibg" )
	if( ibg ) then
		ibg:ClearAllPoints()
		ibg:SetParent( UIParent )
		ibg:Hide()
		freebg[#freebg + 1] = ibg
	end

	bar.candyBarBar.SetPoint=bar.candyBarBar.OldSetPoint
	bar.candyBarIconFrame.SetWidth=bar.candyBarIconFrame.OldSetWidth
	if( disablescaling ) then 
		bar.SetScale=bar.OldSetScale
	end

	bar.candyBarIconFrame:ClearAllPoints()
	bar.candyBarIconFrame:SetPoint( "TOPLEFT" )
	bar.candyBarIconFrame:SetPoint( "BOTTOMLEFT" )
	bar.candyBarIconFrame:SetTexCoord( 0.07, 0.93, 0.07, 0.93 )

	bar.candyBarBar:ClearAllPoints()
	bar.candyBarBar:SetPoint( "TOPRIGHT" )
	bar.candyBarBar:SetPoint( "BOTTOMRIGHT" )

	bar.candyBarBackground:SetAllPoints()

	bar.candyBarDuration:ClearAllPoints()
	bar.candyBarDuration:SetPoint( "RIGHT", bar.candyBarBar, "RIGHT", -2, 0 )

	bar.candyBarLabel:ClearAllPoints()
	bar.candyBarLabel:SetPoint( "LEFT", bar.candyBarBar, "LEFT", 2, 0 )
	bar.candyBarLabel:SetPoint( "RIGHT", bar.candyBarBar, "RIGHT", -2, 0 )
	
end

local applystyle = function( bar )
	bar:SetHeight( buttonsize / 4 )
	if( disablescaling ) then
		bar:SetScale( 1 )
		bar.OldSetScale = bar.SetScale
		bar.SetScale = S.dummy
	end

	local bg = nil
	if( #freebg > 0 ) then
		bg = table.remove( freebg )
	else
		bg = createbg()
	end
	bg:SetParent( bar )
	bg:ClearAllPoints()
	bg:Point( "TOPLEFT", bar, "TOPLEFT", -2, 2 )
	bg:Point( "BOTTOMRIGHT", bar, "BOTTOMRIGHT", 2, -2 )
	bg:SetFrameStrata( "BACKGROUND" )
	bg:Show()
	bar:Set( "bigwigs:tukui_bigwigs:bg", bg )

	local ibg = nil
	if( bar.candyBarIconFrame:GetTexture() ) then
		if( #freebg > 0 ) then
			ibg = table.remove( freebg )
		else
			ibg = createbg()
		end
		ibg:SetParent( bar )
		ibg:ClearAllPoints()
		ibg:Point( "TOPLEFT", bar.candyBarIconFrame, "TOPLEFT", -2, 2 )
		ibg:Point( "BOTTOMRIGHT", bar.candyBarIconFrame, "BOTTOMRIGHT", 2, -2 )
		ibg:SetFrameStrata( "BACKGROUND" )
		ibg:Show()
		bar:Set( "bigwigs:tukui_bigwigs:ibg", ibg )
	end

	bar.candyBarLabel:SetFont( unpack( S.FontTemplate.SkinsDefault.BuildFont ) )
	bar.candyBarLabel:SetShadowColor( 0, 0, 0, 0 )
	bar.candyBarLabel:SetJustifyH( "LEFT" )
	bar.candyBarLabel:ClearAllPoints()
	bar.candyBarLabel:Point( "BOTTOMLEFT", bar, "TOPLEFT", -2, 4 )

	bar.candyBarDuration:SetFont( unpack( S.FontTemplate.SkinsDefault.BuildFont ) )
	bar.candyBarDuration:SetShadowColor( 0, 0, 0, 0 )
	bar.candyBarDuration:SetJustifyH( "RIGHT" )
	bar.candyBarDuration:ClearAllPoints()
	bar.candyBarDuration:Point( "BOTTOMRIGHT", bar, "TOPRIGHT", 2, 4 )

	bar.candyBarBar:ClearAllPoints()
	bar.candyBarBar:SetAllPoints( bar )
	bar.candyBarBar.OldSetPoint = bar.candyBarBar.SetPoint
	bar.candyBarBar.SetPoint = S.dummy
	bar.candyBarBar:SetStatusBarTexture( C["media"]["normTex"] )
	if( barcolor and not bar.data["bigwigs:emphasized"] == true ) then
		bar.candyBarBar:SetStatusBarColor( barcolor.r, barcolor.g, barcolor.b, 1 )
	end
	bar.candyBarBackground:SetTexture( C["media"]["normTex"] )

	bar.candyBarIconFrame:ClearAllPoints()
	bar.candyBarIconFrame:Point( "BOTTOMLEFT", bar, "BOTTOMLEFT", -buttonsize - buttonsize / 3 , 0 )
	bar.candyBarIconFrame:SetSize( buttonsize, buttonsize )
	bar.candyBarIconFrame.OldSetWidth = bar.candyBarIconFrame.SetWidth
	bar.candyBarIconFrame.SetWidth = S.dummy
	bar.candyBarIconFrame:SetTexCoord( 0.08, 0.92, 0.08, 0.92 )
end

local f = CreateFrame( "Frame" )

local function registerStyle()
	if( not BigWigs ) then return end

	local bars = BigWigs:GetPlugin( "Bars", true )
	local prox = BigWigs:GetPlugin( "Proximity", true )

	if( bars ) then
		bars:RegisterBarStyle( "Tukui_BigWigs", {
			apiVersion = 1,
			version = 1,
			GetSpacing = function( bar )
				return buttonsize
			end,
			ApplyStyle = applystyle,
			BarStopped = freestyle,
			GetStyleName = function()
				return "Tukui_BigWigs"
			end,
		} )
	end

	if( prox and skinrange and BigWigs.pluginCore.modules.Bars.db.profile.barStyle == "Tukui_BigWigs" ) then
		hooksecurefunc( BigWigs.pluginCore.modules.Proximity, "RestyleWindow", function()
			BigWigsProximityAnchor:SetTemplate( "Transparent" )
			if( drawshadow ) then
				BigWigsProximityAnchor:CreateShadow( "Default" )
			end
		end )
	end
end

f:RegisterEvent( "ADDON_LOADED" )
f:SetScript( "OnEvent", function( self, event, msg )
	if( event == "ADDON_LOADED" ) then
		if( msg == "BigWigs_Plugins" ) then
			registerStyle()
			f:UnregisterEvent( "ADDON_LOADED" )
		end
	end
end )

local pr = function( msg )
	print( "|cffC495DDAsphyxiaUI BigWigs Skin|r:", tostring( msg ) )
end

SLASH_ASPHYXIAUIBIGWIGS1 = "/abigwigs"
SlashCmdList["ASPHYXIAUIBIGWIGS"] = function( msg )
	if( msg == "apply" ) then
		SlashCmdList["BigWigs"]()
		HideUIPanel( InterfaceOptionsFrame )
		S.ShowPopup( "ASPHYXIAUI_ENABLE_BIGWIGS_SKIN" )
	elseif( msg == "test" ) then
		SlashCmdList["BigWigs"]()
		BigWigs.pluginCore.modules.Proximity.Test( BigWigs.pluginCore.modules.Proximity )
		HideUIPanel( InterfaceOptionsFrame )
		BigWigs:Test()
		BigWigs:Test()
		BigWigs:Test()
		BigWigs:Test()
		BigWigs:Test()
	else
		pr( "use |cffFF0000/abigwigs apply|r to apply BigWigs settings." )
		pr( "use |cffFF0000/abigwigs test|r to launch BigWigs testmode." )
	end
end

S.CreatePopup["ASPHYXIAUI_ENABLE_BIGWIGS_SKIN"] = {
	question = L.Popups_ENABLE_BIGWIGS_SKIN,
	answer1 = ACCEPT,
	answer2 = CANCEL,
	function1 = function()
		BigWigs.pluginCore.modules.Bars.db.profile.barStyle = "Tukui_BigWigs"
		BigWigs.pluginCore.modules.Bars.db.profile.font = C["media"]["font"]
		BigWigs.pluginCore.modules.Messages.db.profile.font = C["media"]["font"]
		BigWigs.pluginCore.modules.Messages.db.profile.outline = "OUTLINE"
		BigWigs.pluginCore.modules.Proximity.db.profile.font = C["media"]["font"]

		if( InCombatLockdown() ) then
			print( ERR_NOT_IN_COMBAT )
			print( L.Message_BIGWIGS_RELOAD_INTERFACE )
		else
			ReloadUI()
		end
	end,
}