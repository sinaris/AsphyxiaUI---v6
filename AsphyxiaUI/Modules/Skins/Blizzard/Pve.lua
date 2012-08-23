---------------------------------------------------------------------------------------------
-- Project: AsphyxiaUI Version 6.0
---------------------------------------------------------------------------------------------

local S, C, L, G = unpack( Tukui )

if( C["general"]["blizzardreskin"] ~= true ) then return end

local function SkinFrames( self, event, addon )
	if( addon == "AsphyxiaUI" ) then
		PVEFrame.backdrop:SetTemplate( "Transparent" )
		PVEFrame.backdrop:CreateShadow( "Default" )

		RaidBrowserFrame.backdrop:SetTemplate( "Transparent" )
	end
end

local Init = CreateFrame( "Frame" )
Init:RegisterEvent( "ADDON_LOADED" )
Init:SetScript( "OnEvent", SkinFrames )