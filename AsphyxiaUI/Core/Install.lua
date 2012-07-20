---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

G.Install.Frame:SetTemplate( "Transparent" )
G.Install.StatusBar:SetStatusBarTexture( C["media"]["normal"] )

local AsphyxiaUIOnLogon = CreateFrame( "Frame" )
AsphyxiaUIOnLogon:RegisterEvent( "PLAYER_ENTERING_WORLD" )
AsphyxiaUIOnLogon:SetScript( "OnEvent", function( self, event )
	self:UnregisterEvent( "PLAYER_ENTERING_WORLD" )

	if( TukuiSaved == nil ) then
		TukuiSaved = {}
		TukuiSaved = {
			["bottomrows"] = 1,
			["rightbars"] = 1,
			["splitbars"] = false,
			["actionbarsLocked"] = false,
		}
	end

	if( IsAddOnLoaded( "AsphyxiaUI_Raid" ) and IsAddOnLoaded( "AsphyxiaUI_Raid_Healing" ) ) then
		StaticPopup_Show( "ASPHYXIAUI_CHANGE_RAID_LAYOUT" )
	end

	if( C["chat"]["background"] ~= true ) then
		StaticPopup_Show( "ASPHYXIAUI_ENABLE_CHAT_BACKGROUND" )
	end

	if( C["global"]["welcomemessage"] == true ) then
		print( "L.welcomemessage_1" )
		print( "L.welcomemessage_2" )
	end
end )