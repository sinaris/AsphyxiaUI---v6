---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["addonskins"]["embedright"]["enable"] ~= true ) then return end

local AsphyxiaUIEmbedRightBackground = CreateFrame( "Frame", "AsphyxiaUIEmbedRightBackground", UIParent )
AsphyxiaUIEmbedRightBackground:Size( C["chat"]["width"], C["chat"]["height"] )
AsphyxiaUIEmbedRightBackground:Point( "BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -2, 2 )
AsphyxiaUIEmbedRightBackground:SetTemplate( "Transparent" )
AsphyxiaUIEmbedRightBackground:SetFrameStrata( "MEDIUM" )
AsphyxiaUIEmbedRightBackground:SetFrameLevel( 3 )
AsphyxiaUIEmbedRightBackground:Hide()

if( C["addonskins"]["embedright"]["combattoggle"] == true ) then
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
end