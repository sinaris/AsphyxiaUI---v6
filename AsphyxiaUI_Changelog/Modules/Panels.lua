---------------------------------------------------------------------------------------------
-- AddOn Name: AsphyxiaUI 6.0.0
-- License: MIT
-- Author: Sinaris @ Das Syndikat, Vaecia @ Blackmoore
-- Description: AsphyxiaUI, Editied Tukui Layout
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

local AsphyxiaUIChangelog = CreateFrame( "Frame" )

local AsphyxiaUIChangelogOnLogon = CreateFrame( "Frame" )
AsphyxiaUIChangelogOnLogon:RegisterEvent( "PLAYER_ENTERING_WORLD" )
AsphyxiaUIChangelogOnLogon:SetScript( "OnEvent", function( self, event )
	self:UnregisterEvent( "PLAYER_ENTERING_WORLD" )

	print( "|cff00AAFFAsphyxiaUI - Changelog|r loaded!" )
end )