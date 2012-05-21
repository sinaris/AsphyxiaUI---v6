---------------------------------------------------------------------------------------------
-- AsphyxiaUI
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

local AsphyxiaUIChangelogOnLogon = CreateFrame( "Frame" )
AsphyxiaUIChangelogOnLogon:RegisterEvent( "PLAYER_ENTERING_WORLD" )
AsphyxiaUIChangelogOnLogon:SetScript( "OnEvent", function( self, event )
	self:UnregisterEvent( "PLAYER_ENTERING_WORLD" )

	print( "|cff00AAFFAsphyxiaUI - Changelog|r loaded!" )
end )