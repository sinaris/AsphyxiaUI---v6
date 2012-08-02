---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

local AsphyxiaUIFAQ = CreateFrame( "Frame" )

local AsphyxiaUIFAQOnLogon = CreateFrame( "Frame" )
AsphyxiaUIFAQOnLogon:RegisterEvent( "PLAYER_ENTERING_WORLD" )
AsphyxiaUIFAQOnLogon:SetScript( "OnEvent", function( self, event )
	self:UnregisterEvent( "PLAYER_ENTERING_WORLD" )

	print( "|cff00AAFFAsphyxiaUI - F.A.Q.|r loaded!" )
end )