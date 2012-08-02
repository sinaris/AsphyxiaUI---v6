---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

local AsphyxiaUIChangelog = CreateFrame( "Frame" )

local AsphyxiaUIChangelogOnLogon = CreateFrame( "Frame" )
AsphyxiaUIChangelogOnLogon:RegisterEvent( "PLAYER_ENTERING_WORLD" )
AsphyxiaUIChangelogOnLogon:SetScript( "OnEvent", function( self, event )
	self:UnregisterEvent( "PLAYER_ENTERING_WORLD" )

	print( "|cff00AAFFAsphyxiaUI - Changelog|r loaded!" )
end )