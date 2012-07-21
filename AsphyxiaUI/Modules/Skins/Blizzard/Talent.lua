---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

local function SkinFrames( self, event, addon )
	if( addon == "Blizzard_TalentUI" ) then
		PlayerTalentFrame.backdrop:SetTemplate( "Transparent" )
		PlayerTalentFrame.backdrop:CreateShadow( "Default" )
	end
end

local Init = CreateFrame( "Frame" )
Init:RegisterEvent( "ADDON_LOADED" )
Init:SetScript( "OnEvent", SkinFrames )