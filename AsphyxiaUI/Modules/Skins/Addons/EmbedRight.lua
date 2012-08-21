---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["addonskins"]["background"] ~= true ) then return end

local AsphyxiaUIEmbedRightBackground = CreateFrame( "Frame", "AsphyxiaUIEmbedRightBackground", UIParent )
AsphyxiaUIEmbedRightBackground:Size( C["chat"]["width"], C["chat"]["height"] )
AsphyxiaUIEmbedRightBackground:Point( "BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -2, 2 )
AsphyxiaUIEmbedRightBackground:SetTemplate( "Transparent" )
AsphyxiaUIEmbedRightBackground:SetFrameStrata( "MEDIUM" )
AsphyxiaUIEmbedRightBackground:SetFrameLevel( 3 )
AsphyxiaUIEmbedRightBackground:Hide()

AsphyxiaUIEmbedRightBackground:RegisterEvent("PLAYER_ENTERING_WORLD")
AsphyxiaUIEmbedRightBackground:RegisterEvent("PLAYER_LOGIN")
if( C["addonskins"]["combattoggle"] == true ) then
	AsphyxiaUIEmbedRightBackground:RegisterEvent( "PLAYER_REGEN_ENABLED" )
	AsphyxiaUIEmbedRightBackground:RegisterEvent( "PLAYER_REGEN_DISABLED" )
end

AsphyxiaUIEmbedRightBackground:SetScript( "OnEvent", function( self, event )
	if( C["chat"].background == true or C["addonskins"]["combattoggle"] == true ) then
		if( event == "PLAYER_LOGIN" ) then
			AsphyxiaUIEmbedRightBackground:Hide()
			if( IsAddOnLoaded( "Recount" ) ) then Recount_MainWindow:Hide() end
			if( IsAddOnLoaded( "Omen" ) ) then OmenAnchor:Hide() end
			if( IsAddOnLoaded( "Skada" ) ) then Skada:SetActive( false ) end
			if( IsAddOnLoaded( "TinyDPS" ) ) then tdpsFrame:Hide() end
		elseif( event == "PLAYER_ENTERING_WORLD" ) then
			AsphyxiaUIEmbedRightBackground:Hide()
			if( IsAddOnLoaded( "Recount" ) ) then Recount_MainWindow:Hide() end
			if( IsAddOnLoaded( "Omen" ) ) then OmenAnchor:Hide() end
			if( IsAddOnLoaded( "Skada" ) ) then Skada:SetActive( false ) end
			if( IsAddOnLoaded( "TinyDPS" ) ) then tdpsFrame:Hide() end
		end
	end

	if( C["addonskins"]["combattoggle"] == true ) then
		if( event == "PLAYER_REGEN_ENABLED" ) then
			AsphyxiaUIEmbedRightBackground:Hide()
			if( IsAddOnLoaded( "Recount" ) ) then Recount_MainWindow:Hide() end
			if( IsAddOnLoaded( "Omen" ) ) then OmenAnchor:Hide() end
			if( IsAddOnLoaded( "Skada" ) ) then Skada:SetActive( false ) end
			if( IsAddOnLoaded( "TinyDPS" ) ) then tdpsFrame:Hide() end
		elseif( event == "PLAYER_REGEN_DISABLED" ) then
			AsphyxiaUIEmbedRightBackground:Show()
			if( IsAddOnLoaded( "Recount" ) ) then Recount_MainWindow:Show() end
			if( IsAddOnLoaded( "Omen" ) ) then OmenAnchor:Show() end
			if( IsAddOnLoaded( "Skada" ) ) then Skada:SetActive( true ) end
			if( IsAddOnLoaded( "TinyDPS" ) ) then tdpsFrame:Show() end
		end
	end
end )









--[[if( C["addonskins"]["embedright"]["combattoggle"] == true ) then
	AsphyxiaUIEmbedRightBackgroundHider = CreateFrame( "Frame" )
	AsphyxiaUIEmbedRightBackgroundHider:RegisterEvent( "PLAYER_REGEN_ENABLED" )
	AsphyxiaUIEmbedRightBackgroundHider:RegisterEvent( "PLAYER_REGEN_DISABLED" )

	AsphyxiaUIEmbedRightBackgroundHider:SetScript( "OnEvent", function( self, event )
		if( event == "PLAYER_REGEN_DISABLED" ) then
			print"disabled"
			AsphyxiaUIEmbedRightBackground:Show()
		elseif( event == "PLAYER_REGEN_ENABLED" ) then
			print"enabled"
			AsphyxiaUIEmbedRightBackground:Hide()
		end
	end )
end]]--